IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CRMP10302]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CRMP10302]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
-- Kiểm tra trước khi xóa/sửa danh sách nhóm người nhận
-- Nếu mã nhóm người nhận chưa được sử dụng thì cho phép xóa (Xóa ngầm) ngược lại thì báo message ID đã sử dụng không được phép xóa
-- <Param>
-- <Return>
-- <Reference>
-- <History>
-- Created by: Phan thanh hoàng vũ, Date: 17/03/2017
---- Modified by Thị Phượng, Date 23/06/2017 Bổ sung set lại giá trị @Status khi chạy con trỏ
---- Modify by Thị Phượng, Date 11/10/2017 Comment out Xóa trong bảng Lịch sử
-- <Example> EXEC CRMP10302 'AS', '00003FCC-50FB-4888-8A37-65AE93B3F0E8', '00003FCC-50FB-4888-8A37-65AE93B3F0E8', 'CRMF1032', 1,0, NULL

CREATE PROCEDURE CRMP10302 ( 
	@DivisionID varchar(50), --Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
	@GroupReceiverID varchar(50),		--Trường hợp sửa
	@GroupReceiverIDList NVARCHAR(MAX),	--Trường hợp xóa hoặc xử lý enable/disable
	@FormID nvarchar(50),	-- "CRMF1030" hoặc "CRMF1032"	
	@Mode tinyint,			--0: Sửa, 1: Xóa; 2: Sửa (Disable/Enable)
	@IsDisable  tinyint,	--1: Disable; 0: Enable
	@UserID Varchar(50)
	) 
AS 
BEGIN
	DECLARE @sSQL NVARCHAR(MAX)
	IF @Mode = 1 --Kiểm tra và xóa
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Cur CURSOR,
						@DelDivisionID VARCHAR(50),
						@DelAPKGroupReceiverID VARCHAR(50),
						@DelGroupReceiverID VARCHAR(50),
						@DelIsCommon tinyint
				Declare @CRMT10301temp table (
						Status tinyint,
						MessageID varchar(100),
						Params varchar(4000))
				SET @Status = 0
				SET @Message = ''''
				Insert into @CRMT10301temp (	Status, MessageID, Params) 
											Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
											union all
											Select 2 as Status, ''00ML000052'' as MessageID, Null as Params
				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT APK , DivisionID, GroupReceiverID, IsCommon FROM CRMT10301 WITH (NOLOCK) WHERE GroupReceiverID IN ('''+@GroupReceiverIDList+''')
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelAPKGroupReceiverID, @DelDivisionID, @DelGroupReceiverID, @DelIsCommon
				WHILE @@FETCH_STATUS = 0
				BEGIN
					EXEC CRMP90000 @DelDivisionID, '''+@FormID+''', ''CRMT10301'', NULL, @DelGroupReceiverID, NULL, NULL, @Status OUTPUT
					IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1)
							update @CRMT10301temp set Params = ISNULL(Params,'''') + @DelGroupReceiverID+'','' where MessageID = ''00ML000050''
					ELSE IF (Select @Status) = 1
							update @CRMT10301temp set Params = ISNULL(Params,'''') + @DelGroupReceiverID+'',''  where MessageID = ''00ML000052''
					ELSE 
						Begin
							DELETE FROM CRMT10301 WHERE APK = @DelAPKGroupReceiverID
							--DELETE FROM CRMT00003 WHERE RelatedToTypeID =11 and RelatedToID = convert(varchar(50), @DelAPKGroupReceiverID)
							DELETE FROM CRMT10301_REL WHERE GroupReceiverID = convert(varchar(50), @DelAPKGroupReceiverID)
						End
					FETCH NEXT FROM @Cur INTO @DelAPKGroupReceiverID, @DelDivisionID, @DelGroupReceiverID, @DelIsCommon
					Set @Status = 0
				END
				CLOSE @Cur
				SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @CRMT10301temp where Params is not null'
			EXEC (@sSQL)
	END
	ELSE IF @Mode = 0 --Kiểm tra trước khi sửa
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Params Varchar(100),
						@DelDivisionID Varchar(50), 
						@DelGroupReceiverID Varchar(50), 
						@DelIsCommon tinyint
				Declare @CRMT10301temp table (
								Status tinyint,
								MessageID varchar(100),
								Params varchar(4000))
				SELECT @DelDivisionID = DivisionID, @DelGroupReceiverID = GroupReceiverID, @DelIsCommon = Isnull(IsCommon, 0)
				FROM CRMT10301 WITH (NOLOCK) WHERE GroupReceiverID = '''+@GroupReceiverID+'''			
				IF (@DelDivisionID !='''+ @DivisionID+''' and @DelIsCommon != 1) --Kiểm tra khac DivisionID và không dùng chung
							Begin
								SET @Message = ''00ML000050'' 
								SET	@Status = 2
								SET @Params = @DelGroupReceiverID
							End 
				INSERT INTO @CRMT10301temp (	Status, MessageID, Params) SELECT @Status as Status, @Message as MessageID, @Params as Params 			
				SELECT Status, MessageID,Params From  @CRMT10301temp where Params is not null'
			EXEC (@sSQL)
	END
	ELSE IF @Mode = 2--Kiểm tra trước khi sửa Check Disable/Enable
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Cur CURSOR,
						@DelDivisionID VARCHAR(50),
						@DelAPKGroupReceiverID VARCHAR(50),
						@DelGroupReceiverID VARCHAR(50),
						@DelIsCommon tinyint
				Declare @CRMT10301temp table (
						Status tinyint,
						MessageID varchar(100),
						Params varchar(4000),
						UpdateSuccess varchar(4000))
				SET @Status = 0
				SET @Message = ''''
				Insert into @CRMT10301temp (	Status, MessageID, Params) 
				Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
							
				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT APK, DivisionID, GroupReceiverID, IsCommon FROM CRMT10301 WITH (NOLOCK) WHERE GroupReceiverID IN ('''+@GroupReceiverIDList+''')
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelAPKGroupReceiverID, @DelDivisionID, @DelGroupReceiverID, @DelIsCommon
				WHILE @@FETCH_STATUS = 0
				BEGIN
					IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1)
							update @CRMT10301temp set Params = ISNULL(Params,'''') + @DelGroupReceiverID+'',''
					ELSE 
					Begin
						IF '+ Cast(@IsDisable as varchar(50)) +'=1 --Nếu chọn là Disable
							UPDATE CRMT10301 SET Disabled = 1 WHERE APK = @DelAPKGroupReceiverID		
						ELSE  --Nếu chọn là Enable
							UPDATE CRMT10301 SET Disabled = 0 WHERE APK = @DelAPKGroupReceiverID			
						
						--Trả ra những GroupReceiverID update thành công để Dev Lưu lịch sử cho trường hợp Disable/Enable		
						update @CRMT10301temp set UpdateSuccess = ISNULL(UpdateSuccess,'''') + @DelGroupReceiverID+'',''		


					End
					FETCH NEXT FROM @Cur INTO @DelAPKGroupReceiverID, @DelDivisionID, @DelGroupReceiverID, @DelIsCommon
				END
				CLOSE @Cur

				IF (SELECT Params from @CRMT10301temp) is Null
				BEGIN	
					Update @CRMT10301temp set MessageID = Null, Status = 0
				END

				SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params, LEFT(UpdateSuccess,LEN(UpdateSuccess) - 1) AS UpdateSuccess 
				From  @CRMT10301temp where Params is not null  or UpdateSuccess is not null'
			EXEC (@sSQL)
			
	END
	
END
