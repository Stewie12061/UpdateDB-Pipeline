IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP2014]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP2014]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- <Summary>
--- Load master phiếu in phiếu đặt cọc (Master)
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Hoàng Vũ on 08/02/2018
----Edited by : Hoàng Vũ on 02/05/2018, Lấy chương trình khuyến mãi theo ghi chú trong lưới nhập liệu của phiếu
----Edited by: Trà Giang on 20/10/2018: bổ sung in phiếu cho CustomerIndex= 98 (ATTOM)
----Edited by: hoàng vũ on 22/11/2018: Customize = 87 (OKIA) bổ sung thêm các control [Ngày đặt cọc lần 1], [SO], [Số tiền/Amount], [Ngày đặt cọc bổ sung], [PT] và [Số tiền/Amount]
----Edited by: hoàng vũ on 18/04/2019: đưa vào bảng chuẩn
----Example: EXEC POSP2014 'HCM', 'D0E4D764-A01E-4DDC-9E3E-38A91158D33C',  'HCM10'

 CREATE PROCEDURE POSP2014 (
		 @DivisionID	VARCHAR(50),
		 @APK NVARCHAR(50),
		 @UserID		NVARCHAR(50)
		)
AS

	DECLARE @CustomerName INT
	
	CREATE Table #CustomerName (CustomerName INT, ImportExcel int)
	INSERT #CustomerName EXEC AP4444
	SET @CustomerName = (SELECT TOP 1 CustomerName FROM #CustomerName)
	
	IF @CustomerName =  87 or  @CustomerName =  98--OKIA
	Begin
		Select M.APK, M.DivisionID, M.ShopID, P10.ShopName, M.VoucherTypeID, M.TranMonth, M.TranYear, M.VoucherNo, M.VoucherDate, M.ObjectID
				, M.MemberID, D.MemberName, D.Phone, Isnull(M.Tel, D.Tel) as Tel, D.CompanyName
				, ISnull(D.CompanyAddress, Isnull(M.Address, D.Address)) as CompanyAddress
				, Isnull(M.Address, D.Address) as Address, D.Identify, D.BankAccountNo, D.BankName, D.BankAddress, M.PaymentID
				, Case when Isnull(P06.PaymentID01, '') != '' and Isnull(P06.PaymentID02, '') != '' then A051.PaymentName+', '+ A052.PaymentName
					when Isnull(P06.PaymentID01, '') != '' and Isnull(P06.PaymentID02, '') = '' then A051.PaymentName
					when Isnull(P06.PaymentID01, '') = '' and Isnull(P06.PaymentID02, '') != '' then A052.PaymentName
					else NULL end as PaymentName
				, Stuff(isnull((	Select  ', ' + x.Notes From  
																(	Select Distinct APKMaster, DivisionID, Notes 
																	From POST2011
																	Where APKMaster = @APK and DeleteFlg= 0
																) x
									Where x.APKMaster = Convert(varchar(50),M.APK) and x.DivisionID= M.DivisionID
									FOR XML PATH (''), TYPE).value('.','NVARCHAR(max)'), ''), 1, 2, '') as PromotionProgram
				, M.CurrencyID, M.ExchangeRate, M.EmployeeID, M.Description as Remarks, M.SaleManID, A03.FullName as SaleManName
				, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
				, Isnull(M.BookingAmount, 0) as BookingAmount01
				, THU.VoucherDate_Receive, THU.VoucherNo_Receive
				, Isnull(THU.BookingAmount02, 0) as BookingAmount02
				, Isnull(M.BookingAmount, 0) + Isnull(THU.BookingAmount02, 0) as BookingAmount
		From POST2010 M With (NOLOCK) 
				Left join ( Select D.DivisionID, D.APKMInherited as APK, Sum(Amount) as BookingAmount02, Max(VoucherDate) as VoucherDate_Receive, Max(VoucherNo) as VoucherNo_Receive
							From POST00801 M inner join POST00802 D on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
							Where Isnull(M.IsDeposit, 0) = 1 and Isnull(IsPayInvoice, 0) = 0 and M.DeleteFlg = 0 and D.APKMInherited is not null
							Group by D.DivisionID, D.APKMInherited) THU on THU.DivisionID = M.DivisionID and THU.APK = M.APK
						   
				Left join POST0011 D With (NOLOCK) on M.MemberID = D.MemberID
				Left join POST0010 P10 With (NOLOCK) on M.DivisionID = P10.DivisionID and M.ShopID = P10.ShopID
				Left join POST0006 P06 With (NOLOCK) on M.APKPaymentID = P06.APK
				Left join AT1205 A051 With (NOLOCK) on P06.PaymentID01 = A051.PaymentID
				Left join AT1205 A052 With (NOLOCK) on P06.PaymentID02 = A052.PaymentID
				Left join AT1103 A03 With (NOLOCK) on M.SaleManID = A03.EmployeeID
				Left join (Select Distinct PromoteID, FromDate, Todate, Description 
							From AT1328 WITH (NOLOCK)
							Where DivisionID in (@DivisionID, '@@@')
							and convert(varchar(10), Getdate(), 111) between convert(varchar(10), FromDate, 111) 
							and convert(varchar(10), ToDate, 111)
							) AT28 on P10.PromoteID = AT28.PromoteID
		Where M.APK = @APK
		Group by M.APK, M.DivisionID, M.ShopID, P10.ShopName, M.VoucherTypeID, M.TranMonth, M.TranYear, M.VoucherNo, M.VoucherDate
				, M.ObjectID, M.MemberID, D.MemberName, D.Phone, Isnull(M.Tel, D.Tel), D.CompanyName
				, ISnull(D.CompanyAddress, Isnull(M.Address, D.Address))
				, Isnull(M.Address, D.Address), D.Identify, D.BankAccountNo, D.BankName, D.BankAddress, M.PaymentID
				, Case when Isnull(P06.PaymentID01, '') != '' and Isnull(P06.PaymentID02, '') != '' then A051.PaymentName+', '+ A052.PaymentName
					when Isnull(P06.PaymentID01, '') != '' and Isnull(P06.PaymentID02, '') = '' then A051.PaymentName
					when Isnull(P06.PaymentID01, '') = '' and Isnull(P06.PaymentID02, '') != '' then A052.PaymentName
					else NULL end
				, M.CurrencyID, M.ExchangeRate, M.EmployeeID, M.Description, M.SaleManID, A03.FullName, M.CreateUserID
				, M.CreateDate, M.LastModifyUserID, M.LastModifyDate, Isnull(M.BookingAmount, 0), Isnull(THU.BookingAmount02, 0), THU.VoucherDate_Receive, THU.VoucherNo_Receive
	End
	Else
	Begin
		Select M.APK, M.DivisionID, M.ShopID, P10.ShopName, M.VoucherTypeID, M.TranMonth, M.TranYear, M.VoucherNo, M.VoucherDate, M.ObjectID
				, M.MemberID, D.MemberName, D.Phone, Isnull(M.Tel, D.Tel) as Tel, D.CompanyName
				, ISnull(D.CompanyAddress, Isnull(M.Address, D.Address)) as CompanyAddress
				, Isnull(M.Address, D.Address) as Address, D.Identify, D.BankAccountNo, D.BankName, D.BankAddress, M.PaymentID
				, Case when Isnull(P06.PaymentID01, '') != '' and Isnull(P06.PaymentID02, '') != '' then A051.PaymentName+', '+ A052.PaymentName
					when Isnull(P06.PaymentID01, '') != '' and Isnull(P06.PaymentID02, '') = '' then A051.PaymentName
					when Isnull(P06.PaymentID01, '') = '' and Isnull(P06.PaymentID02, '') != '' then A052.PaymentName
					else NULL end as PaymentName
				, Stuff(isnull((	Select  ', ' + x.Notes From  
																(	Select Distinct APKMaster, DivisionID, Notes 
																	From POST2011
																	Where APKMaster = @APK and DeleteFlg= 0
																) x
									Where x.APKMaster = Convert(varchar(50),M.APK) and x.DivisionID= M.DivisionID
									FOR XML PATH (''), TYPE).value('.','NVARCHAR(max)'), ''), 1, 2, '') as PromotionProgram
				, M.CurrencyID, M.ExchangeRate, M.EmployeeID, M.Description as Remarks, M.SaleManID, A03.FullName as SaleManName
				, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
				, Isnull(M.BookingAmount, 0) as BookingAmount01
				, THU.VoucherDate_Receive, THU.VoucherNo_Receive
				, Isnull(THU.BookingAmount02, 0) as BookingAmount02
				, Isnull(M.BookingAmount, 0) + Isnull(THU.BookingAmount02, 0) as BookingAmount
		From POST2010 M With (NOLOCK) 
				Left join ( Select D.DivisionID, D.APKMInherited as APK, Sum(Amount) as BookingAmount02, Max(VoucherDate) as VoucherDate_Receive, Max(VoucherNo) as VoucherNo_Receive
							From POST00801 M inner join POST00802 D on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
							Where Isnull(M.IsDeposit, 0) = 1 and Isnull(IsPayInvoice, 0) = 0 and M.DeleteFlg = 0 and D.APKMInherited is not null
							Group by D.DivisionID, D.APKMInherited) THU on THU.DivisionID = M.DivisionID and THU.APK = M.APK
						   
				Left join POST0011 D With (NOLOCK) on M.MemberID = D.MemberID
				Left join POST0010 P10 With (NOLOCK) on M.DivisionID = P10.DivisionID and M.ShopID = P10.ShopID
				Left join POST0006 P06 With (NOLOCK) on M.APKPaymentID = P06.APK
				Left join AT1205 A051 With (NOLOCK) on P06.PaymentID01 = A051.PaymentID
				Left join AT1205 A052 With (NOLOCK) on P06.PaymentID02 = A052.PaymentID
				Left join AT1103 A03 With (NOLOCK) on M.SaleManID = A03.EmployeeID
				Left join (Select Distinct PromoteID, FromDate, Todate, Description 
							From AT1328 WITH (NOLOCK)
							Where DivisionID in (@DivisionID, '@@@')
							and convert(varchar(10), Getdate(), 111) between convert(varchar(10), FromDate, 111) 
							and convert(varchar(10), ToDate, 111)
							) AT28 on P10.PromoteID = AT28.PromoteID
		Where M.APK = @APK
		Group by M.APK, M.DivisionID, M.ShopID, P10.ShopName, M.VoucherTypeID, M.TranMonth, M.TranYear, M.VoucherNo, M.VoucherDate
				, M.ObjectID, M.MemberID, D.MemberName, D.Phone, Isnull(M.Tel, D.Tel), D.CompanyName
				, ISnull(D.CompanyAddress, Isnull(M.Address, D.Address))
				, Isnull(M.Address, D.Address), D.Identify, D.BankAccountNo, D.BankName, D.BankAddress, M.PaymentID
				, Case when Isnull(P06.PaymentID01, '') != '' and Isnull(P06.PaymentID02, '') != '' then A051.PaymentName+', '+ A052.PaymentName
					when Isnull(P06.PaymentID01, '') != '' and Isnull(P06.PaymentID02, '') = '' then A051.PaymentName
					when Isnull(P06.PaymentID01, '') = '' and Isnull(P06.PaymentID02, '') != '' then A052.PaymentName
					else NULL end
				, M.CurrencyID, M.ExchangeRate, M.EmployeeID, M.Description, M.SaleManID, A03.FullName, M.CreateUserID
				, M.CreateDate, M.LastModifyUserID, M.LastModifyDate, Isnull(M.BookingAmount, 0), Isnull(THU.BookingAmount02, 0), THU.VoucherDate_Receive, THU.VoucherNo_Receive
	End






GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
