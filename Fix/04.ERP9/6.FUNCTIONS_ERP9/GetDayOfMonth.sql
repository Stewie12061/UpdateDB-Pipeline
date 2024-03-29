IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[GetDayOfMonth]') AND XTYPE IN (N'FN', N'IF', N'TF'))
DROP FUNCTION [DBO].[GetDayOfMonth]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Lấy thứ tự ngày của tháng
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---- Create on 20/07/2018 by Bảo Anh
---- Modified on

CREATE FUNCTION [dbo].[GetDayOfMonth]
(
	@DivisionID AS VARCHAR(50),
	@TranMonth as INT,
	@TranYear As INT
)
RETURNS @DateTable TABLE 
(
    [Date] DATETIME,
	DateOrder TINYINT
)
AS
BEGIN

DECLARE @BeginDate AS DATETIME,
		@EndDate AS DATETIME,
		@RunDate AS DATETIME,
		@Order TINYINT

SET @Order = 1

SELECT @BeginDate = BeginDate, @EndDate = EndDate
FROM HT9999 WITH (NOLOCK)
WHERE DivisionID = @DivisionID AND TranMonth = @TranMonth AND TranYear = @TranYear

SET @RunDate = @BeginDate

WHILE @RunDate <= @EndDate
BEGIN
	INSERT INTO @DateTable ([Date], DateOrder) VALUES (@RunDate, @Order)
	SET @RunDate = DATEADD(d,1,@RunDate)
	SET @Order = @Order + 1
END

RETURN

END