IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP2020]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP2020]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load Grid danh sách học viên thôi học
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Thanh Sơn on 17/02/2014
-- <Example>
/*
    EXEC MTP2020 'EIS',null,1,25,1,null,null,null,null,null,null,null,'','','', @IsExcel = 1
*/

 CREATE PROCEDURE MTP2020
(
     @DivisionIDList NVARCHAR(2000),
     @UserID VARCHAR(50),
     @PageNumber INT = NULL,
     @PageSize INT = NULL,
     @IsSearch BIT,
     @IsDate TINYINT,
     @FromMonth INT,
     @FromYear INT,
     @ToMonth INT,
     @ToYear INT,
     @FromDate DATETIME,
     @ToDate DATETIME,
     @StudentID VARCHAR(50),
     @StudentName NVARCHAR(250),
     @StopReasonID VARCHAR(50),
     @IsExcel TINYINT = NULL
)
AS
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)

SET @sWhere = ''
SET @TotalRow = ''
SET @OrderBy = 'M20.StudentID'

IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
IF @IsSearch = 1
BEGIN
	IF @StudentID IS NOT NULL SET @sWhere = @sWhere + '
	AND M20.StudentID LIKE ''%'+@StudentID+'%'' '
	IF @StudentName IS NOT NULL SET @sWhere = @sWhere + '
	AND M00.StudentName LIKE N''%'+@StudentName+'%'' '
	IF @StopReasonID IS NOT NULL SET @sWhere = @sWhere + '
	AND M20.StopReasonID LIKE N''%'+@StopReasonID+'%'' '
	IF @IsDate = 0 SET @sWhere = @sWhere + '
	AND M20.TranYear * 100 + M20.TranMonth BETWEEN '+STR(@FromYear * 100 + @FromMonth)+' AND '+STR(@ToYear * 100 + @ToMonth)+' '
	IF @IsDate = 1 SET @sWhere = @sWhere + '
	AND CONVERT(VARCHAR(10),M20.StopDate,112) BETWEEN '+CONVERT(VARCHAR(10),@FromDate,112)+' AND '+CONVERT(VARCHAR(10),@ToDate,112)+' '
END
ELSE SET @sWhere = @sWhere + '
	AND M20.TranYear * 100 + M20.TranMonth = '+STR(@FromYear * 100 + @FromMonth)
SET @sSQL = '
SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow,
M20.APK, M20.DivisionID, M20. StopVoucherNo, M20.StudentID, M00.StudentName, M20.StopDate, M30.StopReasonName
FROM MTT2020 M20
LEFT JOIN MTT1030 M30 ON M30.StopReasonID = M20.StopReasonID
LEFT JOIN MTT2000 M00 ON M00.StudentID = M20.StudentID
WHERE M20.DivisionID IN ('''+@DivisionIDList+''') '+@sWhere+'
AND M20.DeleteFlag = 0
ORDER BY '+@OrderBy+'
OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

IF @IsExcel = 1 SET @sSQL = '
SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, M20.*, M00.StudentName, M30.StopReasonName, M40.ClassName
FROM MTT2020 M20
LEFT JOIN MTT1040 M40 ON M40.ClassID = M20.ClassID
LEFT JOIN MTT1030 M30 ON M30.StopReasonID = M20.StopReasonID
LEFT JOIN MTT2000 M00 ON M00.StudentID = M20.StudentID   '

EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
