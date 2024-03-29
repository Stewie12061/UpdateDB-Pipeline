IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[AP0130]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[AP0130]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- <Summary>
---- Kiểm tra Sửa/Xóa Danh mục Email template
---- Xóa danh mục template
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Nguyễn Thanh Sơn, Date: 07/10/2014
----Editted by: hoàng Vũ, Date: 03/04/2017: xóa trong bảng khai báo biến, kiểm tra điều kiện đã sử dụng.
-- <Example>
---- 
/*
	EXEC AP0130 @DivisionID = 'EIS', @UserID = '', @TemplateIDList = 'HK1_2014'',''HK2_2014' , @Mode = 1
	EXEC AP0130 @DivisionID = 'EIS', @UserID = '', @TemplateID = 'HK1_2014', @Mode = 0
*/

CREATE PROCEDURE AP0130
( 
  @DivisionID VARCHAR(50),
  @UserID VARCHAR(50),
  @TemplateID VARCHAR(50) = NULL,
  @TemplateIDList NVARCHAR(MAX) = NULL,
  @Mode TINYINT --0: Edit, 1: Delete
) 
AS 
DECLARE @sSQL NVARCHAR(MAX)

IF @Mode = 1 --Xử lý xóa Email template
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
										union all
										Select 2 as Status, ''00ML000052'' as MessageID, Null as Params
			SET @Cur = CURSOR SCROLL KEYSET FOR
			SELECT APK, DivisionID, TemplateID, IsCommon FROM AT0129 WITH (NOLOCK) WHERE TemplateID IN ('''+@TemplateIDList+''')
			OPEN @Cur
			FETCH NEXT FROM @Cur INTO @DelAPKTemplateID, @DelDivisionID, @DelTemplateID, @DelIsCommon
			WHILE @@FETCH_STATUS = 0
			BEGIN
					EXEC CRMP90000 @DelDivisionID, NULL, ''AT0129'', NULL, @DelTemplateID, NULL, NULL, @Status OUTPUT
					IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1)
							update @AT0129temp set Params = ISNULL(Params,'''') + @DelTemplateID+'','' where MessageID = ''00ML000050''
					ELSE IF (Select @Status) = 1
							update @AT0129temp set Params = ISNULL(Params,'''') + @DelTemplateID+'',''  where MessageID = ''00ML000052''
					ELSE 
						Begin
							DELETE FROM AT0129 WHERE APK = @DelAPKTemplateID	
							DELETE FROM AT0130 WHERE TemplateID = @DelTemplateID	
						End
				FETCH NEXT FROM @Cur INTO @DelAPKTemplateID, @DelDivisionID, @DelTemplateID, @DelIsCommon
			END 
			CLOSE @Cur
			SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @AT0129temp where Params is not null
			'

IF @Mode = 0   --Xử lý sửa Email template
			SET @sSQL = '
			DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Params Varchar(100),
						@DelDivisionID Varchar(50), 
						@DelTemplateID Varchar(50), 
						@DelIsCommon tinyint
			Declare @AT0129temp table (
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000))
			SELECT @DelDivisionID = DivisionID, @DelTemplateID = TemplateID, @DelIsCommon = Isnull(IsCommon, 0)
			FROM AT0129 WITH (NOLOCK) WHERE TemplateID = '''+@TemplateID+'''			
			IF (@DelDivisionID !='''+ @DivisionID+''' and @DelIsCommon != 1) --Kiểm tra khac DivisionID và không dùng chung
						Begin
							SET @Message = ''00ML000050'' 
							SET	@Status = 2
							SET @Params = @DelTemplateID
						End 
			INSERT INTO @AT0129temp (Status, MessageID, Params) SELECT @Status as Status, @Message as MessageID, @Params as Params 			
			SELECT Status, MessageID,Params From  @AT0129temp where Params is not null
			'

EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
