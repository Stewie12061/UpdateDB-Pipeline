IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP11802]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CIP11802]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
-- Kiểm tra trước khi xóa/sửa mã bộ định mức kít
-- Nếu mã bộ kít chưa được sử dụng thì cho phép xóa (Xóa ngầm) ngược lại thì báo message ID đã sử dụng không được phép xóa
-- <Param>
-- <Return>
-- <Reference>
-- <History>
-- Created by: Phan thanh hoàng vũ, Date: 24/05/2016
-- <Example> EXEC CIP11802 'HT', 'OOO', 'OOO', 'AT1325', 2, 1, NULL

CREATE PROCEDURE CIP11802 ( 
	@DivisionID varchar(50),--Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
	@KITID varchar(50),
	@KITIDList NVARCHAR(MAX),
	@TableID nvarchar(50),	-- "AT1325"	
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
						@DelKITID VARCHAR(50),
						@DelIsCommon tinyint
				Declare @AT1325temp table (
						Status tinyint,
						MessageID varchar(100),
						Params varchar(4000))
				SET @Status = 0
				SET @Message = ''''
				Insert into @AT1325temp (	Status, MessageID, Params) 
											Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
											union all
											Select 2 as Status, ''00ML000052'' as MessageID, Null as Params
				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT DivisionID, KITID, IsCommon FROM AT1325 WITH (NOLOCK) WHERE KITID IN ('''+@KITIDList+''')
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelKITID, @DelIsCommon
				WHILE @@FETCH_STATUS = 0
				BEGIN
					EXEC CIP90000 @DelDivisionID, NULL, '''+@TableID+''',@DelKITID, @Status OUTPUT
					IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1)
							update @AT1325temp set Params = ISNULL(Params,'''') + @DelKITID+'','' where MessageID = ''00ML000050''
					ELSE IF (Select @Status) = 1
							update @AT1325temp set Params = ISNULL(Params,'''') + @DelKITID+'',''  where MessageID = ''00ML000052''
					ELSE 
						Begin
							DELETE FROM AT1326 WHERE KITID = @DelKITID
							DELETE FROM AT1324 WHERE KITID = @DelKITID
							DELETE FROM AT1325 WHERE KITID = @DelKITID
						End
					FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelKITID, @DelIsCommon
				END
				CLOSE @Cur
				SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @AT1325temp where Params is not null'
			EXEC (@sSQL)
	END
	ELSE IF @Mode = 0 --Kiểm tra trước khi sửa
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Params Varchar(100),
						@DelDivisionID Varchar(50), 
						@DelKITID Varchar(50), 
						@DelIsCommon tinyint
				Declare @AT1325temp table (
								Status tinyint,
								MessageID varchar(100),
								Params varchar(4000))
				SELECT @DelDivisionID = DivisionID, @DelKITID = KITID, @DelIsCommon = Isnull(IsCommon, 0)
				FROM AT1325 WITH (NOLOCK) WHERE KITID = '''+@KITID+'''			
				IF (@DelDivisionID !='''+ @DivisionID+''' and @DelIsCommon != 1) --Kiểm tra khac DivisionID và không dùng chung
							Begin
								SET @Message = ''00ML000050'' 
								SET	@Status = 2
								SET @Params = @DelKITID
							End 
				INSERT INTO @AT1325temp (	Status, MessageID, Params) SELECT @Status as Status, @Message as MessageID, @Params as Params 			
				SELECT Status, MessageID,Params From  @AT1325temp where Params is not null'
			EXEC (@sSQL)
	END
	ELSE IF @Mode = 2--Kiểm tra trước khi sửa Check Disable/Enable
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Cur CURSOR,
						@DelDivisionID VARCHAR(50),
						@DelKITID VARCHAR(50),
						@DelIsCommon tinyint
				Declare @AT1325temp table (
						Status tinyint,
						MessageID varchar(100),
						Params varchar(4000))
				SET @Status = 0
				SET @Message = ''''
				Insert into @AT1325temp (	Status, MessageID, Params) 
				Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
							
				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT DivisionID, KITID, IsCommon FROM AT1325 WITH (NOLOCK) WHERE KITID IN ('''+@KITIDList+''')
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelKITID, @DelIsCommon
				WHILE @@FETCH_STATUS = 0
				BEGIN
					IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1)
							update @AT1325temp set Params = ISNULL(Params,'''') + @DelKITID+'','' where MessageID = ''00ML000050''
					ELSE 
					Begin
						IF '+ Cast(@IsDisable as varchar(50)) +'=1 --Nếu chọn là Disable
						Begin	
							UPDATE AT1326 SET Disabled = 1 WHERE KITID = @DelKITID		
							UPDATE AT1325 SET Disabled = 1 WHERE KITID = @DelKITID
						End
						ELSE  --Nếu chọn là Enable
						begin
							UPDATE AT1326 SET Disabled = 0 WHERE KITID = @DelKITID			
							UPDATE AT1325 SET Disabled = 0 WHERE KITID = @DelKITID			
						End

					End
					FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelKITID, @DelIsCommon
				END
				CLOSE @Cur
				SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @AT1325temp where Params is not null'
			EXEC (@sSQL)
	END
END