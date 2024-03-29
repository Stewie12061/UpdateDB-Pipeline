IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP1001]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP1001]
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
	EXEC MTP1001 @DivisionID = 'EIS', @UserID = '', @CourseIDList = 'HK1_2014'',''HK2_2014' , @Mode = 1
	EXEC MTP1001 @DivisionID = 'EIS', @UserID = '', @CourseID = 'HK1_2014', @Mode = 0
*/

CREATE PROCEDURE MTP1001
( 
  @DivisionID VARCHAR(50),
  @UserID VARCHAR (50),
  @CourseID VARCHAR(50) = NULL,
  @CourseIDList NVARCHAR(MAX) = NULL,
  @Mode TINYINT --0: Edit, 1: Delete
) 
AS 
DECLARE @sSQL NVARCHAR(MAX),
		@sSQL1 NVARCHAR(MAX)

IF @Mode = 1 SET @sSQL = '
DECLARE @Cur CURSOR,
		@Params1 NVARCHAR(MAX),
		@Params2 NVARCHAR(MAX),
		@DelCourseID VARCHAR(50)
SET @Params1 = ''''
SET @Params2 = ''''
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT CourseID FROM MTT1000 WHERE CourseID IN ('''+@CourseIDList+''')
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DelCourseID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF ('''+@DivisionID+''' <> (SELECT TOP 1 DivisionID FROM MTT1000 WHERE CourseID = @DelCourseID))   --kiểm tra khác DivisionID
	SET @Params1 = @Params1 + @DelCourseID + '', ''
	ELSE
	BEGIN		
		IF EXISTS (SELECT TOP 1 1 FROM MTT1040 WHERE CourseID = @DelCourseID)			
		SET @Params2 = @Params2 + @DelCourseID + '', ''			
		ELSE DELETE FROM MTT1000 WHERE CourseID = @DelCourseID		
	END	
	FETCH NEXT FROM @Cur INTO @DelCourseID
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

IF ('''+@DivisionID+''' <> (SELECT TOP 1 DivisionID FROM MTT1000 WHERE CourseID = '''+@CourseID+'''))
	BEGIN
		SET @Params = '''+@CourseID+'''
		SET @MessageID = ''00ML000050''
	END
--ELSE	
--	BEGIN
--		IF EXISTS (SELECT TOP 1 1 FROM MTT1040 WHERE CourseID = '''+@CourseID+''')			
--		SET @Params = '''+@CourseID+'''
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

