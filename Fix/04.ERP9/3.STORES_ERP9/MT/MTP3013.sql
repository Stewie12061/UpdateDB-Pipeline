IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP3013]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP3013]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Đổ nguồn cho báo cáo giảm học phí
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: by Thanh Sơn on 21/02/2014 
-- <Example>
/*
    EXEC MTP3013 'EIS', '',1,2013,12,2013,1, '2014-02-19 00:00:00.000', '2014-03-19 00:00:00.000', '%'
*/

 CREATE PROCEDURE MTP3013
(
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@FromMonth INT,
	@FromYear INT,
	@ToMonth INT,
	@ToYear INT,
	@IsDate TINYINT,
	@FromDate DATETIME,
	@ToDate DATETIME,
	@BranchID VARCHAR(50)
)
AS
DECLARE @sSQL NVARCHAR(MAX),
		@sWhere NVARCHAR (1000),
		@sWhere1 NVARCHAR(2000)
SET @sWhere = ''
SET @sWhere1 = ''
IF (@BranchID <> '%' ) SET @sWhere1 = @sWhere1 + 'AND CONVERT(INT,SUBSTRING(ClassID,2,2)) = SUBSTRING('''+@BranchID+''',3,1) '
IF @IsDate = 1 SET @sWhere = @sWhere +'
AND CONVERT(VARCHAR(10),M10.ClassDate,112) BETWEEN '''+CONVERT(VARCHAR(10),@FromDate,112)+''' AND '''+CONVERT(VARCHAR(10),@ToDate,112)+''' ' 
ELSE SET @sWhere = @sWhere +'
AND M10.TranYear * 100 + M10.TranMonth BETWEEN '+STR(@FromYear * 100 + @FromMonth)+' AND '+STR(@ToYear * 100 + @ToMonth)+' '

SET @sSQL = '
SELECT M10.StudentID, M00.StudentName, M00.Birthday, M10.ClassID, M10.BeginDate, M10.EndDate,
M10.ReduceAmount, A11.AnaName AS ReasonID
FROM MTT2010 M10
LEFT JOIN AT1011 A11 ON A11.AnaID = M10.ReduceReasonID
LEFT JOIN MTT2000 M00 ON M00.DivisionID = M10.DivisionID AND M00.StudentID = M10.StudentID
WHERE M10.DivisionID = '''+@DivisionID+'''
'+@sWhere1+'
AND M10.DeleteFlag = 0
AND ISNULL(M10.ReduceAmount,0) <> 0 '+@sWhere+'  '

EXEC (@sSQL)
PRINT (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
