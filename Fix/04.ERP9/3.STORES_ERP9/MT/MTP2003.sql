IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP2003]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP2003]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Thanh Sơn on 13/02/2014
-- <Example>
/*
    EXEC MTP2003 'EIS','','10198'
*/

 CREATE PROCEDURE MTP2003
(
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@StudentID VARCHAR(50)
)
AS
SELECT M20.*,
M1.[Description] AS SourceName1, M1.DescriptionE AS SourceName1E,
M2.[Description] AS SourceName2, M2.DescriptionE AS SourceName2E,
M3.[Description] AS SourceName3, M3.DescriptionE AS SourceName3E
FROM MTT2000 M20
LEFT JOIN MTT0099 M1 ON M1.ID = M20.Source1 AND M1.CodeMaster = 'SourceID'
LEFT JOIN MTT0099 M2 ON M2.ID = M20.Source2 AND M2.CodeMaster = 'SourceID'
LEFT JOIN MTT0099 M3 ON M3.ID = M20.Source3 AND M3.CodeMaster = 'SourceID'
WHERE M20.StudentID = @StudentID

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
