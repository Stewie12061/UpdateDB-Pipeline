-- <Summary>
---- Insert dữ liệu ngầm vào bảng OT0099 - Note: Khi Update không được sửa @CodeMaster và @ID
-- <History>
---- Create on 16/02/2015 by Phan thanh hoàng Vũ
---- Modified on 09/02/2017 by Phan Hải Long: Bổ sung đơn hàng sản xuất
---- Modified on 06/12/2018 by Như Hàn: Bổ sung mức độ ưu tiên
---- Modified on 14/12/2018 by Như Hàn: Bổ sung tình trạng nhận hàng
---- Modified on 28/07/2021 by Hoài Bảo: Bổ sung dữ liệu cột [CodeMasterName]
---- <Example>
DECLARE @CodeMaster VARCHAR(50), @OrderNo INT, @ID VARCHAR(50), @Description NVARCHAR(250), @DescriptionE NVARCHAR(250), @Disabled TINYINT, @CodeMasterName NVARCHAR(MAX)

------Đơn hàng bán------
------Loại đơn hàng------- 
SET @CodeMaster = 'OrderTypeID' 
SET @OrderNo = 1  
SET @ID = '0' 
SET @Description = N'0-Đơn hàng bán' 
SET @DescriptionE = N'0-Đơn hàng bán' 
SET @Disabled = 0
SET @CodeMasterName = N'Loại đơn hàng (Màn hình Cập nhật đơn hàng POF2018)' 
IF NOT EXISTS (SELECT TOP 1 1 FROM OT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) 
	INSERT INTO OT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], CodeMasterName) 
	VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @CodeMasterName) 
ELSE 
	UPDATE OT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, CodeMasterName = @CodeMasterName
	WHERE CodeMaster = @CodeMaster AND ID = @ID 
------Loại đơn hàng-------
SET @CodeMaster = 'OrderTypeID' 
SET @OrderNo = 2  
SET @ID = '1' 
SET @Description = N'1-Đơn hàng điều chỉnh' 
SET @DescriptionE = N'1-Đơn hàng điều chỉnh' 
SET @Disabled = 0 
SET @CodeMasterName = N'Loại đơn hàng (Màn hình Cập nhật đơn hàng POF2018)' 
IF NOT EXISTS (SELECT TOP 1 1 FROM OT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) 
	INSERT INTO OT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], CodeMasterName) 
	VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @CodeMasterName) 
ELSE 
	UPDATE OT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, CodeMasterName = @CodeMasterName
	WHERE CodeMaster = @CodeMaster AND ID = @ID 
	
	
------Đơn hàng sản xuất------
------Loại đơn hàng-------
SET @CodeMaster = 'OrderTypeID2' 
SET @OrderNo = 3  
SET @ID = '0' 
SET @Description = N'0-Đơn hàng sản xuất' 
SET @DescriptionE = N'0-Đơn hàng sản xuất' 
SET @Disabled = 0 
SET @CodeMasterName = N'Đơn hàng sản xuất - Loại đơn hàng'
IF NOT EXISTS (SELECT TOP 1 1 FROM OT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) 
	INSERT INTO OT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], CodeMasterName) 
	VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @CodeMasterName) 
ELSE 
	UPDATE OT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, CodeMasterName = @CodeMasterName
	WHERE CodeMaster = @CodeMaster AND ID = @ID 
------Loại đơn hàng-------
SET @CodeMaster = 'OrderTypeID2' 
SET @OrderNo = 4  
SET @ID = '1' 
SET @Description = N'1-Đơn hàng sản xuất điều chỉnh' 
SET @DescriptionE = N'1-Đơn hàng sản xuất điều chỉnh' 
SET @Disabled = 0 
SET @CodeMasterName = N'Đơn hàng sản xuất - Loại đơn hàng'
IF NOT EXISTS (SELECT TOP 1 1 FROM OT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) 
	INSERT INTO OT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], CodeMasterName) 
	VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @CodeMasterName) 
ELSE 
	UPDATE OT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, CodeMasterName = @CodeMasterName
	WHERE CodeMaster = @CodeMaster AND ID = @ID 	


