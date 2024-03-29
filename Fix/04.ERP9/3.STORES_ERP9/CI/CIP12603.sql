IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'CIP12603') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE CIP12603
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Grid Form CIF1260 In Danh muc khuyến mãi hóa đơn
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 16/08/2016
-- <Example>
----EXEC CIP12603 'AS','AS'',''GS'',''TB',null, null,'2016-01-01 00:00:00.000','2016-12-12 00:00:00.000',null,null,null, null
----
CREATE PROCEDURE CIP12603 ( 
          @DivisionID VARCHAR(50),  --Biến môi trường
		  @DivisionIDList NVARCHAR(2000),  --Chọn trong DropdownChecklist DivisionID
          @PromoteID nvarchar(100), 
		  @PromoteName nvarchar(50),
		  @FromDate Datetime, 
		  @Todate Datetime, 
		  @Description nvarchar(250),
		  @DisabledName nvarchar(50),
		  @IsCommonName nvarchar(50),
		  @UserID  VARCHAR(50)
) 
AS 
Begin
		DECLARE @sSQL NVARCHAR (MAX),
				@sWhere NVARCHAR(MAX)
			SET @sWhere = ''
	
			--Check DivisionIDList null then get DivisionID 
			IF @DivisionIDList IS NULL or @DivisionIDList = ''
				SET @sWhere = @sWhere + ' (CIT0108.DivisionID = '''+ @DivisionID+''' or CIT0108.IsCommon = 1)'
			Else 
				SET @sWhere = @sWhere + ' (CIT0108.DivisionID IN ('''+@DivisionIDList+''') or CIT0108.IsCommon = 1)'
		
			IF isnull(@PromoteID, '') != ''
				SET @sWhere = @sWhere +  'AND ISNULL(CIT0108.PromoteID,'''') LIKE N''%'+@PromoteID+'%'' '
			IF isnull(@PromoteName, '') != ''
				SET @sWhere = @sWhere + ' AND ISNULL(CIT0108.PromoteName, '''') LIKE N''%'+@PromoteName+'%'' '
			IF Isnull(@FromDate, '') !=''
				SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10),CIT0108.FromDate,112) >='+CONVERT(VARCHAR(10),@FromDate,112)
			IF Isnull(@ToDate, '') != ''
				SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10),CIT0108.ToDate,112) <='+CONVERT(VARCHAR(10),@ToDate,112)
			IF isnull(@Description, '') != ''
				SET @sWhere = @sWhere + ' AND ISNULL(CIT0108.Description, '''') LIKE N''%'+@Description+'%'' '
			IF Isnull(@DisabledName, '') != ''
				SET @sWhere = @sWhere + ' AND ISNULL(CIT0108.Disabled,0) ='+@DisabledName
			IF isnull(@IsCommonName, '') != ''
				SET @sWhere = @sWhere + ' AND ISNULL(CIT0108.IsCommon,0) = '+@IsCommonName

			SET @sSQL = '	Select	  CIT0108.APK
									, Case when CIT0108.DivisionID = ''@@@'' then '''' else CIT0108.DivisionID end as DivisionID
									, CIT0108.PromoteID, CIT0108.PromoteName
									, CIT0108.FromDate, CIT0108.ToDate, CIT0108.Description, CIT0108.IsCommon, CIT0108.Disabled
									, AT0109.FromValues, AT0109.ToValues, AT0109.DiscountPercent, AT0109.DiscountAmount, AT0109.Notes
									, AT0109.O01ID, AT0109.O02ID, AT0109.O03ID, AT0109.O04ID, AT0109.O05ID
									, CIT0108.CreateDate, CIT0108.CreateUserID, CIT0108.LastModifyDate, CIT0108.LastModifyUserID
								From CIT0108 WITH (NOLOCK) Left join AT0109 WITH (NOLOCK) on CIT0108.PromoteID = AT0109.PromoteID
								WHERE '+@sWhere + ' Order by CIT0108.PromoteID, AT0109.OrderNo'
	
			EXEC (@sSQL)
			
End