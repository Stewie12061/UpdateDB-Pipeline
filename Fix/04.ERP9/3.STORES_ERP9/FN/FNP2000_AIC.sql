﻿IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[FNP2000_AIC]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[FNP2000_AIC]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



----- Created by Như Hàn
---- Created Date 07/11/2018
---- Purpose: Đổ nguồn màn hình Kế thừa dự án - GRID 1
---- Modified on ... by ...
/*
EXEC FNP2000_AIC '', '', '8', '2018'
EXEC FNP2000_AIC @@Ana05ID, @PriorityID, @Ana06ID, @EmployeeID, @PageNumber, @PageSize
*/

CREATE PROCEDURE [dbo].[FNP2000_AIC] 	
				@Ana05ID VARCHAR(50),
				@PriorityID VARCHAR(50), 
				@Ana06ID VARCHAR(50),
				@EmployeeID VARCHAR(50),
				@PageNumber INT,
				@PageSize INT

AS
DECLARE @WHERE varchar(max) = '', 
		@SQL varchar(max) = '',
		@TotalRow VARCHAR(50)

SET @TotalRow = ''
IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'


IF ISNULL(@Ana05ID,'')<>''
SET @WHERE = @WHERE + '
	AND Ana05ID = '''+@Ana05ID+''''

IF ISNULL(@PriorityID,'')<>''
SET @WHERE = @WHERE + '
	AND PriorityID = '''+@PriorityID+''''

IF ISNULL(@Ana06ID,'')<>''
SET @WHERE = @WHERE + '
	AND Ana06ID = '''+@Ana06ID+''''

IF ISNULL(@EmployeeID,'')<>''
SET @WHERE = @WHERE + '
	AND EmployeeID = '''+@EmployeeID+''''

SET @SQL = @SQL+'
SELECT JobName
,Amount
,NormID
,NormName
,PriorityID
,PriorityName
,EmployeeID
,EmployeeName
,Ana01ID
,Ana01Name
,Ana02ID
,Ana02Name
,Ana03ID
,Ana03Name
,Ana04ID
,Ana04Name
,Ana05ID
,Ana05Name
,Ana06ID
,Ana06Name
,Ana07ID
,Ana07Name
,Ana08ID
,Ana08Name
,Ana09ID
,Ana09Name
,Ana10ID
,Ana10Name FROM FNT2000_AIC 
WHERE 1=1 '+@WHERE+''

SET @SQL = @SQL+'
	OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
	FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '



GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
