IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SP10101]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[SP10101]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
--- Load Grid Danh mục nhóm người dùng
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Nguyễn Chánh Thi
----Create date: 09/10/2014
---- Modify: Quốc Tuấn 17/11/2014 bổ sung thêm biến tìm kiếm
/*
	EXEC SP10101 'KC','KC'',''GS',null,null,0,1,50,0
*/
 CREATE PROCEDURE SP10101
		(
        @DivisionID VARCHAR(50),
		@DivisionIDList NVARCHAR(2000),
        @GroupID nvarchar(50),
		@GroupName nvarchar(250),
		@Disabled varchar(50), --0: không, 1: có, Null: tất cả
		@PageNumber INT,
        @PageSize INT,
        @IsSearch BIT
		)
AS
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)
        
	SET @sWhere = ''
	SET @TotalRow = ''
	--@Order_Column_List: là danh sách column cần sắp xếp
	SET @OrderBy = 'DivisionID, GroupID'

	IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
--Check Para DivisionIDList null then get DivisionID 
IF @IsSearch=1
BEGIN
	IF @DivisionIDList IS NULL 
		SET @sWhere = @sWhere + 'DivisionID = '''+ @DivisionID+''''
	Else 
		SET @sWhere = @sWhere + 'DivisionID IN ('''+@DivisionIDList+''')'

	--@Column_Para: trường cần search
	--@Para: Giá trị cần search
	IF @GroupID IS NOT NULL SET 
		@sWhere = @sWhere + ' AND GroupID LIKE ''%'+@GroupID+'%'' '
	IF @GroupName IS NOT NULL SET 
		@sWhere = @sWhere + ' AND GroupName LIKE ''%'+@GroupName+'%'' '
	IF @Disabled is not null
		SET @sWhere = @sWhere +  'AND Disabled ='''+@Disabled+''''
END
ELSE
	SET @sWhere = @sWhere + 'DivisionID = '''+ @DivisionID+''''
	
	--@Column_List: Danh sách column cần load lên màn hình trong @Table
	--@Table: bảng cần load dữ liệu tương ứng từng màn hình
	SET @sSQL = '
	SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, APK, DivisionID, GroupID, GroupName,Disabled
	FROM AT1401
	WHERE '+@sWhere+'
	ORDER BY '+@OrderBy+'
	OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
	FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
	EXEC (@sSQL)
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
