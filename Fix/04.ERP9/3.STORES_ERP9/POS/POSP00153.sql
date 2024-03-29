IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP00153]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP00153]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
----  Load detail cho form ke thua nhieu phieu xuat
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---
---Created by: Phan thanh hoàng vũ
---Edited by: Phan thanh hoàng vũ: Bổ sung chức năng dùng chung
-- Modified by :Cao Thị Phượng Date 07/09/2017: Bổ sung lấy thêm giá ra từ phiếu yêu cầu VCNB
-- Modified by :Cao Thị Phượng Date 21/03/2018: Bổ sung lấy trạng thái hàng hóa để insert vào phiếu nhập
-- Modified by Thị Phượng Date 22/03/2018: Bổ sung order by them Orders (STT)
---Edited by: Phan thanh hoàng vũ: Lấy kho xuất của POS1 để insert phiếu chuyển kho nội bộ thứ 1 (POS -> ERP)
-- Modified by Trà Giang on 21/02/2019: Chỉnh sửa load trạng thái mặt hàng khi kế thừa phiếu yêu cầu 
-- Modified by Trà Giang on 26/11/2019: Truyền biến load điều kiện hiển thị danh sách mặt hàng khi chuyển hàng qua shop.
-- Modified by Thanh Lượng on 27/09/2023: [2023/09/TA/0204] - Bổ sung điều kiện không load những mặt hàng đã check "hoàn thành"(status !=1)(Customize ThanhLiem)

---purpose: Filter dữ liệu vào lưới Detail
---	Exec POSP00153 'KC', '85501220-2bb6-40c1-b2a6-8b4b52c16390'

