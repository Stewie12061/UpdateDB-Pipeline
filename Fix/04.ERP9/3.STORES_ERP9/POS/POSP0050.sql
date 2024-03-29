IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0050]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP0050]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load Grid danh sách số du tồn kho
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Phan thanh hoang vu
----Create date: 20/07/2014
----Modify by Phan thanh hoang vu,  on 31/01/2018: Sắp xếp giảm
----Modify by Phan thanh hoang vu,  on 15/06/2018: Do truyền chuổi vào ShopID và DivisionID lớn 50 ké tự nên không ra số liệu
/*
	EXEC POSP0050  null, null, 'KC'',''GS', null, 'BIGC'',''PHUCLONG', null, null, null, 1, 20
	
*/
 CREATE PROCEDURE POSP0050
(
	 @TranYear VARCHAR(Max),
	 @DivisionID VARCHAR(Max),
     @DivisionIDList NVARCHAR(Max),
     @ShopID NVARCHAR(Max),
	 @ShopIDList NVARCHAR(Max),
     @VoucherNo NVARCHAR(Max),
	 @EmployeeID VARCHAR(max),
	 @Description NVARCHAR(Max),
	 @PageNumber INT,
     @PageSize INT
)
AS
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
		@TotalRow NVARCHAR(50)

	SET @sWhere = ''
	SET @TotalRow = ''
	SET @OrderBy = ' M.VoucherDate desc , M.VoucherNo'
	IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
	
--Check Para DivisionIDList null then get DivisionID 
	IF @DivisionIDList IS NULL 
		--SET @sWhere = @sWhere + 'M.DivisionID = '''+ @DivisionID+''''
		SET @sWhere = @sWhere + 'M.DivisionID IN ('''+ @DivisionID+''')'
	Else 
		SET @sWhere = @sWhere + 'M.DivisionID IN ('''+@DivisionIDList+''')'
--Check Para @ShopIDList null then get ShopID 		
	IF @ShopIDList IS NULL 
		--SET @sWhere = @sWhere + 'And M.ShopID = '''+ @ShopID+''''
		SET @sWhere = @sWhere + 'And M.ShopID IN ('''+@ShopID+''')'
	Else 
		SET @sWhere = @sWhere + 'And M.ShopID IN ('''+@ShopIDList+''')'

	IF @TranYear IS not NULL SET @sWhere = @sWhere + '
		AND M.TranYear ='''+@TranYear+''' '
	IF @VoucherNo IS NOT NULL SET @sWhere = @sWhere + '
		AND ISNULL(M.VoucherNo,'''') LIKE N''%'+@VoucherNo+'%'' '
	IF @EmployeeID IS NOT NULL SET @sWhere = @sWhere + '
		AND ISNULL(M.EmployeeID,'''') LIKE N''%'+@EmployeeID+'%'' '
	IF @Description IS NOT NULL SET @sWhere = @sWhere + '
		AND ISNULL(M.Description,'''') LIKE N''%'+@Description+'%'' '
	

	SET @sSQL = '
		SELECT 	ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow,
				M.APK, M.TranYear, M.DivisionID, M.ShopID, M.VoucherTypeID, M.VoucherNo, M.VoucherDate, M.EmployeeID, 
				M.EmployeeName, M.Description, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
		FROM POST0038 M With (NOLOCK)
		WHERE ' +@sWhere + 'AND M.DeleteFlg = 0
		ORDER BY '+@OrderBy+'
	    OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
	    FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

EXEC (@sSQL)


