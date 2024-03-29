IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[LMP2011]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[LMP2011]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load Edit Form LMF2011 Phong tỏa/ Giải tỏa TK ký quỹ
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created on 10/07/2017 by Bảo Anh
----Modify by Tiểu Mai on 03/11/2017: Bổ sung @Type để load lần lượt từng menu
----Modify by Đình Hoà on 30/06/2020: Join thêm bảng để lấy dữ liệu TranMonth, TranYear
-- <Example>
/*  
 EXEC LMP2011 'AS','', 0
 EXEC LMP2011 'AS','', 1
*/
----
CREATE PROCEDURE LMP2011 ( 
        @DivisionID VARCHAR(50),
		@VoucherID VARCHAR(50),
		@Type TINYINT		--- 0: Thông tin chung, thông tin bổ sung, hệ thống
							--- 1: Hợp đồng tiền gửi
) 
AS

DECLARE @CostAnaTypeID varchar(50),
		@SalesAnaTypeID varchar(50)

SELECT	@CostAnaTypeID = ISNULL(CostAnaTypeID,''),
		@SalesAnaTypeID = ISNULL(SalesAnaTypeID,'')
FROM AT0000 WITH (NOLOCK) WHERE DefDivisionID = @DivisionID


IF ISNULL(@Type,0) = 0
BEGIN
	SELECT	
	T11.APK,T11.DivisionID,T11.VoucherID,T11.TranMonth,T11.TranYear,T11.CreditVoucherID,T11.AdvanceDate,T11.AdvanceTypeID
	,T11.AdvancePercent,T11.OriginalAmount,T11.ConvertedAmount,T11.CostTypeID,T11.SalesTypeID,T11.Description,T11.RelatedToTypeID
	,T11.InheritTableName,T11.InheritVoucherID,T11.InheritTransactionID,T11.CreateUserID,T11.CreateDate,T11.LastModifyUserID,T11.LastModifyDate
	,T11.GuaranteeValue,T11.FromDateGuarantee,T11.ToDateGuarantee,T11.AssignObjectID,T11.Parameter01,T11.Parameter02,T11.Parameter03
	,T11.Parameter04,T11.Parameter05,T11.Parameter06,T11.Parameter07,T11.Parameter08,T11.Parameter09,T11.Parameter10,T11.Parameter11
	,T11.Parameter12,T11.Parameter13,T11.Parameter14,T11.Parameter15,T11.Parameter16,T11.Parameter17,T11.Parameter18,T11.Parameter19,T11.Parameter20
	,T11.ProjectID, T01.VoucherNo as CreditVoucherNo, A12.ObjectName AS AssignObjectName, T99.Description as AdvanceTypeName, 
	--T01.FromDate AS FromDateGuarantee, 
	--T01.ToDate AS ToDateGuarantee,
	T01.OriginalAmount as OriginalGuaranteeValue, 
	--T01.ConvertedAmount AS GuaranteeValue,
	A01.AnaName as CostTypeName, A02.AnaName as SalesTypeName, T99.Description as StatusName,
	T03.FullName as CreateUserName, T031.FullName as LastModifyUserName,
	T13.ConvertedAmount BlockadedAmount ,---- Giá trị phong tỏa 
	T13.ConvertedAmount BlockCAmount,
	ISNULL(T13.ConvertedAmount,0) - ISNULL(T12.InheritConvertedAmount,0) BlockadedAmountExtant, ---- Giá trị phong tỏa còn lại
	ISNULL(T12.InheritConvertedAmount,0) RelieveAmount ---- Giá trị đã giải tỏa
	FROM		LMT2011 T11 WITH (NOLOCK)
	LEFT JOIN LMT2051 T01 WITH (NOLOCK) ON T11.DivisionID = T01.DivisionID And T11.CreditVoucherID = T01.VoucherID
	LEFT JOIN LMT0099 T99 WITH (NOLOCK) ON T11.AdvanceTypeID = T99.OrderNo AND CodeMaster = 'LMT00000005'
	LEFT JOIN AT1202 A12 WITH (NOLOCK) ON A12.ObjectID = T11.AssignObjectID
	LEFT JOIN AT1011 A01 WITH (NOLOCK) ON Isnull(T11.CostTypeID,'') = A01.AnaID And A01.AnaTypeID = @CostAnaTypeID
	LEFT JOIN AT1011 A02 WITH (NOLOCK) ON Isnull(T11.SalesTypeID,'') = A02.AnaID And A02.AnaTypeID = @SalesAnaTypeID
	LEFT JOIN AT1103 T03 WITH (NOLOCK) ON T01.CreateUserID = T03.EmployeeID
	LEFT JOIN AT1103 T031 WITH (NOLOCK) ON T01.LastModifyUserID = T031.EmployeeID
	LEFT JOIN (Select DivisionID, CreditVoucherID, SUM(ConvertedAmount) AS InheritConvertedAmount 
           From LMT2011 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND ISNULL(AdvanceTypeID,0) = 1 
           Group by DivisionID, CreditVoucherID
) T12 ON T11.DivisionID = T12.DivisionID AND T11.CreditVoucherID = T12.CreditVoucherID
	LEFT JOIN (Select DivisionID, CreditVoucherID, SUM(ConvertedAmount) AS ConvertedAmount 
           From LMT2011 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND ISNULL(AdvanceTypeID,0) = 0
           Group by DivisionID, CreditVoucherID
) T13 ON T11.DivisionID = T13.DivisionID AND T11.CreditVoucherID = T13.CreditVoucherID
	WHERE		T11.DivisionID = @DivisionID
	AND			T11.VoucherID = @VoucherID
END
ELSE
BEGIN
	--Join thêm LMT2011 để lấy TranMonth, TranYear
	SELECT		T12.*, T11.TranMonth, T11.TranYear,A02.BankName
	FROM		
	LMT2011 T11 WITH (NOLOCK)
	LEFT JOIN LMT2012 T12 WITH (NOLOCK) ON T11.DivisionID = T12.DivisionID AND T11.VoucherID = T12.VoucherID
	LEFT JOIN (SELECT DISTINCT BankID, BankName FROM AT1016 A02 WITH (NOLOCK) ) A02 ON A02.BankID  = T12.BankID
	WHERE		T12.DivisionID = @DivisionID
	AND			T12.VoucherID = @VoucherID
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON