----------------------------------------------------------------------------------------------------- -- Script tạo message - CI ------------------------------------------------------------------------------------------------------ DECLARE @ModuleID VARCHAR(5), @FormID VARCHAR(50), @Language VARCHAR(10), ------------------------------------------------------------------------------------------------------ -- Tham so gen tu dong ------------------------------------------------------------------------------------------------------ @LanguageValue NVARCHAR(4000), @LanguageCustomValue NVARCHAR(4000),  ------------------------------------------------------------------------------------------------------ -- Finished ------------------------------------------------------------------------------------------------------ @Finished BIT  /*  - Tieng Viet: vi-VN   - Tieng Anh: en-US   - Tieng Nhat: ja-JP  - Tieng Trung: zh-CN */ SET @Language = 'ja-JP';  SET @ModuleID = 'CI'; SET @FormID = 'CIF1030';  SET @LanguageValue = N'分析のコード'; SET @LanguageCustomValue = N'Mã chi nhánh'; EXEC ERP9AddLanguage @ModuleID, 'CIF1030.AnaID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;  SET @LanguageValue = N'分析コード名'; SET @LanguageCustomValue = N'Tên chi nhánh'; EXEC ERP9AddLanguage @ModuleID, 'CIF1030.AnaName' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;  SET @LanguageValue = N'分析コードのグループ'; SET @LanguageCustomValue = N''; EXEC ERP9AddLanguage @ModuleID, 'CIF1030.AnaTypeID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;  SET @LanguageValue = N'業務分析コードの名目'; SET @LanguageCustomValue = N'Danh mục chi nhánh'; EXEC ERP9AddLanguage @ModuleID, 'CIF1030.CIF1030Title' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;  SET @LanguageValue = N'表示しない'; SET @LanguageCustomValue = N''; EXEC ERP9AddLanguage @ModuleID, 'CIF1030.Disabled' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;  SET @LanguageValue = N'単位'; SET @LanguageCustomValue = N''; EXEC ERP9AddLanguage @ModuleID, 'CIF1030.DivisionID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;  SET @LanguageValue = N'共用'; SET @LanguageCustomValue = N''; EXEC ERP9AddLanguage @ModuleID, 'CIF1030.IsCommon' , @FormID, @LanguageValue, @Language, @LanguageCustomValue; 