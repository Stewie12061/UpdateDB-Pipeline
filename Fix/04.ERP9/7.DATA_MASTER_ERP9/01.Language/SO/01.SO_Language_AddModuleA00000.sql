/* ============================================================================================== --- Script sinh ngôn ngữ cho module --- Module SO ============================================================================================== */ IF NOT EXISTS (SELECT 1 FROM   [A00000] WHERE [Module] =  'SO' and LanguageID = 'vi-VN' and [Type] = 'L')   INSERT INTO [A00000]([LanguageID],[LanguageName],[Module], [InsertDate], [UpdateDate], [Version], [Type])   VALUES ('vi-VN', N'Tiếng Việt','SO',GetDate(), GetDate(), 1, 'L');    IF NOT EXISTS (SELECT 1 FROM   [A00000] WHERE [Module] =  'SO' and LanguageID = 'en-US' and [Type] = 'L')   INSERT INTO [A00000]([LanguageID],[LanguageName],[Module], [InsertDate], [UpdateDate], [Version], [Type])   VALUES ('en-US', N'English','SO',GetDate(), GetDate(), 1, 'L');
  
IF NOT EXISTS (SELECT 1 FROM   [A00000] WHERE [Module] =  'SO' and LanguageID = 'ja-JP' and [Type] = 'L')
  INSERT INTO [A00000]([LanguageID],[LanguageName],[Module], [InsertDate], [UpdateDate], [Version], [Type])
  VALUES ('ja-JP', N'日本語','SO',GetDate(), GetDate(), 1, 'L');
  
IF NOT EXISTS (SELECT 1 FROM   [A00000] WHERE [Module] =  'SO' and LanguageID = 'zh-CN' and [Type] = 'L')
  INSERT INTO [A00000]([LanguageID],[LanguageName],[Module], [InsertDate], [UpdateDate], [Version], [Type])
  VALUES ('zh-CN', N'中文','SO',GetDate(), GetDate(), 1, 'L'); 
     