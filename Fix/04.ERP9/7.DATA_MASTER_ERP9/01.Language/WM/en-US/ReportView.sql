
-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ ReportView- OO
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
@KeyID VARCHAR(50),

--- Thêm 2 biến dành cho việc thêm ngôn ngữ cho trường thuộc báo cáo
@Text NVARCHAR(2000),
@CustomName NVARCHAR(100),
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
SET @Language = 'en-US' 
SET @ModuleID = 'WM';
SET @FormID = 'ReportView';

------------------------------------------------ BEGIN -----------------------------------------------

SET @KeyID  = N'ReportView.ContractID.CB';
SET @Text = N'Contract ID';
SET @CustomName = NULL
IF NOT EXISTS (SELECT 1 FROM [A00001] WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID)
BEGIN INSERT INTO [A00001]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate], [FormID], [CustomName]) 
VALUES (RTRIM(LTRIM(@KeyID)), RTRIM(LTRIM(@Language)), @Text, RTRIM(LTRIM(@ModuleID)), GetDate(), GetDate(), RTRIM(LTRIM(@FormID)), @CustomName)
END
ELSE
BEGIN UPDATE [A00001] SET [Name]=@Text, [CustomName] = @CustomName, [UpdateDate]=GetDate(), [FormID] = RTRIM(LTRIM(@FormID))
WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID
END

SET @KeyID  = N'ReportView.ContractNo.CB';
SET @Text = N'Contract No';
SET @CustomName = NULL
IF NOT EXISTS (SELECT 1 FROM [A00001] WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID)
BEGIN INSERT INTO [A00001]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate], [FormID], [CustomName]) 
VALUES (RTRIM(LTRIM(@KeyID)), RTRIM(LTRIM(@Language)), @Text, RTRIM(LTRIM(@ModuleID)), GetDate(), GetDate(), RTRIM(LTRIM(@FormID)), @CustomName)
END
ELSE
BEGIN UPDATE [A00001] SET [Name]=@Text, [CustomName] = @CustomName, [UpdateDate]=GetDate(), [FormID] = RTRIM(LTRIM(@FormID))
WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID
END

SET @KeyID  = N'ReportView.ContractName.CB';
SET @Text = N'Contract Name';
SET @CustomName = NULL
IF NOT EXISTS (SELECT 1 FROM [A00001] WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID)
BEGIN INSERT INTO [A00001]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate], [FormID], [CustomName]) 
VALUES (RTRIM(LTRIM(@KeyID)), RTRIM(LTRIM(@Language)), @Text, RTRIM(LTRIM(@ModuleID)), GetDate(), GetDate(), RTRIM(LTRIM(@FormID)), @CustomName)
END
ELSE
BEGIN UPDATE [A00001] SET [Name]=@Text, [CustomName] = @CustomName, [UpdateDate]=GetDate(), [FormID] = RTRIM(LTRIM(@FormID))
WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID
END

SET @KeyID  = N'ReportView.WareHouseID.CB';
SET @Text = N'Warehouse ID';
SET @CustomName = NULL
IF NOT EXISTS (SELECT 1 FROM [A00001] WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID)
BEGIN INSERT INTO [A00001]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate], [FormID], [CustomName]) 
VALUES (RTRIM(LTRIM(@KeyID)), RTRIM(LTRIM(@Language)), @Text, RTRIM(LTRIM(@ModuleID)), GetDate(), GetDate(), RTRIM(LTRIM(@FormID)), @CustomName)
END
ELSE
BEGIN UPDATE [A00001] SET [Name]=@Text, [CustomName] = @CustomName, [UpdateDate]=GetDate(), [FormID] = RTRIM(LTRIM(@FormID))
WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID
END

SET @KeyID  = N'ReportView.WareHouseName.CB';
SET @Text = N'Warehouse ID';
SET @CustomName = NULL
IF NOT EXISTS (SELECT 1 FROM [A00001] WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID)
BEGIN INSERT INTO [A00001]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate], [FormID], [CustomName]) 
VALUES (RTRIM(LTRIM(@KeyID)), RTRIM(LTRIM(@Language)), @Text, RTRIM(LTRIM(@ModuleID)), GetDate(), GetDate(), RTRIM(LTRIM(@FormID)), @CustomName)
END
ELSE
BEGIN UPDATE [A00001] SET [Name]=@Text, [CustomName] = @CustomName, [UpdateDate]=GetDate(), [FormID] = RTRIM(LTRIM(@FormID))
WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID
END
		