------Mức độ ưu tiên yêu cầu mua hàng-------
SET @CodeMaster = 'PriorityID' 
SET @OrderNo = 5  
SET @ID = '1' 
SET @Description = N'Ưu tiên 1' 
SET @DescriptionE = N'Priority 1' 
SET @Disabled = 0 
SET @CodeMasterName = N'Mức độ ưu tiên (Màn hình Danh sách yêu cầu mua hàng - POF2030)'
IF NOT EXISTS (SELECT TOP 1 1 FROM OT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) 
	INSERT INTO OT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], CodeMasterName) 
	VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @CodeMasterName) 
ELSE 
	UPDATE OT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, CodeMasterName = @CodeMasterName
	WHERE CodeMaster = @CodeMaster AND ID = @ID 	

SET @CodeMaster = 'PriorityID' 
SET @OrderNo = 6 
SET @ID = '2' 
SET @Description = N'Ưu tiên 2' 
SET @DescriptionE = N'Priority 2' 
SET @Disabled = 0 
SET @CodeMasterName = N'Mức độ ưu tiên (Màn hình Danh sách yêu cầu mua hàng - POF2030)'
IF NOT EXISTS (SELECT TOP 1 1 FROM OT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) 
	INSERT INTO OT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], CodeMasterName) 
	VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @CodeMasterName) 
ELSE 
	UPDATE OT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, CodeMasterName = @CodeMasterName
	WHERE CodeMaster = @CodeMaster AND ID = @ID 	

SET @CodeMaster = 'PriorityID' 
SET @OrderNo = 7 
SET @ID = '3' 
SET @Description = N'Ưu tiên 3' 
SET @DescriptionE = N'Priority 3' 
SET @Disabled = 0 
SET @CodeMasterName = N'Mức độ ưu tiên (Màn hình Danh sách yêu cầu mua hàng - POF2030)'
IF NOT EXISTS (SELECT TOP 1 1 FROM OT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) 
	INSERT INTO OT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], CodeMasterName) 
	VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @CodeMasterName) 
ELSE 
	UPDATE OT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, CodeMasterName = @CodeMasterName
	WHERE CodeMaster = @CodeMaster AND ID = @ID 	



SET @CodeMaster = 'ReceivingStatus' 
SET @OrderNo = 8 
SET @ID = '1' 
SET @Description = N'Đã lên tiến độ' 
SET @DescriptionE = N'Plan Receiving' 
SET @Disabled = 0 
SET @CodeMasterName = N'Tình trạng nhận hàng (Màn hình Danh mục đơn hàng mua - POF2000)'
IF NOT EXISTS (SELECT TOP 1 1 FROM OT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) 
	INSERT INTO OT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], CodeMasterName) 
	VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @CodeMasterName) 
ELSE 
	UPDATE OT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, CodeMasterName = @CodeMasterName
	WHERE CodeMaster = @CodeMaster AND ID = @ID 	

SET @CodeMaster = 'ReceivingStatus' 
SET @OrderNo = 9
SET @ID = '0' 
SET @Description = N'Chưa lên tiến độ' 
SET @DescriptionE = N'Not Plan Receiving' 
SET @Disabled = 0 
SET @CodeMasterName = N'Tình trạng nhận hàng (Màn hình Danh mục đơn hàng mua - POF2000)'
IF NOT EXISTS (SELECT TOP 1 1 FROM OT0099 WHERE CodeMaster = @CodeMaster AND ID = @ID) 
	INSERT INTO OT0099 (CodeMaster, OrderNo, ID, [Description],DescriptionE, [Disabled], CodeMasterName) 
	VALUES (@CodeMaster, @OrderNo, @ID, @Description, @DescriptionE, @Disabled, @CodeMasterName) 
ELSE 
	UPDATE OT0099 SET OrderNo = @OrderNo, [Description] = @Description,DescriptionE = @DescriptionE, [Disabled] =@Disabled, CodeMasterName = @CodeMasterName
	WHERE CodeMaster = @CodeMaster AND ID = @ID 	

