-- Thêm dữ liệu vào bảng Master

DECLARE
	@ModuleID VARCHAR(50),
	@ScreenID VARCHAR(50),
	@ScreenName NVARCHAR(MAX),
	@ScreenNameE NVARCHAR(MAX),
	@ScreenType TINYINT

SET @ModuleID = N'ASOFTSHM'
---------------------------------------------- Danh mục ------------------------------------------------------------

-----------Nhóm cổ đông----------------------------
SET @ScreenType = 2
SET @ScreenID = N'SHMF1000'
SET @ScreenName = N'Nhóm cổ đông'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'SHMF1001'
SET @ScreenName = N'Cập nhật Nhóm cổ đông'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 5
SET @ScreenID = N'SHMF1002'
SET @ScreenName = N'Xem thông Nhóm cổ đông'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-----------Nhóm loại cổ phần----------------------------
SET @ScreenType = 2
SET @ScreenID = N'SHMF1010'
SET @ScreenName = N'Nhóm loại cổ phần'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'SHMF1011'
SET @ScreenName = N'Cập nhật Nhóm loại cổ phần'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 5
SET @ScreenID = N'SHMF1012'
SET @ScreenName = N'Xem thông Nhóm loại cổ phần'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-----------Nghiệp vụ số cổ đông----------------------------
SET @ScreenType = 2
SET @ScreenID = N'SHMF2010'
SET @ScreenName = N'Nghiệp vụ số cổ đông'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'SHMF2011'
SET @ScreenName = N'Cập nhật số cổ đông'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 5
SET @ScreenID = N'SHMF2012'
SET @ScreenName = N'Xem thông số cổ đông'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-----------Nghiệp vụ đăng ký mua cổ phần----------------------------
SET @ScreenType = 2
SET @ScreenID = N'SHMF2020'
SET @ScreenName = N'Nghiệp vụ đăng ký mua cổ phần'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'SHMF2021'
SET @ScreenName = N'Cập nhật đăng ký mua cổ phần'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 5
SET @ScreenID = N'SHMF2022'
SET @ScreenName = N'Xem thông đăng ký mua cổ phần'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

-----------Nghiệp vụ danh sách chuyển nhượng cổ phần----------------------------
SET @ScreenType = 2
SET @ScreenID = N'SHMF2030'
SET @ScreenName = N'Nghiệp vụ danh sách chuyển nhượng cổ phần'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'SHMF2031'
SET @ScreenName = N'Cập nhật danh sách chuyển nhượng cổ phần'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 5
SET @ScreenID = N'SHMF2032'
SET @ScreenName = N'Xem thông danh sách chuyển nhượng cổ phần'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE


-----------Nghiệp vụ danh sách chia cổ tức----------------------------
SET @ScreenType = 2
SET @ScreenID = N'SHMF2040'
SET @ScreenName = N'Nghiệp vụ danh sách chia cổ tức'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'SHMF2041'
SET @ScreenName = N'Cập nhật chia cổ tức'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 5
SET @ScreenID = N'SHMF2042'
SET @ScreenName = N'Xem chi tiết chia cổ tức'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE


-----------Nhóm loại cổ phần----------------------------
SET @ScreenType = 2
SET @ScreenID = N'SHMF1020'
SET @ScreenName = N'Đợt phát hành'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 3
SET @ScreenID = N'SHMF1021'
SET @ScreenName = N'Cập nhật đợt phát hành'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenType = 5
SET @ScreenID = N'SHMF1022'
SET @ScreenName = N'Xem thông tin đơt phát hành'
SET @ScreenNameE = N''
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE


---------------------------------------------- Báo cáo ------------------------------------------------------------
SET @ScreenType = 1

SET @ScreenID = N'SHMF3001'	
SET @ScreenName = N'Báo cáo tình hình chi trả cổ tức'	
SET @ScreenNameE = N''	
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE

SET @ScreenID = N'SHMF3002'	
SET @ScreenName = N'Báo cáo cổ tức phải trả'	
SET @ScreenNameE = N''	
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE	

SET @ScreenID = 'SHMF3000A'	
SET @ScreenName =  N'Danh sách chia cổ tức'
SET @ScreenNameE = N''	
EXEC AddScreenERP9 @ModuleID, @ScreenID,@ScreenType,@ScreenName,@ScreenNameE	
