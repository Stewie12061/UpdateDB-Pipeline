/*
==============================================================================================
--- Script sinh ngôn ngữ cho module
--- Module HRM
==============================================================================================
*/
IF NOT EXISTS (SELECT 1 FROM   [A00000] WHERE [Module] =  'HRM' and LanguageID = 'vi-VN' and [Type] = 'L')
  INSERT INTO [A00000]([LanguageID],[LanguageName],[Module], [InsertDate], [UpdateDate], [Version], [Type])
  VALUES ('vi-VN', N'Tiếng Việt','HRM',GetDate(), GetDate(), 1, 'L');
  
IF NOT EXISTS (SELECT 1 FROM   [A00000] WHERE [Module] =  'HRM' and LanguageID = 'en-US' and [Type] = 'L')
  INSERT INTO [A00000]([LanguageID],[LanguageName],[Module], [InsertDate], [UpdateDate], [Version], [Type])
  VALUES ('en-US', N'English','HRM',GetDate(), GetDate(), 1, 'L');
  
IF NOT EXISTS (SELECT 1 FROM   [A00000] WHERE [Module] =  'HRM' and LanguageID = 'ja-JP' and [Type] = 'L')
  INSERT INTO [A00000]([LanguageID],[LanguageName],[Module], [InsertDate], [UpdateDate], [Version], [Type])
  VALUES ('ja-JP', N'日本語','HRM',GetDate(), GetDate(), 1, 'L');
  
IF NOT EXISTS (SELECT 1 FROM   [A00000] WHERE [Module] =  'HRM' and LanguageID = 'zh-CN' and [Type] = 'L')
  INSERT INTO [A00000]([LanguageID],[LanguageName],[Module], [InsertDate], [UpdateDate], [Version], [Type])
  VALUES ('zh-CN', N'中文','HRM',GetDate(), GetDate(), 1, 'L'); 
--Select * from A00000 where Module = 'HRM