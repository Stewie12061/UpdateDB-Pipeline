IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0034]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP0034]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- <Summary>
---- 
---- Xóa/ sửa loại thẻ, dựa vào Store POSP9000
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 08/07/2014
--- Modify Thị Phượng on 09/06/2016 bổ sung With (NOLOCK)
-- <Example>
/*

	EXEC POSP0034 'AS', '123',1, '','POSF0043'

*/
CREATE PROCEDURE POSP0034
( 
		  @DivisionID varchar(50),--Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
		  @TypeNoList NVARCHAR(MAX), 
		  @Mode tinyint, -- 3: Ẩn, 2: Hiện, 1: Xóa
		  @UserID VARCHAR(50),
		  @FormID nvarchar(50) --  "POSF0043"
) 
AS 
DECLARE @sSQL NVARCHAR(MAX)
SET @sSQL = ' 
	DECLARE @Status TINYINT,
			@Message NVARCHAR(1000),
			@Cur CURSOR,
			@DelDivisionID VARCHAR(50),
			@ShopID VARCHAR(50) = null,
			@DelTypeNo varchar(50),
			@TranMonth int = null,
			@TranYear int = null,
			@APK uniqueidentifier = NULL,
			@DelIsCommon int
		Declare @POST0021temp table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
	SET @Status = 0
	SET @Message = ''''
	Insert into @POST0021temp (	Status, MessageID, Params) 
								Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''00ML000052'' as MessageID, Null as Params	
	SET @Cur = CURSOR SCROLL KEYSET FOR
	SELECT DivisionID, TypeNo, IsCommon FROM POST0021 With (NOLOCK) WHERE TypeNo IN ('''+@TypeNoList+''')

	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @DelDivisionID,@DelTypeNo, @DelIsCommon
	WHILE @@FETCH_STATUS = 0
	BEGIN
			Exec POSP9000   @DelDivisionID, @ShopID, @TranMonth, @TranYear,  @DelTypeNo, @APK , '''+@FormID+''', @Status OUTPUT 
			IF @DelDivisionID != '''+@DivisionID+''' and @DelIsCommon !=1
									Begin
										UPDATE @POST0021temp set Params = ISNULL(Params,'''') + @DelTypeNo+'','' where MessageID = ''00ML000050''
									End

			IF (Select @Status) = 1
				BEGIN
					IF '+STR(@Mode)+' =3
					UPDATE @POST0021temp set Params = ISNULL(Params,'''') + @DelTypeNo+'',''  where MessageID = ''00ML000052''
					IF '+STR(@Mode)+' = 2
						BEGIN
							UPDATE POST0021 SET [Disabled] = 0,
												 LastModifyUserID = '''+@UserID+''',
												 LastModifyDate = GETDATE()
							WHERE  TypeNo = @DelTypeNo
						END	
					IF '+STR(@Mode)+' = 1
						UPDATE @POST0021temp set Params = ISNULL(Params,'''') +  @DelTypeNo+'',''  where MessageID = ''00ML000052''
				END
				
			IF (Select @Status) = 0 
				BEGIN
					IF '+STR(@Mode)+' = 3
						BEGIN
							UPDATE POST0021 SET [Disabled] = 1, 
							LastModifyUserID = '''+@UserID+''', 
							LastModifyDate = GETDATE()
							WHERE  TypeNo = @DelTypeNo
						END
					IF '+STR(@Mode)+' = 2
						BEGIN
							UPDATE POST0021 SET [Disabled] = 0,
												 LastModifyUserID = '''+@UserID+''',
												 LastModifyDate = GETDATE()
							WHERE  TypeNo = @DelTypeNo
						END	
					IF '+STR(@Mode)+' = 1
					BEGIN
						DELETE FROM POST0021 
						WHERE TypeNo = @DelTypeNo	
					END
				END
		FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelTypeNo, @DelIsCommon		
	END
	CLOSE @Cur
	SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @POST0021temp where Params is not null'
EXEC (@sSQL)
--PRINT (@sSQL)


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
