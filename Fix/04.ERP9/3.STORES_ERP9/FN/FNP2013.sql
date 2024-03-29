IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[FNP2013]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[FNP2013]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load danh sách kế hoạch thu/chi (detail) chưa được kế thừa lập thu/chi thực tế
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created on 03/11/2018 by Bảo Anh
----Modify on 03/01/2019 by Như Hàn: Hiện tại AIC chưa làm phần duyệt, nên điều chỉnh store lấy dữ liệu chưa duyệt lên để test. Chỉnh sửa chỉ lấy từ dữ liệu tổng hợp
----Modify on
-- <Example>
/*  
 EXEC FNP2013 'AS','359B3973-3E52-4C92-85CB-2B603A6D3F93',1,20
*/
----
CREATE PROCEDURE FNP2013 ( 
        @DivisionID VARCHAR(50),
		@APK VARCHAR(MAX),
		@PageNumber INT,
        @PageSize INT
) 
AS

DECLARE @TotalRow VARCHAR(50),
		@sSQL VARCHAR (MAX),
		@sSQL1 VARCHAR (MAX),
		@sWhere NVARCHAR(MAX)
		
SET @TotalRow = ''
IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'

SET @sWhere = ''

SET @sSQL = '
SELECT	DivisionID, APK, APKDetail,
		ISNULL(OriginalAmount,0) - ISNULL(ActualOAmount,0) - ISNULL(ActualOAmount_T90,0) as EndOAmount,
		ISNULL(ConvertedAmount,0) - ISNULL(ActualCAmount,0) - ISNULL(ActualCAmount_T90,0) as EndCAmount
