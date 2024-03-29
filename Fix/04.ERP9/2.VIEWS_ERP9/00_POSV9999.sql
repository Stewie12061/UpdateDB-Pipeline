IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSV9999]') AND OBJECTPROPERTY(ID, N'IsView') = 1)
DROP VIEW [DBO].[POSV9999]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Format định dạng các kì kế toán: kì, quý
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoang vu, date: 20/03/2014
-- <Example>
---- 

CREATE  VIEW [dbo].[POSV9999] AS
SELECT (CASE WHEN  TranMOnth <10 THEN '0'+RTRIM(LTRIM(STR(TranMonth)))+'/'+LTRIM(RTRIM(STR(TranYear))) 
	Else RTRIM(LTRIM(STR(TranMonth)))+'/'+LTRIM(RTRIM(STR(TranYear))) END) AS MonthYear,

	('0'+ LTRIM(RTRIM(CASE WHEN TranMonth %3 = 0 THEN TranMonth/3  ELSE TranMonth/3+1  END))+'/'+LTRIM(RTRIM(STR(TranYear)))
	)
	  AS [Quarter],	TranMonth,	TranYear,	DivisionID, Closing, Disabled
FROM POST9999

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO



