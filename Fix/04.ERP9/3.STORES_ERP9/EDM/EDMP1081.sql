﻿IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[EDMP1081]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[EDMP1081]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Xuất Excel danh mục Feeling
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Hồng Thảo, Date: 25/08/2018
-- <Example>
---- 
/*-- <Example>
	EDMP1081 @DivisionID = 'VF', @UserID = 'ASOFTADMIN', @XML = 'ACA2816E-0903-4126-885C-387AB959408E'
	

	EDMP1081 @DivisionID, @UserID, @XML
----*/

CREATE PROCEDURE EDMP1081
( 
	 @DivisionID VARCHAR(50),
	 @UserID VARCHAR(50),
	 @XML XML
)


AS 
DECLARE @sSQL NVARCHAR (MAX) = N'',
		@LanguageID VARCHAR(50)

SELECT TOP 1 @LanguageID = ISNULL(LanguageID,'') FROM AT14051 WITH (NOLOCK) WHERE UserID = @UserID

CREATE TABLE #EDMP1081 (APK VARCHAR(50))
INSERT INTO #EDMP1081 (APK)
SELECT X.Data.query('APK').value('.', 'NVARCHAR(50)') AS APK
FROM @XML.nodes('//Data') AS X (Data)	

SET @sSQL = @sSQL + N'
SELECT EDMT1080.DivisionID, EDMT1080.FeelingID, EDMT1080.FeelingName,
'+CASE WHEN ISNULL(@LanguageID,'') = 'vi-VN' THEN 'T01.Description' ELSE 'T01.DescriptionE' END+' AS IsCommon, 
'+CASE WHEN ISNULL(@LanguageID,'') = 'vi-VN' THEN 'T02.Description' ELSE 'T02.DescriptionE' END+' AS [Disabled]
FROM EDMT1080 WITH (NOLOCK)
INNER JOIN #EDMP1081 ON EDMT1080.APK = #EDMP1081.APK
LEFT JOIN EDMT0099 T01 WITH (NOLOCK) ON EDMT1080.IsCommon = T01.ID AND T01.CodeMaster = ''Disabled''
LEFT JOIN EDMT0099 T02 WITH (NOLOCK) ON EDMT1080.[Disabled] = T02.ID AND T02.CodeMaster = ''Disabled''
ORDER BY EDMT1080.FeelingID'

--PRINT(@sSQL)
EXEC (@sSQL)


   
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO