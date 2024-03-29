IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[HRMP2097]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[HRMP2097]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- <Summary>
--- Load kiểm tra ngân sách đào tạo
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Hải Long on 21/09/2017
----Modified by: Trọng Kiên on 28/08/2020: Fix kiểu dữ liệu ProposeAmount
----Modify by...
-- <Example>
/*
*/

 CREATE PROCEDURE [HRMP2097] 
 (
     @DivisionID NVARCHAR(50),
	 @UserID NVARCHAR(50),
	 @IsAll TINYINT,
     @DepartmentID NVARCHAR(50),
     @XML XML
)
AS

DECLARE @Status AS TINYINT = 0,
		@Message AS NVARCHAR(50),
		@TranQuarter AS INT = 0 ,
		@TranYear AS INT = 0 

SELECT	X.Data.query('ProposeAmount').value('.', 'DECIMAL(28)') AS ProposeAmount,	
		X.Data.query('FromDate').value('.', 'DATETIME') AS FromDate,		
		X.Data.query('ToDate').value('.', 'DATETIME') AS ToDate,
		X.Data.query('IsAll').value('.', 'TINYINT') AS IsAll																								
INTO #Data		
FROM @XML.nodes('//Data') AS X (Data)

-- Lấy chi phí đào tạo toàn công ty
SELECT DivisionID, 1 AS IsAll, NULL AS DepartmentID, SUM(CostAmount) AS CostAmount, TranQuarter, TranYear
INTO #TEMP
FROM
(
	SELECT HRMT2130.DivisionID, HRMT2100.IsAll, '%' AS DepartmentID, HRMT2130.CostAmount, 
	DATEPART(QUARTER, HRMT2130.FromDate) AS TranQuarter, DATEPART(YEAR, HRMT2130.FromDate) AS TranYear
	FROM HRMT2131 WITH (NOLOCK)
	INNER JOIN HRMT2130 WITH (NOLOCK) ON HRMT2130.DivisionID = HRMT2131.DivisionID AND HRMT2130.TrainingCostID = HRMT2131.TrainingCostID
	LEFT JOIN HRMT2100 ON HRMT2100.DivisionID = HRMT2130.DivisionID AND HRMT2100.TrainingScheduleID = HRMT2130.TrainingScheduleID
	WHERE HRMT2100.IsAll = 1
	
	UNION ALL 
	
	SELECT @DivisionID AS DivisionID, IsAll, '%' AS DepartmentID, CAST(ISNULL(ProposeAmount,0) AS DECIMAL(28)) AS CostAmount, 
	DATEPART(QUARTER, FromDate) AS TranQuarter, DATEPART(YEAR, FromDate) AS TranYear
	FROM #Data
	WHERE @IsAll = 1
) TB1
GROUP BY DivisionID, TranQuarter, TranYear

UNION ALL
-- Lấy chi phí đào tạo theo phòng ban
SELECT DivisionID, 0 AS IsAll, DepartmentID, SUM(CostAmount) AS CostAmount, TranQuarter, TranYear
FROM
(
	SELECT HRMT2130.DivisionID, 0 AS IsAll, HRMT2131.DepartmentID, HRMT2131.CostAmount,
	DATEPART(QUARTER, HRMT2130.FromDate) AS TranQuarter, DATEPART(YEAR, HRMT2130.FromDate) AS TranYear
	FROM HRMT2130 WITH (NOLOCK)
	INNER JOIN 
	(
		SELECT DivisionID, DepartmentID, TrainingCostID, SUM(CostAmount) AS CostAmount
		FROM HRMT2131 WITH (NOLOCK)
		GROUP BY DivisionID, DepartmentID, TrainingCostID
	) HRMT2131 ON HRMT2130.DivisionID = HRMT2131.DivisionID AND HRMT2130.TrainingCostID = HRMT2131.TrainingCostID
	LEFT JOIN HRMT2100 ON HRMT2100.DivisionID = HRMT2130.DivisionID AND HRMT2100.TrainingScheduleID = HRMT2130.TrainingScheduleID
	WHERE HRMT2100.IsAll = 0
	
	UNION ALL 	
 
	SELECT @DivisionID AS DivisionID, IsAll, '%' AS DepartmentID, CAST(ISNULL(ProposeAmount, 0) AS DECIMAL(28)) AS CostAmount, 
	DATEPART(QUARTER, FromDate) AS TranQuarter, DATEPART(YEAR, FromDate) AS TranYear
	FROM #Data
	WHERE @IsAll = 0	
) TB2
GROUP BY DivisionID, DepartmentID, TranQuarter, TranYear

-- So sánh với ngân sách
SELECT TOP 1 @TranQuarter = HRMT2060.TranQuarter, @TranYear = HRMT2060.TranYear
FROM HRMT2060 WITH (NOLOCK)
LEFT JOIN #TEMP ON #TEMP.DivisionID = HRMT2060.DivisionID AND #TEMP.IsAll = HRMT2060.IsAll AND ISNULL(#TEMP.DepartmentID, '') = ISNULL(HRMT2060.DepartmentID, '')
AND 1 = (CASE WHEN IsBugetYear = 1 AND HRMT2060.TranYear = #TEMP.TranYear THEN 1
			  WHEN IsBugetYear = 0 AND HRMT2060.TranYear = #TEMP.TranYear AND HRMT2060.TranQuarter = #TEMP.TranQuarter THEN 1 ELSE 0 END)
WHERE #TEMP.CostAmount > HRMT2060.BudgetAmount
AND HRMT2060.IsAll = @IsAll		

IF (@TranQuarter <> 0 AND @TranYear <> 0 ) 
BEGIN
	SET @Message = 'HRMFML000026'	
	SET @Status = 1		
END 	

IF (@TranQuarter = 0  AND @TranYear <> 0 ) 
BEGIN
	SET @Message = 'HRMFML000027'	
	SET @Status = 1		
END 				


SELECT @Status AS Status, @Message AS Message, @TranQuarter AS TranQuarter, @TranYear AS TranYear



GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
