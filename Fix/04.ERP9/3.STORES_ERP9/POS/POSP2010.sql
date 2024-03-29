IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP2010]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP2010]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
--- Load Grid danh sách phiếu đặt cọc
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Phan thanh hoang vu
----Create date: 08/12/2017
----Modified by Thị Phượng on 08/01/2018: Chỉnh sửa bug truyền biến
----Modified by Hoàng Vũ on 18/01/2018: Chỉnh sửa sau đào tạo: cho phép load thêm những phiếu đã xóa/hủy, để biết có những phiếu nào đã xóa, Sắp sếp giảm dần
----Modified by Hoàng Vũ on 21/02/2018: Chỉnh sửa sau đào tạo: Lấy điện thoại/địa chỉ trên phiếu nếu không có thì lấy trên khách hàng

/*
	EXEC POSP2010 1, '2017-01-01', '2017-01-01', '12/2017', 'HCM', 'HCM'',''HN'',''DN'',''HP', 'ShopID', 'SHOPID', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 10
*/
 CREATE PROCEDURE POSP2010 (
	 @IsDate TINYINT,					--0:Datetime; 1:Period
     @FromDate DATETIME,
     @ToDate DATETIME,
	 @PeriodIDList NVARCHAR(Max),
	 @DivisionID NVARCHAR(Max),			--Biến môi trường
	 @DivisionIDList NVARCHAR(Max),
	 @ShopID NVARCHAR(Max),				--Biến môi trường
     @ShopIDList NVARCHAR(Max),
	 @VoucherNo NVARCHAR(50),
	 @MemberName NVARCHAR(250),
	 @Tel NVARCHAR(250),
	 @Address NVARCHAR(250),
	 @Description NVARCHAR(250),
	 @SaleManName NVARCHAR(250),
	 @IsInvoice NVARCHAR(50),
	 @DeleteFlg NVARCHAR(50),
	 @ConditionBookingID nvarchar(max), --Phiếu đặt cọc (Biến môi trường: BookingID)
	 @UserID  NVARCHAR(50),				--Biến môi trường
	 @PageNumber INT,
     @PageSize INT						--Biến môi trường
)
AS
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
		@OrderBy NVARCHAR(500)

	SET @sWhere = ' '
	SET @OrderBy = ' M.VoucherDate desc, M.VoucherNo'
	
	IF @IsDate = 0 
		SET @sWhere = @sWhere + ' CONVERT(VARCHAR(10),M.VoucherDate,112) BETWEEN '+CONVERT(VARCHAR(10),@FromDate,112)+' AND '+CONVERT(VARCHAR(10),@ToDate,112)+' '
	Else 
		SET @sWhere = @sWhere + ' (Case When  M.TranMonth <10 then ''0''+rtrim(ltrim(str(M.TranMonth)))+''/''+ltrim(Rtrim(str(M.TranYear))) 
									Else rtrim(ltrim(str(M.TranMonth)))+''/''+ltrim(Rtrim(str(M.TranYear))) End) IN ('''+@PeriodIDList+''')'

	--Check Para DivisionIDList null then get DivisionID 
	IF Isnull(@DivisionIDList,'') = ''
		SET @sWhere = @sWhere + ' AND M.DivisionID IN ('''+ @DivisionID+''')'
	Else 
		SET @sWhere = @sWhere + ' AND M.DivisionID IN ('''+@DivisionIDList+''')'

	--Check Para @ShopIDList null then get ShopID 
	IF Isnull(@ShopIDList,'') = ''
		SET @sWhere = @sWhere + ' And M.ShopID IN ('''+@ShopID+''')'
	Else 
		SET @sWhere = @sWhere + ' And M.ShopID IN ('''+@ShopIDList+''')'

	IF Isnull(@VoucherNo, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.VoucherNo,'''') LIKE N''%'+@VoucherNo+'%'' '
	
	IF Isnull(@MemberName, '') != ''
		SET @sWhere = @sWhere + ' AND (ISNULL(M.MemberID,'''') LIKE N''%'+@MemberName+'%'' or ISNULL(P11.MemberName,'''') LIKE N''%'+@MemberName+'%'')'
	
	IF Isnull(@Tel, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(P11.Tel,'''') LIKE N''%'+@Tel+'%'''
	
	IF Isnull(@Address, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(P11.Address,'''') LIKE N''%'+@Address+'%'''
	
	IF Isnull(@SaleManName, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.SaleManID,'''') LIKE N''%'+@SaleManName+'%'' '

	IF Isnull(@Description, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.Description,'''') LIKE N''%'+@Description+'%'' '
	
	IF Isnull(@IsInvoice, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.IsInvoice,'''') LIKE N''%'+@IsInvoice+'%'''
	
	IF Isnull(@DeleteFlg, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.DeleteFlg,'''') LIKE N''%'+@DeleteFlg+'%'''

	IF Isnull(@ConditionBookingID, '') != ''
		SET @sWhere = @sWhere + ' AND M.CreateUserID in (N'''+@ConditionBookingID+''' )'

   	SET @sSQL ='		Select	M.APK, M.DivisionID, M.ShopID, M.VoucherTypeID
								, M.TranMonth, M.TranYear, M.VoucherNo, M.VoucherDate, M.ObjectID
								, M.MemberID, P11.MemberName, Isnull(M.Address, P11.Address) as Address , Isnull(M.Tel, P11.Tel) as Tel
								, M.CurrencyID, M.ExchangeRate, M.EmployeeID, M.Description
								, M.SaleManID
								, M.BookingAmount, M.IsInvoice, M.DeleteFlg
								, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
							into #TempPOST2010
							FROM POST2010 M WITH (NOLOCK) Left join POST0011 P11 WITH (NOLOCK) on M.MemberID = P11.MemberID
							WHERE  ' +@sWhere + ' 
							
							DECLARE @count int
							Select @count = Count(APK) From #TempPOST2010 With (NOLOCK)
							
							SELECT 	ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @count AS TotalRow
									, M.APK, M.DivisionID, M.ShopID, M.VoucherTypeID
									, M.TranMonth, M.TranYear, M.VoucherNo, M.VoucherDate, M.ObjectID
									, M.MemberID, M.MemberName, M.Address, M.Tel
									, M.CurrencyID, M.ExchangeRate, M.EmployeeID, M.Description
									, M.SaleManID, D.FullName as SaleManName
									, M.BookingAmount, M.IsInvoice, M.DeleteFlg
									, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
							FROM #TempPOST2010 M WITH (NOLOCK) Left join AT1103 D WITH (NOLOCK) on M.SaleManID = D.EmployeeID
							ORDER BY '+@OrderBy+'
							OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
							FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
	EXEC (@sSQL)
	




GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
