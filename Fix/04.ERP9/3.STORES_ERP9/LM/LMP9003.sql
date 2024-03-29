IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[LMP9003]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[LMP9003]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




-- <Summary>
---- Load chứng từ kế toán được chọn qua màn hình gọi kế thừa
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created on 25/07/2017 by Bảo Anh
----Modify on
-- <Example>
/*  
 EXEC LMP9003 'AS','ABCD,DEFG'
*/
----
CREATE PROCEDURE LMP9003 ( 
        @DivisionID VARCHAR(50),
		@TransactionIDList VARCHAR(MAX)
) 
AS

DECLARE @sSQL VARCHAR (MAX),
		@sWhere VARCHAR(MAX),
		@SalesAnaTypeID_00 VARCHAR(50),
		@CostAnaTypeID_00 VARCHAR(50),
		@SalesAnaTypeID VARCHAR(50),
		@CostAnaTypeID VARCHAR(50)
		
SELECT @SalesAnaTypeID_00 = ISNULL(SalesAnaTypeID,''), @CostAnaTypeID_00 = ISNULL(CostAnaTypeID,'')
FROM AT0000 WITH (NOLOCK) WHERE DefDivisionID = @DivisionID


SELECT @SalesAnaTypeID = REPLACE(@SalesAnaTypeID_00,'A','Ana') + 'ID', @CostAnaTypeID = REPLACE(@CostAnaTypeID_00,'A','Ana') + 'ID'

SET @sWhere = ''
SET @TransactionIDList = REPLACE(@TransactionIDList,',',''',''')

SET @sSQL = '
SELECT	T90.VoucherID, T90.TransactionID, T90.VoucherDate, T90.VDescription, T90.ExchangeRate, T90.DebitAccountID, T90.CreditAccountID, T90.TDescription,
		'+ CASE WHEN ISNULL(@SalesAnaTypeID_00,'') = '' THEN '''''' ELSE 'T90.' + @SalesAnaTypeID + ''END +' as SalesTypeID, 
		'+ CASE WHEN ISNULL(@CostAnaTypeID_00,'') = '' THEN '''''' ELSE 'T90.' + @CostAnaTypeID + ''END +' as CostTypeID,
		--T90.' + @CostAnaTypeID + ' as CostTypeID,
		A11.AnaName as SalesTypeName, A12.AnaName as CostTypeName,
		T90.OriginalAmount, T90.ConvertedAmount
FROM AT9000 T90 WITH (NOLOCK)
LEFT JOIN AT1011 A11 WITH (NOLOCK) ON '+ CASE WHEN ISNULL(@SalesAnaTypeID_00,'') = '' THEN '''''' ELSE 'T90.' + @SalesAnaTypeID + ''END +' = A11.AnaID And A11.AnaTypeID = ''' + @SalesAnaTypeID_00 + '''
LEFT JOIN AT1011 A12 WITH (NOLOCK) ON '+ CASE WHEN ISNULL(@CostAnaTypeID_00,'') = '' THEN '''''' ELSE 'T90.' + @CostAnaTypeID + ''END +' = A12.AnaID And A12.AnaTypeID = ''' + @CostAnaTypeID_00 + '''
WHERE T90.DivisionID = ''' + @DivisionID + ''' AND T90.TransactionID in (''' + @TransactionIDList + ''')
ORDER BY T90.VoucherDate, T90.VoucherNo, T90.Orders'

--print @sSQL
EXEC(@sSQL)




GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
