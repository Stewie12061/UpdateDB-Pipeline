IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP3030]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP3030]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Báo cáo bill đặt cọc– POSF3030
---- 
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Hoàng Vũ on 12/06/2018
----Modify by: 
-- <Example> EXEC POSP3030 'HCM', 'HCM', '50C2101', '50C2101', 1, '2018-05-01' ,'2018-06-13', 6, 2018, 6, 2018, '', '', '', '', 'HCM08'

CREATE PROCEDURE POSP3030 
(
	@DivisionID			VARCHAR(50),
	@DivisionIDList		NVARCHAR(MAX),
	@ShopID				VARCHAR(50),
	@ShopIDList			NVARCHAR(MAX),
	@IsDate				TINYINT,  --1: Theo ngày; 0: Theo kỳ
	@FromDate			DATETIME, 
	@ToDate				DATETIME, 
	@FromTranMonth		INT,
	@FromTranYear		INT,
	@ToTranMonth		INT,
	@ToTranYear			INT,
	@ToSaleManID		VARCHAR(MAX),
	@FromSaleManID  	VARCHAR(MAX),
	@ToInventoryID		VARCHAR(MAX),
	@FromInventoryID	VARCHAR(MAX),
	@UserID				VARCHAR(50)
)
AS
BEGIN
		DECLARE @sSQL01   NVARCHAR(MAX),  
				@sSQL02   NVARCHAR(MAX),
				@sSQL03   NVARCHAR(MAX),
				@sSQL04   NVARCHAR(MAX),
				@sWhere NVARCHAR(MAX),
				@sWhereOption NVARCHAR(MAX),
				@sWherePhatsinh NVARCHAR(MAX),
				@sWhereDauky NVARCHAR(MAX),
				@sWhereSearch NVARCHAR(MAX)

		SET @sWhere = ''
		SET @sWherePhatsinh = ''
		SET @sWhereDauky = ''
		SET @sWhereOption = ''
		SET @sWhereSearch = ''

		--Nếu Danh sách @DivisionIDList trống thì lấy những DivisionID của User đăng nhập có quyền trong @DivisionID
		IF Isnull(@DivisionIDList, '') != ''
			SET @sWhere = @sWhere + ' AND M.DivisionID IN ('''+@DivisionIDList+''')'
		ELSE 
			SET @sWhere = @sWhere + ' AND M.DivisionID IN ('''+@DivisionID+''')'	
	
		--Nếu Danh sách @ShopIDList trống thì lấy những shopID của User đăng nhập có quyền trong @ShopID
		IF Isnull(@ShopIDList, '')!= ''
			SET @sWhere = @sWhere + ' AND M.ShopID IN ('''+@ShopIDList+''')'
		ELSE 
			SET @sWhere = @sWhere + ' AND M.ShopID IN ('''+@ShopID+''')'

		IF @IsDate = 1	
		Begin
			SET @sWhereSearch = @sWhere + N' AND CONVERT(NVARCHAR(10),M.VoucherDate,21) BETWEEN '''+CONVERT(NVARCHAR(10),@FromDate,21)+''' AND '''+CONVERT(NVARCHAR(10),@ToDate,21)+''' '
			SET @sWherePhatsinh = @sWhere + N' AND CONVERT(NVARCHAR(10),M.VoucherDate,21) BETWEEN '''+CONVERT(NVARCHAR(10),@FromDate,21)+''' AND '''+CONVERT(NVARCHAR(10),@ToDate,21)+''' '
			SET @sWhereDauky = @sWhere + N' AND CONVERT(NVARCHAR(10),M.VoucherDate,21) < '''+CONVERT(NVARCHAR(10),@FromDate,21)+'''' 
		End
		ELSE
		Begin
			SET @sWhereSearch = @sWhere + N' AND M.TranYear*100+M.TranMonth BETWEEN '+STR(@FromTranYear*100+@FromTranMonth)+' AND '+STR(@ToTranYear*100+@ToTranMonth)+' '
			SET @sWherePhatsinh = @sWhere + N' AND M.TranYear*100+M.TranMonth BETWEEN '+STR(@FromTranYear*100+@FromTranMonth)+' AND '+STR(@ToTranYear*100+@ToTranMonth)+' '
			SET @sWhereDauky = @sWhere + N' AND M.TranYear*100+M.TranMonth < '+STR(@FromTranYear*100+@FromTranMonth)+''
		End

		--Search theo nhân viên bán hàng  (Dữ liệu nhân viên bán hàng nhiều nên dùng control từ nhân viên bán hàng , đến nhân viên bán hàng
		IF Isnull(@FromSaleManID, '')!= '' and Isnull(@ToSaleManID, '') = ''
			SET @sWhereOption = @sWhereOption + ' AND M.SaleManID > = N'''+@FromSaleManID +''''
		ELSE IF Isnull(@FromSaleManID, '') = '' and Isnull(@ToSaleManID, '') != ''
			SET @sWhereOption = @sWhereOption + ' AND M.SaleManID < = N'''+@ToSaleManID +''''
		ELSE IF Isnull(@FromSaleManID, '') != '' and Isnull(@ToSaleManID, '') != ''
			SET @sWhereOption = @sWhereOption + ' AND M.SaleManID Between N'''+@FromSaleManID+''' AND N'''+@ToSaleManID+''''

		--Search theo mặt hàng  (Dữ liệu mặt hàng nhiều nên dùng control từ mặt hàng , đến mặt hàng
		IF Isnull(@FromInventoryID, '')!= '' and Isnull(@ToInventoryID, '') = ''
			SET @sWhereOption = @sWhereOption + ' AND D.InventoryID > = N'''+@FromInventoryID +''''
		ELSE IF Isnull(@FromInventoryID, '') = '' and Isnull(@ToInventoryID, '') != ''
			SET @sWhereOption = @sWhereOption + ' AND D.InventoryID < = N'''+@ToInventoryID +''''
		ELSE IF Isnull(@FromInventoryID, '') != '' and Isnull(@ToInventoryID, '') != ''
			SET @sWhereOption = @sWhereOption + ' AND D.InventoryID Between N'''+@FromInventoryID+''' AND N'''+@ToInventoryID+''''
	 	
		   
		Print (@sWhereDauky) 
		Print (@sWherePhatsinh) 
		SET @sSQL01 = N'
			-->>>>>>>>>>>>>>>>>>>Lấy hàng bán/hàng tăng
			--Bảng giá khuyến mãi
			Select M.DivisionID, M.APK as APKMaster, D.APK as APKDetail, M.TranMonth, M.TranYear, M.VoucherNo, M.VoucherDate, M.SaleManID, M.ShopID, M.Description, D.InventoryID, D.InventoryName 
					, O32.IsGift, M.BookingAmount, D.IsTaxIncluded, D.ActualQuantity, D.UnitPrice, D.Amount, D.DiscountAmount, D.TaxAmount, M.APKPaymentID, '''+@UserID+''' as EmployeeIDReport
			into #TempResult
			From POST2010 M WITH (NOLOCK) INNER JOIN POST2011 D WITH (NOLOCK) ON D.APKMaster = M.APK and D.DeleteFlg = M.DeleteFlg and D.IsPromotePriceTable = 1
										  inner join OT1302 O32 WITH (NOLOCK) on D.PromotePriceTableID = O32.ID and D.InventoryID = O32.InventoryID
			WHERE M.DeleteFlg = 0 '+@sWhereSearch+''+@sWhereOption+ '
			Union all
			--Bảng giá gói
			Select M.DivisionID, M.APK as APKMaster, D.APK as APKDetail, M.TranMonth, M.TranYear, M.VoucherNo, M.VoucherDate, M.SaleManID, M.ShopID, M.Description, D.InventoryID, D.InventoryName 
					, C48.IsGift, M.BookingAmount, D.IsTaxIncluded, D.ActualQuantity, D.UnitPrice, D.Amount, D.DiscountAmount, D.TaxAmount, M.APKPaymentID, '''+@UserID+''' as EmployeeIDReport
			From POST2010 M WITH (NOLOCK) INNER JOIN POST2011 D WITH (NOLOCK) ON D.APKMaster = M.APK and D.DeleteFlg = M.DeleteFlg and D.IsPackage = 1
										  inner join CT0148 C48 on D.PackagePriceID = C48.PackagePriceID and D.PackageID = C48.PackageID and D.InventoryID = C48.InventoryID
			WHERE M.DeleteFlg = 0 '+@sWhereSearch+''+@sWhereOption+ '
			Union all
			--Bảng giá chung
			Select M.DivisionID, M.APK as APKMaster, D.APK as APKDetail, M.TranMonth, M.TranYear, M.VoucherNo, M.VoucherDate, M.SaleManID, M.ShopID, M.Description, D.InventoryID, D.InventoryName 
					, O32.IsGift, M.BookingAmount, D.IsTaxIncluded, D.ActualQuantity, D.UnitPrice, D.Amount, D.DiscountAmount, D.TaxAmount, M.APKPaymentID, '''+@UserID+''' as EmployeeIDReport
			From POST2010 M WITH (NOLOCK) INNER JOIN POST2011 D WITH (NOLOCK) ON D.APKMaster = M.APK and D.DeleteFlg = M.DeleteFlg and D.IsTable = 1
										  inner join OT1302 O32 WITH (NOLOCK) on D.PriceTable = O32.ID and D.InventoryID = O32.InventoryID
			WHERE M.DeleteFlg = 0 '+@sWhereSearch+''+@sWhereOption+ '
			--<<<<<<<<<<<<<<<<<<<<<<Lấy hàng bán/hàng tăng '
		SET @sSQL02 = N'
			-->>>>>>>>>>>>>>>>>>>>>>Lấy [Tổng tiền thanh toán], [Tổng đặt coc] và [Tổng còn lại]
			Select D.DivisionID, D.APKMaster, Sum(Case when D.IsTaxIncluded = 1 then D.InventoryAmount else D.InventoryAmount + D.TaxAmount end) as  Amount
				  , P82.Amount as BookingAmount
				  , Sum(Case when D.IsTaxIncluded = 1 then D.InventoryAmount else D.InventoryAmount + D.TaxAmount end) - P82.Amount as RemainAmount
			into #TotalBooking
			From POST2011 D With (Nolock) 
					Inner join POST2010 M With (Nolock) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg 
					left join 
							(
							Select D.DivisionID, D.APKMInherited, Sum(Isnull(D.Amount, 0.0)) as Amount
							From POST00802 D With (Nolock) Left join POST00801 M With (Nolock) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg and M.IsDeposit = 1
							Where D.APKMInherited is not null '+ @sWherePhatsinh + ' 
							Group by D.DivisionID, D.APKMInherited
							) P82 on P82.DivisionID = D.DivisionID and P82.APKMInherited = D.APKMAster
			WHERE M.DeleteFlg = 0 '+@sWhereSearch+''+@sWhereOption+ '
			Group by D.DivisionID, D.APKMaster, P82.Amount 
			--<<<<<<<<<<<<<<<<<<<<<Lấy [Tổng tiền thanh toán], [Tổng đặt coc] và [Tổng còn lại] '
		SET @sSQL03 = N'	
			Select M.DivisionID, M.ShopID + ''_'' + P10.ShopName as ShopName
					, M.VoucherNo, M.VoucherDate, M.TranMonth, M.TranYear
					, M.InventoryID + ''_'' + M.InventoryName as InventoryName
				    , Case when Isnull(IsGift, 0) = 0 then ''v'' Else NULL end as IsSale
				    , Case when Isnull(IsGift, 0) = 0 then NULL Else ''v'' end as IsGift
					, Isnull(P16.IsInTime, ''x'') as IsInTime , D.Amount, D.BookingAmount, D.RemainAmount
					, Case When A251.PaymentName is null and A252.PaymentName is null Then NULL
						  When A251.PaymentName is not null and A252.PaymentName is null Then A251.PaymentName
						  When A251.PaymentName is null and A252.PaymentName is not null Then A252.PaymentName
						  When A251.PaymentName is not null and A252.PaymentName is not null Then A251.PaymentName + ''; '' + A252.PaymentName
						  End as PaymentName
				   , M.SaleManID + ''_'' + A03.FullName as SaleManName
				   , M.Description
				   , M.EmployeeIDReport, A103.FullName as EmployeeNameReport, A103.Tel as TelReport
				   , P21.VoucherNo_BeforeEndDate, P22.VoucherNoBegin, P23.VoucherNoEnd
				   , Stuff(isnull((	Select  '';  '' + x.VoucherNo 
									From  (Select Distinct M.DivisionID, M.VoucherNo
										   From	   POST2010 M WITH (NOLOCK) inner join POST2011 D on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
										   Where M.DeleteFlg = 1  '+@sWhereSearch+''+@sWhereOption+ '
											   ) x
									Where x.DivisionID= M.DivisionID
									FOR XML PATH (''''), TYPE).value(''.'',''NVARCHAR(max)''), ''''), 1, 2, '''') as VoucherNoCancel
			From #TempResult M Left join AT1103 A03 With (Nolock) on M.SaleManID = A03.EmployeeID
							  Left join POST0010 P10 With (Nolock) on M.DivisionID = P10.DivisionID and M.ShopID = P10.ShopID
							  Left join #TotalBooking D on M.DivisionID = D.DivisionID and M.APKMaster = D.APKMaster
							  Left join POST0006 P6 With (Nolock) on M.DivisionID = P6.DivisionID and M.APKPaymentID = P6.APK
							  Left join AT1205 A251 With (Nolock) on P6.PaymentID01 = A251.PaymentID
							  Left join AT1205 A252 With (Nolock) on P6.PaymentID02 = A252.PaymentID
							  Left join AT1103 A103 With (Nolock) on M.EmployeeIDReport = A103.EmployeeID '
		SET @sSQL04 = N'
							  Left join (
											Select M.APK as APKMaster, D.APK as APKDetail, M.DivisionID, D.APKMInherited, D.APKDInherited, D.IsWarehouseGeneral
												   , Case when Isnull(P27.IsInTime, 0) = 2 then ''v'' Else ''x'' end as IsInTime
											From POST0016 M With (Nolock) inner join POST00161 D With (Nolock) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg and Isnull(D.IsWarehouseGeneral, 0) = 0
															Left join POST0028 P28 With (Nolock) on P28.DivisionID = D.DivisionID and P28.APKMInherited = D.APKMaster and P28.APKDInherited = D.APK and P28.DeleteFlg = 0
															Left join POST0027 P27 With (Nolock) on P27.APK = P28.APKMaster and P27.DeleteFlg = P28.DeleteFlg
											Where M.DeleteFlg = 0 
											Union all
											Select M.APK as APKMaster, D.APK as APKDetail, M.DivisionID, D.APKMInherited, D.APKDInherited, D.IsWarehouseGeneral
													, Case when Isnull(A06.IsInTime, 0) = 2 then ''v'' Else ''x'' end as IsInTime
											From POST0016 M With (Nolock) inner join POST00161 D With (Nolock) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg and Isnull(D.IsWarehouseGeneral, 0) = 1
															Left join WT0096 W96 With (Nolock) on W96.DivisionID = D.DivisionID and W96.InheritVoucherID = D.APKMaster and W96.InheritTransactionID = D.APK
															Left join AT2007 A07 With (Nolock) on A07.DivisionID = W96.DivisionID and A07.InheritVoucherID = W96.VoucherID and A07.InheritTransactionID = W96.TransactionID
															Left join AT2006 A06 With (Nolock) on A06.DivisionID = A07.DivisionID and A06.VoucherID = A07.VoucherID
											Where M.DeleteFlg = 0
										) P16 on M.DivisionID = P16.DivisionID and M.APKMaster = P16.APKMInherited and M.APKDetail = P16.APKDInherited 
							 Left join (
										Select Top 1 M.DivisionID, M.Voucherno  as VoucherNo_BeforeEndDate
										From POST2010 M WITH (NOLOCK) INNER JOIN POST2011 D WITH (NOLOCK) ON D.APKMaster = M.APK and D.DeleteFlg = M.DeleteFlg
										WHERE M.DeleteFlg = 0   '+@sWhereDauky+''+@sWhereOption+ '
										Order by M.CreateDate desc
										) P21 on M.DivisionID = P21.DivisionID
							 Left join (
										Select Top 1 M.DivisionID, M.VoucherNo as VoucherNoBegin
										From POST2010 M WITH (NOLOCK)  INNER JOIN POST2011 D WITH (NOLOCK) ON D.APKMaster = M.APK and D.DeleteFlg = M.DeleteFlg
										WHERE M.DeleteFlg = 0  '+@sWhereSearch+''+@sWhereOption+ '
										Order by M.CreateDate 
										) P22 on M.DivisionID = P22.DivisionID
							 Left join (
										Select Top 1 M.DivisionID, M.VoucherNo as VoucherNoEnd
										From POST2010 M WITH (NOLOCK) INNER JOIN POST2011 D WITH (NOLOCK) ON D.APKMaster = M.APK and D.DeleteFlg = M.DeleteFlg
										WHERE M.DeleteFlg = 0  '+@sWhereSearch+''+@sWhereOption+ '
										Order by M.CreateDate desc
										) P23 on M.DivisionID = P23.DivisionID
			Order by M.VoucherDate, M.VoucherNo
							'
		
		EXEC (@sSQL01+@sSQL02+@sSQL03+@sSQL04)
		--Print (@sSQL01)
		--Print (@sSQL02)
		--Print (@sSQL03)
		--Print (@sSQL04)
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
