IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP2014]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP2014]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- <Summary>
--- Load chi tiết đóng học phí (EIS)
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Thanh Sơn on 06/03/2014
---- Modified by Bảo Thy on 30/05/2016: Bổ sung WITH (NOLOCK)
-- <Example>
/*
    EXEC MTP2014 'AS','','H1-AHA-001','A01PK1BSA8-1-3-13'    ---H1-KXU-001,H4-TNG-001
*/

 CREATE PROCEDURE MTP2014
(
     @DivisionID VARCHAR(50),
     @UserID VARCHAR(50),
     @StudentID VARCHAR(50),
     @ClassID VARCHAR(50)
 )    
AS
IF NOT EXISTS (SELECT TOP 1 1 FROM AT9000 WITH (NOLOCK) WHERE ObjectID = @StudentID AND Ana06ID = @ClassID AND CreditAccountID LIKE '3388' AND DebitAccountID LIKE '1311')
-- kiểm tra xem học viên đóng học phí theo nhiều đợt hay một đợt - Nếu là một đợt
	BEGIN 
		SELECT  ROW_NUMBER() OVER (ORDER BY VoucherDate DESC) AS RowNum, SUM(ConvertedAmount) AS Amount, SUM(ConvertedAmount) AS Paid, 0.00000000 AS Remaining, VoucherNo, VoucherDate,
		SUM(ConvertedAmount) AS ConvertedAmount, BDescription
		FROM AT9000 WITH (NOLOCK)
		WHERE ObjectID = @StudentID
		AND ISNULL(Ana06ID,'') LIKE @ClassID
		AND (CreditAccountID LIKE '5113%' OR CreditAccountID LIKE '51111%' OR CreditAccountID LIKE '51112%')
		AND DebitAccountID LIKE '136%'
		GROUP BY VoucherNo, VoucherDate, BDescription
	END 
ELSE		
	BEGIN
		SELECT  ROW_NUMBER() OVER (ORDER BY VoucherDate DESC) AS RowNum, A.*, A3.VoucherNo, A3.VoucherDate, A3.ConvertedAmount, A3.[VDescription] BDescription FROM 		
		(SELECT A1.ObjectID, A1.Ana06ID, A1.ConvertedAmount AS Amount, SUM (A2.ConvertedAmount) AS Paid, A1.ConvertedAmount - SUM (A2.ConvertedAmount) AS Remaining
		FROM AT9000 A1 WITH (NOLOCK)
		LEFT JOIN AT9000 A2 WITH (NOLOCK) ON A2.ObjectID = A1.ObjectID AND A2.Ana06ID = A1.Ana06ID
		AND A2.CreditAccountID LIKE '1311' AND A2.DebitAccountID LIKE '136%'
		WHERE A1.ObjectID = @StudentID
		AND ISNULL(A1.Ana06ID,'') = @ClassID
		AND A1.CreditAccountID LIKE '3388' AND A1.DebitAccountID LIKE '1311'
		GROUP BY A1.ConvertedAmount, A1.ObjectID, A1.Ana06ID)A 
		LEFT JOIN AT9000 A3 WITH (NOLOCK) ON A3.ObjectID = A.ObjectID AND A3.Ana06ID = A.Ana06ID
		AND A3.CreditAccountID LIKE '1311' AND A3.DebitAccountID LIKE '136%'
		ORDER BY A3.VoucherDate DESC
	END



GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

