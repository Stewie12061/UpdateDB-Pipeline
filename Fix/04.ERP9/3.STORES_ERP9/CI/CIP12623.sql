IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'CIP12623') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE CIP12623
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Grid Form CIF1262 chi tiết khuyến mãi hóa đơn
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 16/08/2016
----Modified by: Hoài Bảo, Date: 07/06/2022 - Bổ sung load thông tin hàng khuyến mãi và số lượng
-- <Example>
----EXEC CIP12623 'AS','KMHD01', null, 1,10
----
CREATE PROCEDURE CIP12623 ( 
          @DivisionID VARCHAR(50),
		  @PromoteID nvarchar(100), 
		  @UserID  VARCHAR(50),
		  @PageNumber INT,
		  @PageSize INT	
) 
AS 
Begin
		Select  ROW_NUMBER() OVER (ORDER BY AT0109.PromoteID, AT0109.OrderNo) AS RowNum, Count(*) OVER() AS TotalRow
		, AT0109.APK, AT0109.DivisionID, AT0109.PromoteID, AT0109.PromoteName, AT0109.FromDate
		, AT0109.ToDate, AT0109.Description, AT0109.IsCommon, AT0109.Disabled, AT0109.OrderNo
		, AT0109.FromValues, AT0109.ToValues, AT0109.DiscountPercent, AT0109.DiscountAmount
		, AT0109.Notes, AT0109.CreateUserID, AT0109.CreateDate, AT0109.LastModifyUserID
		, AT0109.LastModifyDate, AT0109.InventoryTypeID, AT0109.O01ID, AT0109.O02ID
		, AT0109.O03ID, AT0109.O04ID, AT0109.O05ID, AT1302.InventoryID, AT1302.InventoryName, AT0109.PromoteQuantity
		From AT0109 WITH (NOLOCK)
		Left join AT1302 WITH (NOLOCK) ON AT0109.InventoryID = AT1302.InventoryID
		Where AT0109.PromoteID = @PromoteID
		ORDER BY AT0109.PromoteID, AT0109.OrderNo
		OFFSET (@PageNumber-1)* @PageSize ROWS
		FETCH NEXT @PageSize ROWS ONLY 
			
End