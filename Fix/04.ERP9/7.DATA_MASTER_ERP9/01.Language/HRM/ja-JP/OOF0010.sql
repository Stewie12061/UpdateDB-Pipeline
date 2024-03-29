
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF0010- OO
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
SET @Language = 'ja-JP' 
SET @ModuleID = 'HRM';
SET @FormID = 'OOF0010';

SET @LanguageValue = N'承認業務設定';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.OOF0010Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'休暇申請届け';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.OOF0010Tab01Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'残業申請届け';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.OOF0010Tab02Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'外出申請届け';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.OOF0010Tab03Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'打刻データー訂正申請届け';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.OOF0010Tab04Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'シフトアレンジ表';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.OOF0010Tab05Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'シフト変更申請届け';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.OOF0010Tab06Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'シフト変更申請届け';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.OOF0010Tab07Title' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'承認レベル';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.DXP' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認レベル';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.DXLTG' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認レベル';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.DXRN' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認レベル';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.DXBSQT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認レベル';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.BPC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認レベル';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.DXDC' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'承認レベル';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.DCTT' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'自動コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.VoucherTypeID1' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'自動コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.VoucherTypeID2' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'自動コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.VoucherTypeID3' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'自動コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.VoucherTypeID4' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'自動コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.VoucherTypeID5' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'自動コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.VoucherTypeID6' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'自動コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.VoucherTypeID7' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'レベル';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.SubLevel' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'職位';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.DutyName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'権限';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.IsPermision' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'外出届け';
EXEC ERP9AddLanguage @ModuleID, 'OOF0010.AbsentTypeID' , @FormID, @LanguageValue, @Language;
