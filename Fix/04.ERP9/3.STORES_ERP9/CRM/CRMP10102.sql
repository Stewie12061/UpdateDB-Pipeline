IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CRMP10102]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[CRMP10102]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Kiểm tra trước khi Xóa/sửa khách hàng
---- Nếu mã khách hàng chưa được sử dụng thì cho phép xóa (Xóa ngầm) ngược lại thì báo message ID đã sử dụng không được phép xóa
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
----
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 26/12/2015
---- Modify by Thị Phượng, Bổ sung chỉnh sửa bản cloud, chẹc DivisionID dung chung
---- Modified by Thị Phượng, Date 03/05/2017 Bổ sung biến trường hợp Disabled và Enable
---- Modified by Thị Phượng, Date 23/06/2017 Bổ sung set lại giá trị @Status khi chạy con trỏ
---- Modify by Thị Phượng, Date 11/10/2017 Comment out Xóa trong bảng Lịch sử
---- Modify by Hoàng vũ, Date 25/09/2018: Convert chuyển lấy dữ liệu khách hàng CRM (CRMT10101)-> Khách hàng POS (POST0011)
---- Modify by Trọng Kiên, Date 06/10/2020: Fix lỗi xóa khách hàng (Invalid column RelatedToID) --> vì Email thay đổi cấu trúc
---- Modify by Anh Tuấn, Date 31/12/2021: Thay đổi giá trị DeleteFlg = 1 khi xóa
---- Modify by Hoài Bảo, Date 31/08/2022: Cập nhật giá trị DeleteFlg = 1 cho bảng đối tượng AT1202
-- <Example> EXEC CRMP10102 'AS', 'CRMF1010', '7285AC3D-B409-4B3C-BFA9-90DC19B5BACD'', ''69B7BF1C-F016-49CA-9FE0-B73A83EE1687'',''7B9B9B15-C159-4D31-A97D-8367A726F715', '0D401459-E025-4804-8920-C81307A9ABC8', 2,1,  'NV01'


