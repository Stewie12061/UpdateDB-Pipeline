/* ============================================================================================== --- Script sinh ngôn ngữ cho module --- Module BI ============================================================================================== */ IF NOT EXISTS (SELECT 1 FROM   [A00000] WHERE [Module] =  'BI' and LanguageID = 'vi-VN' and [Type] = 'L')   INSERT INTO [A00000]([LanguageID],[LanguageName],[Module], [InsertDate], [UpdateDate], [Version], [Type])   VALUES ('vi-VN', N'Tiếng Việt','BI',GetDate(), GetDate(), 1, 'L');    IF NOT EXISTS (SELECT 1 FROM   [A00000] WHERE [Module] =  'BI' and LanguageID = 'en-US' and [Type] = 'L')   INSERT INTO [A00000]([LanguageID],[LanguageName],[Module], [InsertDate], [UpdateDate], [Version], [Type])   VALUES ('en-US', N'English','BI',GetDate(), GetDate(), 1, 'L');
  
IF NOT EXISTS (SELECT 1 FROM   [A00000] WHERE [Module] =  'BI' and LanguageID = 'ja-JP' and [Type] = 'L')
  INSERT INTO [A00000]([LanguageID],[LanguageName],[Module], [InsertDate], [UpdateDate], [Version], [Type])
  VALUES ('ja-JP', N'日本語','BI',GetDate(), GetDate(), 1, 'L');
  
IF NOT EXISTS (SELECT 1 FROM   [A00000] WHERE [Module] =  'BI' and LanguageID = 'zh-CN' and [Type] = 'L')
  INSERT INTO [A00000]([LanguageID],[LanguageName],[Module], [InsertDate], [UpdateDate], [Version], [Type])
  VALUES ('zh-CN', N'中文','BI',GetDate(), GetDate(), 1, 'L'); 
     