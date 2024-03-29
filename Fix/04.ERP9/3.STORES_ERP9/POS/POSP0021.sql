/****** Object:  StoredProcedure [dbo].[POSP0021]    Script Date: 18/04/2014 8:07:10 AM ******/
IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0021]') AND 
		   OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP0021]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		MaiVu, Create date: 15/04/2014
-- Description:	Lọc dữ liệu phiếu xuất.
-- Modify by:	Hoàng Vũ, on 13/06/2016: 
-- Modify by:	Hoàng Vũ, on 31/01/2018: Sắp xếp giảm dần
-- Modify by:	Hoàng Vũ, on 06/12/2018: sửa điều kiện search cửa hàng
-- EXEC POSP0021 'KC',0,'2014-01-01','2014-010-01','01/2016'',''01/2016'',''06/2016','KC'',''GS','','','','',0,'',1,25

-- =============================================
CREATE PROCEDURE POSP0021 (
		 @DivisionID NVARCHAR(50),
		 @IsDate tinyint, --1: Tìm theo ngày, 0: Tìm theo kỳ
		 @FromDate datetime,
		 @ToDate datetime,
		 @PeriodList NVARCHAR(2000),
		 @DivisionIDList NVARCHAR(2000),
		 @ShopID nvarchar(Max) = NULL,
		 @VoucherNo varchar(50),
		 @EmployeeID varchar(50),
		 @EmployeeName nvarchar(250),
		 @Status tinyint,--0: đang chờ duyệt; 1: đã duyệt
		 @IsRefund tinyint,
		 @PageNumber INT,
		 @PageSize INT,
		 @ShopIDPermission NVARCHAR(MAX) = NULL
		 )
AS
DECLARE @sSQL NVARCHAR (2000),
		@sWhere NVARCHAR(2000),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)
SET @sWhere = ''
SET @TotalRow = ''
SET @OrderBy = ' VoucherDate desc, VoucherNo'
IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'

	--Check Para DivisionIDList null then get DivisionID 
	IF Isnull(@DivisionIDList, '') != ''
		SET @sWhere = @sWhere + ' DivisionID IN ('''+@DivisionIDList+''')'
	Else 
		SET @sWhere = @sWhere + ' DivisionID IN ('''+@DivisionID+''')'

	IF @IsDate = 0 
			SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10),VoucherDate,112) BETWEEN '+CONVERT(VARCHAR(10),@FromDate,112)+' AND '+CONVERT(VARCHAR(10),@ToDate,112)+' '

	IF @IsDate = 1 
			SET @sWhere = @sWhere + ' AND (Case When  TranMonth <10 then ''0''+rtrim(ltrim(str(TranMonth)))+''/''+ltrim(Rtrim(str(TranYear))) 
									Else rtrim(ltrim(str(TranMonth)))+''/''+ltrim(Rtrim(str(TranYear))) End) IN ('''+@PeriodList+''')'

	IF Isnull(@ShopID, '')!=''
	BEGIN
		SET @sWhere = @sWhere + ' AND ISNULL(ShopID,'''') in ('''+@ShopID+''')'
	END
	ELSE
		SET @sWhere = @sWhere + ' AND ISNULL(ShopID,'''') in ('''+@ShopIDPermission+''')'

	IF Isnull(@VoucherNo, '') !='' 
			SET @sWhere = @sWhere + ' AND VoucherNo LIKE N''%'+@VoucherNo+'%'' '
	IF Isnull(@EmployeeID, '') !=''
			SET @sWhere = @sWhere + ' AND EmployeeID LIKE N''%'+@EmployeeID+'%'' '
	IF Isnull(@EmployeeName, '') !='' 
			SET @sWhere = @sWhere + ' AND ISNULL(EmployeeName,'''') LIKE N''%'+@EmployeeName+'%''  '
	IF Isnull(@Status, '') !=''
			SET @sWhere = @sWhere + ' AND Status = '+ STR(@Status) +' '
	IF Isnull(@IsRefund, '') !='' 
			SET @sWhere = @sWhere + ' AND IsRefund = '+ STR(@IsRefund) +' '

SET @sSQL = 'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, APK, DivisionID, ShopID, 
					VoucherDate, VoucherNo, EmployeeID, EmployeeName, RecipientShopID, RecipientShopName, Description,IsRefund,Status
			 FROM POST0022 WITH (NOLOCK)
			 WHERE ' +@sWhere+' AND DeleteFlg = 0 
			 ORDER BY '+@OrderBy+'
			 OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
			 FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
EXEC (@sSQL)