INTO #TAM
FROM
(
	SELECT	F01.DivisionID, F00.APK, F01.APK AS APKDetail,
			ISNULL(F01.ApprovalOAmount, F01.OriginalAmount) AS OriginalAmount, ISNULL(F01.ApprovalCAmount,F01.ConvertedAmount) AS ConvertedAmount,
			F11.ActualOAmount, F11.ActualCAmount, T90.ActualOAmount_T90, T90.ActualCAmount_T90
	FROM FNT2001 F01 WITH (NOLOCK)
	INNER JOIN FNT2000 F00 WITH (NOLOCK) ON F01.DivisionID = F00.DivisionID AND F01.APKMaster = F00.APK AND F00.DeleteFlag = 0 AND TypeID = ''TH''  --AND F00.Status = 1 
	LEFT JOIN	(Select DivisionID, InheritAPK, SUM(ActualOAmount) as ActualOAmount, SUM(ActualCAmount) as ActualCAmount
				From FNT2011 WITH (NOLOCK) 
				Where DivisionID = ''' + @DivisionID + ''' And Isnull(InheritAPK,'''') <> ''''
				Group by DivisionID, InheritAPK
				) F11 ON F01.DivisionID = F11.DivisionID And F01.APK = F11.InheritAPK
	LEFT JOIN	(Select DivisionID, InheritTransactionID, SUM(OriginalAmount) as ActualOAmount_T90, SUM(ConvertedAmount) as ActualCAmount_T90
				From AT9000 WITH (NOLOCK) 
				Where DivisionID = ''' + @DivisionID + ''' And ISNULL(InheritTableID,'''') = ''FNT2000'' And Isnull(InheritTransactionID,'''') <> ''''
				Group by DivisionID, InheritTransactionID
				) T90 ON F01.DivisionID = T90.DivisionID And F01.APK = T90.InheritTransactionID
	WHERE F01.DivisionID = ''' + @DivisionID + ''' AND F00.APK IN ( ''' + @APK + ''') --AND ISNULL(F01.StatusDetail,0) = 1
) A
WHERE ISNULL(OriginalAmount,0) - ISNULL(ActualOAmount,0) - ISNULL(ActualOAmount_T90,0) > 0'

SET @sSQL1 = '
SELECT	ROW_NUMBER() OVER (ORDER BY F01.JobName) AS RowNum, '+@TotalRow+' AS TotalRow,
		F01.APKMaster, F00.PriorityID, F20.PriorityName, F00.PayMentPlanDate AS PlanVoucherDate, F00.CurrencyID, F00.ExchangeRate, F00.Descriptions as Description,
		F00.PayMentTypeID, (SELECT Description FROM FNT0099 WITH (NOLOCK) WHERE CodeMaster = ''TransactionType'' AND ID = F00.PayMentTypeID) AS PayMentTypeName,
		F01.APK, F01.JobName, F01.ObjectProposalID, F01.ObjectBeneficiaryID,
		T02.ObjectName AS ObjectProposalName, T022.ObjectName AS ObjectBeneficiaryName,
		ISNULL(F01.ApprovalOAmount, F01.OriginalAmount) AS PlanOAmount, 
		ISNULL(F01.ApprovalCAmount,F01.ConvertedAmount) AS PlanCAmount, 
		#TAM.EndOAmount AS RemainOAmount, #TAM.EndCAmount AS RemainCAmount,
		F01.Ana01ID, F01.Ana02ID, F01.Ana03ID, F01.Ana04ID, F01.Ana05ID, F01.Ana06ID, F01.Ana07ID, F01.Ana08ID, F01.Ana09ID, F01.Ana10ID,
		A01.AnaName AS Ana01Name, A02.AnaName AS Ana02Name, A03.AnaName AS Ana03Name, A04.AnaName AS Ana04Name, A05.AnaName AS Ana05Name,
		A06.AnaName AS Ana06Name, A07.AnaName AS Ana07Name, A08.AnaName AS Ana08Name, A09.AnaName AS Ana09Name, A10.AnaName AS Ana10Name
FROM FNT2001 F01 WITH (NOLOCK)
INNER JOIN #TAM ON F01.DivisionID = #TAM.DivisionID And F01.APK = #TAM.APKDetail
INNER JOIN FNT2000 F00 WITH (NOLOCK) ON F01.DivisionID = F00.DivisionID AND F01.APKMaster = F00.APK AND TypeID = ''TH''
LEFT JOIN FNT1020 F20 WITH (NOLOCK) ON F00.PriorityID = F20.PriorityID
LEFT JOIN AT1202 T02 WITH (NOLOCK) ON F01.ObjectProposalID = T02.ObjectID
LEFT JOIN AT1202 T022 WITH (NOLOCK) ON F01.ObjectBeneficiaryID = T022.ObjectID
LEFT JOIN AT1011 A01 WITH (NOLOCK) ON F01.Ana01ID = A01.AnaID AND A01.AnaTypeID = ''A01''
LEFT JOIN AT1011 A02 WITH (NOLOCK) ON F01.Ana02ID = A02.AnaID AND A02.AnaTypeID = ''A02''
LEFT JOIN AT1011 A03 WITH (NOLOCK) ON F01.Ana03ID = A03.AnaID AND A03.AnaTypeID = ''A03''
LEFT JOIN AT1011 A04 WITH (NOLOCK) ON F01.Ana04ID = A04.AnaID AND A04.AnaTypeID = ''A04''
LEFT JOIN AT1011 A05 WITH (NOLOCK) ON F01.Ana05ID = A05.AnaID AND A05.AnaTypeID = ''A05''
LEFT JOIN AT1011 A06 WITH (NOLOCK) ON F01.Ana06ID = A06.AnaID AND A06.AnaTypeID = ''A06''
LEFT JOIN AT1011 A07 WITH (NOLOCK) ON F01.Ana07ID = A07.AnaID AND A07.AnaTypeID = ''A07''
LEFT JOIN AT1011 A08 WITH (NOLOCK) ON F01.Ana08ID = A08.AnaID AND A08.AnaTypeID = ''A08''
LEFT JOIN AT1011 A09 WITH (NOLOCK) ON F01.Ana09ID = A09.AnaID AND A09.AnaTypeID = ''A09''
LEFT JOIN AT1011 A10 WITH (NOLOCK) ON F01.Ana10ID = A10.AnaID AND A10.AnaTypeID = ''A10''

WHERE F01.DivisionID = ''' + @DivisionID + '''
ORDER BY F01.Orders'

SET @sSQL1 = @sSQL1+'
OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

--print @sSQL
--print @sSQL1
EXEC(@sSQL + @sSQL1)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
