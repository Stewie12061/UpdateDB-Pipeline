-- <Summary>
---- Insert dữ liệu mặc định cho thiết lập xét duyệt các nghiệp vụ trên ERP9
-- <History>
---- Create on 09/01/2015 by Bảo Anh
---- Modified on 08/06/2020 by Trọng Kiên: Bổ sung các đối tượng:
----									+ Đề nghị tạm ứng / Đề nghị thanh toán / Đề nghị thanh toán tạm ứng
----									+ Đề nghị công tác
----									+ Thanh toán đi lại
----									+ Thời gian công tác
----									+ Báo cáo công tác
----									+ Dịch chứng từ
---- Modified on 22/12/2020 by Đình Ly: Bổ sung phiếu Thông tin sản xuất (TTSX)
---- Modified on 08/09/2022 by Văn Tài: Bổ sung mặc định cấp duyệt Đơn hàng bán.

DECLARE @DivisionID NVarchar(50)

DECLARE cur_AllDivision CURSOR FOR
SELECT AT1101.DivisionID FROM AT1101 WITH (NOLOCK)

OPEN cur_AllDivision
FETCH NEXT FROM cur_AllDivision INTO @DivisionID
WHILE @@fetch_status = 0
BEGIN
	--- Đơn xin phép
	IF NOT EXISTS (SELECT 1 FROM ST0010 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND TypeID = 'DXP')
		INSERT INTO ST0010 (DivisionID,TypeID,Levels) VALUES (@DivisionID, 'DXP', 1)
	
	--- Đơn xin làm thêm giờ
	IF NOT EXISTS (SELECT 1 FROM ST0010 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND TypeID = 'DXLTG')
		INSERT INTO ST0010 (DivisionID,TypeID,Levels) VALUES (@DivisionID, 'DXLTG', 1)

	--- Đơn xin ra ngoài
	IF NOT EXISTS (SELECT 1 FROM ST0010 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND TypeID = 'DXRN')
		INSERT INTO ST0010 (DivisionID,TypeID,Levels) VALUES (@DivisionID, 'DXRN', 1)

	--- Đơn xin đổi ca
	IF NOT EXISTS (SELECT 1 FROM ST0010 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND TypeID = 'DXDC')
		INSERT INTO ST0010 (DivisionID,TypeID,Levels) VALUES (@DivisionID, 'DXDC', 1)

	--- Đơn xin bổ sung quẹt thẻ
	IF NOT EXISTS (SELECT 1 FROM ST0010 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND TypeID = 'DXBSQT')
		INSERT INTO ST0010 (DivisionID,TypeID,Levels) VALUES (@DivisionID, 'DXBSQT', 1)

	--- Bảng phân ca
	IF NOT EXISTS (SELECT 1 FROM ST0010 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND TypeID = 'BPC')
		INSERT INTO ST0010 (DivisionID,TypeID,Levels) VALUES (@DivisionID, 'BPC', 1)

	--- Kế hoạch tuyển dụng
	IF NOT EXISTS (SELECT 1 FROM ST0010 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND TypeID = 'KHTD')
		INSERT INTO ST0010 (DivisionID,TypeID,Levels) VALUES (@DivisionID, 'KHTD', 1)

	--- Quyết định tuyển dụng
	IF NOT EXISTS (SELECT 1 FROM ST0010 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND TypeID = 'QDTD')
		INSERT INTO ST0010 (DivisionID,TypeID,Levels) VALUES (@DivisionID, 'QDTD', 1)
		
	--- Đề nghị tạm ứng / Đề nghị thanh toán / Đề nghị thanh toán tạm ứng
	IF NOT EXISTS (SELECT 1 FROM ST0010 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND TypeID = 'PDN')
		INSERT INTO ST0010 (DivisionID,TypeID,Levels) VALUES (@DivisionID, 'PDN', 1)
		
	--- Đề nghị công tác 
	IF NOT EXISTS (SELECT 1 FROM ST0010 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND TypeID = 'DNCT')
		INSERT INTO ST0010 (DivisionID,TypeID,Levels) VALUES (@DivisionID, 'DNCT', 1)

	--- Thông tin sản xuất 
	IF NOT EXISTS (SELECT 1 FROM ST0010 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND TypeID = 'TTSX')
		INSERT INTO ST0010 (DivisionID,TypeID,Levels) VALUES (@DivisionID, 'TTSX', 1)

	--- Đơn hàng bán dành cho ERP9 - SO và Mobile - SO.
	IF NOT EXISTS (SELECT 1 FROM ST0010 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND TypeID = 'DHB')
		INSERT INTO ST0010 (DivisionID,TypeID,Levels) VALUES (@DivisionID, 'DHB', 0)
		
	-- --- Thanh toán đi lại
	-- IF NOT EXISTS (SELECT 1 FROM ST0010 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND TypeID = 'TTDL')
		-- INSERT INTO ST0010 (DivisionID,TypeID,Levels) VALUES (@DivisionID, 'TTDL', 1)
		
	-- --- Thời gian công tác
	-- IF NOT EXISTS (SELECT 1 FROM ST0010 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND TypeID = 'TGCT')
		-- INSERT INTO ST0010 (DivisionID,TypeID,Levels) VALUES (@DivisionID, 'TGCT', 1)
		
	-- --- Báo cáo công tác
	-- IF NOT EXISTS (SELECT 1 FROM ST0010 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND TypeID = 'BCCT')
		-- INSERT INTO ST0010 (DivisionID,TypeID,Levels) VALUES (@DivisionID, 'BCCT', 1)
		
	-- --- Dịch chứng từ
	-- IF NOT EXISTS (SELECT 1 FROM ST0010 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND TypeID = 'DCT')
		-- INSERT INTO ST0010 (DivisionID,TypeID,Levels) VALUES (@DivisionID, 'DCT', 1)
		

	FETCH NEXT FROM cur_AllDivision INTO @DivisionID
END
CLOSE cur_AllDivision
DEALLOCATE cur_AllDivision