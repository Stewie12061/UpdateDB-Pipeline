IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'CIP12622') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE CIP12622
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Grid Form CIF1262 In Danh muc khuyến mãi hóa đơn
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 16/08/2016
-- <Example>
----EXEC CIP12622 'AS','KMHD01', null
----
CREATE PROCEDURE CIP12622 ( 
          @DivisionID VARCHAR(50),
		  @PromoteID nvarchar(100), 
		  @UserID  VARCHAR(50)
) 
AS 
Begin
		Select	CIT0108.APK, Case when CIT0108.DivisionID = '@@@' then '' else CIT0108.DivisionID end as DivisionID
			, CIT0108.PromoteID, CIT0108.PromoteName
			, CIT0108.FromDate, CIT0108.ToDate, CIT0108.Description, CIT0108.IsCommon, CIT0108.Disabled
			, AT0109.FromValues, AT0109.ToValues, AT0109.DiscountPercent, AT0109.DiscountAmount, AT0109.Notes
			, AT0109.O01ID, AT0109.O02ID, AT0109.O03ID, AT0109.O04ID, AT0109.O05ID
			, CIT0108.CreateDate, CIT0108.CreateUserID, CIT0108.LastModifyDate, CIT0108.LastModifyUserID
		From CIT0108 WITH (NOLOCK) Left join AT0109 WITH (NOLOCK) on CIT0108.PromoteID = AT0109.PromoteID
		WHERE  CIT0108.DivisionID = @DivisionID and CIT0108.PromoteID = @PromoteID
		Order by CIT0108.PromoteID, AT0109.OrderNo
			
End