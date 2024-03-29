IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CRMV99999]') AND OBJECTPROPERTY(ID, N'IsView') = 1)
DROP VIEW [DBO].[CRMV99999]
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
----Created by: Phan thanh hoang vu, date: 11/12/2015
-- <Example>
---- 

CREATE VIEW [dbo].[CRMV99999] 
AS 
--SELECT (CASE WHEN TranMonth <10 THEN '0'+rtrim(ltrim(str(TranMonth)))+'/'+ltrim(Rtrim(str(TranYear))) 
--		ELSE rtrim(ltrim(str(TranMonth)))+'/'+ltrim(Rtrim(str(TranYear))) END) AS MonthYear,
--		CASE WHEN ISNULL(AT1101.StartDate,'01/01/1900') = '01/01/1900' THEN
--			('0'+ ltrim(rtrim(CASE WHEN TranMonth %3 = 0 THEN TranMonth/3 ELSE TranMonth/3+1 END))+
--			'/'+ltrim(Rtrim(str(TranYear))))
--		else
--			(case when TranMonth >= Month(AT1101.StartDate) then '0' + ltrim((TranMonth - Month(AT1101.StartDate))/3+1) + '/' + ltrim(TranYear)
--			else '0' + ltrim((TranMonth + PeriodNum - Month(AT1101.StartDate))/3+1) + '/' + ltrim(TranYear-1)
--			end) end as Quarter, TranMonth, TranYear, CRMT99999.DivisionID, CRMT99999.Closing 
--FROM CRMT99999 Inner join AT1101 On CRMT99999.DivisionID = AT1101.DivisionID And AT1101.[Disabled] = 0

--Load Combo/Dropdownchecklist chọn kỳ: 

Select DISTINCT  CRMV99999.MonthYear, CRMV99999.TranMonth , CRMV99999.TranYear, CRMV99999.DivisionID

From 

	(SELECT MonthYear, TranMonth , TranYear, DivisionID	FROM OV9999

	 Union all

	 SELECT MonthYear, TranMonth , TranYear, DivisionID	FROM WV9999 where DivisionID !='%'

	) CRMV99999


