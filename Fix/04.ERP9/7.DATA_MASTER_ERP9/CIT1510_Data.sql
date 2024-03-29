----- Created by Nhật Thanh
----- Modified by Hoàng Long - 28/11/2023 - [2023/11/TA/0161] - Bổ sung điều kiện khuyến mãi số ngày cưới
---- DataMaster chương trình khuyến mãi

DECLARE @CustomerName INT = (SELECT TOP 1 CustomerName from CustomerIndex)
--SELECT * FROM CIT1510 ORDER BY TOOLTYPEID
DELETE FROM CIT1510

-- Cách trả
INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('CKTT', N'CK Trả Trước/Ngay', 'PayMenthod', N'Cách trả', N'Trừ ngay vào đơn hàng theo thứ tự')

INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('CKTS', N'CK Trả Sau', 'PayMenthod', N'Cách trả', N'Theo mốc thời gian quy định và theo thứ tự và Total')
		
-- Công cụ
INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('CKGT', N'CK Giá Trị', 'Tool', N'Công cụ', N'Chiết khấu tiền')

INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('CKTL', N'CK Tỷ Lệ', 'Tool', N'Công cụ', N'Chiết khấu tỉ lệ %')

INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('CKQT', N'CK Quà Tặng', 'Tool', N'Công cụ', N'Chiết khấu tặng quà')
IF @CustomerName = 162 -- Customize Gree
BEGIN	
INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('CKCB', N'Chiết khấu cảnh báo', 'Tool', N'Công cụ', N'Cảnh báo khi đạt điều kiện thiết lập')
END		
IF @CustomerName = 166 -- Customize Nệm Kim Cương
BEGIN
INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('CKD', N'CK Điểm', 'Tool', N'Công cụ', N'Chiết khấu điểm')
END

-- Neo chiết khấu
INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('AND', N'Chiết khấu cộng dồn', 'NEO', N'Neo chiết khấu', N'Đạt được tất cả điều kiện nào thỏa')

INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('OR', N'Chiết khấu điều kiện', 'NEO', N'Neo chiết khấu', N'Chỉ đạt được 1 điều kiện theo thứ tự ưu tiên từ trên xuống')
		
INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('STEP', N'Chiết khấu bậc thang', N'NEO', N'Neo chiết khấu', N'Đạt chiết khấu theo khung bậc thang quy định')
		
-- Đơn vị chiết khấu
INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('DH', N'Đơn hàng', 'DiscountUnit', N'Đơn vị chiết khấu', N'Chiết khấu trên tổng đơn hàng')

INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('Model', N'Model', 'DiscountUnit', N'Đơn vị chiết khấu', N'Chiết khấu cho từng model trong đơn hàng')
		
INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('Target', N'Nhóm đối tượng xác định', 'DiscountUnit', N'Đơn vị chiết khấu', N'Chiết khấu trên tổng những đối tượng đạt chiết khấu')
		
INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('ModelTarget', N'Đối tượng xác định', 'DiscountUnit', N'Đơn vị chiết khấu', N'Chiết khấu trên cụ thể từng đối tượng đạt chiết khấu')
		
-- Đơn vị target
INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('Quantity', N'Số lượng', 'TargetUnit', N'Đơn vị target', N'Thỏa chiết khấu nếu đạt đủ số lượng')
		
IF @CustomerName = 166 -- Customize Nệm Kim Cương
BEGIN
INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('TypeQuantity', N'Số loại mặt hàng', 'TargetUnit', N'Đơn vị target', N'Thỏa chiết khấu nếu đạt đủ số loại mặt hàng khác nhau trong đơn')
INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('TotalAccumulated', N'Tổng doanh thu', 'TargetUnit', N'Đơn vị target', N'Thỏa chiết khấu nếu đạt đủ doanh thu trong thời gian CTKM')
INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('TotalTurnover', N'Tổng doanh số', 'TargetUnit', N'Đơn vị target', N'Thỏa chiết khấu nếu đạt đủ doanh số trong thời gian CTKM')
INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
	VALUES ('WeddingDate', N'Ngày cưới', 'TargetUnit', N'Đơn vị target', N'Thỏa chiết khấu nếu đạt đủ số năm')
INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
	VALUES ('AccumulatedGrowUp', N'Tăng trưởng doanh thu', 'TargetUnit', N'Đơn vị target', N'Thỏa chiết khấu nếu đạt mức tăng trưởng so với năm trước')
END
	
INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('Value', N'Giá trị', 'TargetUnit', N'Đơn vị target', N'Thỏa chiết khấu nếu đạt đủ số tiền')
		
INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('KIT', N'Bộ KIT', 'TargetUnit', N'Đơn vị target', N'Thỏa chiết khấu nếu mua bộ KIT')
		
INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('Rate', N'Tỉ lệ', 'TargetUnit', N'Đơn vị target', N'Thỏa chiết khấu nếu mua target đạt đủ tỉ lệ tính trên tổng đơn hàng')

IF @CustomerName = 162 -- Customize GREE
BEGIN
	INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
			VALUES ('TotalAccumulated', N'Tổng doanh thu', 'TargetUnit', N'Đơn vị target', N'Thỏa CK nếu đạt đủ số lượng trong thời gian quy định')
	INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
			VALUES ('TotalTurnover', N'Tổng doanh số', 'TargetUnit', N'Đơn vị target', N'Thỏa CK nếu đạt đủ số lượng trong thời gian quy định')
	INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
			VALUES ('TotalQuantity', N'Tổng số lượng', 'TargetUnit', N'Đơn vị target', N'Thỏa CK nếu đạt đủ số lượng trong thời gian quy định')
END
IF @CustomerName = 166 -- Customize NKC
BEGIN	
INSERT INTO CIT1510 (ToolID, ToolName, ToolTypeID, ToolTypeName, Description)
		VALUES ('CKCB', N'Chiết khấu cảnh báo', 'Tool', N'Công cụ', N'Cảnh báo khi đạt điều kiện thiết lập')
END		
