IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP3016]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP3016]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Đổ nguồn cho báo cáo danh sách học viên thôi học
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
    EXEC MTP3016 'EIS', '',1,2013,12,2013,0, '2014-02-19 00:00:00.000', '2014-03-19 00:00:00.000', '%'
*/

 CREATE PROCEDURE MTP3016
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
IF (@BranchID <> '%' ) SET @sWhere1 = @sWhere1 + 'AND CONVERT(INT,SUBSTRING(M20.ClassID,2,2)) = SUBSTRING('''+@BranchID+''',3,1) '
IF @IsDate = 1 SET @sWhere = @sWhere +'
AND CONVERT(VARCHAR(10),M20.StopDate,112) BETWEEN '''+CONVERT(VARCHAR(10),@FromDate,112)+''' AND '''+CONVERT(VARCHAR(10),@ToDate,112)+''' ' 
ELSE SET @sWhere = @sWhere +'
AND M20.TranYear * 100 + M20.TranMonth BETWEEN '+STR(@FromYear * 100 + @FromMonth)+' AND '+STR(@ToYear * 100 + @ToMonth)+' '

SET @sSQL = '
SELECT M20.StudentID, M00.StudentName, M00.Birthday, M20.ClassID,M20.StopDate, M20.StopReasonID, M30.StopReasonName
FROM MTT2020 M20
LEFT JOIN MTT1030 M30 ON M30.StopReasonID = M20.StopReasonID
LEFT JOIN MTT2000 M00 ON M00.DivisionID = M20.DivisionID AND M00.StudentID = M20.StudentID
WHERE M20.DivisionID = '''+@DivisionID+'''
'+@sWhere1+'
AND M20.DeleteFlag = 0 '+@sWhere+' '

EXEC (@sSQL)


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
