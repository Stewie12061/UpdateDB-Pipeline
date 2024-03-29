IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[ERP9ADDLANGUAGE]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[ERP9ADDLANGUAGE]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

---Modify by Thị Phượng Date 12/06/2017: Bổ sung điều kiện module vào để add ngôn ngữ trường hợp cùng ngôn ngữ khác module
---Modify by Hoài Bảo Date 19/09/2022: Bổ sung điều kiện module vào câu update trường hợp cùng ngôn ngữ khác module
CREATE PROCEDURE ERP9AddLanguage
(
    @ModuleID VARCHAR(10),
	@KeyID VARCHAR(100),
    @FormID VARCHAR(200),
    @Text NVARCHAR(4000),
    @Language VARCHAR(10),
	@CustomName NVARCHAR(4000) = null
)
AS
	IF NOT EXISTS (SELECT 1 FROM [A00001] WHERE [ID] = @KeyID AND LanguageID = @Language AND Module = @ModuleID)
		BEGIN
		  INSERT INTO [A00001]([ID],[LanguageID],[Name],[Module], [InsertDate], [FormID], [CustomName],Platform)
		  VALUES (RTRIM(LTRIM(@KeyID)), 
				RTRIM(LTRIM(@Language)), 
				@Text, 
				RTRIM(LTRIM(@ModuleID)), 
				GetDate(), 
				RTRIM(LTRIM(@FormID)),
				@CustomName,
				1)
		END
	ELSE
		BEGIN
		  UPDATE [A00001]
		  SET [Name]=@Text,
			[CustomName] = @CustomName,
			[FormID] = RTRIM(LTRIM(@FormID)),
			Platform = 1
		  WHERE [ID]=RTRIM(LTRIM(@KeyID)) AND [LanguageID]=RTRIM(LTRIM(@Language)) AND Module = RTRIM(LTRIM(@ModuleID))
		END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
