IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0036]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP0036]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
--- Sử dụng để Xóa và thông báo lỗi -- POSF0034 - DANH MỤC KHU VỰC
-- <Param>
---- 
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Lê Thị Hạnh on 15/07/2014 
----Modify by: Lê Thị Hạnh on 07/08/2014 -- Bổ sung trường hợp hiện
-- <Example>
/*
POSP0036  @DivisionID = 'KC', @ShopID ='BIGC', @AreaIDList = 'KV01'',''KV02', @FormID = 'POSF0034', @MOde = 2, @UserID = ''
*/



CREATE PROCEDURE POSP0036 
(
	@DivisionID VARCHAR(50), ---Nếu @DivisionID không phải là DivisionID hiện tại thì không cho xóa
	@ShopID VARCHAR(50), -- Nếu @ShopID không phải là ShopID hiện tại thì không cho xóa
	@AreaIDList nVARCHAR(MAX), -- DANH SÁCH KHU VỰC CẦN XÓA
	@FormID VARCHAR(50), -- form POST0034 DANH MỤC KHU VỰC
	@Mode TINYINT, -- 1: Sửa Ẩn -- 2: Xóa -- 3: Sửa hiện
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
			@DelAreaID varchar(50),
			@TranMonth int = null,
			@TranYear int = null,
			@APK uniqueidentifier=NULL
		Declare @POST0031temp table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
	SET @Status = 0
	SET @Message = ''''
	Insert into @POST0031temp (	Status, MessageID, Params) 
								Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''00ML000052'' as MessageID, Null as Params	
	SET @Cur = CURSOR SCROLL KEYSET FOR
	SELECT DivisionID, ShopID,AreaID FROM POST0031 With (NOLOCK) WHERE  AreaID IN ('''+@AreaIDList+''')

	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelShopID,@DelAreaID
	WHILE @@FETCH_STATUS = 0
	BEGIN
			Exec POSP9000   @DelDivisionID, @DelShopID, @TranMonth, @TranYear,  @DelAreaID, @APK , '''+@FormID+''', @Status OUTPUT 
			IF @DelDivisionID != '''+@DivisionID+'''
									Begin
										update @POST0031temp set Params = ISNULL(Params,'''') + @DelShopID + @DelAreaID+'','' where MessageID = ''P00ML000050''
									End
			IF @DelShopID != '''+@ShopID+'''
									BEGIN
										update @POST0031temp set Params = ISNULL(Params,'''') + @DelShopID + @DelAreaID+'','' where MessageID = ''00ML000050''
									END
			IF (Select @Status) = 1
				BEGIN
					IF '+STR(@Mode)+' = 1
					update @POST0031temp set Params = ISNULL(Params,'''') + @DelShopID+ @DelAreaID+'',''  where MessageID = ''00ML000052''
					IF '+STR(@Mode)+' = 2
					update @POST0031temp set Params = ISNULL(Params,'''') + @DelShopID+ @DelAreaID+'',''  where MessageID = ''00ML000052''
					IF '+STR(@Mode)+' = 3
					UPDATE POST0031 SET [Disabled] = 0, LastModifyUserID = '''+@UserID+''', LastModifyDate = GETDATE()
					WHERE DivisionID = @DelDivisionID AND ShopID = @DelShopID and AreaID = @DelAreaID
				END
				
			
			IF (Select @Status) = 0 and @DelDivisionID = '''+@DivisionID+''' and @DelShopID = '''+@ShopID+'''
				BEGIN
					IF '+STR(@Mode)+' = 1
					UPDATE POST0031 SET [Disabled] = 1, LastModifyUserID = '''+@UserID+''', LastModifyDate = GETDATE()
					WHERE DivisionID = @DelDivisionID AND ShopID = @DelShopID and AreaID = @DelAreaID
					IF '+STR(@Mode)+' = 2
					DELETE FROM POST0031 WHERE DivisionID = @DelDivisionID AND ShopID = @DelShopID and AreaID = @DelAreaID
					IF '+STR(@Mode)+' = 3
					UPDATE POST0031 SET [Disabled] = 0, LastModifyUserID = '''+@UserID+''', LastModifyDate = GETDATE()
					WHERE DivisionID = @DelDivisionID AND ShopID = @DelShopID and AreaID = @DelAreaID				
				End
		FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelShopID,@DelAreaID		
	END
	CLOSE @Cur
	SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @POST0031temp where Params is not null'
EXEC (@sSQL)
--PRINT (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
