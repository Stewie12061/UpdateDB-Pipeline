IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[LMP2024]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[LMP2024]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load Edit Form LMF2024 Cập nhật lịch trả nợ
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created on 15/07/2017 by Bảo Anh
----Modify on
-- <Example>
/*  
 EXEC LMP2024 'AS','ABCD'
*/
----
CREATE PROCEDURE LMP2024 ( 
        @DivisionID VARCHAR(50),
		@TransactionID VARCHAR(50)		
) 
AS 
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
		@TotalRow VARCHAR(50),
		@CostAnaTypeID varchar(50)
   
SELECT @CostAnaTypeID = ISNULL(CostAnaTypeID,'') FROM AT0000 WITH (NOLOCK) WHERE DefDivisionID = @DivisionID 
    
SET @sSQL = N'
	SELECT 	T22.*, T21.VoucherNo as DisburseVoucherNo, T01.VoucherNo as CreditVoucherNo,
			Convert(varchar(20),T21.FromDate,103) + '' - '' + Convert(varchar(20),T21.ToDate,103) as FromToDate,
			T21.OriginalAmount as DisburseOriginalAmount, T21.ConvertedAmount as DisburseConvertedAmount,
			T10.BankID, T16.BankName, A11.AnaName as CostTypeName, T99.Description as PaymentTypeName, T04.CurrencyName
	FROM LMT2022 T22 WITH (NOLOCK)
	LEFT JOIN LMT2021 T21 WITH (NOLOCK) ON T22.DivisionID = T21.DivisionID And T22.DisburseVoucherID = T21.VoucherID
	LEFT JOIN LMT2001 T01 WITH (NOLOCK) ON T01.DivisionID = T21.DivisionID And T01.VoucherID = T21.CreditVoucherID
	LEFT JOIN LMT1010 T10 WITH (NOLOCK) ON T01.DivisionID = T10.DivisionID And T01.LimitVoucherID = T10.VoucherID
	LEFT JOIN (Select Distinct BankID, BankName From AT1016 WITH (NOLOCK) Where DivisionID in (''@@@'',''' + @DivisionID + ''') And Disabled = 0) T16 ON T10.BankID = T16.BankID
	LEFT JOIN AT1011 A11 WITH (NOLOCK) ON T22.CostTypeID = A11.AnaID And A11.AnaTypeID = ''' + @CostAnaTypeID + '''
	LEFT JOIN LMT0099 T99 WITH (NOLOCK) ON T22.PaymentType = T99.OrderNo And T99.CodeMaster = ''LMT00000010''
	LEFT JOIN	AT1004 T04 WITH (NOLOCK) ON T22.CurrencyID = T04.CurrencyID
	WHERE T22.DivisionID = ''' + @DivisionID + ''' And T22.TransactionID = ''' + @TransactionID + '''
	ORDER BY T22.PaymentDate'

EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON