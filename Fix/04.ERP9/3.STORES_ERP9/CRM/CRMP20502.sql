IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CRMP20502]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[CRMP20502]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
-- Kiểm tra trước khi xóa/sửa cơ hội
-- Nếu mã cơ hội chưa được sử dụng thì cho phép xóa (Xóa ngầm) ngược lại thì báo message ID đã sử dụng không được phép xóa
-- <Param>
-- <Return>
-- <Reference>
-- <History>
-- Created by: Phan thanh hoàng vũ, Date: 13/03/2017
-- Modified by Thị Phượng, Date 23/06/2017 Bổ sung set lại giá trị @Status khi chạy con trỏ
-- Modify by Thị Phượng, Date 11/10/2017 Comment out Xóa trong bảng Lịch sử
-- Modify by Trọng Kiên, Date 06/10/2020: Fix lỗi xóa cơ hội (Invalid column RelatedToID) --> vì Email thay đổi cấu trúc
-- Modify by Anh Tuấn, Date 31/12/2021: Thay đổi giá trị DeleteFlg = 1 khi xóa
-- <Example> EXEC CRMP20502 'AS', '00003FCC-50FB-4888-8A37-65AE93B3F0E8', '00020F01-102A-40C1-9328-94C389B1B3EE', 'CRMF2052',  1, 1, NULL

