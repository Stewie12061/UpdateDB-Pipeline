IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP2015]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP2015]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- <Summary>
--- Load master phiếu in phiếu đặt cọc (Detail)
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Hoàng Vũ on 02/05/2018: chuyển từ Script sang store
----Edited by: Hoàng Vũ on 08/05/2018: Bỏ điều kiện DeleteFlg = 0
----Edited by: Hoàng Vũ on 08/05/2018: Xử lý lấy theo bảng giá trước thuế/sau thuế
----Edited by: Hoàng Vũ on 23/05/2018: Tính lại thuế và chiếc khấu
----Edited by: Hoàng Vũ 26/07/2018: Dùng trường APKPackageInventoryID để truy ngược lại bảng giá bán theo gói (1 gói sản phẩm có thể khai báo 1 mặt hàng nhiều lần)
----Edited by: Hoàng Vũ on 04/10/2018: Xử lý khi in không lên giá
----Edited by: Trà Giang on 20/10/2018: Bổ sung CustormerIndex 98 ( ATTOM )
----Edited by: Hoàng Vũ on 18/04/2019: Đưa vào bảng chuẩn
----Example: EXEC POSP2015 'HCM', 'D31B15D8-FB30-4403-9A6A-B036DF685991',  'HCM10'

 CREATE PROCEDURE POSP2015 (
		 @DivisionID	VARCHAR(50),
		 @APK NVARCHAR(50),
		 @UserID		NVARCHAR(50)
		)
