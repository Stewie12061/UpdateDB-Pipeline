IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP1041]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP1041]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- <Summary>
---- Kiểm tra Sửa/Xóa Danh mục Lớp học
---- Xóa danh mục Lớp học
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Nguyễn Thanh Sơn, Date: 07/112013
-- <Example>
---- 
/*
   EXEC MTP1041 @DivisionID = 'EIS', @UserID = '', @ClassIDList = 'A01001'',''A01002', @Mode = 1
   EXEC MTP1041 @DivisionID = 'EIS', @UserID = '', @ClassID = 'K00001', @Mode = 0
*/

CREATE PROCEDURE MTP1041
( 
  @DivisionID VARCHAR(50),
  @UserID VARCHAR (50),
  @ClassID VARCHAR(50) = NULL,
  @ClassIDList NVARCHAR(MAX) = NULL,
  @Mode TINYINT --0: Edit, 1: Delete
) 
AS 
DECLARE @sSQL NVARCHAR(MAX),
		@sSQL1 NVARCHAR(MAX)

IF @Mode = 1 SET @sSQL = '
DECLARE @Cur CURSOR,
		@Params1 NVARCHAR(MAX),
		@Params2 NVARCHAR(MAX),
		@DelClassID VARCHAR(50)
SET @Params1 = ''''
SET @Params2 = ''''
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT ClassID FROM MTT1040 WHERE ClassID IN ('''+@ClassIDList+''')
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DelClassID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF ('''+@DivisionID+''' <> (SELECT TOP 1 DivisionID FROM MTT1040 WHERE ClassID = @DelClassID))   --kiểm tra khác DivisionID
	SET @Params1 = @Params1 + @DelClassID + '', ''
	ELSE
	BEGIN		
		IF EXISTS (SELECT TOP 1 1 FROM MTT2010 WHERE ClassID = @DelClassID)			
		SET @Params2 = @Params2 + @DelClassID + '', ''			
		ELSE 
			BEGIN
				DELETE FROM MTT1040 WHERE ClassID = @DelClassID	
				DELETE FROM MTT1041 WHERE ClassID = @DelClassID	
			END	
	END	
	FETCH NEXT FROM @Cur INTO @DelClassID
END 
IF @Params1 <> '''' SET @Params1 = LEFT(@Params1, LEN(@Params1)- 1)
IF @Params2 <> '''' SET @Params2 = LEFT(@Params2, LEN(@Params2)- 1)

SELECT * FROM
(
SELECT 2 AS Status,''00ML000050'' AS MessageID, @Params1 AS Params             
UNION ALL 
SELECT 2 AS Status,''00ML000052'' AS MessageID, @Params2 AS Params
)A WHERE A.Params <> '''' '

IF @Mode = 0 SET @sSQL = '
DECLARE @Params NVARCHAR(MAX),
		@MessageID VARCHAR(50)
SET @Params = ''''

IF ('''+@DivisionID+''' <> (SELECT TOP 1 DivisionID FROM MTT1040 WHERE ClassID = '''+@ClassID+'''))
	BEGIN
		SET @Params = '''+@ClassID+'''
		SET @MessageID = ''00ML000050''
	END
--ELSE	
--	BEGIN
--		IF EXISTS (SELECT TOP 1 1 FROM MTT1040 WHERE @ClassID = '''+@ClassID+''')			
--		SET @Params = '''+@ClassID+'''
--		SET @MessageID = ''00ML000052''		
--	END	
IF @Params <> '''' SET @Params = LEFT(@Params, LEN(@Params)- 1)
SELECT 2 AS Status, @MessageID AS MessageID, @Params AS Params
WHERE @Params <> ''''   '

EXEC (@sSQL)
--PRINT (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

