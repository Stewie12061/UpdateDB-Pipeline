IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP30111]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP30111]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- BÁO CÁO BÁN HÀNG THEO KHU VỰC - POSR3011
---- 
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Hoàng Vũ on 16/08/2017
----Modify by: 
-- <Example> EXEC POSP30111 'MS', 'MS', 'CH001', 'CH001', 1, '2017-01-01', '2017-12-30', '12/2016'',''01/2017'',''02/2017', '', '', '', '', 'ASOFTADMIN'

CREATE PROCEDURE POSP30111 
(
	@DivisionID			VARCHAR(50),
	@DivisionIDList		NVARCHAR(MAX),
	@ShopID				VARCHAR(50),
	@ShopIDList			NVARCHAR(MAX),
	@IsDate				TINYINT,  --1: Theo ngày; 0: Theo kỳ
	@FromDate			DATETIME, 
	@ToDate				DATETIME, 
	@PeriodIDList		NVARCHAR(2000),
	@ToMemberID			VARCHAR(MAX),
	@FromMemberID		VARCHAR(MAX),
	@ToInventoryID		VARCHAR(MAX),
	@FromInventoryID	VARCHAR(MAX),
	@UserID				VARCHAR(50)
)
AS
BEGIN
		DECLARE @sSQL   NVARCHAR(MAX),  
				@sWhere NVARCHAR(MAX),
				@Date  NVARCHAR(MAX)

		SET @Date = ''
		SET @sWhere = ''

		--Nếu Danh sách @DivisionIDList trống thì lấy biến môi trường @DivisionID
		IF Isnull(@DivisionIDList, '') != ''
			SET @sWhere = @sWhere + ' AND M.DivisionID IN ('''+@DivisionIDList+''')'
		ELSE 
			SET @sWhere = @sWhere + ' AND M.DivisionID = N'''+@DivisionID+''''	
	
		--Nếu Danh sách @ShopIDList trống thì lấy biến môi trường @ShopID
		IF Isnull(@ShopIDList, '')!= ''
			SET @sWhere = @sWhere + ' AND M.ShopID IN ('''+@ShopIDList+''')'
		ELSE 
			SET @sWhere = @sWhere + ' AND M.ShopID = N'''+@ShopID+''''

		IF @IsDate = 1	
			SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR,M.VoucherDate,112) BETWEEN '''+CONVERT(VARCHAR,@FromDate,112)+''' AND '''+CONVERT(VARCHAR,@ToDate,112)+''''
		ELSE
			SET @sWhere = @sWhere + ' AND (Case When  M.TranMonth <10 then ''0''+rtrim(ltrim(str(M.TranMonth)))+''/''+ltrim(Rtrim(str(M.TranYear))) 
											Else rtrim(ltrim(str(M.TranMonth)))+''/''+ltrim(Rtrim(str(M.TranYear))) End) IN ('''+@PeriodIDList+''')'

		--Search theo hội viên  (Dữ liệhội viên nhiều nên dùng control từ hội viên , đến hội viên
		IF Isnull(@FromMemberID, '')!= '' and Isnull(@ToMemberID, '') = ''
			SET @sWhere = @sWhere + ' AND M.MemberID > = N'''+@FromMemberID +''''
		ELSE IF Isnull(@FromMemberID, '') = '' and Isnull(@ToMemberID, '') != ''
			SET @sWhere = @sWhere + ' AND M.MemberID < = N'''+@ToMemberID +''''
		ELSE IF Isnull(@FromMemberID, '') != '' and Isnull(@ToMemberID, '') != ''
			SET @sWhere = @sWhere + ' AND M.MemberID Between N'''+@FromMemberID+''' AND N'''+@ToMemberID+''''

		--Search theo vật tư  (Dữ liệu vật tư nhiều nên dùng control từ vật tư , đến vật tư
		IF Isnull(@FromInventoryID, '')!= '' and Isnull(@ToInventoryID, '') = ''
			SET @sWhere = @sWhere + ' AND D.InventoryID > = N'''+@FromInventoryID +''''
		ELSE IF Isnull(@FromInventoryID, '') = '' and Isnull(@ToInventoryID, '') != ''
			SET @sWhere = @sWhere + ' AND D.InventoryID < = N'''+@ToInventoryID +''''
		ELSE IF Isnull(@FromInventoryID, '') != '' and Isnull(@ToInventoryID, '') != ''
			SET @sWhere = @sWhere + ' AND D.InventoryID Between N'''+@FromInventoryID+''' AND N'''+@ToInventoryID+''''
 	    
		SET @sSQL = N'
			Select  M.DivisionID, A01.DivisionName, M.ShopID, P10.ShopName, M.TranMonth, M.TranYear, M.VoucherNo
					, M.VoucherDate, M.ObjectID, M.ObjectName
					, Isnull(M.SalemanID, M.EmployeeID) as EmployeeID, Isnull(A03.FullName, M.EmployeeName) as EmployeeName
					, M.MemberID, M.MemberName, M.CurrencyID
					, M.CurrencyName, M.ExchangeRate, M.TotalAmount, M.TotalTaxAmount, M.TotalDiscountAmount
					, M.TotalInventoryAmount, PromoteChangeAmount
					, M.Change, M.TotalDiscountRate, M.TotalRedureRate
					, M.TotalRedureAmount, M.PaymentObjectAmount01, M.PaymentObjectAmount02
					, M.ChangeAmount, M.Description, M.SaleManID, A03.FullName as SaleManName
					, D.InventoryID, D.InventoryName, D.ActualQuantity
			from POST0016 M  WITH (NOLOCK) Left join POST00161 D  WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
											Left join POST0010 P10 WITH (NOLOCK) on M.DivisionID = P10.DivisionID and M.ShopID = P10.ShopID
											Left join AT1101 A01 WITH (NOLOCK) on M.DivisionID = A01.DivisionID
											Left join AT1103 A03 WITH (NOLOCK) on M.SaleManID = A03.EmployeeID
			Where M.DeleteFlg = 0 and M.CVoucherNo is null and M.PVoucherNo is null  '+@sWhere+'
			Order by M.VoucherDate, D.InventoryID
			'
		EXEC (@sSQL)
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