CREATE PROCEDURE CRMP20502 ( 
	@DivisionID varchar(50),--Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
	@OpportunityID varchar(50),			--Trường hợp sửa
	@OpportunityIDList NVARCHAR(MAX),	--Trường hợp xóa hoặc xử lý enable/disable
	@FormID nvarchar(50),	-- "CRMF2050"hoặc "CRMF2052"	
	@Mode tinyint,			--0: Sửa, 1: Xóa; 2: Sửa (Disable/Enable)
	@IsDisable  tinyint,	--1: Disable; 0: Enable
	@UserID Varchar(50)) 
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
						@DelAPKOpportunityID VARCHAR(50),
						@DelOpportunityID VARCHAR(50),
						@DelIsCommon tinyint
				Declare @CRMT20501temp table (
						Status tinyint,
						MessageID varchar(100),
						Params varchar(4000))
				SET @Status = 0
				SET @Message = ''''
				Insert into @CRMT20501temp (	Status, MessageID, Params) 
											Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
											union all
											Select 2 as Status, ''00ML000052'' as MessageID, Null as Params
				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT APK, DivisionID, OpportunityID, IsCommon FROM CRMT20501 WITH (NOLOCK) WHERE OpportunityID IN ('''+@OpportunityIDList+''')
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelAPKOpportunityID, @DelDivisionID, @DelOpportunityID, @DelIsCommon
				WHILE @@FETCH_STATUS = 0
				BEGIN
					EXEC CRMP90000 @DelDivisionID, '''+@FormID+''', ''CRMT20501'', NULL, @DelOpportunityID, NULL, NULL, @Status OUTPUT
					IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1)
							update @CRMT20501temp set Params = ISNULL(Params,'''') + @DelOpportunityID+'','' where MessageID = ''00ML000050''
					ELSE IF (Select @Status) = 1
							update @CRMT20501temp set Params = ISNULL(Params,'''') + @DelOpportunityID+'',''  where MessageID = ''00ML000052''
					ELSE 
						Begin
							-- Thay đổi biến cờ DeleteFlg
							UPDATE CRMT20501 SET DeleteFlg = 1 WHERE CAST(  OpportunityID AS VARCHAR(50)) = @DelOpportunityID

							--Xóa thông tin người duyệt
							--DELETE FROM OOT9000 WHERE APK = (SELECT TOP 1 APKMaster_9000 FROM CRMT20501 WHERE APK = @DelAPKOpportunityID)
							--DELETE FROM OOT9001 WHERE APKMaster = (SELECT TOP 1 APKMaster_9000 FROM CRMT20501 WHERE APK = @DelAPKOpportunityID)	
							--DELETE FROM CRMT20501 WHERE APK = @DelAPKOpportunityID								
							--Xóa loại hình bán hàng trung gian
							--DELETE FROM CRMT20501_CRMT10601_REL Where OpportunityID = @DelAPKOpportunityID
							--Xóa liên hệ trung gian
							--DELETE FROM CRMT20501_CRMT10001_REL Where OpportunityID = @DelAPKOpportunityID
							--Xóa đầu mối truong gian
							--DELETE FROM CRMT20501_CRMT20301_REL Where OpportunityID = @DelAPKOpportunityID
							--Xóa ghi chú trung gian
							--DELETE FROM CRMT90031_REL Where RelatedToID = @DelAPKOpportunityID
							--Xóa báo giá trung gian
							--DELETE FROM CRMT20501_OT2101_REL Where OpportunityID = @DelAPKOpportunityID
							--Xóa sự kiện trung gian
							--DELETE FROM CRMT90051_REL Where RelatedToID = @DelAPKOpportunityID
							--xóa email trung gian
							--DELETE FROM CMNT90051_REL Where RelatedToID = @DelAPKOpportunityID
							--Xóa đính kèm trung gian
							--DELETE FROM CRMT00002_REL Where RelatedToID = @DelAPKOpportunityID
							--Xóa lịch sử trung gian
							--DELETE FROM CRMT00003  Where RelatedToID = @DelAPKOpportunityID

						End
					FETCH NEXT FROM @Cur INTO @DelAPKOpportunityID, @DelDivisionID, @DelOpportunityID, @DelIsCommon
				Set @Status = 0
				END
				CLOSE @Cur
				SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @CRMT20501temp where Params is not null'
			EXEC (@sSQL)
	END
	ELSE IF @Mode = 0 --Kiểm tra trước khi sửa
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Params Varchar(100),
						@DelDivisionID Varchar(50), 
						@DelOpportunityID Varchar(50), 
						@DelIsCommon tinyint
				Declare @CRMT20501temp table (
								Status tinyint,
								MessageID varchar(100),
								Params varchar(4000))
				SELECT @DelDivisionID = DivisionID, @DelOpportunityID = OpportunityID, @DelIsCommon = Isnull(IsCommon, 0)
				FROM CRMT20501 WITH (NOLOCK) WHERE OpportunityID = '''+@OpportunityID+'''			
				IF (@DelDivisionID !='''+ @DivisionID+''' and @DelIsCommon != 1) --Kiểm tra khac DivisionID và không dùng chung
							Begin
								SET @Message = ''00ML000050'' 
								SET	@Status = 2
								SET @Params = @DelOpportunityID
							End 
				INSERT INTO @CRMT20501temp (	Status, MessageID, Params) SELECT @Status as Status, @Message as MessageID, @Params as Params 			
				SELECT Status, MessageID,Params From  @CRMT20501temp where Params is not null'
			EXEC (@sSQL)
	END
	ELSE IF @Mode = 2--Kiểm tra trước khi sửa Check Disable/Enable
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Cur CURSOR,
						@DelDivisionID VARCHAR(50),
						@DelAPKOpportunityID VARCHAR(50),
						@DelOpportunityID VARCHAR(50),
						@DelIsCommon tinyint
				Declare @CRMT20501temp table (
						Status tinyint,
						MessageID varchar(100),
						Params varchar(4000),
						UpdateSuccess varchar(4000))
				SET @Status = 0
				SET @Message = ''''
				Insert into @CRMT20501temp (	Status, MessageID, Params) 
				Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
							
				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT APK, DivisionID, OpportunityID, IsCommon FROM CRMT20501 WITH (NOLOCK) WHERE OpportunityID IN ('''+@OpportunityIDList+''')
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelAPKOpportunityID, @DelDivisionID, @DelOpportunityID, @DelIsCommon
				WHILE @@FETCH_STATUS = 0
				BEGIN
					IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1)
							update @CRMT20501temp set Params = ISNULL(Params,'''') + @DelOpportunityID+'',''
					ELSE 
					Begin
						IF '+ Cast(@IsDisable as varchar(50)) +'=1 --Nếu chọn là Disable
							UPDATE CRMT20501 SET Disabled = 1 WHERE APK = @DelAPKOpportunityID		
						ELSE  --Nếu chọn là Enable
							UPDATE CRMT20501 SET Disabled = 0 WHERE APK = @DelAPKOpportunityID	
						
						--Trả ra những OpportunityID update thành công để Dev Lưu lịch sử cho trường hợp Disable/Enable		
						update @CRMT20501temp set UpdateSuccess = ISNULL(UpdateSuccess,'''') + @DelAPKOpportunityID+'',''		

					End
					FETCH NEXT FROM @Cur INTO @DelAPKOpportunityID, @DelDivisionID, @DelOpportunityID, @DelIsCommon
				END
				CLOSE @Cur
				
				IF (SELECT Params from @CRMT20501temp) is Null
				BEGIN	
					Update @CRMT20501temp set MessageID = Null, Status = 0
				END

				SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params, LEFT(UpdateSuccess,LEN(UpdateSuccess) - 1) AS UpdateSuccess 
				From  @CRMT20501temp where Params is not null or UpdateSuccess is not null'
			EXEC (@sSQL)			
		END
	END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
