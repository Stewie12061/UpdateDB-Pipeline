IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS 
			WHERE ID = OBJECT_ID(N'[DBO].[POSP00101]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP00101]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- 
---- Xóa Cửa hàng, dựa vào Store POSP9000
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 27/03/2014
----Modify by Thị Phương: Bổ sung xóa bảng POST00101 customize Kim YẾN (82)
----Update delete xóa cửa hàng và mã chứng từ của cửa hàng đó.
-- <Example>
/*

	EXEC POSP00101 'KC', 'GS-RS-1-K001'',''LOTTEPT'',''CH03', 'POSF0010'

*/
CREATE PROCEDURE POSP00101
( 
		  @DivisionID varchar(50),--Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
		  @ShopIDList NVARCHAR(MAX),
		  @FormID nvarchar(50) -- From cửa hàng "POSF0010"		  
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
			@TranMonth int = null,
			@TranYear int = null,
			@APK uniqueidentifier=NULL
		Declare @POST0010temp table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
	SET @Status = 0
	SET @Message = ''''
	Insert into @POST0010temp (	Status, MessageID, Params) 
								Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''00ML000052'' as MessageID, Null as Params	
	SET @Cur = CURSOR SCROLL KEYSET FOR
	SELECT DivisionID, ShopID FROM POST0010 WHERE ShopID IN ('''+@ShopIDList+''')

	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelShopID
	WHILE @@FETCH_STATUS = 0
	BEGIN
			Exec POSP9000   @DelDivisionID, @ShopID, @TranMonth, @TranYear,  @DelShopID, @APK , '''+@FormID+''', @Status OUTPUT 
			IF @DelDivisionID != '''+@DivisionID+'''
									Begin
										update @POST0010temp set Params = ISNULL(Params,'''') + @DelShopID +'','' where MessageID = ''00ML000050''
									End
			IF (Select @Status) = 1
				update @POST0010temp set Params = ISNULL(Params,'''') + @DelShopID+'',''  where MessageID = ''00ML000052''
			IF (Select @Status) = 0 and @DelDivisionID = '''+@DivisionID+'''
				Begin
					DELETE FROM POST0010 WHERE DivisionID = @DelDivisionID and ShopID = @DelShopID				
					DELETE FROM POST0002 WHERE DivisionID = @DelDivisionID and ShopID = @DelShopID				
					DELETE FROM POST0003 WHERE DivisionID = @DelDivisionID and ShopID = @DelShopID				
					DELETE FROM POST0026 WHERE DivisionID = @DelDivisionID and ShopID = @DelShopID	
					DELETE FROM POST0004 WHERE DivisionID = @DelDivisionID and ShopID = @DelShopID	
					DELETE FROM POST0030 WHERE DivisionID = @DelDivisionID and ShopID = @DelShopID	
					DELETE FROM POST00101 WHERE DivisionID = @DelDivisionID and ShopID = @DelShopID				
				End
		FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelShopID		
	END
	CLOSE @Cur
	SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @POST0010temp where Params is not null'
EXEC (@sSQL)