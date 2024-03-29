IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[OOP2003]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[OOP2003]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load Form OOP2003: chi tiết lưới phân ca
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Trần Quốc Tuấn, Date: 07/12/2015
----Modified by Bảo Thy on 03/08/2017: bỏ load bảng phân ca theo kỳ
-- <Example>
---- 
/*
   OOP2003 'CTY','ASOFTADMIN',1,50,0,'160872B6-3A98-41C7-B8E8-B70A22F221C9',8,2015,null,null
*/
CREATE PROCEDURE OOP2003
( 
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@PageNumber INT,
	@PageSize INT,
	@IsSearch BIT,
	@APK VARCHAR(50),
	@TranMonth INT,
	@TranYear INT,
	@EmployeeID VARCHAR(200),
	@EmployeeName NVARCHAR(500)
)
AS
DECLARE @sSQL NVARCHAR (MAX) = '',
		@OrderBy NVARCHAR(500),
		@TotalRow NVARCHAR(50) = '',
		@sWhere NVARCHAR(MAX) = ''
		
SET @OrderBy = ' A.EmployeeID'
IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'

IF @IsSearch = 1
BEGIN
	IF @EmployeeID IS NOT NULL SET @sWhere = @sWhere + '
	AND ISNULL(OOT20.EmployeeID,'''') LIKE ''%'+@EmployeeID+'%'' '
	IF @EmployeeName IS NOT NULL SET @sWhere = @sWhere + '
	AND ISNULL(HV14.FullName,'''') LIKE ''%'+@EmployeeName+'%'' '
END
SET @sSQL='
SELECT  ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, *
	FROM
	(
SELECT OOT20.EmployeeID,HV14.FullName EmployeeName, OOT20.D01, OOT20.D02, OOT20.D03, OOT20.D04, OOT20.D05,
       OOT20.D06, OOT20.D07, OOT20.D08, OOT20.D09, OOT20.D10, OOT20.D12, OOT20.D11,
       OOT20.D13, OOT20.D14, OOT20.D15, OOT20.D16, OOT20.D17, OOT20.D18, OOT20.D19,
       OOT20.D20, OOT20.D21, OOT20.D22, OOT20.D23, OOT20.D24, OOT20.D25, OOT20.D26,
       OOT20.D27, OOT20.D28, OOT20.D29, OOT20.D30, OOT20.D31, OOT20.Note,OOT20.APK, 0 AS FormStatus
  FROM OOT2000 OOT20
  INNER JOIN OOT9000 OOT90 ON OOT90.APK = OOT20.APKMaster
  LEFT JOIN HV1400 HV14 ON HV14.EmployeeID = OOT20.EmployeeID AND HV14.DivisionID = OOT90.DivisionID
WHERE OOT90.DivisionID='''+@DivisionID+'''
AND OOT90.APK='''+@APK+'''
--AND OOT90.TranMonth='+STR(@TranMonth)+'
--AND OOT90.TranYear='+STR(@TranYear)+'
'+@sWhere+'
)A
ORDER BY '+@OrderBy+'
OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY'

EXEC (@sSQL)
--PRINT (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
