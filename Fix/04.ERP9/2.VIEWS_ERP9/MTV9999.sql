IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTV9999]') AND OBJECTPROPERTY(ID, N'IsView') = 1)
DROP VIEW [DBO].[MTV9999]
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
----Created by: Nguyễn Thanh Sơn, date: 10/12/2013
-- <Example>
---- 

CREATE  VIEW [dbo].[MTV9999] AS
SELECT (CASE WHEN  TranMOnth <10 THEN '0'+RTRIM(LTRIM(STR(TranMonth)))+'/'+LTRIM(RTRIM(STR(TranYear))) 
	Else RTRIM(LTRIM(STR(TranMonth)))+'/'+LTRIM(RTRIM(STR(TranYear))) END) AS MonthYear,

	('0'+ LTRIM(RTRIM(CASE WHEN TranMonth %3 = 0 THEN TranMonth/3  ELSE TranMonth/3+1  END))+'/'+LTRIM(RTRIM(STR(TranYear)))
	)
	  AS [Quarter],

	TranMonth,
	TranYear,
	DivisionID, Closing
FROM MTT9999

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

