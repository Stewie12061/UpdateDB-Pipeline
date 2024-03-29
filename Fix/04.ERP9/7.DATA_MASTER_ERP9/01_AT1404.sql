-- CREATE BY Lê Minh Lâm ON 15/01/2014
-- Thêm dữ liệu vào bảng Master

declare @DivisionID nvarchar(50),@ModuleID VARCHAR(50), @ScreenID VARCHAR(50), @CreateUserID VARCHAR(50), @ScreenType INTEGER

SET @ModuleID = N'AsoftPOS'
SET @ModuleID = N'AsoftPOS'
SET @CreateUserID = N'ASOFTADMIN'

declare divisionList cursor for select DivisionID from AT1101

open divisionList
fetch next from divisionList into @DivisionID

while @@Fetch_Status = 0
BEGIN
	
------------------------------------------------ Thiết lập --------------------------------------------------------
SET @ScreenType = 4


SET @ScreenID = N'POSFXXXX'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Mở số kỳ kế toán', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())


SET @ScreenID = N'POSF0000'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Hệ thống', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0001'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Nhóm mã phân tích cửa hàng', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0002'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Thông tin phiếu chứng từ', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())


SET @ScreenID = N'POSF0003'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Thiết lập cách tính điểm', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0006'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Thiết lập phương thức thanh toán', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0007'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Thiết lập chung', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0008'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Khóa sổ kỳ kế toán', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0009'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Chọn kỳ kế toán', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0050'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Thiết lập liên kết khu vực - bảng giá', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

------------------------------------------------ Danh mục --------------------------------------------------------
SET @ScreenType = 2

SET @ScreenID = N'POSF0010'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Danh mục cửa hàng', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0011'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Danh mục hội viên', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0012'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Danh mục hàng hóa', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0013'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Danh mục hình thức thanh toán', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0014'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Danh mục kho', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0015'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Danh sách phiếu nhập hàng', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0016'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Danh sách phiếu bán hàng', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0017'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Danh sách phiếu kiểm kê', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0018'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Danh sách phiếu điều chỉnh', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0019'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Danh sách phiếu nhật ký hàng hóa', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())


SET @ScreenID = N'POSF0020'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Danh sách thẻ hội viên', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0034'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Danh mục khu vực', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0021'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Danh sách phiếu đề nghị xuất/ trả hàng', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())
SET @ScreenID = N'POSF0027'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Danh sách phiếu xuất hàng', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0024'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Danh sách phiếu chênh lệch', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

			SET @ScreenID = N'POSF0043'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Danh mục loại thẻ', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

						SET @ScreenID = N'POSF0054'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Danh mục số dư tồn kho', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0060'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Danh mục thời điểm', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())
			
SET @ScreenID = N'POSF0052'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Danh mục bàn', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

------------------------------------------------ Cập nhật --------------------------------------------------------
SET @ScreenType = 3

SET @ScreenID = N'POSF00101'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Cập nhật cửa hàng', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF00111'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Cập nhật hội viên', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF00121'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Hàng khuyến mãi', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF00151'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Cập nhật phiếu nhập hàng', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF00152'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Kế thừa', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF00161'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Cập nhật phiếu bán hàng', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

			SET @ScreenID = N'POSF0039'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Cập nhật phiếu bán hàng', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0040'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Cập nhật phiếu bán hàng', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())
			
SET @ScreenID = N'POSF00171'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Cập nhật phiếu kiểm kê', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF00191'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Cập nhật phiếu nhật ký hàng hóa', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF00201'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Cập nhật thẻ hội viên', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF00202'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Tìm kiếm hội viên', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0022'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Cập nhật phiếu đề nghị xuất/ trả hàng', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0023'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Tìm kiếm người lập phiếu', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0025'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Thông tin chi tiết phiếu chênh lệch', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0026'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Chi tiết mặt hàng', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0028'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Thông tin chi tiết phiếu xuất hàng', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())
			
			
SET @ScreenID = N'POSF0030'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Cập nhật hàng hóa tại cửa hàng', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

SET @ScreenID = N'POSF0062'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Thông tin chi tiết thời điểm', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())
			
SET @ScreenID = N'POSF0044'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Cập nhật loại thẻ', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

			SET @ScreenID = N'POSF0035'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Cập nhật khu vực', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())
			SET @ScreenID = N'POSF0053'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Cập nhật bàn', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())

------------------------------------------------ Báo cáo --------------------------------------------------------
SET @ScreenType = 1

SET @ScreenID = N'POSF0046'
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WHERE DivisionID = @DivisionID AND ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate) 
			VALUES (@DivisionID, @ModuleID, @ScreenID, N'Báo cáo chi tiết bán hàng theo cửa hàng và nhân viên', N'', @ScreenType, @CreateUserID, GETDATE() , @CreateUserID, GETDATE())
	
	fetch next from divisionList into @DivisionID
END

close divisionList
deallocate divisionList