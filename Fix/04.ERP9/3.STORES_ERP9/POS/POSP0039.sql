IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0039]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP0039]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
--- Sử dụng để Xóa/Ẩn/Hiện và thông báo lỗi -- POSF0052 - DANH MỤC BÀN
-- <Param>
---- 
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Lê Thị Hạnh on 18/07/2014 
----Modify by: Lê Thị Hạnh on 07/08/2014 -- Bổ sung trường hợp hiện
-- <Example>
/* -- 1: ẨN 2: XÓA
POSP0039  @DivisionID = 'KC', @ShopID ='BIGC', @TableIDList = 'B01'',''B02'',''B03', @FormID = 'POSF0052', @MOde = 1, @UserID = ''
POSP0039  @DivisionID = 'KC', @ShopID ='BIGC', @TableIDList = 'B01'',''B04', @FormID = 'POSF0052', @MOde = 2, @UserID = ''
*/

CREATE PROCEDURE POSP0039 
(
	@DivisionID VARCHAR(50), ---Nếu @DivisionID không phải là DivisionID hiện tại thì không cho xóa
	@ShopID VARCHAR(50), -- Nếu @ShopID không phải là ShopID hiện tại thì không cho xóa
	@TableIDList NVARCHAR(MAX), -- DANH SÁCH bàn CẦN XÓA/ẩn/hiện
	@FormID VARCHAR(50), -- form POST0052 DANH MỤC BÀN
	@Mode TINYINT, -- 1: Sửa Ẩn -- 2: Xóa --3: Sửa hiện
	@UserID VARCHAR(50)
)
AS 
DECLARE @sSQL NVARCHAR(MAX)
SET @sSQL = '
	DECLARE @Status TINYINT,
			@Message NVARCHAR(1000),
			@Cur CURSOR,
			@ShopID VARCHAR(50) = null,
			@DelDivisionID VARCHAR(50),
			@DelShopID VARCHAR(50),
			@DelTableID varchar(50),
			@TranMonth int = null,
			@TranYear int = null,
			@APK uniqueidentifier=NULL
		Declare @POST0032temp table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
	SET @Status = 0
	SET @Message = ''''
	Insert into @POST0032temp (	Status, MessageID, Params) 
								Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''00ML000052'' as MessageID, Null as Params	
	SET @Cur = CURSOR SCROLL KEYSET FOR
	SELECT DivisionID, ShopID,TableID FROM POST0032 WHERE TableID IN ('''+@TableIDList+''')

	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelShopID,@DelTableID
	WHILE @@FETCH_STATUS = 0
	BEGIN
			Exec POSP9000   @DelDivisionID, @DelShopID, @TranMonth, @TranYear,  @DelTableID, @APK , '''+@FormID+''', @Status OUTPUT 
			IF @DelDivisionID != '''+@DivisionID+'''
									Begin
										update @POST0032temp set Params = ISNULL(Params,'''') + @DelShopID + @DelTableID+'','' where MessageID = ''00ML000050''
									End
			IF @DelShopID != '''+@ShopID+'''
									BEGIN
										update @POST0032temp set Params = ISNULL(Params,'''') + @DelShopID + @DelTableID+'','' where MessageID = ''POSM000052''
									END
			IF (Select @Status) = 1
				BEGIN
					IF '+STR(@Mode)+' = 1 -- Ẩn
					update @POST0032temp set Params = ISNULL(Params,'''') + @DelShopID+ @DelTableID+'',''  where MessageID = ''00ML000052''
					IF '+STR(@Mode)+' = 2 -- Xóa
					update @POST0032temp set Params = ISNULL(Params,'''') + @DelShopID+ @DelTableID+'',''  where MessageID = ''00ML000052''
				    IF '+STR(@Mode)+' = 3 -- Hiện
					UPDATE POST0032 SET [Disabled] = 0, LastModifyUserID = '''+@UserID+''', LastModifyDate = GETDATE()
				END
				
			IF (Select @Status) = 0 and @DelDivisionID = '''+@DivisionID+''' and @DelShopID = '''+@ShopID+'''
				BEGIN
					IF '+STR(@Mode)+' = 1 -- Ẩn
					UPDATE POST0032 SET [Disabled] = 1, LastModifyUserID = '''+@UserID+''', LastModifyDate = GETDATE()
					WHERE DivisionID = @DelDivisionID AND ShopID = @DelShopID and TableID = @DelTableID
					IF '+STR(@Mode)+' = 2 -- Xóa
					DELETE FROM POST0032 WHERE DivisionID = @DelDivisionID AND ShopID = @DelShopID and TableID = @DelTableID
					IF '+STR(@Mode)+' = 3 -- Hiện
					UPDATE POST0032 SET [Disabled] = 0, LastModifyUserID = '''+@UserID+''', LastModifyDate = GETDATE()				
				End
		FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelShopID,@DelTableID		
	END
	CLOSE @Cur
	SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @POST0032temp where Params is not null'
EXEC (@sSQL)
--PRINT (@sSQL)
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
