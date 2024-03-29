IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP2001]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP2001]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Kiểm tra Xóa/Sửa học viên
---- Xóa học viên
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Nguyễn Thanh Sơn, Date: 11/12/2013
-- <Example>
---- 
/*   
    EXEC MTP2001 @DivisionID = 'EIS',@UserID = '',@StudentIDList = 'H2-NDQ-0001'',''H2-NDQ-0002'',''H4-NDQ-001',@Mode = 1
    EXEC MTP2001 @DivisionID = 'EIS',@UserID = '',@StudentID = 'H2-NDQ-0002',@Mode = 0

*/

CREATE PROCEDURE MTP2001
( 
  @DivisionID VARCHAR(50),
  @UserID NVARCHAR (50),
  @StudentID VARCHAR(50) = NULL,
  @StudentIDList NVARCHAR(MAX) = NULL,
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
		@DelStudentID VARCHAR(50)
SET @Params1 = ''''
SET @Params2 = ''''
SET @Params3 = ''''
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT StudentID FROM MTT2000 WHERE StudentID IN ('''+@StudentIDList+''')
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DelStudentID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF ('''+@DivisionID+''' <> (SELECT TOP 1 DivisionID FROM MTT2000 WHERE StudentID = @DelStudentID))--kiểm tra khác DivisionID
	SET @Params1 = @Params1 + @DelStudentID + '', ''
	ELSE
	BEGIN
		IF (SELECT TOP 1 M99.Closing FROM MTT9999 M99 LEFT JOIN MTT2000 M00 ON M00.DivisionID = M99.DivisionID 
			AND M00.TranMonth = M99.TranMonth AND M00.TranYear = M99.TranYear
		    WHERE M00.StudentID = @DelStudentID ) = 1                                                 -- kiểm tra kỳ kế toán đã bị khóa sổ
		SET @Params2 = @Params2 + @DelStudentID + '', ''
		ELSE
			BEGIN
				IF EXISTS (SELECT TOP 1 1 FROM MTT2010 WHERE StudentID = @DelStudentID AND DeleteFlag = 0)			
				SET @Params3 = @Params3 + @DelStudentID + '', ''			
				ELSE DELETE FROM MTT2000 WHERE StudentID = @DelStudentID			
			END
	END	
	FETCH NEXT FROM @Cur INTO @DelStudentID
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
		@MessageID VARCHAR(50)
SET @Params = ''''

IF ('''+@DivisionID+''' <> (SELECT TOP 1 DivisionID FROM MTT2000 WHERE StudentID = '''+@StudentID+'''))
	BEGIN
		SET @Params = '''+@StudentID+'''
		SET @MessageID = ''00ML000050''
	END
ELSE
	BEGIN
		IF (SELECT TOP 1 M99.Closing FROM MTT9999 M99 LEFT JOIN MTT2000 M00 ON M00.DivisionID = M99.DivisionID 
			AND M00.TranMonth = M99.TranMonth AND M00.TranYear = M99.TranYear
			WHERE M00.StudentID = '''+@StudentID+''' ) = 1
		BEGIN
			SET @Params = '''+@StudentID+'''
			SET @MessageID = ''00ML000051''
		END	
	--ELSE
	--	BEGIN
	--		IF EXISTS (SELECT TOP 1 1 FROM MTT2010 WHERE StudentID = '''+@StudentID+''' )			
	--		SET @Params = '''+@StudentID+'''
	--		SET @MessageID = ''00ML000052''		
	--	END
	END		

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

