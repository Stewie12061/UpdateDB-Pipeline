IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP001621]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP001621]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load grid màn hình kế thừa từ đơn hàng trên APP (danh sách đơn hàng trên APP)
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Phan thanh hoang vu on 07/08/2017
----Edited by:  Phan thanh hoang vu on 25/08/2017 chỉ lấy ra những Đơn hàng chưa bị kế thừa (Mỗi đơn hàng chỉ kế thừa 1 lần)
----Edited by:  Phan thanh hoang vu on 28/08/2017 lấy ra trường APPSuggestID để lưu vết cho mặt hàng đề xuất
----Edited by:  Phan thanh hoang vu on 25/04/2019 lấy ra trường TotalGiftVoucherAmount kế thừa từ đơn hàng bán
----Example: EXEC POSP001621 'NN', 'CH001', 0, '01/2017', '2017-01-01', '2017-12-31', '', '', '', 1, 20

 CREATE PROCEDURE POSP001621 (
		 @DivisionID VARCHAR(50),
		 @ShopID NVARCHAR(50),
		 @IsDate TINYINT, --0: Theo ngày; 1:Theo kỳ
		 @PeriodIDList NVARCHAR(4000),
		 @FromDate DATETIME,
		 @ToDate DATETIME,
		 @VoucherNo NVARCHAR(50),
		 @MemberName NVARCHAR(250),
		 @SaleManName NVARCHAR(250),		
		 @PageNumber INT,
		 @PageSize INT
		)
AS
	DECLARE @sSQL NVARCHAR (4000),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500)
	
	SET @sWhere = ''
	SET @OrderBy = ' M.VoucherDate DESC, M.VoucherNo'

	IF @IsDate = 0 
		SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10),M.VoucherDate,112) BETWEEN '+CONVERT(VARCHAR(10),@FromDate,112)+' AND '+CONVERT(VARCHAR(10),@ToDate,112)+' '
	
	IF @IsDate = 1 
		SET @sWhere = @sWhere + ' AND (Case When  M.TranMonth <10 then ''0''+rtrim(ltrim(str(M.TranMonth)))+''/''+ltrim(Rtrim(str(M.TranYear))) 
							Else rtrim(ltrim(str(M.TranMonth)))+''/''+ltrim(Rtrim(str(M.TranYear))) End) IN ('''+@PeriodIDList+''')'

	--Check Para DivisionIDList null then get DivisionID 
	IF Isnull(@DivisionID, '')!=''
		SET @sWhere = @sWhere + ' AND M.DivisionID = N'''+ @DivisionID+''''		
	
	IF Isnull(@ShopID, '')!=''
		SET @sWhere = @sWhere + ' AND M.ShopID = N'''+@ShopID+''''
	
	IF Isnull(@VoucherNo, '')!=''
		SET @sWhere = @sWhere + ' AND M.VoucherNo LIKE N''%'+@VoucherNo+'%'''
	
	IF Isnull(@MemberName, '')!=''
		SET @sWhere = @sWhere + ' AND (M.MemberID LIKE N''%'+@MemberName+'%'' or P11.MemberName LIKE N''%'+@MemberName+'%'')'
	
	IF Isnull(@SaleManName, '')!=''
		SET @sWhere = @sWhere + ' AND (M.SaleManID LIKE N''%'+@SaleManName+'%'' or A03.FullName LIKE N''%'+@SaleManName+'%'')'
	
	
	SET @sSQL = '
		SELECT 	Distinct M.APK, M.APK as APPSuggestID, M.DivisionID, M.ShopID, M.VoucherNo, M.VoucherDate
				, M.TranMonth, M.TranYear
				, M.SaleManID, A03.FullName as SaleManName
				, M.MemberID, P11.MemberName
				, P11.Address as DeliveryAddress
				, P11.MemberName as DeliveryContact
				, P11.Tel as DeliveryMobile
				, P11.MemberName as DeliveryReceiver
				, M.CurrencyID, M.ExchangeRate
				, M.TotalAmount, M.TotalAmountConverted
				, M.PromoteChangeAmount, M.PromoteChangeAmountConverted, M.TotalGiftVoucherAmount
				into #POST01101Temp
		FROM POST01101 M Left join POST01102 D on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
						 Left join POST00161 P61 on P61.APKMInherited = D.APKMaster and P61.APKDInherited = D.APK and P61.DeleteFlg = 0
						 left join POST0011 P11 on M.MemberID = P11.MemberID
						 left join AT1103 A03 on M.SaleManID = A03.EmployeeID
		WHERE M.DeleteFlg = 0 and P61.APKMInherited is null ' +@sWhere + '
		

		DECLARE @count int
		Select @count = Count(APK) From #POST01101Temp
		
		SELECT 	ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @count AS TotalRow
				, M.APK, M.APPSuggestID, M.DivisionID, M.ShopID, M.VoucherNo, M.VoucherDate
				, M.TranMonth, M.TranYear
				, M.SaleManID, M.SaleManName
				, M.MemberID, M.MemberName, M.DeliveryAddress, M.DeliveryContact, M.DeliveryMobile, M.DeliveryReceiver
				, M.CurrencyID, M.ExchangeRate
				, M.TotalAmount, M.TotalAmountConverted
				, M.PromoteChangeAmount, M.PromoteChangeAmountConverted, Isnull(M.TotalGiftVoucherAmount, 0) as TotalGiftVoucherAmount
		FROM #POST01101Temp M
		ORDER BY '+@OrderBy+ '
		OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
		FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
	EXEC (@sSQL)
	--Print (@sSQL)




