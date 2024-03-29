IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS 
			WHERE ID = OBJECT_ID(N'[DBO].[POSP00122]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP00122]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- 
---- Xóa hàng hóa tại cửa hàng
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: MaiVu, Date: 12/06/2014
-- <Example>
/*

	EXEC POSP00122 'KC','BIGC','NK105'',''NK105','POSF0012'

*/

CREATE PROCEDURE POSP00122
( 
		  @DivisionID varchar(50),--Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
		  @ShopID varchar(50),
		  @InventoryIDList NVARCHAR(MAX),
		  @FormID nvarchar(50) -- "POSF0012"		  
) 
AS 
	DECLARE @sSQL NVARCHAR(MAX)
SET @sSQL = '
	DECLARE @Status TINYINT,
			@Message NVARCHAR(1000),
			@Cur CURSOR,
			@DelShopID VARCHAR(50),
			@DelDivisionID VARCHAR(50),
			@ID VARCHAR(50),
			@TranMonth int = null,
			@TranYear int = null,
			@APK uniqueidentifier=NULL
		Declare @POST0012temp table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
	SET @Status = 0
	SET @Message = ''''
	Insert into @POST0012temp (	Status, MessageID, Params) 
								Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''POSM000025'' as MessageID, Null as Params	
								union all
								Select 2 as Status, ''00ML000052'' as MessageID, Null as Params	
	SET @Cur = CURSOR SCROLL KEYSET FOR
	SELECT DivisionID, ShopID, InventoryID FROM POST0030 WHERE InventoryID IN ('''+@InventoryIDList+''') AND ShopID = '''+ @ShopID +'''

	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelShopID, @ID
	WHILE @@FETCH_STATUS = 0
	BEGIN
			Exec POSP9000   @DelDivisionID, @DelShopID, @TranMonth, @TranYear,  @ID, @APK , '''+@FormID+''', @Status OUTPUT 
			IF @DelDivisionID != '''+@DivisionID+'''
									Begin
										update @POST0012temp set Params = ISNULL(Params,'''') + @ID +'','' where MessageID = ''00ML000050''
									End
			IF @DelShopID != '''+@ShopID+'''
									Begin
										update @POST0012temp set Params = ISNULL(Params,'''') + @ID +'','' where MessageID = ''POSM000025''
									End
			IF (Select @Status) = 1
									Begin
										update @POST0012temp set Params = ISNULL(Params,'''') + @ID+'',''  where MessageID = ''00ML000052''
									End				
			IF (Select @Status) = 0 and @DelDivisionID = '''+@DivisionID+''' and @DelShopID = '''+@ShopID+'''
				Begin
					DELETE FROM POST0030 WHERE DivisionID = @DelDivisionID and ShopID = @DelShopID	and InventoryID = @ID						
				End
		FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelShopID, @ID		
	END
	CLOSE @Cur
	SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @POST0012temp where Params is not null'
EXEC (@sSQL)