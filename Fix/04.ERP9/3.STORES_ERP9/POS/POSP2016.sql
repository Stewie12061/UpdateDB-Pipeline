IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP2016]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP2016]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Chọn gói sản phẩm thì chạy Fill Mặt hàng ra lưới
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Hoàng vũ on 23/05/2018
----Edited by: Hoàng Vũ 26/07/2018: Dùng trường APKPackageInventoryID để truy ngược lại bảng giá bán theo gói (1 gói sản phẩm có thể khai báo 1 mặt hàng nhiều lần)
----Edited by: Hoàng Vũ 28/01/2019: Tính lại trường Chiết khấu trước thuế và Đơn giá trước thuế
----Example: 
/*

	EXEC POSP2016 'HCM', '50C2101', '2018-05-22', 'MN5(KWH903RED+KWH930)', NULL

*/
 CREATE PROCEDURE POSP2016 (
		@DivisionID VARCHAR(50),
		@ShopID Varchar(50),
		@VoucherDate DateTime,
		@PackageID VARCHAR(50),
		@UserID VARCHAR(50)
		)
AS
BEGIN
		Select P10.DivisionID, P10.ShopID, M.PackagePriceID, P10.IsPackage, D.PackageID, D.PackageName, E.APK as APKPackageInventoryID, E.InventoryID, E.InventoryName, E.UnitID, A04.UnitName
				, isnull(E.UnitPrice, 0.0) as UnitPrice
				, Isnull(E.IsGift, 0) as IsGift
				, Isnull(E.DiscountRate, 0.0) as DiscountRate
				, Isnull(E.DiscountAmount, 0.0) as DiscountAmount
				, A02.VATGroupID
				, ISNULL(E.VATPercent/100,0) as VATPercent
				, ISNULL(E.VATPercent,0) as DepositVATPercent
				, P10.WareHouseID, P10.WareHouseName
				, E.VATAmount, Isnull(M.IsTaxIncluded, 0) as IsTaxIncluded
				--, Case when Isnull(M.IsTaxIncluded, 0) = 1 
				--	   then isnull(E.UnitPrice, 0.0)/(1 + ISNULL(E.VATPercent,0)/100) 
				--	   Else isnull(E.UnitPrice, 0.0) 
				--	   End as BeforeVATUnitPrice
				, Case when Isnull(M.IsTaxIncluded, 0) = 1 then Isnull(E.UnitPrice, 0.0) - Isnull(E.VATAmount, 0.0) - Isnull(E.DiscountAmount, 0.0)
					Else isnull(E.UnitPrice, 0.0) 
					End as BeforeVATUnitPrice
				--, Case when Isnull(M.IsTaxIncluded, 0) = 1 
				--        then Isnull(E.DiscountAmount, 0.0)/(1 + Isnull(E.DiscountRate, 0.0)/100) 
				--		Else Isnull(E.DiscountAmount, 0.0) 
				--		End as BeforeVATDiscountAmount
				, Isnull(E.DiscountAmount, 0.0) as BeforeVATDiscountAmount
		From POST0010 P10 WITH (NOLOCK) inner join CT0146 M WITH (NOLOCK) on P10.PackagePriceID = M.PackagePriceID and P10.IsPackage = 1
										inner join CT0147 D WITH (NOLOCK) on M.PackagePriceID = D.PackagePriceID
										inner join CT0148 E WITH (NOLOCK) on E.PackagePriceID = D.PackagePriceID and E.PackageID = D.PackageID and E.APK is not null
										Inner join POST0030 P30 WITH (NOLOCK) on P10.DivisionID = P30.DivisionID and  P30.ShopID = @ShopID and E.InventoryID = P30.InventoryID
										Left join AT1302 A02 WITH (NOLOCK) on A02.InventoryID = E.InventoryID
										Left join AT1304 A04 WITH (NOLOCK) on E.UnitID = A04.UnitID
		Where P10.DivisionID = @DivisionID
		   and P10.ShopID = @ShopID
		   and P10.Disabled = 0
		   and @VoucherDate between M.FromDate and M.ToDate
		   and Replace(D.PackageID,CHAR(13)+CHAR(10),'') = @PackageID
		Order by E.OrderNo
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
