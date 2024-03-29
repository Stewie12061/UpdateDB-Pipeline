IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP2021]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP2021]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Kiểm tra Xóa/Sửa quá trình thôi học
---- Xóa quá trình thôi học
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Nguyễn Thanh Sơn, Date: 17/02/2014
-- <Example>
---- 
/*   
     EXEC MTP2021 @DivisionID = 'EIS',@UserID = '',@APKList = 'E9D78A4B-DE95-46E8-A85B-053493C04248'',''586CA0EB-4B40-489A-835C-164C936F4070',
    @Mode = 1
    EXEC MTP2021 @DivisionID = 'EIS',@UserID = '',@APK = 'E9D78A4B-DE95-46E8-A85B-053493C04248', @Mode = 0

*/

CREATE PROCEDURE MTP2021
( 
  @DivisionID VARCHAR(50),
  @UserID NVARCHAR (50),
  @APK VARCHAR(50) = NULL,
  @APKList NVARCHAR(MAX) = NULL,
  @Mode TINYINT --- 0: Edit , 1: Delete
  
) 
AS 
DECLARE @sSQL NVARCHAR(MAX),
		@sSQL1 NVARCHAR(MAX)

IF @Mode = 1 SET @sSQL = '
DECLARE @Cur CURSOR,
		@Params1 NVARCHAR(MAX),
		@Params2 NVARCHAR(MAX),
		@Params3 NVARCHAR(MAX),
		@DelAPK VARCHAR(50),
		@StudentID VARCHAR(50)
SET @Params1 = ''''
SET @Params2 = ''''
SET @Params3 = ''''
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT APK, StudentID FROM MTT2020 WHERE APK IN ('''+@APKList+''')
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DelAPK, @StudentID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF ('''+@DivisionID+''' <> (SELECT TOP 1 DivisionID FROM MTT2020 WHERE APK = @DelAPK))  --kiểm tra khác DivisionID
	SET @Params1 = @Params1 + @StudentID + '', ''
	ELSE
	BEGIN
		IF (SELECT TOP 1 M99.Closing FROM MTT9999 M99 LEFT JOIN MTT2020 M20 ON M20.DivisionID = M99.DivisionID 
			AND M20.TranMonth = M99.TranMonth AND M20.TranYear = M99.TranYear
		    WHERE M20.APK = @DelAPK ) = 1                                                  -- kiểm tra kỳ kế toán đã bị khóa sổ
		SET @Params2 = @Params2 + @StudentID + '', ''
		ELSE
			BEGIN
				IF 1=0 -- EXISTS (SELECT TOP 1 1 FROM MTT2020 WHERE APK = @DelAPK)			
				SET @Params3 = @Params3 + @StudentID + '', ''			
				ELSE UPDATE MTT2020 SET DeleteFlag = 1 WHERE APK = @DelAPK			
			END
	END	
	FETCH NEXT FROM @Cur INTO @DelAPK, @StudentID
END 
IF @Params1 <> '''' SET @Params1 = LEFT(@Params1, LEN(@Params1)- 1)
IF @Params2 <> '''' SET @Params2 = LEFT(@Params2, LEN(@Params2)- 1)
IF @Params3 <> '''' SET @Params3 = LEFT(@Params3, LEN(@Params3)- 1)

SELECT * FROM
(
SELECT 2 AS Status,''00ML000050'' AS MessageID, @Params1 AS Params             
UNION ALL 
SELECT 2 AS Status,''00ML000051'' AS MessageID, @Params2 AS Params
UNION ALL 
SELECT 2 AS Status,''00ML000052'' AS MessageID, @Params3 AS Params
)A WHERE A.Params <> '''' '

IF @Mode = 0 SET @sSQL = '
DECLARE @Params NVARCHAR(MAX),
		@MessageID VARCHAR(50),
		@StudentID NVARCHAR(50)
SET @Params = ''''
SELECT @StudentID = StudentID FROM MTT2020 WHERE APK = '''+@APK+'''

IF ('''+@DivisionID+''' <> (SELECT TOP 1 DivisionID FROM MTT2020 WHERE APK = '''+@APK+'''))
	BEGIN
		SET @Params =  @StudentID
		SET @MessageID = ''00ML000050''
	END
ELSE
	BEGIN
		IF (SELECT TOP 1 M99.Closing FROM MTT9999 M99 LEFT JOIN MTT2020 M20 ON M20.DivisionID = M99.DivisionID 
			AND M20.TranMonth = M99.TranMonth AND M20.TranYear = M99.TranYear
			WHERE M20.APK = '''+@APK+''' ) = 1
			BEGIN
				SET @Params = @StudentID
				SET @MessageID = ''00ML000051''
			END
		ELSE
			BEGIN
				IF EXISTS (SELECT TOP 1 1 FROM MTT2020 WHERE APK = '''+@APK+''')			
				SET @Params = @StudentID
				SET @MessageID = ''00ML000052''		
			END					
	END	
SELECT 2 AS Status, @MessageID AS MessageID, @Params AS Params
WHERE @Params <> ''''   '

EXEC (@sSQL)
--PRINT (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

