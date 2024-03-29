IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CRMP10002]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[CRMP10002]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Kiểm tra trước khi Xóa liên hệ
---- Nếu mã liên hệ chưa được sử dụng thì cho phép xóa (Xóa ngầm) ngược lại thì báo message ID đã sử dụng không được phép xóa
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 20/11/2015
----Modified by Thị Phượng, Date 10/03/2017 Chỉnh sửa trường hơp dùng chung trên CLOUD
----Modified by Thị Phượng, Date 03/05/2017 Bổ sung biến trường hợp Disabled và Enable
---- Modified by Thị Phượng, Date 23/06/2017 Bổ sung set lại giá trị @Status khi chạy con trỏ
-- Modify by Anh Tuấn, Date 4/1/2022: Thay cách xóa mơi (thay đổi giá trị DeleteFlg = 1), bỏ xét cảnh báo dữ liệu đã được sử dụng
-- <Example> EXEC CRMP10002 'AS', 'CRMF1000', 'LH01'',''LH00002'',''LH00003'',''LH00004'',''LH00005'',''LH0006', 'LH01', 2,1, 'NV01'

CREATE PROCEDURE CRMP10002 ( 
			@DivisionID varchar(50),		--Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
			@FormID nvarchar(50),			--"CRMF1010"	
			@ContactIDList NVARCHAR(MAX),	--xử lý xóa
			@ContactID varchar(50),			--xử lý sửa
			@Mode tinyint,					--1: Xóa, 0: Sửa; 2: Sửa (Disable/Enable)
			@IsDisable  tinyint,	--1: Disable; 0: Enable 
			@UserID varchar(50)
			) 
