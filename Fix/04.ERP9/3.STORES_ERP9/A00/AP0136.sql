IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[AP0136]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[AP0136]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
-- Kiểm tra trước khi sửa email template trong danh sách
-- Nếu mã email template khác DivisionID thì cảnh báo message ngược lại thì không
-- <Param>
-- <Return>
-- <Reference>
-- <History>
-- Created by: Phan thanh hoàng vũ, Date: 03/04/2017
-- <Example> EXEC AP0136 'AS', 'MailTemplate01',  1, NULL

CREATE PROCEDURE AP0136 ( 
	@DivisionID varchar(50),--Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
	@TemplateIDList NVARCHAR(MAX),	--Trường hợp xóa hoặc xử lý enable/disable
	@IsDisable  tinyint,	--1: Disable; 0: Enable
	@UserID Varchar(50)) 
AS 
BEGIN
	DECLARE @sSQL NVARCHAR(MAX)
	SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Cur CURSOR,
						@DelDivisionID VARCHAR(50),
						@DelAPKTemplateID VARCHAR(50),
						@DelTemplateID VARCHAR(50),
						@DelIsCommon tinyint
				Declare @AT0129temp table (
						Status tinyint,
						MessageID varchar(100),
						Params varchar(4000))
				SET @Status = 0
				SET @Message = ''''
				Insert into @AT0129temp (	Status, MessageID, Params) 
				Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
							
				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT APK, DivisionID, TemplateID, IsCommon FROM AT0129 WITH (NOLOCK) WHERE TemplateID IN ('''+@TemplateIDList+''')
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelAPKTemplateID, @DelDivisionID, @DelTemplateID, @DelIsCommon
				WHILE @@FETCH_STATUS = 0
				BEGIN
					IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1)
							update @AT0129temp set Params = ISNULL(Params,'''') + @DelTemplateID+'',''
					ELSE 
					Begin
						IF '+ Cast(@IsDisable as varchar(50)) +'=1 --Nếu chọn là Disable
							UPDATE AT0129 SET Disabled = 1 WHERE APK = @DelAPKTemplateID		
						ELSE  --Nếu chọn là Enable
							UPDATE AT0129 SET Disabled = 0 WHERE APK = @DelAPKTemplateID	

					End
					FETCH NEXT FROM @Cur INTO @DelAPKTemplateID, @DelDivisionID, @DelTemplateID, @DelIsCommon
				END
				CLOSE @Cur
				
				SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params 
				From  @AT0129temp where Params is not null '
			EXEC (@sSQL)
			
END

