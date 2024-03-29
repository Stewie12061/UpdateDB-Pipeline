IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP2000]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP2000]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- <Summary>
---- Load Grid Form MTF2000
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Nguyễn Thanh Sơn, Date: 14/01/2014
-- <Example>

/*
    MTP2000 @DivisionIDList = 'EIS'',''CTY', @UserID = '', @PageNumber = 1, @PageSize = 25, @IsSearch = 1, @IsDate = 0,
    @FromMonth = 1, @FromYear = 2014, @ToMonth = 5, @ToYear = 2014, @FromDate = '2014-01-01 15:34:03.853', @ToDate = '2014-01-31 15:34:03.853',
    @StudentID = '0011', @StudentName = '', @StudentNameE='', @Address = '', @ClassID = '', @Tel ='', @IsExcel = 1
*/

CREATE PROCEDURE MTP2000
( 
	@DivisionIDList NVARCHAR(2000),
	@UserID VARCHAR(50),
	@PageNumber INT = NULL,
	@PageSize INT = NULL,
	@IsSearch BIT ,
	@IsDate TINYINT,
	@FromMonth INT,
	@FromYear INT,
	@ToMonth INT,
	@ToYear INT,
	@FromDate DATETIME,
	@ToDate DATETIME,
	@StudentID VARCHAR (50),
	@StudentName NVARCHAR(200),
	@StudentNameE NVARCHAR(250),
	@Address NVARCHAR(1000),
	@ClassID NVARCHAR(250),
	@Tel NVARCHAR(50),
	@IsExcel TINYINT = NULL
) 

AS 

DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)
        
SET @sWhere = ''
SET @TotalRow = ''
SET @OrderBy = 'M00.StudentID'

IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
IF @IsSearch = 1
BEGIN
	IF @StudentID IS NOT NULL SET @sWhere = @sWhere + '
	AND M00.StudentID LIKE ''%'+@StudentID+'%'' '
	IF @StudentName IS NOT NULL SET @sWhere = @sWhere + ' 
	AND ISNULL(M00.StudentName,'''') LIKE N''%'+@StudentName+'%''  '
	IF @StudentNameE IS NOT NULL SET @sWhere = @sWhere + '
	AND ISNULL(M00.StudentNameE,'''') LIKE ''%'+@StudentNameE+'%'' '
	IF @Address IS NOT NULL SET @sWhere = @sWhere + '
	AND ISNULL(M00.Address,'''') LIKE N''%'+@Address+'%'' '
	IF @IsDate = 0 SET @sWhere = @sWhere + '
	AND M00.TranYear * 100 + M00.TranMonth BETWEEN '+STR(@FromYear * 100 + @FromMonth)+' AND '+STR(@ToYear * 100 + @ToMonth)+' '
	IF @IsDate = 1 SET @sWhere = @sWhere + '
	AND CONVERT(VARCHAR(10),M00.StartDate,112) BETWEEN '+CONVERT(VARCHAR(10),@FromDate,112)+' AND '+CONVERT(VARCHAR(10),@ToDate,112)+' '
	IF @ClassID IS NOT NULL SET @sWhere = @sWhere + '
	AND M00.StudentID IN (SELECT DISTINCT StudentID FROM MTT2010 WHERE ClassID LIKE ''%'+@ClassID+'%'')  '
	IF @Tel IS NOT NULL SET @sWhere = @sWhere + '
	AND (ISNULL(M00.Tel1,'''') LIKE ''%'+@Tel+'%'' OR ISNULL(M00.Tel2,'''') LIKE ''%'+@Tel+'%'') '
	
END
ELSE SET @sWhere = @sWhere + '
	AND M00.TranYear * 100 + M00.TranMonth = '+STR(@FromYear * 100 + @FromMonth)

SET @sSQL = '
SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow,
A02.DivisionID, A02.ObjectID AS StudentID, M00.StudentName, M00.StudentNameE, M00.Address,
M00.IsMale, M00.Birthday, M00.Notes
FROM AT1202 A02
INNER JOIN MTT2000 M00 ON M00.DivisionID = A02.DivisionID AND M00.StudentID = A02.ObjectID
WHERE A02.DivisionID IN ('''+@DivisionIDList+''') '+@sWhere+'
ORDER BY '+@OrderBy+'
OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

IF @IsExcel = 1
SET @sSQL = '
SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, A02.DivisionID, A02.ObjectID AS StudentID,
M00.StudentName, M00.StudentNameE, M00.IsMale, M00.Birthday, M00.[Tel1], M00.[Tel2], M00.Email,M00.[Address],
M00.AddWard, M00.AddDistrict, M00.Notes, M00.StartDate, M00.School, M00.Grade, M00.IsTATC, M00.Ward, M00.District,
M00.FatherJob, M00.MotherJob, M00.SpecNotes, M00.[Source1], M00.[Source2], M00.[Source3], M00.[ContactPerson1],
M00.[ContactTel1], M00.[ContactEmail1], M00.[ContactPerson2], M00.[ContactTel2], M00.[ContactEmail2], M00.Interviewer,
M00.Reception, M00.PlacementLevel, M00.TeacherCommentEK, M00.ClassDate, M00.Improvement, M00.Strength, M00.Listening,
M00.Speaking, M00.Reading, M00.Writing, M00.Total, M00.DeleteFlag, M00.[Part1], M00.[Part2], M00.[Part3], M00.[Part4],
M00.PartTotal, M00.IsSkill,M00.OtherNotes
FROM AT1202 A02
INNER JOIN MTT2000 M00 ON M00.DivisionID = A02.DivisionID AND M00.StudentID = A02.ObjectID
WHERE A02.DivisionID IN ('''+@DivisionIDList+''') '+@sWhere+'
ORDER BY '+@OrderBy+'  '

EXEC (@sSQL)
--PRINT(@sSQL)




GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

