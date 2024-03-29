IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WITH (NOLOCK) WHERE ID = OBJECT_ID(N'[DBO].[MTP3012]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP3012]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Đổ nguồn cho báo cáo hoàn học phí
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: by Thanh Sơn on 20/02/2014
---- Modified by Bảo Thy on 30/05/2016: Bổ sung WITH (NOLOCK) 
-- <Example>
/*
    EXEC MTP3012 'EIS', '',1,2013,12,2014,0, '2014-02-19 00:00:00.000', '2014-03-19 00:00:00.000', '%'
*/

 CREATE PROCEDURE MTP3012
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
		@sWhere1 NVARCHAR(2000),
		@sSQL1 NVARCHAR(MAX)

SET @sSQL1 = '
SELECT  DivisionID, ObjectID, Ana06ID, ConvertedAmount FROM AT9000 WITH (NOLOCK)
WHERE CreditAccountID LIKE ''5113%'' AND DebitAccountID LIKE ''136%''
UNION ALL
SELECT  DivisionID, ObjectID, Ana06ID, SUM(ConvertedAmount) FROM AT9000 WITH (NOLOCK)
WHERE  CreditAccountID LIKE ''1311'' AND DebitAccountID LIKE ''136%''
AND DivisionID+ISNULL(ObjectID,'')+ISNULL(Ana06ID,'') NOT IN (
	SELECT  DivisionID+ISNULL(ObjectID,'')+ISNULL(Ana06ID,'') FROM AT9000 WITH (NOLOCK)
	WHERE CreditAccountID LIKE ''5113%'' AND DebitAccountID LIKE ''136%'')
GROUP BY DivisionID, ObjectID, Ana06ID '
				
SET @sWhere = ''
SET @sWhere1 = ''
IF (@BranchID <> '%' ) SET @sWhere1 = @sWhere1 + 'AND CONVERT(INT,SUBSTRING(ClassID,2,2)) = SUBSTRING('''+@BranchID+''',3,1) '
IF @IsDate = 1 SET @sWhere = @sWhere +'
AND CONVERT(VARCHAR(10),M10.ReturnDate,112) BETWEEN '''+CONVERT(VARCHAR(10),@FromDate,112)+''' AND '''+CONVERT(VARCHAR(10),@ToDate,112)+''' ' 
ELSE SET @sWhere = @sWhere +'
AND M10.TranYear * 100 + M10.TranMonth BETWEEN '+STR(@FromYear * 100 + @FromMonth)+' AND '+STR(@ToYear * 100 + @ToMonth)+' '

SET @sSQL = '
SELECT M10.StudentID, M00.StudentName, M00.Birthday, M10.ClassID, M10.BeginDate, M10.EndDate,
ISNULL(A.ConvertedAmount,0) AS PayMoney, M10.ReturnMoney, M10.ReturnDate, M99.[Description] AS ReturnReason
FROM MTT2010 M10 WITH (NOLOCK)
LEFT JOIN ('+@sSQL1+')A ON A.DivisionID = M10.DivisionID AND A.ObjectID = M10.StudentID AND A.Ana06ID = M10.ClassID
LEFT JOIN MTT0099 M99 WITH (NOLOCK) ON M99.ID = M10.ReturnReason AND M99.CodeMaster = ''ReturnReason''
LEFT JOIN MTT2000 M00 WITH (NOLOCK) ON M00.DivisionID = M10.DivisionID AND M00.StudentID = M10.StudentID
WHERE M10.DivisionID = '''+@DivisionID+'''
'+@sWhere1+'
AND M10.DeleteFlag = 0
AND ISNULL(M10.ReturnMoney,0) <> 0 '+@sWhere+'  
ORDER BY M00.StudentName '

EXEC (@sSQL)
--PRINT (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