CREATE PROCEDURE CRMP10102 ( 
			@DivisionID varchar(50),		--Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
			@FormID nvarchar(50),			--"CRMF1010"	
			@APKList NVARCHAR(MAX),	--xử lý xóa
			@APK varchar(50),			--xử lý sửa
			@Mode tinyint,					--1: Xóa, 0: Sửa  ; 2: Sửa (Disable/Enable)
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
			@DelAPK uniqueidentifier,
			@DelDivisionID VARCHAR(50),
			@DelAccountID VARCHAR(50),
			@DelIsCommon TINYINT,
			@TranMonth int = null,
			@TranYear int = null,
			@APK uniqueidentifier=NULL
	Declare @CRMT10101temp table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
	
	SET @Message = ''''
	Insert into @CRMT10101temp (	Status, MessageID, Params) 
								Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''00ML000052'' as MessageID, Null as Params 
	SET @Cur = CURSOR SCROLL KEYSET FOR
	SELECT APK, DivisionID, MemberID as AccountID , IsCommon FROM POST0011 
	WHERE APK IN ('''+@APKList+''')

	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelAccountID, @DelIsCommon
	WHILE @@FETCH_STATUS = 0
	BEGIN
		Exec CRMP90000   @DelDivisionID,'''+@FormID+''', NULL, @APK , @DelAccountID, @TranMonth, @TranYear, @Status OUTPUT 	
	
				----Cảnh báo nếu khác DivisionID hiện tại đăng nhập
				IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1)
					update @CRMT10101temp set Params = ISNULL(Params,'''') + @DelAccountID+'','' where MessageID = ''00ML000050''
				--Cảnh báo nếu đã được sử dụng
				ELSE IF (Select @Status) = 1
							update @CRMT10101temp set Params = ISNULL(Params,'''') + @DelAccountID+'',''  where MessageID = ''00ML000052''
				ELSE 
					Begin	
						-- Thay đổi biến DeleteFlg
							UPDATE POST0011 SET DeleteFlg = 1 WHERE MemberID = @DelAccountID
						-- Cập nhật DeleteFlg bảng đối tượng
							UPDATE AT1202 SET DeleteFlg = 1 WHERE ObjectID = @DelAccountID

						--DELETE FROM POST0011 WHERE MemberID = @DelAccountID				
						--DELETE FROM AT1202 WHERE ObjectID = @DelAccountID				
						--DELETE FROM CRMT10101_CRMT20401_REL WHERE AccountID = convert(varchar(50), @DelAPK)			
						--DELETE FROM CRMT20301_CRMT10101_REL WHERE AccountID = convert(varchar(50), @DelAPK)		
						--DELETE FROM CRMT20501_CRMT10101_REL WHERE AccountID = convert(varchar(50), @DelAPK)		
						--DELETE FROM CRMT90031_REL WHERE RelatedToID = @DelAccountID
						--DELETE FROM CRMT90041_REL WHERE RelatedToID = @DelAccountID	
						--DELETE FROM AT1103_REL WHERE RelatedToID = convert(varchar(50),(select EventID From CRMT90051_REL where RelatedToID =convert(varchar(50), @DelAPK)))		
						--DELETE FROM CRMT90051_REL WHERE RelatedToID = convert(varchar(50), @DelAPK)			
						--DELETE FROM CMNT90051_REL WHERE RelatedToID = convert(varchar(50), @DelAPK)			
						--DELETE FROM CRMT00002_REL WHERE RelatedToID = convert(varchar(50), @DelAPK)				
						--DELETE FROM CRMT00003 WHERE RelatedToID = convert(varchar(50), @DelAPK)		
						
					end				
		FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelAccountID, @DelIsCommon
		Set @Status = 0
	END
	CLOSE @Cur
	SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @CRMT10101temp where Params is not null'
EXEC (@sSQL)
END
IF @Mode = 0
BEGIN
	DECLARE @Status TINYINT,
			@Message NVARCHAR(1000),
			@Params Varchar(100),
			@DelDivisionID Varchar(50), 
			@DelIsCommon Tinyint, 
			@ID Varchar(50)
			Declare @CRMT10101temp table 
					(
					Status tinyint,
					MessageID varchar(100),
					Params varchar(4000)
					)
SELECT @DelDivisionID = DivisionID, @ID = MemberID, @DelIsCommon=IsCommon
FROM POST0011 
WHERE APK = @APK			

			--Cảnh báo nếu khác DivisionID hiện tại đăng nhập
				IF (@DelDivisionID != @DivisionID or @DelIsCommon !=1)
					Begin
						SET @Message = '00ML000050' 
						SET	@Status = 2
						SET @Params = @ID
				End

INSERT INTO @CRMT10101temp (	Status, MessageID, Params) 
	   SELECT @Status as Status, @Message as MessageID, @Params as Params 			
SELECT Status, MessageID,Params From  @CRMT10101temp where Params is not null
END

IF @Mode = 2--Kiểm tra trước khi sửa Check Disable/Enable
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Cur CURSOR,
						@DelDivisionID VARCHAR(50),
						@DelAccountID VARCHAR(50),
						@DelAPK VARCHAR(50),
						@DelIsCommon tinyint
				Declare @CRMT10101temp table (
						Status tinyint,
						MessageID varchar(100),
						Params varchar(4000),
						UpdateSuccess varchar(4000))
				SET @Status = 0
				SET @Message = ''''
				Insert into @CRMT10101temp (	Status, MessageID, Params) 
				Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
							
				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT APK ,DivisionID, MemberID AccountID, IsCommon FROM POST0011 WITH (NOLOCK) WHERE APK IN ('''+@APKList+''')
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelAccountID, @DelIsCommon
				WHILE @@FETCH_STATUS = 0
				BEGIN
					IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1)
							update @CRMT10101temp set Params = ISNULL(Params,'''') + @DelAccountID+'','' where MessageID = ''00ML000050''
					ELSE 
					Begin
						IF '+ Cast(@IsDisable as varchar(50)) +'=1 --Nếu chọn là Disable
							UPDATE POST0011 SET Disabled = 1 WHERE MemberID = @DelAccountID		
						ELSE  --Nếu chọn là Enable
							UPDATE POST0011 SET Disabled = 0 WHERE MemberID = @DelAccountID	
						--Trả ra những APK của AccountID update thành công để Dev Lưu lịch sử cho trường hợp Disable/Enable		
						update @CRMT10101temp set UpdateSuccess = ISNULL(UpdateSuccess,'''') + @DelAPK +'',''				

					End
					FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelAccountID, @DelIsCommon
				END
				CLOSE @Cur
				--Kiểm tra trường hợp nếu không có ID nào ở Params thì không trả về messageID
				IF ((SELECT Params from @CRMT10101temp) is Null)
				BEGIN
					Update @CRMT10101temp set MessageID = Null, Status = Null
				END
				SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params, LEFT(UpdateSuccess,LEN(UpdateSuccess) - 1) AS UpdateSuccess 
				From  @CRMT10101temp where Params is not null or UpdateSuccess is not null'
			EXEC (@sSQL)
	END
	
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
