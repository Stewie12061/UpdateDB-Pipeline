------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2003 - CRM 
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000)
------------------------------------------------------------------------------------------------------
-- Gan gia tri tham so va thuc thi truy van
------------------------------------------------------------------------------------------------------
/*
- Tieng Viet: vi-VN 
- Tieng Anh: en-US 
- Tieng Nhat: ja-JP 
- Tieng Trung: zh-CN
*/ 
SET @Language = 'ja-JP';
SET @ModuleID = 'HRM';
SET @FormID = 'OOF2003';

------------------------------------------------------------------------------------------------------
SET @LanguageValue = N'シフトの入力';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.Title' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'社員コード';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.EmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'社員の名前';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.EmployeeName' , @FormID, @LanguageValue, @Language;
 
 SET @LanguageValue = N'スフとコード';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.ShiftID' , @FormID, @LanguageValue, @Language;
 
 SET @LanguageValue = N'シフト名';
 EXEC ERP9AddLanguage @ModuleID,'OOF2003.ShiftName' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'備考';
 EXEC ERP9AddLanguage @ModuleID,'OOF2003.Note' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'１日';
 EXEC ERP9AddLanguage @ModuleID,'OOF2003.D01' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'２日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D02' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'３日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D03' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'４日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D04' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'５日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D05' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'６日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D06' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'７日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D07' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'８日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D08' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'９日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D09' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'１０日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D10' , @FormID, @LanguageValue, @Language;
 
 SET @LanguageValue = N'１１日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D11' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'１２日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D12' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'１３日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D13' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'１４日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D14' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'１５日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D15' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'１６日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D16' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'１７日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D17' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'１８日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D18' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'１９日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D19' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'２０日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D20' , @FormID, @LanguageValue, @Language;
 
  SET @LanguageValue = N'２１日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D21' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'２２日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D22' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'２３日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D23' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'２４日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D24' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'２５日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D25' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'２６日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D26' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'２７日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D27' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'２８日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D28' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'２９日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D29' , @FormID, @LanguageValue, @Language;

 SET @LanguageValue = N'３０日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D30' , @FormID, @LanguageValue, @Language;
 
  SET @LanguageValue = N'３１日';
 EXEC ERP9AddLanguage @ModuleID, 'OOF2003.D31' , @FormID, @LanguageValue, @Language;
 
SET @LanguageValue = N'社員コード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2003.EmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'社員の名前';
EXEC ERP9AddLanguage @ModuleID, 'OOF2003.EmployeeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'スフとコード';
EXEC ERP9AddLanguage @ModuleID, 'OOF2003.ShiftID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'シフト名';
EXEC ERP9AddLanguage @ModuleID, 'OOF2003.ShiftName.CB' , @FormID, @LanguageValue, @Language;