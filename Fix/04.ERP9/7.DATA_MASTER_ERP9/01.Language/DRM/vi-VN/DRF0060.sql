
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ DRF1000 - DRM
------------------------------------------------------------------------------------------------------
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
SET @ModuleID = 'DRM';
SET @FormID = 'DRF0060';

SET @LanguageValue = N'Thiết lập tỉ lệ phí thu hồi - Khách hàng nhóm A';
EXEC ERP9AddLanguage @ModuleID, 'DRF0060.DRF0060Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày trễ hạn nhỏ hơn 360 ngày và đạt được 2,5% tổng dư nợ đầu tháng (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0060.AFeeCoefficient1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày trễ hạn nhỏ hơn 360 ngày và không đạt được 2,5% tổng dư nợ đầu tháng (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0060.AFeeCoefficient2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số ngày trễ hạn từ 360 ngày trở lên (%)';
EXEC ERP9AddLanguage @ModuleID, 'DRF0060.AFeeCoefficient3' , @FormID, @LanguageValue, @Language;