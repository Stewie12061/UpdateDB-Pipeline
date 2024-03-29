IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP1061]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[CIP1061]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Kiểm tra Sửa/Xóa Danh mục tỉnh thành phố
---- Xóa danh mục Nhân viên
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Quốc Tuấn, Date: 03/09/2015
----Modify by: Thị Phượng on 09/06/2016: cải tiến store và bổ sung With (NOLOCK)
----Modify by: Thị Phượng on 19/07/2017: Chỉnh sửa chuẩn convert từ ERP lên
-- <Example>
---- 
/*
	EXEC CIP1061 @DivisionID = 'PL', @UserID = '',@TableID='AT1002', @CityID = '02'',''01', @Mode =1
	EXEC CIP1061 @DivisionID = 'AS', @UserID = '', @CityID = '101', @Mode = 0
*/

CREATE PROCEDURE CIP1061
( 
  @DivisionID VARCHAR(50),
  @UserID VARCHAR(50),
  @CityID VARCHAR(MAX) = NULL,
  @CityIDList NVARCHAR(MAX) = NULL,
  @Mode TINYINT -- 1: Ẩn, 2: Hiện, 3: Xóa
) 
AS 
DECLARE @sSQL NVARCHAR(MAX)
Declare @CustomerName INT

CREATE Table #CustomerName (CustomerName INT, ImportExcel int)
		INSERT #CustomerName EXEC AP4444
		SET @CustomerName = (SELECT TOP 1 CustomerName FROM #CustomerName)
IF @CustomerName = 34 
Begin 
IF @Mode = 1 SET @sSQL = '
DECLARE @Cur CURSOR,
		@Params1 NVARCHAR(MAX),
		@Params2 NVARCHAR(MAX),
		@DelDivisionID VARCHAR(50),
		@DelCityID VARCHAR(50)
SET @Params1 = ''''
SET @Params2 = ''''
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT DivisionID, CityID FROM AT1002 WHERE CityID IN ('''+@CityIDList+''')
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelCityID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF (@DelDivisionID <> '''+@DivisionID+''')   --kiểm tra khác DivisionID
		SET @Params1 = @Params1 + @DelCityID + '', ''
	ELSE
		BEGIN		
			IF EXISTS (SELECT TOP 1 1 FROM AT1013 WHERE CityID = @DelCityID) -- kiểm tra đã được sử dụng	
				SET @Params2 = @Params2 + @DelCityID + '', ''
			ELSE IF EXISTS (SELECT TOP 1 1 FROM DRT2011 WHERE City = @DelCityID) -- kiểm tra đã được sử dụng	
				SET @Params2 = @Params2 + @DelCityID + '', ''			
			ELSE
				BEGIN
					DELETE AT1002 WHERE CityID = @DelCityID
				END
		END	
	FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelCityID
END 
IF @Params1 <> '''' SET @Params1 = LEFT(@Params1, LEN(@Params1)- 1)
IF @Params2 <> '''' SET @Params2 = LEFT(@Params2, LEN(@Params2)- 1)

SELECT * FROM
(
SELECT 2 AS Status,''00ML000050'' AS MessageID, @Params1 AS Params             
UNION ALL 
SELECT 2 AS Status,''00ML000082'' AS MessageID, @Params2 AS Params
)A WHERE A.Params <> '''' '

IF @Mode = 0 SET @sSQL = '
DECLARE @Params NVARCHAR(MAX),
		@MessageID VARCHAR(50)
SET @Params = ''''

IF ('''+@DivisionID+''' <> (SELECT TOP 1 DivisionID FROM AT1002 WHERE CityID = '''+@CityID+''')) -- kiểm tra khác Division
	BEGIN
		SET @Params = '''+@CityID+'''
		SET @MessageID = ''00ML000050''
	END
IF @Params <> '''' SET @Params = LEFT(@Params, LEN(@Params)- 1)
SELECT 2 AS Status, @MessageID AS MessageID, @Params AS Params
WHERE @Params <> ''''   '

End
Else 
SET @sSQL = ' 
	DECLARE @Status TINYINT,
			@Message NVARCHAR(1000),
			@Cur CURSOR,
			@DelDivisionID VARCHAR(50),
			@DelCityID VARCHAR(50),
			@DelIsCommon tinyint
		Declare @AT1002temp table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
	SET @Status = 0
	SET @Message = ''''
	Insert into @AT1002temp (	Status, MessageID, Params) 
								Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''00ML000052'' as MessageID, Null as Params	
	SET @Cur = CURSOR SCROLL KEYSET FOR
	SELECT DivisionID, CityID, IsCommon FROM AT1002 With (NOLOCK) WHERE CityID IN ('''+@CityIDList+''')

	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelCityID, @DelIsCommon
	WHILE @@FETCH_STATUS = 0
	BEGIN
			EXEC CIP90000 @DelDivisionID, NULL, ''AT1002'',@DelCityID, @Status OUTPUT
			IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon != 1)
									Begin
										UPDATE @AT1002temp set Params = ISNULL(Params,'''')  + @DelCityID+'','' where MessageID = ''00ML000050''
									End
		
			IF (Select @Status) = 1
				BEGIN
					IF '+STR(@Mode)+' = 1
					UPDATE @AT1002temp set Params = ISNULL(Params,'''') +  @DelCityID+'',''  where MessageID = ''00ML000052''
					IF '+STR(@Mode)+' = 2
						BEGIN
							UPDATE AT1002 SET [Disabled] = 0,
												 LastModifyUserID = '''+@UserID+''',
												 LastModifyDate = GETDATE()
							WHERE CityID = @DelCityID
						END	
					IF '+STR(@Mode)+' = 3
						UPDATE @AT1002temp set Params = ISNULL(Params,'''') + @DelCityID+'',''  where MessageID = ''00ML000052''
				END
				
			IF (Select @Status) = 0 
				BEGIN
					IF '+STR(@Mode)+' = 1
						BEGIN
							UPDATE AT1002 SET [Disabled] = 1, 
							LastModifyUserID = '''+@UserID+''', 
							LastModifyDate = GETDATE()
							WHERE  CityID = @DelCityID
						END
					IF '+STR(@Mode)+' = 2
						BEGIN
							UPDATE AT1002 SET [Disabled] = 0,
												 LastModifyUserID = '''+@UserID+''',
												 LastModifyDate = GETDATE()
							WHERE  CityID = @DelCityID
						END	
					IF '+STR(@Mode)+' = 3
					BEGIN
						DELETE FROM AT1002 
						WHERE CityID = @DelCityID	
					END
				END
		FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelCityID, @DelIsCommon	
	END
	CLOSE @Cur
	SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @AT1002temp where Params is not null'

EXEC (@sSQL)
--PRINT @sSQL
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
