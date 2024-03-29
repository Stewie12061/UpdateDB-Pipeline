﻿IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SHMP1012]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[SHMP1012]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Xuất Excel danh mục Loại cổ phần
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Xuân Minh, Date: 02/10/2018
-- <Example>
---- 
/*-- <Example>
	EXEC SHMP1012 @DivisionID = 'AS', @UserID = 'ASOFTADMIN', @XML = 'B3DD9B7C-B110-4C26-9585-79A39EC28528'

	SHMP1012 @DivisionID, @UserID, @XML
----*/

CREATE PROCEDURE SHMP1012
( 
	 @DivisionID VARCHAR(50),
	 @UserID VARCHAR(50),
	 @XML XML
)

AS 
DECLARE @sSQL NVARCHAR (MAX) = N'',
		@LanguageID VARCHAR(50)

SELECT TOP 1 @LanguageID = ISNULL(LanguageID,'') FROM AT14051 WITH (NOLOCK) WHERE UserID = @UserID

CREATE TABLE #SHMP1012 (APK VARCHAR(50))
INSERT INTO #SHMP1012 (APK)
SELECT X.Data.query('APK').value('.', 'NVARCHAR(50)') AS APK
FROM @XML.nodes('//Data') AS X (Data)	

SET @sSQL = @sSQL + N'
SELECT SHMT1010.DivisionID, SHMT1010.ShareTypeID, SHMT1010.ShareTypeName,SHMT1010.PreferentialDescription,
SHMT1010.TransferCondition,ED03.Description as SharedKindName, SHMT1010.LimitTransferYear,
'+CASE WHEN ISNULL(@LanguageID,'') = 'vi-VN' THEN 'ED01.Description' ELSE 'ED01.DescriptionE' END+' AS IsCommon, 
'+CASE WHEN ISNULL(@LanguageID,'') = 'vi-VN' THEN 'ED02.Description' ELSE 'ED02.DescriptionE' END+' AS [Disabled]
FROM SHMT1010 WITH (NOLOCK)
INNER JOIN #SHMP1012 ON SHMT1010.APK = #SHMP1012.APK 
LEFT JOIN AT0099 ED01 WITH (NOLOCK) ON SHMT1010.IsCommon = ED01.ID AND ED01.CodeMaster = ''AT00000004''
LEFT JOIN AT0099 ED02 WITH (NOLOCK) ON SHMT1010.[Disabled] = ED02.ID AND ED02.CodeMaster = ''AT00000004''
LEFT JOIN AT0099 ED03 WITH (NOLOCK) ON SHMT1010.SharedKind =ED03.ID AND ED03.CodeMaster = ''AT00000053''
ORDER BY SHMT1010.ShareTypeID'
--PRINT(@sSQL)
EXEC (@sSQL)


   
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
