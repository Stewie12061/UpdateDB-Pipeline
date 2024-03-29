IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP00103]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP00103]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Check xuất tồn trước khi đóng event
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---- Create on 02/01/2018 by Phan thanh hoang vu: Check ton kho trước khi đóng event
-- <Example> EXEC POSP00103 'HCM', 'CH-HCM001', ''
/*	exec POSP00102 @DivisionID=N'HCM',@ShopID=N'EV000asdasda013245325\=\=\=',@FormID=N'POSF0010',@Mode=3,@IsDisable=1,@UserID=N'VU'
	Declare @Status TINYINT
	EXEC POSP00103 'HCM', 'EV000asdasda013245325\=\=\=', NULL, @Status  output
	SELECT @Status
*/
CREATE PROCEDURE POSP00103 ( 
		@DivisionID AS NVARCHAR(50),
		@ShopID AS NVARCHAR(50),
		@UserID AS NVARCHAR(50),
		@Status  TINYINT OUTPUT
) 
AS				 DECLARE @Message AS NVARCHAR(250),
						 @EndQuantity AS Decimal(28,8)
				 SET @Status = 0
				 
				 DECLARE @POSP00103 table 
					(	DivisionID NVARCHAR(50),
						ShopID NVARCHAR(50),
						WareHouseID NVARCHAR(50),
						InventoryID NVARCHAR(50),
						UnitID NVARCHAR(50),
						BeginQuantity Decimal(28,8),
						ImQuantity Decimal(28,8),
						ExQuantity Decimal(28,8)
					)
					Insert into @POSP00103 ( DivisionID, ShopID, WareHouseID, InventoryID, UnitID, BeginQuantity, ImQuantity, ExQuantity)
					--Số dư đầu kỳ
					Select	P01.DivisionID, P01.ShopID, P01.WareHouseID, P01.InventoryID, P01.UnitID
							, Sum(P01.BeginQuantity) + Sum(P01.ImQuantity) - Sum(P01.ExQuantity) AS BeginQuantity, 0 as ImQuantity, 0 as ExQuantity
								FROM (
										SELECT	M.DivisionID, M.ShopID, D.WareHouseID, D.InventoryID, D.UnitID
												, Sum(D.Quantity) as BeginQuantity, 0 as ImQuantity, 0 as ExQuantity
										FROM POST0038 M WITH (NOLOCK) inner join POST0039 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
										left join POST0030 F WITH (NOLOCK) on M.DivisionID = F.DivisionID and D.ShopID= F.ShopID and F.InventoryID = D.InventoryID
										Where M.DivisionID = @DivisionID and M.ShopID = @ShopID and M.DeleteFlg =0 
										Group by M.DivisionID, M.ShopID, D.WareHouseID, D.InventoryID, D.UnitID
										Union all
										SELECT	M.DivisionID, M.ShopID, D.WareHouseID, D.InventoryID, D.UnitID
												, 0 as BeginQuantity, Sum(D.ActualQuantity) as ImQuantity, 0 as ExQuantity
										FROM POST0015 M WITH (NOLOCK) inner join POST00151 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
										left join POST0030 F WITH (NOLOCK) on M.DivisionID = F.DivisionID and D.ShopID= F.ShopID and F.InventoryID = D.InventoryID
										Where M.DivisionID = @DivisionID and M.ShopID = @ShopID and M.DeleteFlg =0
										Group by M.DivisionID, M.ShopID, D.WareHouseID, D.InventoryID, D.UnitID
										Union all
										SELECT	M.DivisionID, M.ShopID, M.WareHouseID, D.InventoryID, D.UnitID
												, 0 as BeginQuantity, 0 as ImQuantity, Sum(D.ShipQuantity) as ExQuantity
										FROM POST0027 M WITH (NOLOCK) inner join POST0028 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
										left join POST0030 F WITH (NOLOCK) on M.DivisionID = F.DivisionID and D.ShopID= F.ShopID and F.InventoryID = D.InventoryID
										Where M.DivisionID = @DivisionID and M.ShopID = @ShopID and M.DeleteFlg =0
										Group by M.DivisionID, M.ShopID, M.WareHouseID, D.InventoryID, D.UnitID
										) P01
								GROUP BY P01.DivisionID, P01.ShopID, P01.WareHouseID, P01.InventoryID, P01.UnitID
					Union all 
					--Phiếu nhập
					SELECT	M.DivisionID, M.ShopID, D.WareHouseID, D.InventoryID, D.UnitID
												, 0 as BeginQuantity, Sum(D.ActualQuantity) as ImQuantity, 0 as ExQuantity
					FROM POST0015 M WITH (NOLOCK) inner join POST00151 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
												  left join POST0030 F WITH (NOLOCK) on M.DivisionID = F.DivisionID and D.ShopID= F.ShopID and F.InventoryID = D.InventoryID
					Where M.DivisionID = @DivisionID and M.ShopID = @ShopID and M.DeleteFlg =0
					Group by M.DivisionID, M.ShopID, D.WareHouseID, D.InventoryID, D.UnitID
					Union all 
					--Phiếu xuất
					SELECT	M.DivisionID, M.ShopID, M.WareHouseID, D.InventoryID, D.UnitID
												, 0 as BeginQuantity, 0 as ImQuantity, Sum(D.ShipQuantity) as ExQuantity
					FROM POST0027 M WITH (NOLOCK) inner join POST0028 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
												  left join POST0030 F WITH (NOLOCK) on M.DivisionID = F.DivisionID and D.ShopID= F.ShopID and F.InventoryID = D.InventoryID
					Where M.DivisionID = @DivisionID and M.ShopID = @ShopID and M.DeleteFlg =0
					Group by M.DivisionID, M.ShopID, M.WareHouseID, D.InventoryID, D.UnitID 
					
					Set @EndQuantity = (Select Sum(isnull(R.BeginQuantity, 0) + isnull(R.ImQuantity, 0) - Isnull(R.ExQuantity, 0))
										From	@POSP00103 R
										Group by R.DivisionID, R.ShopID)
					
					IF Isnull(@EndQuantity, 0) > 0
					BEGIN
						SET @Status = 1
						GOTO Mess
					END
Mess:

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
