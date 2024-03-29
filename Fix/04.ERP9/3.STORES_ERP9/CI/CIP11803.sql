IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP11803]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CIP11803]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
-- Kiểm tra trước khi xóa/ Thêm mã mặt hàng trong mã bộ định mức kít
-- Nếu mã bộ kít chưa được sử dụng thì cho phép xóa (Xóa ngầm) ngược lại thì báo message ID đã sử dụng không được phép xóa
-- <Param>
-- <Return>
-- <Reference>
-- <History>
-- Created by: Phan thanh hoàng vũ, Date: 24/05/2016
-- <Example> EXEC CIP11803 'HT', 'OOO', 'HTBT000002', 'HTBT000002', 'AT1325', 0, NULL

CREATE PROCEDURE CIP11803 ( 
	@DivisionID varchar(50),
	@KITID varchar(50),
	@InventoryID varchar(50),
	@InventoryIDList NVARCHAR(MAX),
	@TableID nvarchar(50),	-- "AT1325"	
	@Mode tinyint,			--0: Thêm mặt hàng, 1: Xóa mặt hàng
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
						@DelInventoryID VARCHAR(50),
						@DelIsCommon tinyint
				Declare @AT1324temp table (
						Status tinyint,
						MessageID varchar(100),
						Params varchar(4000))
				SET @Status = 0
				SET @Message = ''''
				Insert into @AT1324temp (	Status, MessageID, Params) 
											Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
											
				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT DivisionID, KITID, InventoryID, IsCommon FROM AT1324 WITH (NOLOCK) WHERE InventoryID IN ('''+@InventoryIDList+''') and KITID = '''+@KITID+'''
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelKITID, @DelInventoryID, @DelIsCommon
				WHILE @@FETCH_STATUS = 0
				BEGIN
					IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1)
							update @AT1324temp set Params = ISNULL(Params,'''') + @DelInventoryID+'','' where MessageID = ''00ML000050''
					ELSE 
							DELETE FROM AT1326 WHERE InventoryID = @DelInventoryID and KITID = @DelKITID
							DELETE FROM AT1324 WHERE InventoryID = @DelInventoryID and KITID = @DelKITID
					FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelKITID, @DelInventoryID, @DelIsCommon
				END
				CLOSE @Cur
				SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @AT1324temp where Params is not null'
			EXEC (@sSQL)
	END
	ELSE IF @Mode = 0 --Kiểm tra trước khi thêm
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Params Varchar(100),
						@DelDivisionID Varchar(50), 
						@DelKITID VARCHAR(50),
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
	
END