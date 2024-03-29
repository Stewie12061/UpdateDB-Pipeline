IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP1021]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP1021]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Kiểm tra Sửa/Xóa Danh mục giờ học
---- Xóa danh mục giờ học
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Nguyễn Thanh Sơn, Date: 10/02/2014
-- <Example>
---- 
/*
	EXEC MTP1021 @DivisionID = 'EIS', @UserID = '', @SchoolTimeIDList = 'T2_CC'',''T2_CS', @Mode = 1
	EXEC MTP1021 @DivisionID = 'EIS', @UserID = '', @SchoolTimeID = 'K00001', @Mode = 0
*/

CREATE PROCEDURE MTP1021
( 
  @DivisionID VARCHAR(50),
  @UserID VARCHAR (50),
  @SchoolTimeID VARCHAR(50) = NULL,
  @SchoolTimeIDList NVARCHAR(MAX) = NULL,
  @Mode TINYINT --0: Edit, 1: Delete
) 
AS 
DECLARE @sSQL NVARCHAR(MAX),
		@sSQL1 NVARCHAR(MAX)

IF @Mode = 1 SET @sSQL = '
DECLARE @Cur CURSOR,
		@Params1 NVARCHAR(MAX),
		@Params2 NVARCHAR(MAX),
		@DelSchoolTimeID VARCHAR(50)
SET @Params1 = ''''
SET @Params2 = ''''
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT SchoolTimeID FROM MTT1020 WHERE SchoolTimeID IN ('''+@SchoolTimeIDList+''')
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DelSchoolTimeID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF ('''+@DivisionID+''' <> (SELECT TOP 1 DivisionID FROM MTT1020 WHERE SchoolTimeID = @DelSchoolTimeID))   --kiểm tra khác DivisionID
	SET @Params1 = @Params1 + @DelSchoolTimeID + '', ''
	ELSE
	BEGIN		
		IF EXISTS (SELECT TOP 1 1 FROM MTT1040 WHERE SchoolTimeID = @DelSchoolTimeID)			
		SET @Params2 = @Params2 + @DelSchoolTimeID + '', ''			
		ELSE 
			BEGIN
				DELETE FROM MTT1020 WHERE SchoolTimeID = @DelSchoolTimeID	
				DELETE FROM MTT1021 WHERE SchoolTimeID = @DelSchoolTimeID	
			END	
	END	
	FETCH NEXT FROM @Cur INTO @DelSchoolTimeID
END 
IF @Params1 <> '''' SET @Params1 = LEFT(@Params1, LEN(@Params1)- 1)
IF @Params2 <> '''' SET @Params2 = LEFT(@Params2, LEN(@Params2)- 1)

SELECT * FROM
(
SELECT 1 AS Status,''00ML000050'' AS MessageID, @Params1 AS Params             
UNION ALL 
SELECT 1 AS Status,''00ML000052'' AS MessageID, @Params2 AS Params
)A WHERE A.Params <> '''' '

IF @Mode = 0 SET @sSQL = '
DECLARE @Params NVARCHAR(MAX),
		@MessageID VARCHAR(50)
SET @Params = ''''

IF ('''+@DivisionID+''' <> (SELECT TOP 1 DivisionID FROM MTT1020 WHERE SchoolTimeID = '''+@SchoolTimeID+'''))
	BEGIN
		SET @Params = '''+@SchoolTimeID+'''
		SET @MessageID = ''00ML000050''
	END
--ELSE	
--	BEGIN
--		IF EXISTS (SELECT TOP 1 1 FROM MTT1040 WHERE SchoolTimeID = '''+@SchoolTimeID+''')			
--		SET @Params = '''+@SchoolTimeID+'''
--		SET @MessageID = ''00ML000052''		
--	END	
IF @Params <> '''' SET @Params = LEFT(@Params, LEN(@Params)- 1)
SELECT 1 AS Status, @MessageID AS MessageID, @Params AS Params
WHERE @Params <> ''''   '

EXEC (@sSQL)
--PRINT (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

