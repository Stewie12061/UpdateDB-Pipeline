IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP12602]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CIP12602]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
-- Kiểm tra trước khi xóa/sửa khuyến mãi theo hóa đơn
-- Nếu mã mặt hàng chưa được sử dụng thì cho phép xóa (Xóa ngầm) ngược lại thì báo message ID đã sử dụng không được phép xóa
-- <Param>
-- <Return>
-- <Reference>
-- <History>
-- Created by: Phan thanh hoàng vũ, Date: 16/08/2016
-- Modified by: Hoài Bảo, Date: 10/05/2022 - Đổi bảng dữ liệu từ AT0109 -> AT0109
-- Modified by Anh Đô, Date: 20/03/2023 - Bổ sung xoá rel giữa đợt khuyến mãi và đối tượng
-- <Example> EXEC CIP12602 'AS', 'KMHD02', 'KMHD02', 'AT0109', 1, 0, NULL

CREATE PROCEDURE CIP12602 ( 
	@DivisionID varchar(50),--Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
	@PromoteID varchar(50),
	@PromoteIDList NVARCHAR(MAX),
	@TableID nvarchar(50),	--AT0109
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
						@DelPromoteID VARCHAR(50),
						@DelIsCommon tinyint
				Declare @AT0109temp table (
						Status tinyint,
						MessageID varchar(100),
						Params varchar(4000))
				SET @Status = 0
				SET @Message = ''''
				Insert into @AT0109temp (	Status, MessageID, Params) 
											Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
											union all
											Select 2 as Status, ''00ML000052'' as MessageID, Null as Params
				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT DivisionID, PromoteID, IsCommon FROM AT0109 WITH (NOLOCK) WHERE PromoteID IN ('''+@PromoteIDList+''')
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelPromoteID, @DelIsCommon
				WHILE @@FETCH_STATUS = 0
				BEGIN
					EXEC CIP90000 @DelDivisionID, NULL, '''+@TableID+''',@DelPromoteID, @Status OUTPUT
					IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1)
							update @AT0109temp set Params = ISNULL(Params,'''') + @DelPromoteID+'','' where MessageID = ''00ML000050''
					ELSE IF (Select @Status) = 1
							update @AT0109temp set Params = ISNULL(Params,'''') + @DelPromoteID+'',''  where MessageID = ''00ML000052''
					ELSE 
						Begin
							DELETE FROM AT0109 WHERE PromoteID = @DelPromoteID
							DELETE FROM CIT0088 WHERE BusinessParent = @DelPromoteID AND TableBusinessParent = ''AT0109''
						End
						
					FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelPromoteID, @DelIsCommon
				END
				CLOSE @Cur
				SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @AT0109temp where Params is not null'
			EXEC (@sSQL)
	END
	ELSE IF @Mode = 0 --Kiểm tra trước khi sửa
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Params Varchar(100),
						@DelDivisionID Varchar(50), 
						@DelPromoteID Varchar(50), 
						@DelIsCommon tinyint
				Declare @AT0109temp table (
								Status tinyint,
								MessageID varchar(100),
								Params varchar(4000))
				SELECT @DelDivisionID = DivisionID, @DelPromoteID = PromoteID, @DelIsCommon = Isnull(IsCommon, 0)
				FROM AT0109 WITH (NOLOCK) WHERE PromoteID = '''+@PromoteID+'''			
				IF (@DelDivisionID !='''+ @DivisionID+''' and @DelIsCommon != 1) --Kiểm tra khac DivisionID và không dùng chung
							Begin
								SET @Message = ''00ML000050'' 
								SET	@Status = 2
								SET @Params = @DelPromoteID
							End 
				INSERT INTO @AT0109temp (	Status, MessageID, Params) SELECT @Status as Status, @Message as MessageID, @Params as Params 			
				SELECT Status, MessageID,Params From  @AT0109temp where Params is not null'
			EXEC (@sSQL)
	END
	ELSE IF @Mode = 2--Kiểm tra trước khi sửa Check Disable/Enable
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Cur CURSOR,
						@DelDivisionID VARCHAR(50),
						@DelPromoteID VARCHAR(50),
						@DelIsCommon tinyint
				Declare @AT0109temp table (
						Status tinyint,
						MessageID varchar(100),
						Params varchar(4000))
				SET @Status = 0
				SET @Message = ''''
				Insert into @AT0109temp (	Status, MessageID, Params) 
				Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
							
				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT DivisionID, PromoteID, IsCommon FROM AT0109 WITH (NOLOCK) WHERE PromoteID IN ('''+@PromoteIDList+''')
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelPromoteID, @DelIsCommon
				WHILE @@FETCH_STATUS = 0
				BEGIN
					IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1)
							update @AT0109temp set Params = ISNULL(Params,'''') + @DelPromoteID+'','' where MessageID = ''00ML000050''
					ELSE 
					Begin
						IF '+ Cast(@IsDisable as varchar(50)) +'=1 --Nếu chọn là Disable
						Begin	
							UPDATE AT0109 SET Disabled = 1 WHERE PromoteID = @DelPromoteID
						End
						ELSE  --Nếu chọn là Enable
						Begin
							UPDATE AT0109 SET Disabled = 0 WHERE PromoteID = @DelPromoteID
						End

					End
					FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelPromoteID, @DelIsCommon
				END
				CLOSE @Cur
				SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @AT0109temp where Params is not null'
			EXEC (@sSQL)
			
	END
END