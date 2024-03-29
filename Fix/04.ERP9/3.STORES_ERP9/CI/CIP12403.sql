IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP12403]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CIP12403]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
-- Kiểm tra trước khi xóa/ Thêm mã mặt hàng trong mã hàng khuyến mãi
-- Nếu mã hàng khuyến mãi chưa được sử dụng thì cho phép xóa (Xóa ngầm) ngược lại thì báo message ID đã sử dụng không được phép xóa
-- <Param>
-- <Return>
-- <Reference>
-- <History>
-- Created by: Phan thanh hoàng vũ, Date: 24/05/2016
-- <Example> EXEC CIP12403 'HT', 'OOO', 'HTBT000002', 'HTBT000002', 'AT1328', 1, NULL

CREATE PROCEDURE CIP12403 ( 
	@DivisionID varchar(50),
	@PromoteID varchar(50),
	@InventoryID varchar(50),
	@InventoryIDList NVARCHAR(MAX),
	@TableID nvarchar(50),	-- "AT1328"	
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
						@DelPromoteID VARCHAR(50),
						@DelVoucherID VARCHAR(50),
						@DelInventoryID VARCHAR(50),
						@DelIsCommon tinyint
				Declare @AT1328temp table (
						Status tinyint,
						MessageID varchar(100),
						Params varchar(4000))
				SET @Status = 0
				SET @Message = ''''
				Insert into @AT1328temp (	Status, MessageID, Params) 
											Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
											
				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT DivisionID, VoucherID, PromoteID, InventoryID, IsCommon FROM AT1328 WITH (NOLOCK) WHERE InventoryID IN ('''+@InventoryIDList+''') and PromoteID = '''+@PromoteID+'''
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelVoucherID, @DelPromoteID, @DelInventoryID, @DelIsCommon
				WHILE @@FETCH_STATUS = 0
				BEGIN
					IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1)
							update @AT1328temp set Params = ISNULL(Params,'''') + @DelInventoryID+'','' where MessageID = ''00ML000050''
					ELSE 
							DELETE FROM AT1338 WHERE VoucherID = @DelVoucherID
							DELETE FROM AT1328 WHERE VoucherID = @DelVoucherID
					FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelVoucherID, @DelPromoteID, @DelInventoryID, @DelIsCommon
				END
				CLOSE @Cur
				SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @AT1328temp where Params is not null'
			EXEC (@sSQL)
	END
	ELSE IF @Mode = 0 --Kiểm tra trước khi thêm
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Params Varchar(100),
						@DelDivisionID Varchar(50), 
						@DelPromoteID VARCHAR(50),
						@DelIsCommon tinyint
				Declare @AT1329temp table (
								Status tinyint,
								MessageID varchar(100),
								Params varchar(4000))
				SELECT @DelDivisionID = DivisionID, @DelPromoteID = PromoteID, @DelIsCommon = Isnull(IsCommon, 0)
				FROM AT1329 WITH (NOLOCK) WHERE PromoteID = '''+@PromoteID+'''			
				IF (@DelDivisionID !='''+ @DivisionID+''' and @DelIsCommon != 1) --Kiểm tra khac DivisionID và không dùng chung
							Begin
								SET @Message = ''00ML000050'' 
								SET	@Status = 2
								SET @Params = @DelInventoryID
							End 
				INSERT INTO @AT1329temp (	Status, MessageID, Params) SELECT @Status as Status, @Message as MessageID, @Params as Params 			
				SELECT Status, MessageID,Params From  @AT1328temp where Params is not null'
			EXEC (@sSQL)
	END
	
END