IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP1031]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CIP1031]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Kiểm tra Sửa/Xóa Danh mục mã phân tích
---- Xóa danh mục mã phân tích
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Nguyễn Đức Quý, Date: 07/11/2014
-- <Example>
---- 
/*
	EXEC CIP1031 @DivisionID = 'XR', @UserID = '', @AnaIDList = 'HP'',''HD' , @Mode = 1
	EXEC CIP1031 @DivisionID = 'XR', @UserID = '', @AnaID = 'HP', @Mode = 0
*/

CREATE PROCEDURE CIP1031
( 
  @DivisionID VARCHAR(50),
  @UserID VARCHAR (50),
  @AnaID VARCHAR(50) = NULL,
  @AnaIDList NVARCHAR(MAX) = NULL,
  @Mode TINYINT --0: Edit, 1: Delete
) 
AS 
DECLARE @sSQL NVARCHAR(MAX),
		@sSQL1 NVARCHAR(MAX)

IF @Mode = 1 SET @sSQL = '
DECLARE @Cur CURSOR,
		@Params1 NVARCHAR(MAX),
		@Params2 NVARCHAR(MAX),
		@DelAnaID VARCHAR(50)
SET @Params1 = ''''
SET @Params2 = ''''
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT AnaID FROM AT1011 WHERE AnaID IN ('''+@AnaIDList+''')
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DelAnaID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF ('''+@DivisionID+''' <> (SELECT TOP 1 DivisionID FROM AT1011 WHERE AnaID = @DelAnaID))   --kiểm tra khác DivisionID
	SET @Params1 = @Params1 + @DelAnaID + '', ''
	ELSE
	BEGIN		
		IF EXISTS (SELECT TOP 1 1 FROM DRT1000 WHERE BranchID = @DelAnaID)			
		SET @Params2 = @Params2 + @DelAnaID + '', ''			
		ELSE DELETE FROM AT1011 WHERE AnaID = @DelAnaID		
	END	
	FETCH NEXT FROM @Cur INTO @DelAnaID
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
--DECLARE @Params NVARCHAR(MAX),
--		@MessageID VARCHAR(50)
--SET @Params = ''''

--IF ('''+@DivisionID+''' <> (SELECT TOP 1 DivisionID FROM AT1011 WHERE AnaID = '''+@AnaID+'''))
--	BEGIN
--		SET @Params = '''+@AnaID+'''
--		SET @MessageID = ''00ML000050''
--	END
--ELSE	
--	BEGIN
--		IF EXISTS (SELECT TOP 1 1 FROM MTT1040 WHERE AnaID = '''+@AnaID+''')			
--		SET @Params = '''+@AnaID+'''
--		SET @MessageID = ''00ML000052''		
--	END	
--IF @Params <> '''' SET @Params = LEFT(@Params, LEN(@Params)- 1)
--SELECT 2 AS Status, @MessageID AS MessageID, @Params AS Params
--WHERE @Params <> ''''   '

EXEC (@sSQL)
PRINT (@sSQL)
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

