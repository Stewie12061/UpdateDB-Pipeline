IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP11702]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CIP11702]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
-- Kiểm tra trước khi xóa/sửa mặt hàng
-- Nếu mã mặt hàng chưa được sử dụng thì cho phép xóa (Xóa ngầm) ngược lại thì báo message ID đã sử dụng không được phép xóa
-- <Param>
-- <Return>
-- <Reference>
-- <History>
-- Created by: Phan thanh hoàng vũ, Date: 17/05/2016
-- Editted by: Phan thanh hoàng vũ, Date: 16/02/2017: Xóa trong bảng dịnh mức bộ kit và chi tiết bộ định mức kít
-- Editted by: Kiều Nga, Date: 05/08/2020: Điều chỉnh where theo InventoryID sang APK
---Editted by: Kiều Nga, Date: 22/11/2022 : Kiểm tra mặt hàng đã sử dụng cho cấu trúc sản phẩm , định mức sản phẩm
---Editted by: Nhật Quang, Date: 16/03/2023 : HIPC - Cho phép sửa danh mục mặt hàng khi đã được sử dụng.
-- <Example> EXEC CIP11702 'HT', 'HTBT000003', 'HTBT000003', 'AT1302', 2, 1, NULL

CREATE PROCEDURE CIP11702 ( 
	@DivisionID varchar(50),--Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
	@InventoryID varchar(50),
	@InventoryIDList NVARCHAR(MAX),
	@TableID nvarchar(50),	-- "CIF1170"	
	@Mode tinyint,			--0: Sửa, 1: Xóa; 2: Sửa (Disable/Enable)
	@IsDisable  tinyint,	--1: Disable; 0: Enable
	@UserID Varchar(50)) 
AS 
BEGIN
	DECLARE @sSQL NVARCHAR(MAX)
	DECLARE @CustomerName INT = (SELECT TOP 1 CustomerIndex.CustomerName FROM CustomerIndex)
	IF @Mode = 1 --Kiểm tra và xóa
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Cur CURSOR,
						@DelDivisionID VARCHAR(50),
						@DelInventoryID VARCHAR(50),
						@DelIsCommon tinyint
				Declare @AT1302temp table (
						Status tinyint,
						MessageID varchar(100),
						Params varchar(4000))
				SET @Status = 0
				SET @Message = ''''
				Insert into @AT1302temp (	Status, MessageID, Params) 
											Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
											union all
											Select 2 as Status, ''00ML000052'' as MessageID, Null as Params
				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT DivisionID, InventoryID, IsCommon FROM AT1302 WITH (NOLOCK) WHERE APK IN ('''+@InventoryIDList+''')
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelInventoryID, @DelIsCommon
				WHILE @@FETCH_STATUS = 0
				BEGIN
					EXEC CIP90000 @DelDivisionID, NULL, '''+@TableID+''',@DelInventoryID, @Status OUTPUT
					IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1)
							update @AT1302temp set Params = ISNULL(Params,'''') + @DelInventoryID+'','' where MessageID = ''00ML000050''
					ELSE IF (Select @Status) = 1
							update @AT1302temp set Params = ISNULL(Params,'''') + @DelInventoryID+'',''  where MessageID = ''00ML000052''
					ELSE 
						Begin
							DELETE FROM AT1302 WHERE InventoryID = @DelInventoryID	
							DELETE FROM AT1312 WHERE InventoryID = @DelInventoryID
							DELETE FROM AT2008 WHERE InventoryID = @DelInventoryID
							DELETE FROM A00003 WHERE InventoryID = @DelInventoryID
							DELETE FROM AT1314 Where InventoryID = @DelInventoryID
							DELETE FROM AT1323 WHERE InventoryID = @DelInventoryID
							DELETE FROM POST0030 WHERE InventoryID = @DelInventoryID
							DELETE FROM AT1326 WHERE InventoryID = @DelInventoryID
							--DELETE FROM AT1324 WHERE InventoryID = @DelInventoryID
							
						End
					FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelInventoryID, @DelIsCommon
				END
				CLOSE @Cur
				SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @AT1302temp where Params is not null'
			EXEC (@sSQL)
	END
	ELSE IF @Mode = 0 AND @CustomerName <> 158 --Kiểm tra trước khi sửa
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Params Varchar(100),
						@DelDivisionID Varchar(50), 
						@DelInventoryID Varchar(50), 
						@DelIsCommon tinyint
				Declare @AT1302temp table (
								Status tinyint,
								MessageID varchar(100),
								Params varchar(4000))
				SELECT @DelDivisionID = DivisionID, @DelInventoryID = InventoryID, @DelIsCommon = Isnull(IsCommon, 0)
				FROM AT1302 WITH (NOLOCK) WHERE APK = '''+@InventoryIDList+'''			
				IF (@DelDivisionID !='''+ @DivisionID+''' and @DelIsCommon != 1) --Kiểm tra khac DivisionID và không dùng chung
							Begin
								SET @Message = ''00ML000050'' 
								SET	@Status = 2
								SET @Params = @DelInventoryID
							End 
				INSERT INTO @AT1302temp (	Status, MessageID, Params) SELECT @Status as Status, @Message as MessageID, @Params as Params 
				
				-- Bổ sung xử lý kiểm tra trước khi sửa
				SET @Status = 0
				SET @Message = ''''
				Insert into @AT1302temp (	Status, MessageID, Params) 
											Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
											union all
											Select 2 as Status, ''00ML000052'' as MessageID, Null as Params
				EXEC CIP90000 @DelDivisionID, NULL, '''+@TableID+''',@DelInventoryID, @Status OUTPUT
				IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1)
						update @AT1302temp set Params = ISNULL(Params,'''') + @DelInventoryID+'','' where MessageID = ''00ML000050''
				ELSE IF (Select @Status) = 1
						update @AT1302temp set Params = ISNULL(Params,'''') + @DelInventoryID+'',''  where MessageID = ''00ML000052''
						
				SELECT Status, MessageID,LEFT(Params,LEN(Params) - 1) AS Params From  @AT1302temp where Params is not null'
			EXEC (@sSQL)
	END
	ELSE IF @Mode = 2--Kiểm tra trước khi sửa Check Disable/Enable
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Cur CURSOR,
						@DelDivisionID VARCHAR(50),
						@DelInventoryID VARCHAR(50),
						@DelIsCommon tinyint
				Declare @AT1302temp table (
						Status tinyint,
						MessageID varchar(100),
						Params varchar(4000))
				SET @Status = 0
				SET @Message = ''''
				Insert into @AT1302temp (	Status, MessageID, Params) 
				Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
							
				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT DivisionID, InventoryID, IsCommon FROM AT1302 WITH (NOLOCK) WHERE APK IN ('''+@InventoryIDList+''')
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelInventoryID, @DelIsCommon
				WHILE @@FETCH_STATUS = 0
				BEGIN
					IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1)
							update @AT1302temp set Params = ISNULL(Params,'''') + @DelInventoryID+'','' where MessageID = ''00ML000050''
					ELSE 
					Begin
						IF '+ Cast(@IsDisable as varchar(50)) +'=1 --Nếu chọn là Disable
							UPDATE AT1302 SET Disabled = 1 WHERE InventoryID = @DelInventoryID		
						ELSE  --Nếu chọn là Enable
							UPDATE AT1302 SET Disabled = 0 WHERE InventoryID = @DelInventoryID			

					End
					FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelInventoryID, @DelIsCommon
				END
				CLOSE @Cur
				SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @AT1302temp where Params is not null'
			EXEC (@sSQL)
			
	END
END