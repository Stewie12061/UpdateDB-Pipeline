IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP1071]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[CIP1071]
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
----Modifile by Thị Phượng Date 09/08/2016, chỉnh sửa điều kiện khi xóa
----Modify by: Thị Phượng on 19/07/2017: Chỉnh sửa chuẩn convert từ ERP lên
-- <Example>
---- 
/*
	EXEC CIP1071 @DivisionID = 'AS', @UserID = '',  @DistrictIDList = '10303'',''10304' , @Mode = 1
	EXEC CIP1071 @DivisionID = 'XR', @UserID = '',  @DistrictID = '10101', @Mode = 0
*/

CREATE PROCEDURE CIP1071
( 
  @DivisionID VARCHAR(50),
  @UserID VARCHAR(50),
  @DistrictID VARCHAR(50) = NULL,
  @DistrictIDList VARCHAR(max) = NULL,
  @Mode TINYINT --0: Edit, 1: Delete
) 
AS 
DECLARE @sSQL NVARCHAR(MAX)
Declare @CustomerName INT
CREATE Table #CustomerName (CustomerName INT, ImportExcel int)
		INSERT #CustomerName EXEC AP4444
		SET @CustomerName = (SELECT TOP 1 CustomerName FROM #CustomerName)
IF @CustomerName = 34 
Begin 
IF @Mode = 1
	SET @sSQL = '
	DECLARE @Cur CURSOR,
			@Params1 NVARCHAR(MAX),
			@Params2 NVARCHAR(MAX),
			@DelDivisionID VARCHAR(50),
			@DelDistrictID VARCHAR(50)
	SET @Params1 = ''''
	SET @Params2 = ''''
	SET @Cur = CURSOR SCROLL KEYSET FOR
	SELECT DivisionID, DistrictID FROM AT1013 WHERE DistrictID IN ('''+@DistrictIDList+''')
	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelDistrictID
	WHILE @@FETCH_STATUS = 0
	BEGIN
		IF (@DelDivisionID <> '''+@DivisionID+''')   --kiểm tra khác DivisionID
			SET @Params1 = @Params1 + @DelDistrictID + '', ''
		ELSE
			BEGIN		
				IF EXISTS (SELECT TOP 1 1 FROM DRT2011 WHERE District = @DelDistrictID) -- kiểm tra đã được sử dụng	
					SET @Params2 = @Params2 + @DelDistrictID + '', ''			
				ELSE
					BEGIN
						DELETE AT1013 WHERE DistrictID = @DelDistrictID
					END
			END	
		FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelDistrictID
	END 
	IF @Params1 <> '''' SET @Params1 = LEFT(@Params1, LEN(@Params1)- 1)
	IF @Params2 <> '''' SET @Params2 = LEFT(@Params2, LEN(@Params2)- 1)

	SELECT * FROM
	(
	SELECT 2 AS Status,''00ML000050'' AS MessageID, @Params1 AS Params             
	UNION ALL 
	SELECT 2 AS Status,''00ML000082'' AS MessageID, @Params2 AS Params
	)A WHERE A.Params <> '''' '

IF @Mode = 0 
	SET @sSQL = '
	DECLARE @Params NVARCHAR(MAX),
			@MessageID VARCHAR(50)
	SET @Params = ''''

	IF ('''+@DivisionID+''' <> (SELECT TOP 1 DivisionID FROM AT1013 WHERE DistrictID = '''+@DistrictID+''')) -- kiểm tra khác Division
		BEGIN
			SET @Params = '''+@DistrictID+'''
			SET @MessageID = ''00ML000050''
		END
	IF @Params <> '''' SET @Params = LEFT(@Params, LEN(@Params)- 1)
	SELECT 2 AS Status, @MessageID AS MessageID, @Params AS Params
	WHERE @Params <> ''''   '

END
Else
Begin
IF @Mode = 1 
SET @sSQL = '
DECLARE @Status TINYINT,
			@Message NVARCHAR(1000),
			@Cur CURSOR,
			@DelDivisionID VARCHAR(50),
			@DelDistrictID VARCHAR(50),
			@DelIsCommon tinyint
		Declare @AT1013temp table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
	SET @Status = 0
	SET @Message = ''''
	Insert into @AT1013temp (	Status, MessageID, Params) 
								Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''00ML000052'' as MessageID, Null as Params	
	SET @Cur = CURSOR SCROLL KEYSET FOR
	SELECT DivisionID, DistrictID, IsCommon FROM AT1013 With (NOLOCK) WHERE DistrictID IN ('''+@DistrictIDList+''')

	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelDistrictID, @DelIsCommon
	WHILE @@FETCH_STATUS = 0
	BEGIN
			EXEC CIP90000 @DelDivisionID, NULL, ''AT1013'',@DelDistrictID, @Status OUTPUT
			IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon != 1)
									Begin
										UPDATE @AT1013temp set Params = ISNULL(Params,'''')  + @DelDistrictID+'','' where MessageID = ''00ML000050''
									End
			IF (Select @Status) = 1
				BEGIN
					UPDATE @AT1013temp set Params = ISNULL(Params,'''') + @DelDistrictID+'',''  where MessageID = ''00ML000052''
				END
			IF (Select @Status) = 0 
				BEGIN
					DELETE FROM AT1013
					WHERE DistrictID = @DelDistrictID	
				END
		FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelDistrictID, @DelIsCommon	
	END
	CLOSE @Cur
	SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @AT1013temp where Params is not null'

IF @Mode = 0 
SET @sSQL = '
DECLARE @Params NVARCHAR(MAX),
		@MessageID VARCHAR(50)
SET @Params = ''''

IF ('''+@DivisionID+''' <> (SELECT TOP 1 DivisionID FROM AT1013 WHERE DistrictID = '''+@DistrictIDList+''')) -- kiểm tra khác Division
	BEGIN
		SET @Params = '''+@DistrictIDList+'''
		SET @MessageID = ''00ML000050''
	END
IF @Params <> '''' SET @Params = LEFT(@Params, LEN(@Params)- 1)
SELECT 2 AS Status, @MessageID AS MessageID, @Params AS Params
WHERE @Params <> ''''   '
end
EXEC (@sSQL)
--PRINT @sSQL
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
