 IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP00121]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP00121]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Grid Form POSP00121 View hàng khuyến mãi

-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ Date: 31/03/2014
-- <Example>
----    EXEC POSP00121 'KC','BIGC','IP5S-32','1','25'
----
CREATE PROCEDURE POSP00121 ( 
        @DivisionID VARCHAR(50), 
		@ShopID varchar(50),
		@InventoryID varchar(50),   
        @PageNumber INT,
        @PageSize INT
) 
AS 
 DECLARE @sSQL NVARCHAR (MAX)
		 
 SET @sSQL = '
 Select ROW_NUMBER() OVER (ORDER BY A.PromoteID) AS RowNum, COUNT(*) OVER () AS TotalRow, 
		A.PromoteID, A.InventoryID,B.PromoteInventoryID,  C.InventoryName, C.UnitID,
		(CASE WHEN ISNULL(A.PromoteTypeID, 1) = 1 THEN N''Theo so luong'' ELSE N''Theo phan tram'' END) as PromoteTypeID, 
		A.FromDate,  A.ToDate, A.FromQuantity,  A.ToQuantity, B.PromoteQuantity,   B.PromotePercent
 From POST0010 P Left join AT1328 A on P.DivisionID = A.DivisionID AND P.PromoteID = A.PromoteID 
				 inner join AT1338 B on A.DivisionID = B.DivisionID and A.VoucherID=B.VoucherID
			   left join AT1302 C on B.DivisionID = C.DivisionID AND B.PromoteInventoryID = C.InventoryID
 Where A.DivisionID ='''+@DivisionID + ''' AND P.ShopID = '''+ @ShopID+''' and A.InventoryID ='''+@InventoryID+''' and A.Disabled =0
 order by A.PromoteID
OFFSET '+STR((@PageNumber-1)*@PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
EXEC (@sSQL)