IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0066]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP0066]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Kiểm tra hàng tồn kho trương hợp Loại vật tư là [Phân loại bán hàng hoa]; [Nhóm đồ ăn] và [Nhóm thức uống] không theo dõi hàng tồn kho
---- 
---- 
----
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoang vu, Date: 25/07/2014
----Edit by	  : Phan thanh hoàng vũ on 18/08/2014
----Edit by	  : Phan thanh hoàng vũ on 28/06/2016 Chuyển dùng số chứng từ sang table để quản lý POST0015 (Phiếu nhập); POST0038 (Số dư), POST0027 (Phiếu xuất)
----Edit by	  : Phan thanh hoàng vũ on 26/10/2016: Sửa lại cách lấy dữ liệu mới hoàn toàn: do lấy sai số dư dầu và cuối so với báo cáo bảng cân đối tồn kho
----Edit by	  : Phan thanh hoàng vũ on 07/06/2017: Bổ sung dùng chung
----Edit by	  : Phan thanh hoàng vũ on 22/01/2018: Xử lý yêu cầu đẽ duyệt thì không cho phép xuất kho
----Edit by	  : Cao Thị Phượng on 19/03/2018: Xử lý không kiểm tra cửa hàng mà chỉ lấy kho trong cửa hàng để kiểm tra tránh trường hợp nhiều cửa hàng cùng 1 kho
----Edit by	  : Phan thanh hoàng vũ on 17/05/2018: Frame lại truogn72 hợp đề xuất -> Khi nào làm giữ chỗ thì sẽ mở ra
-- <Example> exec POSP0066 N'TMQ3',N'05',N'05H8KEMCLOSEUP220HUONGLOCDE','2016-10-26','111'

CREATE PROCEDURE POSP0066 ( 
		@DivisionID VARCHAR(50),
		@ShopID varchar(50),
		@InventoryID varchar(50) = null,
		@VoucherDate Datetime,
		@APK nvarchar(50) -- trường hợp: @APK is NULL (Thêm phiếu mới); @APK is not null (Sửa Phiếu cũ)
						   --@APK: là giá trị @APK của phiếu cần xuất hiện tại
) 
AS 
		DECLARE @sSQLBegin   NVARCHAR(MAX),  
				@sSQLImport   NVARCHAR(MAX),  
				@sSQLExport   NVARCHAR(MAX),  
				@sSQLRequest   NVARCHAR(MAX),  
				@sSQLResult   NVARCHAR(MAX),  
				@sWhere  NVARCHAR(MAX),
				@sWhereEx  NVARCHAR(MAX),
				@sWhereRe  NVARCHAR(MAX)
				
		SET @sWhereEx = ' '
		SET @sWhere = ' '
		SET @sWhereRe = ' '
		IF isnull(@DivisionID, '') !=''
		Begin
			SET @sWhere = @sWhere + ' And F.DivisionID = N'''+ @DivisionID+''''
			SET @sWhereEx = @sWhereEx + ' And F.DivisionID = N'''+ @DivisionID+''''
			SET @sWhereRe = @sWhereRe + ' And F.DivisionID = N'''+ @DivisionID+''''
		END
		IF Isnull(@ShopID, '') != ''
		Begin
			SET @sWhere = @sWhere + ' AND ( D.WareHouseID = (SELECT WarehouseID FROM POST0010 WHERE ShopID = N'''+ @ShopID+''')
											OR D.WareHouseID = (SELECT DisplayWareHouseID FROM POST0010 WHERE ShopID = N'''+ @ShopID+''')
											OR D.WareHouseID = (SELECT BrokenWareHouseID FROM POST0010 WHERE ShopID = N'''+ @ShopID+'''))'
			SET @sWhereEx = @sWhereEx + ' AND ( M.WareHouseID = (SELECT WarehouseID FROM POST0010 WHERE ShopID = N'''+ @ShopID+''')
											OR M.WareHouseID = (SELECT DisplayWareHouseID FROM POST0010 WHERE ShopID = N'''+ @ShopID+''')
											OR M.WareHouseID = (SELECT BrokenWareHouseID FROM POST0010 WHERE ShopID = N'''+ @ShopID+'''))'
			SET @sWhereRe = @sWhereRe + ' AND ( M.WareHouseID = (SELECT WarehouseID FROM POST0010 WHERE ShopID = N'''+ @ShopID+''')
											OR M.WareHouseID = (SELECT DisplayWareHouseID FROM POST0010 WHERE ShopID = N'''+ @ShopID+''')
											OR M.WareHouseID = (SELECT BrokenWareHouseID FROM POST0010 WHERE ShopID = N'''+ @ShopID+'''))'
		END
		IF Isnull(@InventoryID, '') !=''
		Begin
			SET @sWhere = @sWhere + ' AND F.InventoryID = N'''+ @InventoryID+''''
			SET @sWhereEx = @sWhereEx + ' AND F.InventoryID = N'''+ @InventoryID+''''
			SET @sWhereRe = @sWhereRe + ' AND F.InventoryID = N'''+ @InventoryID+''''
		END
		IF Isnull(@VoucherDate, '') != ''
		Begin
			SET @sWhere = @sWhere+ ' and CONVERT(VARCHAR(10),M.VoucherDate,112)  <= '''+ CONVERT(VARCHAR(10),@VoucherDate,112)+''''
			SET @sWhereEx = @sWhereEx+ ' and CONVERT(VARCHAR(10),M.VoucherDate,112)  <= '''+ CONVERT(VARCHAR(10),@VoucherDate,112)+''''
			SET @sWhereRe = @sWhereRe+ ' and CONVERT(VARCHAR(10),M.VoucherDate,112)  <= '''+ CONVERT(VARCHAR(10),@VoucherDate,112)+''''
		End

		IF Isnull(@APK, '') != ''
		Begin
			SET @sWhereEx = @sWhereEx+ ' and Cast(D.APKMInherited as Varchar(50)) != N'''+ @APK+''''
			SET @sWhereRe = @sWhereRe+ ' and Cast(D.InheritVoucherID as Varchar(50)) != N'''+ @APK+''''
		End
		else
		Begin
			SET @sWhereEx = @sWhereEx
			SET @sWhereRe = @sWhereRe
		End
			
		--Lấy đầu kỳ
		SET @sSQLBegin = N' 
					DECLARE @POSP0066 table 
								(	DivisionID NVARCHAR(50),
									ShopID NVARCHAR(50),
									WareHouseID NVARCHAR(50),
									InventoryID NVARCHAR(50),
									UnitID NVARCHAR(50),
									BeginQuantity Decimal(28,8),
									ImQuantity Decimal(28,8),
									ExQuantity Decimal(28,8)
								)
								Insert into @POSP0066 ( DivisionID, ShopID, WareHouseID, InventoryID, UnitID, BeginQuantity, ImQuantity, ExQuantity)
								SELECT	M.DivisionID, M.ShopID, D.WareHouseID, D.InventoryID, D.UnitID
												, D.Quantity as BeginQuantity, 0 as ImQuantity, 0 as ExQuantity
										FROM POST0038 M WITH (NOLOCK) inner join POST0039 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
										inner join POST0030 F WITH (NOLOCK) on D.DivisionID = F.DivisionID and D.ShopID= F.ShopID and D.InventoryID = F.InventoryID
										Where M.DeleteFlg =0 ' + @sWhere+ ''
		--Lấy phiếu nhập
		SET @sSQLImport = N' Union all 
							 SELECT	M.DivisionID, M.ShopID, D.WareHouseID, D.InventoryID, D.UnitID
												, 0 as BeginQuantity, D.ActualQuantity as ImQuantity, 0 as ExQuantity
										FROM POST0015 M WITH (NOLOCK) inner join POST00151 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
										inner join POST0030 F WITH (NOLOCK) on D.DivisionID = F.DivisionID and D.ShopID= F.ShopID and D.InventoryID = F.InventoryID
										Where M.DeleteFlg =0 ' +@sWhere+'
										'
		--Lấy phiếu xuất
		SET @sSQLExport = N' Union all 
							 SELECT	M.DivisionID, M.ShopID, M.WareHouseID, D.InventoryID, D.UnitID
												, 0 as BeginQuantity, 0 as ImQuantity, D.ShipQuantity as ExQuantity
										FROM POST0027 M WITH (NOLOCK) inner join POST0028 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
										inner join POST0030 F WITH (NOLOCK) on D.DivisionID = F.DivisionID and D.ShopID= F.ShopID and D.InventoryID = F.InventoryID
										Where M.DeleteFlg =0 ' + @sWhereEx+'
										'
		----Lấy phiếu yêu cầu xuất kho và yêu cầu vận chuyển nội bộ đã duyệt
		--SET @sSQLRequest = N' Union all 
		--					 SELECT	M.DivisionID, M.ObjectID as ShopID, M.WareHouseID, D.InventoryID, D.UnitID
		--										, 0 as BeginQuantity, 0 as ImQuantity, D.ActualQuantity as ExQuantity--, M.KindVoucherID, D.InheritTableID, D.InheritVoucherID, D.InheritTransactionID
		--								From WT0095 M inner join WT0096 D on M.DivisionID = D.DivisionID and M.VoucherID = D.VoucherID and M.KindVoucherID != 1 and D.InheritTableID in (''POST0022'', ''POST0016'')
		--								  inner join POST0030 F WITH (NOLOCK) on D.DivisionID = F.DivisionID and M.ObjectID= F.ShopID and D.InventoryID = F.InventoryID
		--								Where M.IsCheck = 1 ' + @sWhereRe+' 
		--								'
		--Lấy kết quả
		SET @sSQLResult = N'Select M.DivisionID, NULL as ShopID, M.WareHouseID, F.InventoryTypeID, F.IsStocked, M.InventoryID, M.UnitID
												, Sum(M.BeginQuantity) + Sum(M.ImQuantity) - Sum(M.ExQuantity) as Balance
										 From	@POSP0066 M Inner join AT1302 F  WITH (NOLOCK) on M.InventoryID = F.InventoryID
										 Group by  M.DivisionID, M.WareHouseID, F.InventoryTypeID, F.IsStocked, M.InventoryID, M.UnitID
										 Order by M.InventoryID, M.UnitID
							 '
		EXEC(@sSQLBegin + @sSQLImport+@sSQLExport +@sSQLResult)
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