AS 
DECLARE @sSQL NVARCHAR(MAX)
IF @Mode = 1
BEGIN
SET @sSQL = '
	DECLARE @Status TINYINT,
			@Message NVARCHAR(1000),
			@Cur CURSOR,
			@DelDivisionID VARCHAR(50),
			@DelContactID VARCHAR(50),
			@DelIsCommon tinyint,
			@TranMonth int = null,
			@TranYear int = null,
			@APK uniqueidentifier=NULL
	Declare @CRMT10001temp table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
	
	SET @Message = ''''
	Insert into @CRMT10001temp (	Status, MessageID, Params) 
								Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''00ML000052'' as MessageID, Null as Params 

	IF ('''+@FormID+''' = ''CRMF1000'')
		BEGIN
			SET @Cur = CURSOR SCROLL KEYSET FOR
			SELECT APK, DivisionID, ContactID, IsCommon FROM CRMT10001 
			WHERE APK IN ('''+@ContactIDList+''')

			OPEN @Cur
			FETCH NEXT FROM @Cur INTO @APK, @DelDivisionID, @DelContactID, @DelIsCommon
			WHILE @@FETCH_STATUS = 0
			BEGIN
				-- Thay đổi biến DeleteFlg
				UPDATE CRMT10001 SET DeleteFlg = 1 WHERE CAST( ContactID AS VARCHAR(50)) = @DelContactID
				FETCH NEXT FROM @Cur INTO @APK, @DelDivisionID, @DelContactID, @DelIsCommon
			END
		END
	ELSE
	BEGIN
		SET @Cur = CURSOR SCROLL KEYSET FOR
		SELECT APK, DivisionID, ContactID, IsCommon FROM CRMT10001 
		WHERE ContactID IN ('''+@ContactIDList+''')

		OPEN @Cur
		FETCH NEXT FROM @Cur INTO @APK, @DelDivisionID, @DelContactID, @DelIsCommon
		WHILE @@FETCH_STATUS = 0
		BEGIN
			Exec CRMP90000   @DelDivisionID,'''+@FormID+''', NULL, @APK , @DelContactID, @TranMonth, @TranYear, @Status OUTPUT 	
		
		--Cảnh báo nếu khác DivisionID hiện tại đăng nhập
		IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1)
									Begin
										update @CRMT10001temp set Params = ISNULL(Params,'''') + @DelContactID+'','' where MessageID = ''00ML000050''
									End
		ELSE 
	
		--Cảnh báo nếu đã được sử dụng
		IF (Select @Status) = 1
				update @CRMT10001temp set Params = ISNULL(Params,'''') + @DelContactID+'',''  where MessageID = ''00ML000052''

		--Xóa được nếu không xảy ra 2 trường hợp trên (Khác DivisionID, đã sử dung)
		IF (Select @Status) = 0 and (@DelDivisionID = '''+@DivisionID+''' or @DelIsCommon =1)
				DELETE FROM CRMT10001 WHERE ContactID = @DelContactID				
			
		FETCH NEXT FROM @Cur INTO @APK, @DelDivisionID, @DelContactID, @DelIsCommon
		Set @Status = 0
		END
	END
	CLOSE @Cur
	SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @CRMT10001temp where Params is not null'
EXEC (@sSQL)

END
IF @Mode = 0
BEGIN
	DECLARE @Status TINYINT,
			@Status1 TINYINT,
			@Message NVARCHAR(1000),
			@Params Varchar(100),
			@DelDivisionID Varchar(50), 
			@DelIsCommon TINYINT,
			@TranMonth int, 
			@TranYear int, 
			@ID Varchar(50), 
			@APK uniqueidentifier
		    Declare @CRMT10001temp table 
					(
					Status tinyint,
					MessageID varchar(100),
					Params varchar(4000)
					)
SELECT @DelDivisionID = DivisionID, @ID = ContactID, @DelIsCommon= IsCommon
FROM CRMT10001 
WHERE ContactID = @ContactID			
Exec CRMP90000   @DelDivisionID,@FormID, @APK , @ID, @TranMonth, @TranYear, @Status OUTPUT 	
IF (@DelDivisionID != @DivisionID or @DelIsCommon!=1)
			Begin
				SET @Message = '00ML000050' 
				SET	@Status1 = 2
				SET @Params = @ID
			End 
IF (Select @Status) = 1
			Begin
				SET @Message = '00ML000052' 
				SET	@Status1 = 2
				SET @Params = @ID
			End	
INSERT INTO @CRMT10001temp (	Status, MessageID, Params) 
	   SELECT @Status1 as Status, @Message as MessageID, @Params as Params 			
SELECT Status, MessageID,Params From  @CRMT10001temp where Params is not null
END

IF @Mode = 2--Kiểm tra trước khi sửa Check Disable/Enable
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Cur CURSOR,
						@DelDivisionID VARCHAR(50),
						@DelContactID VARCHAR(50),
						@DelAPK VARCHAR(50),
						@DelIsCommon tinyint
				Declare @CRMT10001temp table (
						Status tinyint,
						MessageID varchar(100),
						Params varchar(4000),
						UpdateSuccess varchar(4000))
				SET @Status = 0
				SET @Message = ''''
				Insert into @CRMT10001temp (	Status, MessageID, Params) 
				Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
							
				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT APK, DivisionID, ContactID, IsCommon FROM CRMT10001 WITH (NOLOCK) WHERE ContactID IN ('''+@ContactIDList+''')
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelContactID, @DelIsCommon
				WHILE @@FETCH_STATUS = 0
				BEGIN
					IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1)
							update @CRMT10001temp set Params = ISNULL(Params,'''') + @DelContactID+'','' where MessageID = ''00ML000050''
					ELSE 
					Begin
						IF '+ Cast(@IsDisable as varchar(50)) +'=1 --Nếu chọn là Disable
							UPDATE CRMT10001 SET Disabled = 1 WHERE ContactID = @DelContactID		
						ELSE  --Nếu chọn là Enable
							UPDATE CRMT10001 SET Disabled = 0 WHERE ContactID = @DelContactID	
						--Trả ra những ContactID update thành công để Dev Lưu lịch sử cho trường hợp Disable/Enable		
						update @CRMT10001temp set UpdateSuccess = ISNULL(UpdateSuccess,'''') + @DelAPK+'',''				

					End
					FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelContactID, @DelIsCommon
				END
				CLOSE @Cur
				--Kiểm tra trường hợp nếu không có ID nào ở Params thì không trả về messageID
				IF ((SELECT Params from @CRMT10001temp) is Null)
				BEGIN
					Update @CRMT10001temp set MessageID = Null, Status = Null
				END
				SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params, LEFT(UpdateSuccess,LEN(UpdateSuccess) - 1) AS UpdateSuccess 
				From  @CRMT10001temp where Params is not null or UpdateSuccess is not null'
			EXEC (@sSQL)
	END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