AS
	DECLARE @CustomerName INT
	
	CREATE Table #CustomerName (CustomerName INT, ImportExcel int)
	INSERT #CustomerName EXEC AP4444
	SET @CustomerName = (SELECT TOP 1 CustomerName FROM #CustomerName)
	
	IF @CustomerName =  87 --OKIA
	Begin
		Select  M.IsPackage
				, M.PackagePriceID
				, M.PackageID
				, C47.PackageName
				, Case when M.IsPackage = 1 then 1.0 else 0.0 end as PackageQuantity
				, Case when M.IsPackage = 1 then C48.PackagePrice else 0.0 end as PackagePrice
				, Case when M.IsPackage = 1 then C48.PackagePrice else 0.0 end as PackageAmount
				, M.InventoryID
				, M.InventoryName
				, M.UnitID
				, M.ActualQuantity
				, Case when M.IsPackage = 1
					   then 0.0 
						else (Case when M.IsPromotePriceTable = 1  then Case when Isnull(IsTaxIncluded, 0) = 0 
																			 then Isnull(O31.UnitPrice, 0) + Isnull(O31.VATAmount, 0)
																			 Else Isnull(O31.UnitPrice, 0) end 
								   when M.IsTable = 1  then Case when Isnull(IsTaxIncluded, 0) = 0 
																 then Isnull(O32.UnitPrice, 0) + Isnull(O32.VATAmount, 0) 
																 Else Isnull(O32.UnitPrice, 0) end
								   Else Case when Isnull(IsTaxIncluded, 0) = 0 
											 then Isnull(M.UnitPrice, 0) + Isnull(M.TaxAmount, 0) 
											 Else Isnull(M.UnitPrice, 0) end
								   End
							)  
						end as  UnitPrice
				, Case when M.IsPackage = 1
					   then 0.0 
						else (Case when M.IsPromotePriceTable = 1 then Case when Isnull(IsTaxIncluded, 0) = 0 
																			then (Isnull(O31.UnitPrice, 0) + Isnull(O31.VATAmount, 0)) * Isnull(M.ActualQuantity, 0)
																			Else Isnull(O31.UnitPrice, 0)* Isnull(M.ActualQuantity, 0) end 
								   when M.IsTable = 1  then Case when Isnull(IsTaxIncluded, 0) = 0 
																 then (Isnull(O32.UnitPrice, 0) + Isnull(O32.VATAmount, 0)) * Isnull(M.ActualQuantity, 0)
																 Else Isnull(O32.UnitPrice, 0)* Isnull(M.ActualQuantity, 0) end
								   Else	Case when Isnull(IsTaxIncluded, 0) = 0 
											 then (Isnull(M.UnitPrice, 0) + Isnull(M.TaxAmount, 0)) * Isnull(M.ActualQuantity, 0)
											 Else Isnull(M.UnitPrice, 0)* Isnull(M.ActualQuantity, 0) end
								   End
							)  
						end as  Amount
				, M.DiscountRate
				, M.DiscountAmount as RefDiscountAmount
				, M.VATGroupID
				, M.VATPercent
				, M.TaxAmount as RefTaxAmount
				, ROUND(M.InventoryAmount , A.ConvertedDecimals) InventoryAmount
				, M.Notes
				, M.OrderNo
				, M.MemberToTake
				, M.DeliveryToMemberID 
				, Isnull(M.OrderPackage, 0) as OrderPackage
				From POST2011 M With (NOLOCK)
						Left join CT0147 C47 With (NOLOCK) on M.PackagePriceID = C47.PackagePriceID and M.PackageID = C47.PackageID
						--Lấy bảng giá gói
						LEFT JOIN (
									SELECT M.APKMaster, M.DivisionID, M.PackagePriceID, M.PackageID, Isnull(M.OrderPackage, 0) as OrderPackage
											, Case when Isnull(M.IsTaxIncluded, 0) = 0 then  Sum(C48.UnitPrice + C48.VATAmount) else Sum(C48.UnitPrice) end as PackagePrice 
									FROM POST2011 M  With (NOLOCK) INNER JOIN CT0148 C48 With (NOLOCK) on M.PackagePriceID = C48.PackagePriceID and M.PackageID = C48.PackageID and M.APKPackageInventoryID = C48.APK
									WHERE M.APKMaster = @APK and M.DeleteFlg = 0 and M.IsPackage = 1
									Group by M.APKMaster, M.DivisionID, M.PackagePriceID, M.PackageID, Isnull(M.IsTaxIncluded, 0), Isnull(M.OrderPackage, 0)
								  ) C48 ON M.APKMaster = C48.APKMaster and M.PackagePriceID = C48.PackagePriceID and M.PackageID = C48.PackageID and Isnull(M.OrderPackage, 0) = Isnull(C48.OrderPackage, 0)
						--Lấy bảng giá khuyến mãi
						LEFT JOIN OT1302 O31 With (NOLOCK) on O31.DivisionID = M.DivisionID and O31.ID = M.PromotePriceTableID and O31.InventoryID = M.InventoryID and M.IsPromotePriceTable = 1
						--Lấy bảng giá chung
						LEFT JOIN OT1302 O32 With (NOLOCK) on O32.DivisionID = M.DivisionID and O32.ID = M.PriceTable and O32.InventoryID = M.InventoryID and M.IsTable = 1
						
						LEFT JOIN AT1101 A WITH (NOLOCK) ON A.DivisionID = M.DivisionID
				Where M.APKMaster = @APK
				Order by M.OrderNo
	End
	ELSE
	IF @CustomerName =  98 --ATTOM
	Begin
		Select  M.IsPackage
				, M.PackagePriceID
				, M.PackageID
				, C47.PackageName
				, Case when M.IsPackage = 1 then 1.0 else 0.0 end as PackageQuantity
				--, Case when M.IsPackage = 1 then C48.PackagePrice else 0.0 end as PackagePrice
				--, Case when M.IsPackage = 1 then C48.PackagePrice else 0.0 end as PackageAmount
				, M.InventoryID
				, M.InventoryName
				, M.UnitID
				, M.ActualQuantity
				, Case when M.IsPackage = 1
					   then 0.0 
						else (Case when M.IsPromotePriceTable = 1  then Case when Isnull(IsTaxIncluded, 0) = 0 
																			 then Isnull(O31.UnitPrice, 0) + Isnull(O31.VATAmount, 0)
																			 Else Isnull(O31.UnitPrice, 0) end 
								   when M.IsTable = 1  then Case when Isnull(IsTaxIncluded, 0) = 0 
																 then Isnull(O32.UnitPrice, 0) + Isnull(O32.VATAmount, 0) 
																 Else Isnull(O32.UnitPrice, 0) end
								   Else Case when Isnull(IsTaxIncluded, 0) = 0 
											 then Isnull(M.UnitPrice, 0) + Isnull(M.TaxAmount, 0) 
											 Else Isnull(M.UnitPrice, 0) end
								   End
							)  
						end as  UnitPrice
				, Case when M.IsPackage = 1
					   then 0.0 
						else (Case when M.IsPromotePriceTable = 1 then Case when Isnull(IsTaxIncluded, 0) = 0 
																			then (Isnull(O31.UnitPrice, 0) + Isnull(O31.VATAmount, 0)) * Isnull(M.ActualQuantity, 0)
																			Else Isnull(O31.UnitPrice, 0)* Isnull(M.ActualQuantity, 0) end 
								   when M.IsTable = 1  then Case when Isnull(IsTaxIncluded, 0) = 0 
																 then (Isnull(O32.UnitPrice, 0) + Isnull(O32.VATAmount, 0)) * Isnull(M.ActualQuantity, 0)
																 Else Isnull(O32.UnitPrice, 0)* Isnull(M.ActualQuantity, 0) end
								   Else	Case when Isnull(IsTaxIncluded, 0) = 0 
											 then (Isnull(M.UnitPrice, 0) + Isnull(M.TaxAmount, 0)) * Isnull(M.ActualQuantity, 0)
											 Else Isnull(M.UnitPrice, 0)* Isnull(M.ActualQuantity, 0) end
								   End
							)  
						end as  Amount
				, M.DiscountRate
				, M.DiscountAmount as RefDiscountAmount
				, M.VATGroupID
				, M.VATPercent
				, M.TaxAmount as RefTaxAmount
				, ROUND(M.InventoryAmount , A.ConvertedDecimals) InventoryAmount
				, M.Notes
				, M.OrderNo
				, M.MemberToTake
				, M.DeliveryToMemberID 
				, Isnull(M.OrderPackage, 0) as OrderPackage
				From POST2011 M With (NOLOCK)
						Left join CT0147 C47 With (NOLOCK) on M.PackagePriceID = C47.PackagePriceID and M.PackageID = C47.PackageID
						----Lấy bảng giá gói
						--LEFT JOIN (
						--			SELECT M.APKMaster, M.DivisionID, M.PackagePriceID, M.PackageID, Isnull(M.OrderPackage, 0) as OrderPackage
						--					, Case when Isnull(M.IsTaxIncluded, 0) = 0 then  Sum(C48.UnitPrice + C48.VATAmount) else Sum(C48.UnitPrice) end as PackagePrice 
						--			FROM POST2011 M  With (NOLOCK) INNER JOIN CT0148 C48 With (NOLOCK) on M.PackagePriceID = C48.PackagePriceID and M.PackageID = C48.PackageID and M.APKPackageInventoryID = C48.APK
						--			WHERE M.APKMaster = @APK and M.DeleteFlg = 0 and M.IsPackage = 1
						--			Group by M.APKMaster, M.DivisionID, M.PackagePriceID, M.PackageID, Isnull(M.IsTaxIncluded, 0), Isnull(M.OrderPackage, 0)
						--		  ) C48 ON M.APKMaster = C48.APKMaster and M.PackagePriceID = C48.PackagePriceID and M.PackageID = C48.PackageID and Isnull(M.OrderPackage, 0) = Isnull(C48.OrderPackage, 0)
						--Lấy bảng giá khuyến mãi
						LEFT JOIN OT1302 O31 With (NOLOCK) on O31.DivisionID = M.DivisionID and O31.ID = M.PromotePriceTableID and O31.InventoryID = M.InventoryID and M.IsPromotePriceTable = 1
						--Lấy bảng giá chung
						LEFT JOIN OT1302 O32 With (NOLOCK) on O32.DivisionID = M.DivisionID and O32.ID = M.PriceTable and O32.InventoryID = M.InventoryID and M.IsTable = 1
						
						LEFT JOIN AT1101 A WITH (NOLOCK) ON A.DivisionID = M.DivisionID
				Where M.APKMaster = @APK
				Order by M.OrderNo
	End
	ELSE
	Begin
			Select  M.IsPackage
				, M.PackagePriceID
				, M.PackageID
				, C47.PackageName
				, Case when M.IsPackage = 1 then 1.0 else 0.0 end as PackageQuantity
				, Case when M.IsPackage = 1 then C48.PackagePrice else 0.0 end as PackagePrice
				, Case when M.IsPackage = 1 then C48.PackagePrice else 0.0 end as PackageAmount
				, M.InventoryID
				, M.InventoryName
				, M.UnitID
				, M.ActualQuantity
				, Case when M.IsPackage = 1
					   then 0.0 
						else (Case when M.IsPromotePriceTable = 1  then Case when Isnull(IsTaxIncluded, 0) = 0 
																			 then Isnull(O31.UnitPrice, 0) + Isnull(O31.VATAmount, 0)
																			 Else Isnull(O31.UnitPrice, 0) end 
								   when M.IsTable = 1  then Case when Isnull(IsTaxIncluded, 0) = 0 
																 then Isnull(O32.UnitPrice, 0) + Isnull(O32.VATAmount, 0) 
																 Else Isnull(O32.UnitPrice, 0) end
								   Else Case when Isnull(IsTaxIncluded, 0) = 0 
											 then Isnull(M.UnitPrice, 0) + Isnull(M.TaxAmount, 0) 
											 Else Isnull(M.UnitPrice, 0) end
								   End
							)  
						end as  UnitPrice
				, Case when M.IsPackage = 1
					   then 0.0 
						else (Case when M.IsPromotePriceTable = 1 then Case when Isnull(IsTaxIncluded, 0) = 0 
																			then (Isnull(O31.UnitPrice, 0) + Isnull(O31.VATAmount, 0)) * Isnull(M.ActualQuantity, 0)
																			Else Isnull(O31.UnitPrice, 0)* Isnull(M.ActualQuantity, 0) end 
								   when M.IsTable = 1  then Case when Isnull(IsTaxIncluded, 0) = 0 
																 then (Isnull(O32.UnitPrice, 0) + Isnull(O32.VATAmount, 0)) * Isnull(M.ActualQuantity, 0)
																 Else Isnull(O32.UnitPrice, 0)* Isnull(M.ActualQuantity, 0) end
								   Else	Case when Isnull(IsTaxIncluded, 0) = 0 
											 then (Isnull(M.UnitPrice, 0) + Isnull(M.TaxAmount, 0)) * Isnull(M.ActualQuantity, 0)
											 Else Isnull(M.UnitPrice, 0)* Isnull(M.ActualQuantity, 0) end
								   End
							)  
						end as  Amount
				, M.DiscountRate
				, M.DiscountAmount as RefDiscountAmount
				, M.VATGroupID
				, M.VATPercent
				, M.TaxAmount as RefTaxAmount
				, ROUND(M.InventoryAmount , A.ConvertedDecimals) InventoryAmount
				, M.Notes
				, M.OrderNo
				, M.MemberToTake
				, M.DeliveryToMemberID 
				, Isnull(M.OrderPackage, 0) as OrderPackage
				From POST2011 M With (NOLOCK)
						Left join CT0147 C47 With (NOLOCK) on M.PackagePriceID = C47.PackagePriceID and M.PackageID = C47.PackageID
						--Lấy bảng giá gói
						LEFT JOIN (
									SELECT M.APKMaster, M.DivisionID, M.PackagePriceID, M.PackageID, Isnull(M.OrderPackage, 0) as OrderPackage
											, Case when Isnull(M.IsTaxIncluded, 0) = 0 then  Sum(C48.UnitPrice + C48.VATAmount) else Sum(C48.UnitPrice) end as PackagePrice 
									FROM POST2011 M  With (NOLOCK) INNER JOIN CT0148 C48 With (NOLOCK) on M.PackagePriceID = C48.PackagePriceID and M.PackageID = C48.PackageID and M.APKPackageInventoryID = C48.APK
									WHERE M.APKMaster = @APK and M.DeleteFlg = 0 and M.IsPackage = 1
									Group by M.APKMaster, M.DivisionID, M.PackagePriceID, M.PackageID, Isnull(M.IsTaxIncluded, 0), Isnull(M.OrderPackage, 0)
								  ) C48 ON M.APKMaster = C48.APKMaster and M.PackagePriceID = C48.PackagePriceID and M.PackageID = C48.PackageID and Isnull(M.OrderPackage, 0) = Isnull(C48.OrderPackage, 0)
						--Lấy bảng giá khuyến mãi
						LEFT JOIN OT1302 O31 With (NOLOCK) on O31.DivisionID = M.DivisionID and O31.ID = M.PromotePriceTableID and O31.InventoryID = M.InventoryID and M.IsPromotePriceTable = 1
						--Lấy bảng giá chung
						LEFT JOIN OT1302 O32 With (NOLOCK) on O32.DivisionID = M.DivisionID and O32.ID = M.PriceTable and O32.InventoryID = M.InventoryID and M.IsTable = 1
						
						LEFT JOIN AT1101 A WITH (NOLOCK) ON A.DivisionID = M.DivisionID
				Where M.APKMaster = @APK
				Order by M.OrderNo

	End

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
