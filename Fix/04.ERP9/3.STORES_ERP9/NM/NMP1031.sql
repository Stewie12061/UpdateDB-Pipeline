﻿IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[NMP1031]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[NMP1031]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Xuất Excel danh mục định mức
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Trà Giang, Date: 25/08/2018
-- <Example>
---- 
/*-- <Example>
	NMP1031 @DivisionID = 'VF', @UserID = 'ASOFTADMIN', @XML = 'ACA2816E-0903-4126-885C-387AB959408E'
	

	NMP1031 @DivisionID, @UserID, @XML
----*/

CREATE PROCEDURE NMP1031
( 
	 @DivisionID VARCHAR(50),
	 @UserID VARCHAR(50),
	 @XML XML
)


AS 
DECLARE @sSQL NVARCHAR (MAX) = N'',
		@LanguageID VARCHAR(50)

SELECT TOP 1 @LanguageID = ISNULL(LanguageID,'') FROM AT14051 WITH (NOLOCK) WHERE UserID = @UserID

CREATE TABLE #NMP1031 (APK VARCHAR(50))
INSERT INTO #NMP1031 (APK)
SELECT X.Data.query('APK').value('.', 'NVARCHAR(50)') AS APK
FROM @XML.nodes('//Data') AS X (Data)	

SET @sSQL = @sSQL + N'


	NMT1030.APK, NMT1030.DivisionID,NMT1030.QuotaNutritionID, NMT1030.QuotaNutritionName,NMT1030.MenuTypeID,NMT1030.Description,
	NMT1030.Disabled, NMT1030.IsCommon
,NMT1031.SystemName, NMT1031.QuotaStandard, NMT1031.MinRatio,NMT1031.MaxRatio FROM NMT1030 WITH (NOLOCK)
INNER JOIN #NMP1031 ON NMT1030.APK = #NMP1031.APK
INNER JOIN NMT1031 WITH (NOLOCK) ON NMT1030.APK = NMT1031.APKMaster 
ORDER BY NMT1030.QuotaNutritionID
'

--PRINT(@sSQL)
EXEC (@sSQL)


   
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