SET @KeyID  = N'ReportView.InventoryID.CB';
SET @Text = N'Inventory ID';
SET @CustomName = NULL
IF NOT EXISTS (SELECT 1 FROM [A00001] WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID)
BEGIN INSERT INTO [A00001]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate], [FormID], [CustomName]) 
VALUES (RTRIM(LTRIM(@KeyID)), RTRIM(LTRIM(@Language)), @Text, RTRIM(LTRIM(@ModuleID)), GetDate(), GetDate(), RTRIM(LTRIM(@FormID)), @CustomName)
END
ELSE
BEGIN UPDATE [A00001] SET [Name]=@Text, [CustomName] = @CustomName, [UpdateDate]=GetDate(), [FormID] = RTRIM(LTRIM(@FormID))
WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID
END

SET @KeyID  = N'ReportView.InventoryName.CB';
SET @Text = N'Inventory Name';
SET @CustomName = NULL
IF NOT EXISTS (SELECT 1 FROM [A00001] WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID)
BEGIN INSERT INTO [A00001]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate], [FormID], [CustomName]) 
VALUES (RTRIM(LTRIM(@KeyID)), RTRIM(LTRIM(@Language)), @Text, RTRIM(LTRIM(@ModuleID)), GetDate(), GetDate(), RTRIM(LTRIM(@FormID)), @CustomName)
END
ELSE
BEGIN UPDATE [A00001] SET [Name]=@Text, [CustomName] = @CustomName, [UpdateDate]=GetDate(), [FormID] = RTRIM(LTRIM(@FormID))
WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID
END

SET @KeyID  = N'ReportView.ObjectID.CB';
SET @Text = N'Object ID';
SET @CustomName = NULL
IF NOT EXISTS (SELECT 1 FROM [A00001] WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID)
BEGIN INSERT INTO [A00001]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate], [FormID], [CustomName]) 
VALUES (RTRIM(LTRIM(@KeyID)), RTRIM(LTRIM(@Language)), @Text, RTRIM(LTRIM(@ModuleID)), GetDate(), GetDate(), RTRIM(LTRIM(@FormID)), @CustomName)
END
ELSE
BEGIN UPDATE [A00001] SET [Name]=@Text, [CustomName] = @CustomName, [UpdateDate]=GetDate(), [FormID] = RTRIM(LTRIM(@FormID))
WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID
END

SET @KeyID  = N'ReportView.ObjectName.CB';
SET @Text = N'Object Name';
SET @CustomName = NULL
IF NOT EXISTS (SELECT 1 FROM [A00001] WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID)
BEGIN INSERT INTO [A00001]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate], [FormID], [CustomName]) 
VALUES (RTRIM(LTRIM(@KeyID)), RTRIM(LTRIM(@Language)), @Text, RTRIM(LTRIM(@ModuleID)), GetDate(), GetDate(), RTRIM(LTRIM(@FormID)), @CustomName)
END
ELSE
BEGIN UPDATE [A00001] SET [Name]=@Text, [CustomName] = @CustomName, [UpdateDate]=GetDate(), [FormID] = RTRIM(LTRIM(@FormID))
WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID
END

SET @KeyID  = N'ReportView.IsSource.CB';
SET @Text = N'Source';
SET @CustomName = NULL
IF NOT EXISTS (SELECT 1 FROM [A00001] WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID)
BEGIN INSERT INTO [A00001]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate], [FormID], [CustomName]) 
VALUES (RTRIM(LTRIM(@KeyID)), RTRIM(LTRIM(@Language)), @Text, RTRIM(LTRIM(@ModuleID)), GetDate(), GetDate(), RTRIM(LTRIM(@FormID)), @CustomName)
END
ELSE
BEGIN UPDATE [A00001] SET [Name]=@Text, [CustomName] = @CustomName, [UpdateDate]=GetDate(), [FormID] = RTRIM(LTRIM(@FormID))
WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID
END

SET @KeyID  = N'ReportView.IsLimitDate.CB';
SET @Text = N'Limit Date';
SET @CustomName = NULL
IF NOT EXISTS (SELECT 1 FROM [A00001] WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID)
BEGIN INSERT INTO [A00001]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate], [FormID], [CustomName]) 
VALUES (RTRIM(LTRIM(@KeyID)), RTRIM(LTRIM(@Language)), @Text, RTRIM(LTRIM(@ModuleID)), GetDate(), GetDate(), RTRIM(LTRIM(@FormID)), @CustomName)
END
ELSE
BEGIN UPDATE [A00001] SET [Name]=@Text, [CustomName] = @CustomName, [UpdateDate]=GetDate(), [FormID] = RTRIM(LTRIM(@FormID))
WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID
END