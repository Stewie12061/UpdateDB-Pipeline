IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP12621]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CIP12621]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
-- Kiểm tra trước khi xóa/ Thêm chi tiết khuyến mãi theo hóa đơn
-- Nếu mã khuyến mãi theo hóa đơn chưa được sử dụng thì cho phép xóa (Xóa ngầm) ngược lại thì báo message ID đã sử dụng không được phép xóa
-- <Param>
-- <Return>
-- <Reference>
-- <History>
-- Created by: Phan thanh hoàng vũ, Date: 16/08/2016
-- <Example> EXEC CIP12621 'HT', 'KMHD01', '6DF91554-177B-4845-BBE7-CAD4928D2BD2', '6DF91554-177B-4845-BBE7-CAD4928D2BD2', 'AT0109', 1, NULL

CREATE PROCEDURE CIP12621 ( 
	@DivisionID varchar(50),
	@PromoteID varchar(50),
	@APK varchar(50),
	@APKList NVARCHAR(MAX),
	@TableID nvarchar(50),	-- "AT0109"	
	@Mode tinyint,			--0: Thêm/Sửa, 1: Xóa
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
						@DelAPK VARCHAR(50),
						@DelID VARCHAR(50),
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
				SELECT DivisionID, PromoteID, APK, Cast(FromValues as varchar(50)) + ''->'' + Cast(ToValues as varchar(50)) as DelID, IsCommon FROM AT0109 WITH (NOLOCK) WHERE APK IN ('''+@APKList+''') and PromoteID = '''+@PromoteID+'''
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelPromoteID, @DelAPK, @DelID, @DelIsCommon
				WHILE @@FETCH_STATUS = 0
				BEGIN
					IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1)
							update @AT0109temp set Params = ISNULL(Params,'''') + @DelID+'','' where MessageID = ''00ML000050''
					ELSE 
							DELETE FROM AT0109 WHERE APK = @DelAPK and PromoteID = @DelPromoteID
							
					FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelPromoteID, @DelAPK, @DelID, @DelIsCommon
				END
				CLOSE @Cur
				SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @AT0109temp where Params is not null'
			EXEC (@sSQL)
	END
	ELSE IF @Mode = 0 --Kiểm tra trước khi thêm/sửa
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Params Varchar(100),
						@DelDivisionID Varchar(50), 
						@DelPromoteID VARCHAR(50),
						@DelIsCommon tinyint
				Declare @CIT0108temp table (
								Status tinyint,
								MessageID varchar(100),
								Params varchar(4000))
				SELECT @DelDivisionID = DivisionID, @DelPromoteID = PromoteID, @DelIsCommon = Isnull(IsCommon, 0)
				FROM CIT0108 WITH (NOLOCK) WHERE PromoteID = '''+@PromoteID+'''			
				IF (@DelDivisionID !='''+ @DivisionID+''' and @DelIsCommon != 1) --Kiểm tra khac DivisionID và không dùng chung
							Begin
								SET @Message = ''00ML000050'' 
								SET	@Status = 2
								SET @Params = @DelPromoteID
							End 
				INSERT INTO @CIT0108temp (	Status, MessageID, Params) SELECT @Status as Status, @Message as MessageID, @Params as Params 			
				SELECT Status, MessageID,Params From  @CIT0108temp where Params is not null'
			EXEC (@sSQL)
	END
	
END