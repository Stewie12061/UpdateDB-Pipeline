IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[BEMP2007]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[BEMP2007]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




-- <Summary>
---- Load Grid: màn hình kế thừa đề nghị công tác
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
----
-- <History>
----Created by Trọng Kiên on 16/06/2020
-- <Example>
---- 
/*-- <Example>
    BEMP2021 @DivisionID = 'AIC', @UserID = '', @PageNumber = 1, @PageSize = 25, @ROrderID = 'sfasdf'
    BEMP2021 @DivisionID, @UserID, @PageNumber, @PageSize, @ROrderID

----*/

CREATE PROCEDURE [dbo].[BEMP2007]
( 
     @DivisionID VARCHAR(50),
     @UserID VARCHAR(50),
     @PageNumber INT,
     @PageSize INT,	 
     @APKMaster NVARCHAR(MAX)
)
AS 
DECLARE @sSQL NVARCHAR(MAX) = N'',
        @sWhere NVARCHAR(MAX) = N'',
        @TotalRow NVARCHAR(50) = N'',
        @OrderBy NVARCHAR(500) = N'',
        @sJoin NVARCHAR(MAX) =N''

SET @OrderBy = 'B2.CreateDate DESC'
SET @sWhere = ''

SET @sSQL = @sSQL + N'
    SELECT  B1.APK, B4.VoucherNo, B1.APKMaster, B1.DivisionID, B1.CreateDate, B1.CostAnaID, B1.DepartmentAnaID, A1.AnaName AS CostAnaName, A2.AnaName AS DepartmentAnaName, B1.Description, B1.RingiNo
            , B1.InvoiceNo, B1.InvoiceDate, B1.FeeID, B3.FeeName, B4.CurrencyID, A3.CurrencyName, B4.ExchangeRate, B1.RequestAmount, B4.AdvanceUserID AS ObjectID, A4.ObjectName, A4.Address AS ObjectAddress
            , B1.RequestAmount
                - SUM(ISNULL(IIF(ISNULL(B5.Status, 0) = 0, B5.RequestAmount, 0), 0))
                - SUM(ISNULL(IIF(ISNULL(B5.Status, 0) = 1, B5.SpendAmount, 0), 0))
                AS RemainingAmount
    INTO #TempBEMT2007
    FROM BEMT2001 B1 WITH (NOLOCK)
        LEFT JOIN BEMT2000 B4 WITH (NOLOCK) ON B4.APK = B1.APKMaster
        LEFT JOIN AT1011 A1 WITH (NOLOCK) ON A1.AnaID = B1.CostAnaID
        LEFT JOIN AT1011 A2 WITH (NOLOCK) ON A2.AnaID = B1.DepartmentAnaID
        LEFT JOIN BEMT1000 B3 WITH (NOLOCK) ON B3.FeeID = B1.FeeID
        LEFT JOIN AT1004 A3 WITH (NOLOCK) ON A3.CurrencyID = B4.CurrencyID
        LEFT JOIN AT1202 A4 WITH (NOLOCK) ON A4.ObjectID = B4.AdvanceUserID
        LEFT JOIN BEMT2001 B5 WITH (NOLOCK) ON B5.APKDInherited = B1.APK
    WHERE ISNULL(B1.DeleteFlg, 0) = 0 AND ' + @sWhere +   ' B1.DivisionID = ''' + @DivisionID + '''	
          AND CONVERT(VARCHAR(50), B1.APKMaster) IN (' + @APKMaster + ')
    GROUP BY B1.APK, B4.VoucherNo, B1.APKMaster, B1.DivisionID, B1.CreateDate, B1.CostAnaID, B1.DepartmentAnaID, A1.AnaName, A2.AnaName, B1.Description, B1.RingiNo
            , B1.InvoiceNo, B1.InvoiceDate, B1.FeeID, B3.FeeName, B4.CurrencyID, A3.CurrencyName, B4.ExchangeRate, B1.RequestAmount, B4.AdvanceUserID, A4.ObjectName
            , A4.Address, B1.RequestAmount

    DECLARE @Count INT
    SELECT @Count = COUNT (*) FROM #TempBEMT2007

    SELECT ROW_NUMBER() OVER (ORDER BY ' + @OrderBy + ') AS RowNum, @Count AS TotalRow
            , B2.APK
            , B2.VoucherNo
            , B2.CreateDate
            , B2.CostAnaID
            , B2.CostAnaName
            , B2.DepartmentAnaID
            , B2.DepartmentAnaName
            , B2.Description
            , B2.RingiNo
            , B2.InvoiceNo
            , B2.InvoiceDate
            , B2.FeeID
            , B2.FeeName
            , B2.CurrencyID
            , B2.CurrencyName
            , B2.ExchangeRate
            , B2.RemainingAmount
            , B2.RequestAmount
            , B2.ObjectID
            , B2.ObjectName
            , B2.ObjectAddress

    FROM #TempBEMT2007 B2
    ORDER BY ' + @OrderBy + '
    OFFSET ' + STR((@PageNumber - 1) * @PageSize) + ' ROWS
    FETCH NEXT ' + STR(@PageSize) + ' ROWS ONLY '

    EXEC (@sSQL)
    PRINT(@sSQL)


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
