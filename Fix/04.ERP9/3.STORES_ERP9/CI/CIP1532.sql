IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP1532]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CIP1532]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load master chi tiết ví chiết khấu khuyến mãi
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Nhật Thanh, Date: 27/04/2023
-- <Example>
---- 
/*
*/

CREATE PROCEDURE CIP1532
( 
	@DivisionID VARCHAR(50),
	@APK nvarchar(50)
) 
AS 
DECLARE @sSQL NVARCHAR(MAX),
        @TotalRow NVARCHAR(50)

		SET @sSQL = '
SELECT 	MAX(C30.APK) APK, C30.ObjectID, C30.ObjectName, SUM(CASE WHEN ISNULL(KindDiscountID,0)=2 THEN -DiscountValue WHEN ISNULL(IsAvailable,0)=1 THEN DiscountValue ELSE 0 END) SumDiscountValue, 
	SUM(CASE WHEN ISNULL(KindDiscountID,0)=2 THEN -DiscountRate WHEN ISNULL(IsAvailable,0)=1 THEN DiscountRate ELSE 0 END) SumDiscountRate--, STRING_AGG(InventoryGiftName,'', '') AS ListInventoryGiftName
FROM CIT1530 C30
WHERE DivisionID like ''%'+@DivisionID+'%'' AND ObjectID like ''%'+@APK+'%''
GROUP BY C30.ObjectID, C30.ObjectName
ORDER BY C30.ObjectID'

EXEC (@sSQL)
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

