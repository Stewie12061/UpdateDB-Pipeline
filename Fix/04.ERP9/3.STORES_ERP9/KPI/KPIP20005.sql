IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[KPIP20005]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[KPIP20005]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load lưới cho Form Cập nhật kết quả KPI KPIF2004
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created om 25/02/2019 by Bảo Anh
--- Modified on
-- <Example> EXEC KPIP20005 @DivisionID=N'NTY',@APKEvaluationSetID='A1534382-CFF7-4A4E-B54F-8C0E3CA3AEF4',@APKMaster = NULL
--- EXEC KPIP20005 @DivisionID=N'NTY',@APKEvaluationSetID=NULL,@APKMaster = 'A1534382-CFF7-4A4E-B54F-8C0E3CA3AEF4'

CREATE PROCEDURE KPIP20005
(
	  @DivisionID VARCHAR(50),  
	  @APKEvaluationSetID VARCHAR(50),
	  @APKMaster VARCHAR(50)
)
AS

IF @APKEvaluationSetID IS NOT NULL	--- load lưới khi addnew
BEGIN
	SELECT	M.DivisionID, '' as APKMaster, '' AS APK, M.TargetsID, M.TargetsName,
			M.TargetsGroupID, Cast(K1.OrderNo as varchar(200)) + ' - ' + K1.TargetsGroupName as TargetsGroupName, M.TargetsGroupPercentage,
			M.UnitKpiID, K4.UnitKpiName, M.FormulaName, M.FrequencyID, A992.Description as FrequencyName,
			M.SourceID, K3.SourceName, M.Categorize, A991.Description as CategorizeName, M.TargetsPercentage,
			M.Revenue, M.GoalLimit, M.Benchmark, M.OrderNo, 0 as PerformTotal, 0 as PerformPointTotal, 0 AS PerformPercent,
			'' AS DateName1, '' AS DateName2, '' AS DateName3, '' AS DateName4, '' AS DateName5, '' AS DateName6, '' AS DateName7,
			'' AS DateName8, '' AS DateName9, '' AS DateName10, '' AS DateName11, '' AS DateName12, '' AS DateName13, '' AS DateName14, '' AS DateName15,
			0 AS Perform1, 0 AS Perform2, 0 AS Perform3, 0 AS Perform4, 0 AS Perform5, 0 AS Perform6, 0 AS Perform7, 0 AS Perform8,
			0 AS Perform9, 0 AS Perform10, 0 AS Perform11, 0 AS Perform12, 0 AS Perform13, 0 AS Perform14, 0 AS Perform15,
			0 AS PerformPoint1, 0 AS PerformPoint2, 0 AS PerformPoint3, 0 AS PerformPoint4, 0 AS PerformPoint5, 0 AS PerformPoint6, 0 AS PerformPoint7,
			0 AS PerformPoint8, 0 AS PerformPoint9, 0 AS PerformPoint10, 0 AS PerformPoint11, 0 AS PerformPoint12, 0 AS PerformPoint13, 0 AS PerformPoint14, 0 AS PerformPoint15,
			K5.FormulaID, K6.FormulaDes
	FROM KPIT10702 M WITH (NOLOCK)
	LEFT JOIN AT0099 A991 WITH (NOLOCK) on M.Categorize = A991.ID and A991.CodeMaster ='AT00000041'
	LEFT JOIN AT0099 A992 WITH (NOLOCK) on M.FrequencyID = A992.ID and A992.CodeMaster ='AT00000042'
	LEFT JOIN KPIT10101 K1 WITH (NOLOCK) on M.TargetsGroupID = K1.TargetsGroupID
	LEFT JOIN KPIT10301 K3 WITH (NOLOCK) on M.SourceID = K3.SourceID 
	LEFT JOIN KPIT10401 K4 WITH (NOLOCK) on M.UnitKpiID = K4.UnitKpiID 
	LEFT JOIN KPIT10501 K5 WITH (NOLOCK) on M.TargetsID = K5.TargetsID
	LEFT JOIN KPIT10471 K6 WITH (NOLOCK) ON K5.FormulaID = K6.FormulaID
	WHERE M.DivisionID = @DivisionID AND M.APKMaster =@APKEvaluationSetID
	ORDER BY K1.OrderNo, K5.OrderNo
END
ELSE	--- load lưới khi edit
BEGIN
	SELECT	M.DivisionID, M.APKMaster, M.APK, M.TargetsID, M.TargetsName,
			M.TargetsGroupID, Cast(K1.OrderNo as varchar(200)) + ' - ' + K1.TargetsGroupName as TargetsGroupName, M.TargetsGroupPercentage,
			M.UnitKpiID, K4.UnitKpiName, M.FormulaName, M.FrequencyID, A992.Description as FrequencyName,
			M.SourceID, K3.SourceName, M.Categorize, A991.Description as CategorizeName, M.TargetsPercentage,
			M.Revenue, M.GoalLimit, M.Benchmark, M.OrderNo, M.PerformTotal, M.PerformPointTotal, M.PerformPercent,
			T.DateName1, T.DateName2, T.DateName3, T.DateName4, T.DateName5, T.DateName6, T.DateName7, T.DateName8,
			T.DateName9, T.DateName10, T.DateName11, T.DateName12, T.DateName13, T.DateName14, T.DateName15,
			T.Perform1, T.Perform2, T.Perform3, T.Perform4, T.Perform5, T.Perform6, T.Perform7, T.Perform8,
			T.Perform9, T.Perform10, T.Perform11, T.Perform12, T.Perform13, T.Perform14, T.Perform15,
			T.PerformPoint1, T.PerformPoint2, T.PerformPoint3, T.PerformPoint4, T.PerformPoint5, T.PerformPoint6, T.PerformPoint7,
			T.PerformPoint8, T.PerformPoint9, T.PerformPoint10, T.PerformPoint11, T.PerformPoint12, T.PerformPoint13, T.PerformPoint14, T.PerformPoint15,
			K5.FormulaID, K6.FormulaDes, M.APKMaster APK20003, M.APK APK20004
	FROM KPIT20004 M WITH (NOLOCK)
	LEFT JOIN KPIT20005 T WITH (NOLOCK) ON M.APK = T.APKDetail AND M.APKMaster = T.APKMaster
	LEFT JOIN AT0099 A991 WITH (NOLOCK) on M.Categorize = A991.ID and A991.CodeMaster ='AT00000041'
	LEFT JOIN AT0099 A992 WITH (NOLOCK) on M.FrequencyID = A992.ID and A992.CodeMaster ='AT00000042'
	LEFT JOIN KPIT10101 K1 WITH (NOLOCK) on M.TargetsGroupID = K1.TargetsGroupID
	LEFT JOIN KPIT10301 K3 WITH (NOLOCK) on M.SourceID = K3.SourceID
	LEFT JOIN KPIT10401 K4 WITH (NOLOCK) on M.UnitKpiID = K4.UnitKpiID 
	LEFT JOIN KPIT10501 K5 WITH (NOLOCK) on M.TargetsID = K5.TargetsID
	LEFT JOIN KPIT10471 K6 WITH (NOLOCK) ON K5.FormulaID = K6.FormulaID
	WHERE M.DivisionID = @DivisionID AND M.APKMaster = @APKMaster
	ORDER BY K1.OrderNo, K5.OrderNo
END




GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
