IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP1530]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[CIP1530]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- <Summary>
---- Load danh mục ví chiết khấu khuyến mãi
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Nhật Thanh, Date: 27/04/2023
-- <Example>
---- 
/*
*/

CREATE PROCEDURE CIP1530
( 
	@DivisionID VARCHAR(50),
	@ObjectID VARCHAR (50),
	@IsPeriod INT,
	@FromDate DATETIME,
	@ToDate DATETIME,
	@PeriodList VARCHAR(500),
	@PageNumber INT,
	@PageSize INT
) 
AS 

DECLARE @sSQL NVARCHAR(MAX),
        @TotalRow NVARCHAR(50),
		@FromDateText NVARCHAR(20),
		@ToDateText NVARCHAR(20),
		@sWhere NVARCHAR(MAX) = ''
	SET @FromDateText = CONVERT(NVARCHAR(20), @FromDate, 101)
	SET @ToDateText = CONVERT(NVARCHAR(20), @ToDate, 101) + ' 23:59:59'

IF @IsPeriod = 0
BEGIN
	IF (ISNULL(@FromDate,'') != '' AND ISNULL(@ToDate,'') = '' )
	BEGIN
		SET @sWhere = @sWhere + ' AND (C30.CreateDate >= ''' + @FromDateText + ''' OR C30.CreateDate >= ''' + @FromDateText + ''')'
	END
	ELSE IF(ISNULL(@FromDate,'') = '' AND ISNULL(@ToDate,'') != '')
	BEGIN
		SET @sWhere = @sWhere + ' AND (C30.CreateDate <= ''' + @ToDateText + ''' OR C30.CreateDate <= ''' + @ToDateText + ''')'
	END
	ELSE IF(ISNULL(@FromDate, '') != '' AND ISNULL(@ToDate, '') != '')
	BEGIN
		SET @sWhere = @sWhere + ' AND (C30.CreateDate BETWEEN ''' + @FromDateText + ''' AND ''' + @ToDateText + ''') '
	END
END
ELSE IF @IsPeriod = 1 AND ISNULL(@PeriodList, '') != ''
BEGIN
	SET @sWhere = @sWhere + ' AND CONCAT(FORMAT(DATEPART(M, C30.CreateDate), ''00''), ''/'', DATEPART(YYYY, C30.CreateDate))
				 IN (''' + @PeriodList + ''') '
END

IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
		SET @sSQL = '
SELECT ROW_NUMBER() OVER (ORDER BY ObjectID) AS RowNum, '+@TotalRow+' AS TotalRow,
	MAX(C30.APK) APK, C30.DivisionID, C30.ObjectID, C30.ObjectName, SUM(CASE WHEN ISNULL(KindDiscountID,0)=2 THEN -DiscountValue WHEN ISNULL(IsAvailable,0)=1 THEN DiscountValue ELSE 0 END) SumDiscountValue, 
	SUM(CASE WHEN ISNULL(KindDiscountID,0)=2 THEN -DiscountRate WHEN ISNULL(IsAvailable,0)=1 THEN DiscountRate ELSE 0 END) SumDiscountRate--, STRING_AGG(InventoryGiftName,'', '') AS ListInventoryGiftName
FROM CIT1530 C30
WHERE DivisionID like ''%'+@DivisionID+'%'' AND ObjectID like ''%'+@ObjectID+'%''' + @sWhere + '
AND ISNULL(KindDiscountID,0)!=0
GROUP BY C30.DivisionID, C30.ObjectID, C30.ObjectName
ORDER BY C30.ObjectID
OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY'

PRINT (@sSQL)
EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
