IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP1031]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP1031]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Kiểm tra Sửa/Xóa Danh mục Khóa học
---- Xóa danh mục khóa học
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
	EXEC MTP1031 @DivisionID = 'EIS', @UserID = '', @StopReasonIDList = 'R01'',''R02'',''R03', @Mode = 1
	EXEC MTP1031 @DivisionID = 'EIS', @UserID = '', @StopReasonID = 'K00001', @Mode = 0
*/

CREATE PROCEDURE MTP1031
( 
  @DivisionID VARCHAR(50),
  @UserID VARCHAR (50),
  @StopReasonID VARCHAR(50) = NULL,
  @StopReasonIDList NVARCHAR(MAX) = NULL,
  @Mode TINYINT --0: Edit, 1: Delete
) 

AS 
DECLARE @sSQL NVARCHAR(MAX),
		@sSQL1 NVARCHAR(MAX)

IF @Mode = 1 SET @sSQL = '
DECLARE @Cur CURSOR,
		@Params1 NVARCHAR(MAX),
		@Params2 NVARCHAR(MAX),
		@DelStopReasonID VARCHAR(50)
SET @Params1 = ''''
SET @Params2 = ''''
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT StopReasonID FROM MTT1030 WHERE StopReasonID IN ('''+@StopReasonIDList+''')
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DelStopReasonID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF ('''+@DivisionID+''' <> (SELECT TOP 1 DivisionID FROM MTT1030 WHERE StopReasonID = @DelStopReasonID))   --kiểm tra khác DivisionID
	SET @Params1 = @Params1 + @DelStopReasonID + '', ''
	ELSE
	BEGIN		
		IF EXISTS (SELECT TOP 1 1 FROM MTT2020 WHERE StopReasonID = @DelStopReasonID)			
		SET @Params2 = @Params2 + @DelStopReasonID + '', ''			
		ELSE DELETE FROM MTT1030 WHERE StopReasonID = @DelStopReasonID		
	END	
	FETCH NEXT FROM @Cur INTO @DelStopReasonID
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

IF ('''+@DivisionID+''' <> (SELECT TOP 1 DivisionID FROM MTT1030 WHERE StopReasonID = '''+@StopReasonID+'''))
	BEGIN
		SET @Params = '''+@StopReasonID+'''
		SET @MessageID = ''00ML000050''
	END
--ELSE	
--	BEGIN
--		IF EXISTS (SELECT TOP 1 1 FROM MTT2020 WHERE StopReasonID = '''+@StopReasonID+''')			
--		SET @Params = '''+@StopReasonID+'''
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

