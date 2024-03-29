IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[KPIP20006]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[KPIP20006]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load lưới cho Form Tính kết quả thực hiện chỉ tiêu KPI KPIF2006
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created on 25/02/2019 by Bảo Anh
--- Modified on
-- <Example> EXEC KPIP20006 @DivisionID=N'NTY',@APKMaster=NULL,@APKDetail = 'A1534382-CFF7-4A4E-B54F-8C0E3CA3AEF4',@DateName = '1/2019',@FormulaDes='@T003/@T001 + 8*@T008'

CREATE PROCEDURE KPIP20006
(
	  @DivisionID VARCHAR(50),
	  @APKMaster VARCHAR(50),
	  @APKDetail VARCHAR(50),
	  @DateName VARCHAR(50),
	  @FormulaDes VARCHAR(50)
)
AS

IF EXISTS (SELECT 1 FROM KPIT20006 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND APKMaster = @APKMaster AND APKDetail = @APKDetail AND [DateName] = @DateName)
	SELECT K1.Orders, K1.ParameterID, K2.ParameterName, K1.Value
	FROM KPIT20006 K1 WITH (NOLOCK)
	LEFT JOIN KPIT10441 K2 WITH (NOLOCK) ON SUBSTRING(K1.ParameterID, CHARINDEX('@', K1.ParameterID) + 1, LEN(K1.ParameterID)) = K2.ParameterID
	WHERE K1.DivisionID = @DivisionID AND K1.APKMaster = @APKMaster AND K1.APKDetail = @APKDetail AND K1.[DateName] = @DateName
	ORDER BY K1.Orders
ELSE
	SELECT ROW_NUMBER() OVER(ORDER BY ParameterID) AS Orders, A.*, NULL AS Value
	FROM
	(
		SELECT * FROM dbo.[GetParameterList] (@FormulaDes)
	) A



GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
