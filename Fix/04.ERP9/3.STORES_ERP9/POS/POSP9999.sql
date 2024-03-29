IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POSP9999]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[POSP9999]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Khóa sổ module POS
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---- Create on 26/12/2013 by Hoang Vu
---- Modified by Thị Phượng Bổ sung chỉnh sửa câu update POST0000 có where DivisionID = @DivisionID và bổ sung With (Nolock)
-- <Example>
---- EXEC POSP9999 'POS', 'thanhson', 12, 2013, '2013-12-01 00:00:00.000', '2013-12-31 00:00:00.000'


CREATE PROCEDURE POSP9999
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

SELECT  @Closing =  Closing FROM POST9999 With (Nolock)
WHERE DivisionID = @DivisionID AND TranMonth = @TranMonth AND TranYear =  @TranYear

SELECT @MaxPeriod = MAX( TranYear * 100 + TranMonth) FROM POST9999 With (Nolock) WHERE DivisionID = @DivisionID

IF @Closing <> 1
BEGIN
	UPDATE POST9999 SET Closing = 1 
	WHERE DivisionID = @DivisionID AND TranMonth = @TranMonth AND TranYear = @TranYear
	
	IF @MaxPeriod < (@NextYear * 100 + @NextMonth)
	BEGIN
		INSERT INTO POST9999 (DivisionID, TranMonth, TranYear, Closing, BeginDate, EndDate)
		VALUES (@DivisionID, @NextMonth, @NextYear, 0, @BeginDate, @EndDate)
		
		IF EXISTS (SELECT 1 FROM POST0000 With (Nolock) WHERE DivisionID = @DivisionID)
		BEGIN
			UPDATE POST0000 SET TranMonth = @NextMonth, TranYear = @NextYear
			where DivisionID = @DivisionID
		END
	END	
	ELSE
		BEGIN
			UPDATE POST9999 SET BeginDate = @BeginDate, EndDate = @EndDate
			WHERE DivisionID = @DivisionID AND TranMonth = @NextMonth AND TranYear = @NextYear
		END
END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