Create PROCEDURE POSP00153
(
    @DivisionID VARCHAR(50),
    @APKList VARCHAR(MAX),
	@IsExportCompanyToShop TINYINT
)
AS
Begin
		DECLARE 
			@sSQL NVARCHAR(MAX),
			@sWHERE AS NVARCHAR(4000),
			@CustomerIndex INT = (SELECT CustomerName FROM CustomerIndex)
		
		SET @sWHERE = ''
		
		IF @CustomerIndex = 163
		BEGIN
					-- Những phiếu đã check hoàn thành thì không hiện kế thừa
					SET @sWHERE = @sWHERE + 'and D.status !=1'
		END
		IF Isnull(@DivisionID, '')!=''
			SET @sWHERE = @sWHERE + ' And M.DivisionID ='''+@DivisionID+''''
		
		IF Isnull(@APKList, '') !=''
			SET @sWHERE = @sWHERE + ' And M.VoucherID IN ('''+@APKList+''')'

		IF @IsExportCompanyToShop = 1
			SET @sSQL = 'Select DISTINCT 0 AS RowNum, D.TransactionID as APK, D.VoucherID as APKMaster, M.DivisionID, M.VoucherNo
								, B.InventoryTypeID, D.InventoryID, B.InventoryName, D.UnitID, Isnull(D.ActualQuantity,0) as ActualQuantity
								, Isnull(D.ReceiveQuantity,0) as ReceiveQuantity, isnull(D.ActualQuantity,0) - Isnull(D.QuantityCompanyToShop,0) as Remain 
								, D.Notes as Description
								, Case When B.MethodID = 3 then D.UnitPrice 
									 When B.MethodID not in (3, 1) 
											then (
													Select UnitPrice 
													From
														(
															SELECT A.InventoryID, A.UnitPrice, A.WareHouseID 
															FROM 
																(
																	SELECT A.InventoryID, isnull(A.UnitPrice, 0) UnitPrice, A.WareHouseID, ROW_NUMBER() OVER (PARTITION BY A.InventoryID ORDER BY M.VoucherDate DESC) rn
																	FROM AT2008 A WITH (NOLOCK) 
																) A Inner JOIN AT1302 C WITH (NOLOCK) ON A.InventoryID = C.InventoryID and C.MethodID not in (3,1)
															Where A.InventoryID = D.InventoryID and A.WareHouseID = M.WareHouseID2 	AND rn = 1
														) B
												 ) End as UnitPrice
								,POST0023.StatusInventory AS StatusInventory
								, D.Orders as OrderNo
								, WareHouseID2
						Into #TemWT0095
  					    From WT0095 M With (NOLOCK) inner join WT0096 D With (NOLOCK) On M.DivisionID = D.DivisionID and M.VoucherID = D.VoucherID
						Left join AT1302 B With (NOLOCK) on D.InventoryID = B.InventoryID
						 LEFT JOIN POST0022 WITH (NOLOCK) ON M.DivisionID = POST0022.DivisionID AND M.RefNo01=POST0022.VoucherNo
						  LEFT JOIN POST0023  WITH (NOLOCK) ON POST0023.DivisionID = POST0022.DivisionID AND POST0022.APK=POST0023.APKMaster
						Where 1=1 ' + @sWHERE + '  
						 and (isnull(D.ActualQuantity,0) - Isnull(D.QuantityCompanyToShop,0))>0
						Order by D.Orders
						Select M.RowNum, M.APK, M.APKMaster, M.DivisionID, M.VoucherNo
								, M.InventoryTypeID, M.InventoryID, M.InventoryName, M.UnitID, M.ActualQuantity
								, M.ReceiveQuantity, M.Remain 
								, M.Description, M.UnitPrice, M.StatusInventory, A.Description as StatusInventoryName
								, M.OrderNo
								, M.WareHouseID2
  					     From #TemWT0095 M 
						 LEFT JOIN POST0099 A With (NOLOCK) ON A.CodeMaster = ''POS000015'' and A.Disabled = 0 and A.ID= M.StatusInventory
					     '
		
		ELSE
		
			SET @sSQL = 'Select DISTINCT 0 AS RowNum, D.TransactionID as APK, D.VoucherID as APKMaster, M.DivisionID, M.VoucherNo
								, B.InventoryTypeID, D.InventoryID, B.InventoryName, D.UnitID, Isnull(D.ActualQuantity,0) as ActualQuantity
								, Isnull(D.ReceiveQuantity,0) as ReceiveQuantity, isnull(D.ActualQuantity,0) - Isnull(D.ReceiveQuantity,0) as Remain 
								, D.Notes as Description
								, Case When B.MethodID = 3 then D.UnitPrice 
									 When B.MethodID not in (3, 1) 
											then (
													Select UnitPrice 
													From
														(
															SELECT A.InventoryID, A.UnitPrice, A.WareHouseID 
															FROM 
																(
																	SELECT A.InventoryID, isnull(A.UnitPrice, 0) UnitPrice, A.WareHouseID, ROW_NUMBER() OVER (PARTITION BY A.InventoryID ORDER BY M.VoucherDate DESC) rn
																	FROM AT2008 A WITH (NOLOCK) 
																) A Inner JOIN AT1302 C WITH (NOLOCK) ON A.InventoryID = C.InventoryID and C.MethodID not in (3,1)
															Where A.InventoryID = D.InventoryID and A.WareHouseID = M.WareHouseID2 	AND rn = 1
														) B
												 ) End as UnitPrice
								,POST0023.StatusInventory AS StatusInventory
								, D.Orders as OrderNo
								, WareHouseID2
						Into #TemWT0095
  					    From WT0095 M With (NOLOCK) inner join WT0096 D With (NOLOCK) On M.DivisionID = D.DivisionID and M.VoucherID = D.VoucherID
						Left join AT1302 B With (NOLOCK) on D.InventoryID = B.InventoryID
						 LEFT JOIN POST0022 WITH (NOLOCK) ON M.DivisionID = POST0022.DivisionID AND M.RefNo01=POST0022.VoucherNo
						  LEFT JOIN POST0023  WITH (NOLOCK) ON POST0023.DivisionID = POST0022.DivisionID AND POST0022.APK=POST0023.APKMaster
						Where 1=1 ' + @sWHERE + '  
						and (D.Status = 0 or D.Status = 1 or D.Status is Null)  and (isnull(D.ActualQuantity,0) - Isnull(D.ReceiveQuantity,0))>0
						Order by D.Orders
						Select M.RowNum, M.APK, M.APKMaster, M.DivisionID, M.VoucherNo
								, M.InventoryTypeID, M.InventoryID, M.InventoryName, M.UnitID, M.ActualQuantity
								, M.ReceiveQuantity, M.Remain 
								, M.Description, M.UnitPrice, M.StatusInventory, A.Description as StatusInventoryName
								, M.OrderNo
								, M.WareHouseID2
  					     From #TemWT0095 M 
						 LEFT JOIN POST0099 A With (NOLOCK) ON A.CodeMaster = ''POS000015'' and A.Disabled = 0 and A.ID= M.StatusInventory
					     '
		Exec (@sSQL)
		--Print  (@sSQL) 
End


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
