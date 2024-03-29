-- [dbo].[POST00202]: Lọc danh sách hội viên
-- ================================================
IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[POSP00202]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[POSP00202]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		MaiVu
-- Create date: 07/04/2014
-- Description:	Lọc danh sách hội viên theo giá trị người dùng nhập
-- DivisionID: lấy giá trị DivisionID đang load trên màn hình (Giá trị dùng đăng nhập)
-- EX EXEC POSP00202 'KC','Member','BIGC-',1,20
-- =============================================
CREATE PROCEDURE [dbo].[POSP00202]
	@DivisionID varchar(50),
	@ObjectSearch varchar(50),
	@SearchValue nvarchar(250), 
	@PageNumber int,
	@PageSize int
AS
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)
 
IF @ObjectSearch= 'Member'
BEGIN
	SET @sWhere = ''
	SET @TotalRow = ''
	SET @OrderBy = 'MemberName'
	IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
BEGIN
		IF @SearchValue IS NOT NULL 
		SET @sWhere = @sWhere +'AND (MemberID LIKE ''%'+@SearchValue+'%'' OR MemberName LIKE N''%'+@SearchValue+'%'')'
END
SET @sSQL ='
			SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, 
			MemberID, MemberName
			FROM POST0011
			WHERE DivisionID in ( '''+@DivisionID+''', ''@@@'')  '+@sWhere+' AND Disabled = 0
			ORDER BY '+@OrderBy+'
			OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
			FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
EXEC (@sSQL)
END
GO
			
			