IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS 
			WHERE ID = OBJECT_ID(N'[DBO].[POSP00111]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP00111]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Kiểm tra trước khi Xóa hội viên, update Disabed, Enable
---- Nếu mã hội viên chưa được sử dụng thì cho phép xóa (Xóa ngầm) ngược lại thì báo message ID đã sử dụng không được phép xóa
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 31/03/2014
----Modify By Thị Phượng, Bổ sung trường IsCommon on 13/06/2016
-- <Example>
---- EXEC POSP00111 'KC', '0000001-GS-RS-1-K018'',''0000002-GS-RS-1-K018'',''0000003-GS-RS-1-K018'',''0000004-GS-RS-1-K018', 'GS-RS-1-K018', 2, 1, 'POSF0011', null
---- EXEC POSP00111 'AS', '0000001-GS-RS-1-K018', 'DVBOT001', 2,1 ,'POSF0011', 'BIGC000001'
CREATE PROCEDURE POSP00111 ( 
			@DivisionID varchar(50),--Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
			@MemberIDList NVARCHAR(MAX),
			@ShopID varchar(50),
			@Mode tinyint,--1: Xóa, 0: Sửa  ,  2: Sửa (Disable/Enable)
			@IsDisabled TINYINT, --1: Disabled, 0:Enabled
			@FormID nvarchar(50), -- "POSF0011"	
			@MemberID varchar(50)
			) 
AS 
DECLARE @sSQL NVARCHAR(MAX)
IF @Mode = 1
BEGIN
SET @sSQL = '
	DECLARE @Status TINYINT,
			@Message NVARCHAR(1000),
			@Cur CURSOR,
			@DelShopID VARCHAR(50),
			@DelDivisionID VARCHAR(50),
			@DelMemberID VARCHAR(50),
			@TranMonth int = null,
			@TranYear int = null,
			@APK uniqueidentifier=NULL,
			@DelIsCommon tinyint
	Declare @POST0011temp table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
	SET @Status = 0
	SET @Message = ''''
	Insert into @POST0011temp (	Status, MessageID, Params) 
								Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''POSM000025'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''00ML000052'' as MessageID, Null as Params
	SET @Cur = CURSOR SCROLL KEYSET FOR
	SELECT DivisionID, MemberID, ShopID, IsCommon FROM POST0011 With (NOLOCK)
	WHERE MemberID IN ('''+@MemberIDList+''')

	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelMemberID, @DelShopID, @DelIsCommon
	WHILE @@FETCH_STATUS = 0
	BEGIN
		Exec POSP9000   @DelDivisionID, @DelShopID, @TranMonth, @TranYear,  @DelMemberID, @APK , '''+@FormID+''', @Status OUTPUT 		
		IF @DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1
									Begin
										update @POST0011temp set Params = ISNULL(Params,'''') + @DelMemberID+'','' where MessageID = ''00ML000050''
									End
		ELSE IF @DelShopID != '''+@ShopID+'''
									Begin
										update @POST0011temp set Params = ISNULL(Params,'''') + @DelMemberID+'','' where MessageID = ''POSM000025''
									End
		ELSE IF (Select @Status) = 1
				update @POST0011temp set Params = ISNULL(Params,'''') + @DelMemberID+'',''  where MessageID = ''00ML000052''
		IF (Select @Status) = 0 and @DelShopID = '''+@ShopID+'''
				DELETE FROM POST0011 WHERE  MemberID = @DelMemberID				
				DELETE POST0020 WHERE  MemberID = @DelMemberID
		FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelMemberID, @DelShopID,  @DelIsCommon
	END
	CLOSE @Cur
	SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @POST0011temp where Params is not null'
EXEC (@sSQL)

END
IF @Mode = 0
BEGIN
	DECLARE @Status TINYINT,
			@Status1 TINYINT,
			@Message NVARCHAR(1000),
			@Params Varchar(100),
			@DelDivisionID Varchar(50), 
			@DelShopID Varchar(50), 
			@TranMonth int, 
			@TranYear int, 
			@ID Varchar(50), 
			@APK uniqueidentifier,
			@Closing TINYINT,
			@DelIsCommon TINYINT
		    Declare @POST0011temp table 
					(
					Status tinyint,
					MessageID varchar(100),
					Params varchar(4000)
					)
SELECT @DelDivisionID = DivisionID, @ID = MemberID, @DelShopID = ShopID, @DelIsCommon=IsCommon
FROM POST0011 With (NOLOCK)
WHERE MemberID = @MemberID			
Exec POSP9000   @DelDivisionID, @DelShopID, @TranMonth, @TranYear, @ID, @APK , @FormID, @Status OUTPUT
IF @DelDivisionID != @DivisionID AND @DelIsCommon !=1
			Begin
				SET @Message = '00ML000050' 
				SET	@Status1 = 2
				SET @Params = @ID
			End 
IF @DelShopID != @ShopID 
			Begin
				SET @Message = 'POSM000025'  
				SET	@Status1 = 2
				SET @Params = @ID
			End
IF (Select @Status) = 1
			Begin
				SET @Message = '00ML000052' 
				SET	@Status1 = 2
				SET @Params = @ID
			End	
INSERT INTO @POST0011temp (	Status, MessageID, Params) 
	   SELECT @Status1 as Status, @Message as MessageID, @Params as Params 			
SELECT Status, MessageID,Params From  @POST0011temp where Params is not null
END
ELSE IF @Mode = 2--Kiểm tra trước khi sửa Check Disable/Enable
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT,                                 
						@Message NVARCHAR(1000),
						@Cur CURSOR,
						@DelDivisionID VARCHAR(50),
						@DelMemberID VARCHAR(50),
						@DelShopID VARCHAR(50),
						@TranMonth int = null,
						@TranYear int = null,
						@APK uniqueidentifier=NULL,
						@DelIsCommon TINYINT
				Declare @POST0011temp table (
						Status tinyint,
						MessageID varchar(100),
						Params varchar(4000))
				SET @Status = 0
				SET @Message = ''''
				Insert into @POST0011temp (	Status, MessageID, Params) 
								Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''00ML000052'' as MessageID, Null as Params
							
				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT DivisionID, MemberID, ShopID, IsCommon FROM POST0011 WITH (NOLOCK) WHERE MemberID IN ('''+@MemberIDList+''')
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelMemberID, @DelShopID, @DelIsCommon 
				WHILE @@FETCH_STATUS = 0
				BEGIN
					EXEC POSP9000   @DelDivisionID, @DelShopID, @TranMonth, @TranYear,  @DelMemberID, @APK , '''+@FormID+''', @Status OUTPUT
					IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1)
							update @POST0011temp set Params = ISNULL(Params,'''') + @DelMemberID+'','' where MessageID = ''00ML000050''
					ELSE 
					Begin
						IF '+ Cast(@IsDisabled as varchar(50)) +'=1 --Nếu chọn là Disable
						BEGIN
							IF (Select @Status) = 1 --Kiểm tra đã sử dụng
									update @POST0011temp set Params = ISNULL(Params,'''') + @DelMemberID+'','' where MessageID = ''00ML000052''
							ELSE 
								UPDATE POST0011 SET Disabled = 1 WHERE MemberID = @DelMemberID		
						END
						ELSE  --Nếu chọn là Enable
							UPDATE POST0011 SET Disabled = 0 WHERE MemberID = @DelMemberID			

					End
					FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelMemberID, @DelShopID, @DelIsCommon
				END
				CLOSE @Cur
				SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @POST0011temp where Params is not null'
			EXEC (@sSQL)
		
	END