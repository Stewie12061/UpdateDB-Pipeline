IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[LMP2071]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[LMP2071]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load Edit Form LMF2072 Cập nhật gia hạn hợp đồng bảo lãnh
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by Tiểu Mai on 24/10/2017:
-- <Example>
/*  
 EXEC LMP2071 'AS','ABCD',1,0,1,8
 EXEC LMP2071 'AS','ABCD',1,1,1,8
*/
---- LMT2051
CREATE PROCEDURE LMP2071 ( 
        @DivisionID NVARCHAR(50),
		@VoucherID NVARCHAR(50),
		@IsViewDetail TINYINT,	--- 0: màn hình edit, 1: màn hình view
		@Type TINYINT,			--- 0: Load master và Thông tin bổ sung, 1: Detail(Phí)
		@PageNumber INT,
        @PageSize INT		
) 
AS

DECLARE @ProjectAnaTypeID varchar(50),
		@ContractAnaTypeID varchar(50),
		@CostAnaTypeID varchar(50),
		@sSQL VARCHAR (MAX),
		@sSQL1 VARCHAR (MAX),
		@sSQL2 VARCHAR (MAX),
		@TotalRow VARCHAR(50)

SET @TotalRow = ''
IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'

SELECT	@ProjectAnaTypeID = ISNULL(ProjectAnaTypeID,''),
		@ContractAnaTypeID = ISNULL(ContractAnaTypeID,''),
		@CostAnaTypeID = ISNULL(CostAnaTypeID,'')
FROM AT0000 WITH (NOLOCK) WHERE DefDivisionID = @DivisionID

IF @Type = 0
	BEGIN
		SET @sSQL = '
		SELECT		T02.*, L11.VoucherNo as GuaranteeVoucherNo, T04.CurrencyName
		FROM		LMT2051 T02 WITH (NOLOCK)
		LEFT JOIN	LMT2051 L11 WITH (NOLOCK) ON T02.DivisionID  = L11.DivisionID AND T02.GuaranteeVoucherID = L11.VoucherID
		LEFT JOIN	AT1004 T04 WITH (NOLOCK) ON T02.CurrencyID = T04.CurrencyID
		WHERE		T02.DivisionID = ''' + @DivisionID + '''
		AND	T02.VoucherID = ''' + @VoucherID + ''''		
	END
ELSE
	BEGIN
		if(@IsViewDetail = 1)
	begin
		SET @sSQL1 = '
		SELECT		ROW_NUMBER() OVER (ORDER BY T02.Orders) AS RowNum, '+@TotalRow+' AS TotalRow,
					T02.*, A01.AnaName as CostTypeName, case when T02.CostID = 0 then N''Phí bảo lãnh'' else N''Phí khác'' end as CostDescription
		FROM		LMT2052 T02 WITH (NOLOCK)
		LEFT JOIN	AT1011 A01 WITH (NOLOCK) ON T02.CostTypeID = A01.AnaID And A01.AnaTypeID = ''' + @CostAnaTypeID + '''
		WHERE		T02.DivisionID = ''' + @DivisionID + '''
		AND	T02.VoucherID = ''' + @VoucherID + '''
		ORDER BY	T02.Orders'	
		end
	
	else
	begin
	SET @sSQL1 = '
		SELECT		
					T02.*, A01.AnaName as CostTypeName, case when T02.CostID = 0 then N''Phí bảo lãnh'' else N''Phí khác'' end as CostDescription
		FROM		LMT2052 T02 WITH (NOLOCK)
		LEFT JOIN	AT1011 A01 WITH (NOLOCK) ON T02.CostTypeID = A01.AnaID And A01.AnaTypeID = ''' + @CostAnaTypeID + '''
		WHERE		T02.DivisionID = ''' + @DivisionID + '''
		AND	T02.VoucherID = ''' + @VoucherID + '''
		ORDER BY	T02.Orders'	
	end
	END

IF @IsViewDetail = 1
BEGIN
	SET @sSQL1 = @sSQL1+'
	OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
	FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
END

--PRINT @sSQL
--PRINT @sSQL1
--PRINT @sSQL2

EXEC (@sSQL)
EXEC (@sSQL1)
EXEC (@sSQL2)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON