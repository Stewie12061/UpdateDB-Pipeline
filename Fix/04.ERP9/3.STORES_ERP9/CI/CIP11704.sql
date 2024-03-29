IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'CIP11704') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE CIP11704
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Thêm/sửa mặt hàng bên CI thì thêm/sửa mặt hàng tương ứng bên POS
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 16/09/2016
-- <Example>
----EXEC CIP11704 'HT','HTBT000001', 'HTBT000001', 3
----
CREATE PROCEDURE CIP11704 ( 
        @DivisionID VARCHAR(50),
		@InventoryID nvarchar(100), 
		@InventoryIDNew nvarchar(100), --Sửa thành mã vật tư mới nếu mã vật tư chưa được sử dụng
		@TypeID tinyint				--Loại 1: Thêm, 2:Sửa
) 
AS
Begin
	Declare @SrtDivisionID Varchar(250), 
			@SrtShopID Varchar(250), 
			@SrtInventoryTypeIDPOS0010 Varchar(250),
			@Cur CURSOR
	IF @TypeID = 1 --Chạy thêm vật tư bên CI thì thêm bên POS
	Begin
			SET @Cur = CURSOR SCROLL KEYSET FOR
			SELECT	DivisionID, ShopID, InventoryTypeID
			FROM POST0010
			OPEN @Cur
			FETCH NEXT FROM @Cur INTO @SrtDivisionID, @SrtShopID, @SrtInventoryTypeIDPOS0010
			WHILE @@FETCH_STATUS = 0
				BEGIN
						IF not Exists  ( Select * From POST0030 
										 Where DivisionID  = @SrtDivisionID and ShopID = @SrtShopID and InventoryID = @InventoryID
											   and InventoryTypeID in (Select Data from Split(@SrtInventoryTypeIDPOS0010, ',')))
						Begin
								Insert into POST0030(DivisionID, ShopID, Barcode, InventoryID, InventoryName,InventoryTypeID, UnitID
													, Ana01ID, Ana02ID, Ana03ID, Ana04ID, Ana05ID, Ana06ID, Ana07ID, Ana08ID, Ana09ID, Ana10ID
													, CreateUserID,CreateDate, LastModifyUserID, LastModifyDate)
								SELECT @SrtDivisionID, @SrtShopID, Barcode, InventoryID, InventoryName,InventoryTypeID, UnitID
													, I01ID, I02ID, I03ID, I04ID, I05ID, I06ID, I07ID, I08ID, I09ID, I10ID
													, CreateUserID,CreateDate, LastModifyUserID, LastModifyDate
								FROM AT1302
								WHERE InventoryID = @InventoryID and InventoryTypeID in (Select Data from Split(@SrtInventoryTypeIDPOS0010, ','))
						End
						FETCH NEXT FROM @Cur INTO	@SrtDivisionID, @SrtShopID, @SrtInventoryTypeIDPOS0010
				END
			CLOSE @Cur
			DEALLOCATE @Cur
	End

	IF @TypeID = 2 --Chạy sửa vật tư bên CI thì sửa bên POS (kiểm tra nếu nếu tồn tại vật tư thị update, ngược lại tồn tại thì insert)
	Begin
			SET @Cur = CURSOR SCROLL KEYSET FOR
			SELECT	DivisionID, ShopID, InventoryTypeID 
			FROM POST0010
			OPEN @Cur
			FETCH NEXT FROM @Cur INTO @SrtDivisionID, @SrtShopID, @SrtInventoryTypeIDPOS0010
			WHILE @@FETCH_STATUS = 0
				BEGIN
							IF not Exists  ( Select * From POST0030 
											 Where DivisionID  = @SrtDivisionID and ShopID = @SrtShopID and InventoryID = @InventoryID
											   and InventoryTypeID in (Select Data from Split(@SrtInventoryTypeIDPOS0010, ',')))
							Begin
									Insert into POST0030(DivisionID, ShopID, Barcode, InventoryID, InventoryName,InventoryTypeID, UnitID
														, Ana01ID, Ana02ID, Ana03ID, Ana04ID, Ana05ID, Ana06ID, Ana07ID, Ana08ID, Ana09ID, Ana10ID
														, CreateUserID,CreateDate, LastModifyUserID, LastModifyDate)
									SELECT @SrtDivisionID, @SrtShopID, Barcode, InventoryID, InventoryName,InventoryTypeID, UnitID
														, I01ID, I02ID, I03ID, I04ID, I05ID, I06ID, I07ID, I08ID, I09ID, I10ID
														, CreateUserID,CreateDate, LastModifyUserID, LastModifyDate
									FROM AT1302
									WHERE InventoryID = @InventoryID and InventoryTypeID in (Select Data from Split(@SrtInventoryTypeIDPOS0010, ','))
							End
							Else
							Begin
								Update POST0030 Set  
											POST0030.Barcode = AT1302.Barcode,  POST0030.InventoryName = AT1302.InventoryName,
											POST0030.InventoryTypeID = AT1302.InventoryTypeID, POST0030.UnitID = AT1302.UnitID, 
											POST0030.Ana01ID = AT1302.I01ID, POST0030.Ana02ID = AT1302.I02ID, 
											POST0030.Ana03ID = AT1302.I03ID, POST0030.Ana04ID = AT1302.I04ID, 
											POST0030.Ana05ID = AT1302.I05ID, POST0030.Ana06ID = AT1302.I06ID, 
											POST0030.Ana07ID = AT1302.I07ID, POST0030.Ana08ID = AT1302.I08ID, 
											POST0030.Ana09ID = AT1302.I09ID, POST0030.Ana10ID = AT1302.I10ID,
											POST0030.LastModifyUserID = AT1302.LastModifyUserID, POST0030.LastModifyDate = AT1302.LastModifyDate
								From POST0030 inner join AT1302 on POST0030.InventoryID = AT1302.InventoryID 
								Where  POST0030.DivisionID  = @SrtDivisionID and POST0030.ShopID = @SrtShopID and POST0030.InventoryID =@InventoryID 
							End
														
						FETCH NEXT FROM @Cur INTO @SrtDivisionID, @SrtShopID, @SrtInventoryTypeIDPOS0010
				END
			CLOSE @Cur
			DEALLOCATE @Cur
	End
End