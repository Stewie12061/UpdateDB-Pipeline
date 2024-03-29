-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ 
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
SET @ModuleID = 'NM';
SET @FormID = 'NMF0002';

SET @LanguageValue = N'Thiết lập định mức tiêu chuẩn sức khỏe';
EXEC ERP9AddLanguage @ModuleID, 'NMF0002.Title', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Độ tuổi(tháng)';
EXEC ERP9AddLanguage @ModuleID, 'NMF0002.YearOld', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngưỡng dưới';
EXEC ERP9AddLanguage @ModuleID, 'NMF0002.LowerThreshold', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chuẩn';
EXEC ERP9AddLanguage @ModuleID, 'NMF0002.QuotaThreshold', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngưỡng trên';
EXEC ERP9AddLanguage @ModuleID, 'NMF0002.AboveThreshold', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chiều cao (Bé trai) - Cm';
EXEC ERP9AddLanguage @ModuleID, 'NMF0002.TabNMT0002HeightBoy', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chiều cao (Bé gái) - Cm';
EXEC ERP9AddLanguage @ModuleID, 'NMF0002.TabNMT0002WeightBoy', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cân nặng (Bé trai) - Kg';
EXEC ERP9AddLanguage @ModuleID, 'NMF0002.TabNMT0002HeightGirl', @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Cân nặng (Bé gái) - Kg';
EXEC ERP9AddLanguage @ModuleID, 'NMF0002.TabNMT0002WeightGirl', @FormID, @LanguageValue, @Language;







