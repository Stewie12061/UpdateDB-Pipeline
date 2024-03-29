IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0041]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP0041]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Thực hiện kiểm tra Xóa/Hiện/Ẩn Danh mục thời điểm
---- Xóa/Ẩn/Hiện danh mục Thời điểm
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Lê Thị Hạnh on 22/07/2014
--- Modify Thị Phượng on 09/06/2016 bổ sung With (NOLOCK)
-- <Example>
---- 
/*
  POSP0041 @DivisionID = 'KC', @ShopID = 'COOPLTK', @TimeIDList = 'COOP0001'',''COOP0005',
	 @FormID = 'POSF0060', @Mode = 1, @UserID = ''
*/

CREATE PROCEDURE POSP0041 
(
	 @DivisionID VARCHAR(50), 
	 @ShopID VARCHAR(50),
	 @TimeIDList NVARCHAR(MAX), -- danh sách thời điểm 
	 @FormID VARCHAR(50), -- POSF0060 - Danh mục thời điểm
	 @Mode TINYINT, -- 1: Ẩn, 2: Hiện, 3: Xóa
	 @UserID VARCHAR(50)
)
AS 
DECLARE @sSQL NVARCHAR(MAX)
SET @sSQL = ' 
	DECLARE @Status TINYINT,
			@Message NVARCHAR(1000),
			@Cur CURSOR,
			@DelDivisionID VARCHAR(50),
			@DelShopID VARCHAR(50),
			@DelTimeID varchar(50),
			@TranMonth int = null,
			@TranYear int = null,
			@APK uniqueidentifier = NULL
		Declare @POST0036temp table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
	SET @Status = 0
	SET @Message = ''''
	Insert into @POST0036temp (	Status, MessageID, Params) 
								Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''00ML000052'' as MessageID, Null as Params	
	SET @Cur = CURSOR SCROLL KEYSET FOR
	SELECT DivisionID, ShopID,TimeID FROM POST0036 With (NOLOCK) WHERE TimeID IN ('''+@TimeIDList+''')

	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelShopID,@DelTimeID
	WHILE @@FETCH_STATUS = 0
	BEGIN
			Exec POSP9000   @DelDivisionID, @DelShopID, @TranMonth, @TranYear,  @DelTimeID, @APK , '''+@FormID+''', @Status OUTPUT 
			IF @DelDivisionID != '''+@DivisionID+'''
									Begin
										UPDATE @POST0036temp set Params = ISNULL(Params,'''') + @DelShopID + @DelTimeID+'','' where MessageID = ''00ML000050''
									End
			IF @DelShopID != '''+@ShopID+'''
									BEGIN
										UPDATE @POST0036temp set Params = ISNULL(Params,'''') + @DelShopID + @DelTimeID+'','' where MessageID = ''00ML000050''
									END
			IF (Select @Status) = 1
				BEGIN
					IF '+STR(@Mode)+' = 1
					UPDATE @POST0036temp set Params = ISNULL(Params,'''') + @DelShopID+ @DelTimeID+'',''  where MessageID = ''00ML000052''
					IF '+STR(@Mode)+' = 2
						BEGIN
							UPDATE POST0036 SET [Disabled] = 0,
												 LastModifyUserID = '''+@UserID+''',
												 LastModifyDate = GETDATE()
							WHERE DivisionID = @DelDivisionID AND ShopID = @DelShopID and TimeID = @DelTimeID
						END	
					IF '+STR(@Mode)+' = 3
						UPDATE @POST0036temp set Params = ISNULL(Params,'''') + @DelShopID+ @DelTimeID+'',''  where MessageID = ''00ML000052''
				END
				
			IF (Select @Status) = 0 and @DelDivisionID = '''+@DivisionID+''' and @DelShopID = '''+@ShopID+'''
				BEGIN
					IF '+STR(@Mode)+' = 1
						BEGIN
							UPDATE POST0036 SET [Disabled] = 1, 
							LastModifyUserID = '''+@UserID+''', 
							LastModifyDate = GETDATE()
							WHERE DivisionID = @DelDivisionID AND ShopID = @DelShopID and TimeID = @DelTimeID
						END
					IF '+STR(@Mode)+' = 2
						BEGIN
							UPDATE POST0036 SET [Disabled] = 0,
												 LastModifyUserID = '''+@UserID+''',
												 LastModifyDate = GETDATE()
							WHERE DivisionID = @DelDivisionID AND ShopID = @DelShopID and TimeID = @DelTimeID
						END	
					IF '+STR(@Mode)+' = 3
					BEGIN
						DELETE FROM POST0036 
						WHERE DivisionID = @DelDivisionID AND ShopID = @DelShopID and TimeID = @DelTimeID	
					END
				END
		FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelShopID, @DelTimeID		
	END
	CLOSE @Cur
	SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @POST0036temp where Params is not null'

EXEC (@sSQL)
--PRINT (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
