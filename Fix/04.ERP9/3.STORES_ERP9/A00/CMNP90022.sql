IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CMNP90022]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CMNP90022]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load màn hình chi tiết sơ đồ tuyến (Load dữ liệu Detail)
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Hoàng vũ
-- <Example>
/*
    exec CMNP90022 @DivisionID=N'HT',@RouteID=N'TUYEN02', @PageNumber = 1 , @PageSize = 10
*/

 CREATE PROCEDURE CMNP90022 (
     @DivisionID NVARCHAR(2000),
     @RouteID VARCHAR(50),
	 @PageNumber INT,
     @PageSize INT
)
AS
DECLARE  @sSQL NVARCHAR (MAX),	
		 @OrderBy NVARCHAR(500),
		 @TotalRow NVARCHAR(50)
	SET @TotalRow = ''
	SET @OrderBy = 'CT0144.StationOrder'
	
	IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
	
	SET @sSQL = '
				SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow
					   , CT0144.DivisionID, CT0144.RouteID, CT0144.TransactionID, CT0144.StationID
					   , CT0141.StationName, CT0144.StationOrder, CT0144.Notes, CT0141.Address
					   , CT0141.Street, CT0141.Ward, CT0141.District, CT0141.CityID
				from CT0144 left join CT0141 on CT0144.DivisionID = CT0141.DivisionID and CT0144.StationID = CT0141.StationID 
				WHERE CT0144.DivisionID = '''+@DivisionID+'''and CT0144.RouteID = '''+@RouteID+'''
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
				
	
EXEC (@sSQL)
--PRINT(@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
