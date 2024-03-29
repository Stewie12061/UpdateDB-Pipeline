IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[LMP2062]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[LMP2062]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load Form LMF2062 - tab thông tin chi tiết (xem chi tiết giải chấp tài sản)
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created on 25/10/2017 by Bảo Anh
----Modify by Như Hàn on 03/06/2019: Sửa lại theo yêu cầu của dev, chỉ lấy UserID không có phần cộng ở đuôi
----Modify by ...
-- <Example>
/*  
	EXEC LMP2062 @DivisionID = 'AS', @UserID = 'ASOFTADMNIN', @VoucherID = 'ABCDEF'
*/
----
CREATE PROCEDURE [LMP2062] 
( 
	@DivisionID NVARCHAR(50),
	@UserID NVARCHAR(50),
	@VoucherID NVARCHAR(50)
) 
AS

DECLARE	@sSQL VARCHAR (MAX)

-- Lấy thông tin master
SET @sSQL = '
SELECT LMT2060.VoucherID, LMT2060.LoanVoucherID, LMT2001.VoucherNo	AS LoanVoucherNo, LMT2001.FromDate, LMT2001.ToDate, LMT2001.ConvertedAmount AS LoanConvertedAmount,
LMT2060.UnwindDate, LMT2060.Description,
LMT2060.CreateUserID CreateUserID, LMT2060.CreateDate, 
LMT2060.LastModifyUserID LastModifyUserID, LMT2060.LastModifyDate
FROM LMT2060 WITH (NOLOCK)
LEFT JOIN LMT2001 WITH (NOLOCK) ON LMT2060.DivisionID = LMT2001.DivisionID And LMT2060.LoanVoucherID = LMT2001.VoucherID
WHERE LMT2060.DivisionID = ''' + @DivisionID + '''
AND LMT2060.VoucherID = ''' + @VoucherID + ''''

--PRINT @sSQL
EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON