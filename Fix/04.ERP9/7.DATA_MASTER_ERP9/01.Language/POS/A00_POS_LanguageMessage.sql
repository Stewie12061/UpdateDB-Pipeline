/*
==============================================================================================
--- Script sinh ngôn ngữ và message cho module
--- Module POS
==============================================================================================
*/

DECLARE @Module varchar(150)
DECLARE @ModuleA00 varchar(150)

Set @ModuleA00 = N'A00'
Set @Module = N'POS'
 
IF NOT EXISTS (SELECT 1 FROM   [A00000] WHERE [Module] =  @ModuleA00 and LanguageID = 'vi-VN' and [Type] = 'L')
  INSERT INTO [A00000]([LanguageID],[LanguageName],[Module], [InsertDate], [UpdateDate], [Version], [Type])
  VALUES ('vi-VN', N'Tiếng Việt',@ModuleA00,GetDate(), GetDate(), 1, 'L');
  
IF NOT EXISTS (SELECT 1 FROM   [A00000] WHERE [Module] =  @ModuleA00 and LanguageID = 'en-US' and [Type] = 'L')
  INSERT INTO [A00000]([LanguageID],[LanguageName],[Module], [InsertDate], [UpdateDate], [Version], [Type])
  VALUES ('en-US', N'English',@ModuleA00,GetDate(), GetDate(), 1, 'L');
  
IF NOT EXISTS (SELECT 1 FROM   [A00000] WHERE [Module] =  @ModuleA00 and LanguageID = 'vi-VN' and [Type] = 'M')
  INSERT INTO [A00000]([LanguageID],[LanguageName],[Module], [InsertDate], [UpdateDate], [Version], [Type])
  VALUES ('vi-VN', N'Tiếng Việt',@ModuleA00,GetDate(), GetDate(), 1, 'M');
  
IF NOT EXISTS (SELECT 1 FROM   [A00000] WHERE [Module] =  @ModuleA00 and LanguageID = 'en-US' and [Type] = 'M')
  INSERT INTO [A00000]([LanguageID],[LanguageName],[Module], [InsertDate], [UpdateDate], [Version], [Type])
  VALUES ('en-US', N'English',@ModuleA00,GetDate(), GetDate(), 1, 'M');


/*
==============================================================================================
--- Script sinh ngôn ngữ và message cho module
--- Module MT
==============================================================================================
*/
IF NOT EXISTS (SELECT 1 FROM   [A00000] WHERE [Module] =  @Module and LanguageID = 'vi-VN' and [Type] = 'L')
  INSERT INTO [A00000]([LanguageID],[LanguageName],[Module], [InsertDate], [UpdateDate], [Version], [Type])
  VALUES ('vi-VN', N'Tiếng Việt',@Module,GetDate(), GetDate(), 1, 'L');
  
IF NOT EXISTS (SELECT 1 FROM   [A00000] WHERE [Module] =  @Module and LanguageID = 'en-US' and [Type] = 'L')
  INSERT INTO [A00000]([LanguageID],[LanguageName],[Module], [InsertDate], [UpdateDate], [Version], [Type])
  VALUES ('en-US', N'English',@Module,GetDate(), GetDate(), 1, 'L');
  
IF NOT EXISTS (SELECT 1 FROM   [A00000] WHERE [Module] =  @Module and LanguageID = 'vi-VN' and [Type] = 'M')
  INSERT INTO [A00000]([LanguageID],[LanguageName],[Module], [InsertDate], [UpdateDate], [Version], [Type])
  VALUES ('vi-VN', N'Tiếng Việt',@Module,GetDate(), GetDate(), 1, 'M');
  
IF NOT EXISTS (SELECT 1 FROM   [A00000] WHERE [Module] =  @Module and LanguageID = 'en-US' and [Type] = 'M')
  INSERT INTO [A00000]([LanguageID],[LanguageName],[Module], [InsertDate], [UpdateDate], [Version], [Type])
  VALUES ('en-US', N'English',@Module,GetDate(), GetDate(), 1, 'M');

