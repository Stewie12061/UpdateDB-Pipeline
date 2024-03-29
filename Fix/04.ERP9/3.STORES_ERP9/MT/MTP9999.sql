IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MTP9999]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[MTP9999]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Khóa sổ module MT
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---- Create on 26/12/2013 by Thanh Sơn
---- 
-- <Example>
---- EXEC MTP9999 'EIS', 'thanhson', 12, 2013, '2013-12-01 00:00:00.000', '2013-12-31 00:00:00.000'


CREATE PROCEDURE MTP9999
(
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@TranMonth INT,
	@TranYear INT,
	@BeginDate DATETIME,
	@EndDate DATETIME
)
AS

DECLARE @Closing TINYINT,
        @NextMonth INT,
        @NextYear INT,
        @PeriodNum INT,
        @MaxPeriod INT
        
SELECT PeriodNum = PeriodNum FROM AT0001

IF @PeriodNum IS NULL SET @PeriodNum = 12

SET @NextMonth =  @TranMonth % @PeriodNum + 1
SET @NextYear =  @TranYear + @TranMonth / @PeriodNum

SELECT  @Closing =  Closing FROM MTT9999
WHERE DivisionID = @DivisionID AND TranMonth = @TranMonth AND TranYear =  @TranYear

SELECT @MaxPeriod = MAX( TranYear * 100 + TranMonth) FROM MTT9999 WHERE DivisionID = @DivisionID

IF @Closing <> 1
BEGIN
	UPDATE MTT9999 SET Closing = 1 
	WHERE DivisionID = @DivisionID AND TranMonth = @TranMonth AND TranYear = @TranYear
	
	IF @MaxPeriod < (@NextYear * 100 + @NextMonth)
	BEGIN
		INSERT INTO MTT9999 (DivisionID, TranMonth, TranYear, Closing, BeginDate, EndDate)
		VALUES (@DivisionID, @NextMonth, @NextYear, 0, @BeginDate, @EndDate)
		
		IF EXISTS (SELECT 1 FROM AT0000 WHERE DefDivisionID = @DivisionID)
		BEGIN
			UPDATE MTT0000 SET TranMonth = @NextMonth, TranYear = @NextYear
		END
	END	
	ELSE
		BEGIN
			UPDATE MTT9999 SET BeginDate = @BeginDate, EndDate = @EndDate
			WHERE DivisionID = @DivisionID AND TranMonth = @NextMonth AND TranYear = @NextYear
		END
END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
