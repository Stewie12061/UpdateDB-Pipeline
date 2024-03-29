------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ SF0010 - S
-----------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000),

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
@Finished BIT


------------------------------------------------------------------------------------------------------
-- Gan gia tri tham so va thu thi truy van
------------------------------------------------------------------------------------------------------
/*
 - Tieng Viet: vi-VN 
 - Tieng Anh: en-US 
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/
SET @Language = 'vi-VN' 
SET @ModuleID = 'S';
SET @FormID = 'SF0010';
------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Thông tin người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.Title' , @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'Mã người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.UserID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.UserName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngôn ngữ';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.LanguageID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số dòng/trang';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.PageSize' , @FormID, @LanguageValue, @Language;

-- 20/08/2020 - [Tấn Lộc] - Bổ sung ngôn ngữ cho thông tin thiết lập nhận mail theo user - AT14052

SET @LanguageValue = N'Máy chủ (POP/IMAP)';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.Server', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cổng kết nối (Port)';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.Port', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.Email', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.DisplayName', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mật khẩu';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.Password', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Sử dụng SSL';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.EnableSsl', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phương thức';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.Protocol', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.UserID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã ngôn ngữ';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.LanguageID.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên ngôn ngữ';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.LanguageName.CB', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông tin người dùng';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.UserInformation', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Phương thức gửi';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.ProtocolSend', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Máy chủ gửi';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.ServerSend', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cổng kết nối (Port gửi)';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.PortSend', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Email mặc định';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.EmailDefault', @FormID, @LanguageValue, @Language;

-- 07/10/2021 - [Hoài Bảo] - Bổ sung ngôn ngữ cho cập nhật người dùng SF0010 - thông tin người dùng
SET @LanguageValue = N'Địa chỉ SIP';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.SipID', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mật khẩu SIP';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.SipPassword', @FormID, @LanguageValue, @Language;

-- 18/03/2022 - [Hoài Bảo] - Bổ sung ngôn ngữ cho Tab thiết lập WorkSpace - AT14051
SET @LanguageValue = N'Diễn giải';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.Description', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ẩn/Hiện';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.Enable', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công việc hôm nay';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.OOD0001', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công việc chưa xử lý';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.OOD0002', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thành quả KPI của bạn';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.OOD0003', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tình hình dự án';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.OOD0004', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Biểu đồ điểm nóng';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.OOD0005', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Thông báo';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.OOD0008', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công việc đã giao';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.OOD0009', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Công việc đang theo dõi';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.OOD0010', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý văn bản';
EXEC ERP9AddLanguage @ModuleID, 'SF0010.OOD0011', @FormID, @LanguageValue, @Language;
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;