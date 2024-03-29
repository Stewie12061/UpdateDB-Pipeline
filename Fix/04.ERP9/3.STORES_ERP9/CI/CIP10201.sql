IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP10201]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CIP10201]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
----<Summary>
----Man hinh truy van load du lieu danh muc chuc vu -Store CIP10201
---- 
----<Param>
---- 
----<Return>
---- 
----<Reference>
---- 
----<History>
----Created by: Ho hoang tu, Date: 09/10/2014
----Modify by: Phan thanh hoang vu, 16/10/2014 
---- 
----EXEC CIP10201 'KC','KC'',''KC', '','','',0,1,20
----
CREATE PROCEDURE CIP10201 ( 
        @DivisionID varchar(50),
		@DivisionIDList NVARCHAR(2000),       
		@DutyID nvarchar(50),
		@DutyRate nvarchar(50),
		@DutyName nvarchar(50),
		@Disabled nvarchar(50),		
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
	
			--Sap xep du lieu tra ve
			SET @OrderBy = 'HT1102.DivisionID, HT1102.DutyID'	
			--Dem so dong phan trang
			IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'

IF STR(@IsSearch) = 1
BEGIN
            IF @DivisionIDList IS NOT NULL  OR  @DivisionIDList != '' 
			      SET @sWhere = @sWhere + 'AND HT1102.DivisionID IN ('''+@DivisionIDList+''')'
			   ELSE 
		          SET @sWhere = @sWhere + 'AND HT1102.DivisionID = '''+@DivisionID+'''  '			
			IF @DutyRate IS NOT NULL 
				SET @sWhere = @sWhere +  'AND HT1102.DutyRate LIKE ''%'+@DutyRate+'%'' '
			IF @DutyID IS NOT NULL 
				SET @sWhere = @sWhere +  'AND HT1102.DutyID LIKE N''%'+@DutyID+'%'' '
			IF @DutyName IS NOT NULL 
				SET @sWhere = @sWhere +  'AND HT1102.DutyName LIKE N''%'+@DutyName+'%'' '
			IF @Disabled is not null
				SET @sWhere = @sWhere +  'AND HT1102.Disabled ='''+@Disabled+''''
END
IF STR(@IsSearch) = 0
BEGIN
     SET @sWhere = @sWhere + 'AND HT1102.DivisionID = '''+ @DivisionID+''''
END
			--Cau SQL truy van lay du lieu	
			SET @sSQL = '
			SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, HT1102.DivisionID, HT1102.DutyID
					,HT1102.DutyName, HT1102.DutyRate, [Disabled], HT1102.CreateUserID, HT1102.LastModifyUserID, HT1102.CreateDate,HT1102.LastModifyDate 
			FROM HT1102
			WHERE 1 = 1 '+@sWhere+'
			ORDER BY '+@OrderBy+'
			OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
			FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
			EXEC (@sSQL)		
			GO
			SET QUOTED_IDENTIFIER OFF
			GO
			SET ANSI_NULLS ON
			GO

