IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP3018]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP3018]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
--- In báo cáo {Aging Metro} hay {Báo cáo công nợ phải thu metro}=> Khách hàng OKIA
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Phan thanh hoang vu on 04/01/2018: Chờ QA bên CON để hoàn thiện báo cáo load dữ liệu
----Example: EXEC POSP3018 'HCM',NULL, '', 1, '', '2018-01-01 00:00:00.000', '2018-01-03 00:00:00.000',  null,null,null
 CREATE PROCEDURE POSP3018 (
		 @DivisionID VARCHAR(50),
		 @DivisionIDList NVARCHAR(2000),
		 @ShopID NVARCHAR(50),
		 @ShopIDList NVARCHAR(2000),
		 @IsDate TINYINT, --0:Datetime; 1:Period
		 @PeriodIDList NVARCHAR(MAX),
		 @FromDate DATETIME,
		 @ToDate DATETIME,
		 @RefVoucherNo NVARCHAR(50),		--Số phiếu đặt cọc
		 @VoucherNo NVARCHAR(250) = null,	--Số phiếu bán hàng/đổi hàng/trả hàng
		 @UserID NVARCHAR(250) = Null)
AS
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
		@TotalRow VARCHAR(50),
		@CustomerName INT

	CREATE Table #CustomerName (CustomerName INT, ImportExcel int)
	INSERT #CustomerName EXEC AP4444
	SET @CustomerName = (SELECT TOP 1 CustomerName FROM #CustomerName)

	SET @sWhere = ''
	
	--IF Isnull(@PeriodID, '') != '' 
	--	SET @sWhere = @sWhere + ' AND (Case When  M.TranMonth <10 then ''0''+rtrim(ltrim(str(M.TranMonth)))+''/''+ltrim(Rtrim(str(M.TranYear))) 
	--						Else rtrim(ltrim(str(M.TranMonth)))+''/''+ltrim(Rtrim(str(M.TranYear))) End) IN ('''+@PeriodID+''')'

	--Check Para DivisionIDList null then get DivisionID 
	IF Isnull(@DivisionIDList, '')!=''
		SET @sWhere = @sWhere + ' AND M.DivisionID IN ('''+@DivisionIDList+''')'
	Else 
		SET @sWhere = @sWhere + ' AND M.DivisionID = N'''+ @DivisionID+''''		
	
	IF Isnull(@ShopIDList, '')!=''
		SET @sWhere = @sWhere + ' AND ISNULL(M.ShopID,'''') IN ('''+@ShopIDList+''')'
	Else
		SET @sWhere = @sWhere + ' AND ISNULL(M.ShopID,'''') = N'''+ @ShopID+''''		

	IF Isnull(@RefVoucherNo, '')!=''
		SET @sWhere = @sWhere + ' AND ISNULL(M.VoucherNo,'''') LIKE N''%'+@RefVoucherNo+'%'' '
	
	IF Isnull(@VoucherNo, '')!=''
		SET @sWhere = @sWhere + ' AND (ISNULL(M.VoucherNo,'''') LIKE N''%'+@VoucherNo+'%''or ISNULL(M.PVoucherNo,'''') LIKE N''%'+@VoucherNo+'%''or ISNULL(M.CVoucherNo,'''') LIKE N''%'+@VoucherNo+'%'')'
	
	
	IF @CustomerName = 87
	Begin
		SET @sSQL = ' SELECT  
						 ''HCM'' as DivisionID
						, ''Chi nhánh 3 - Hồ Chí Minh'' as DivisionName
						, ''CH-HCM001'' as ShopID
						, ''Cửa hàng HCM001'' as ShopName
						,  ''2018-01-03 00:00:00.000'' as OBVoucherDate	
						, ''PBH/01/2018/002'' as OBVoucherNo	
						, ''1000000'' as OBAmount	
						, '''' as STVoucherDate	
						, '''' as STVoucherNo	
						, '''' as STAmount	
						, '''' as SCVoucherDate	
						, '''' as SCVoucherNo	
						, '''' as SCAmount	
						, '''' as SCDeductBas	
						, '''' as CBVoucherDate	
						, '''' as CBVoucherNo	
						, '''' as CBAmount	
						, '''' as OrderNo	
						, '''' as DeliveryDate	
						, '''' as DueDate	
						, '''' as paymentDate	
						, '''' as STATUSNAME	
						, '''' as CurrentAmount	
						, '''' as PASTDUEDAY	
						, '''' as PASTDUE1_30	
						, '''' as PASTDUE31_60	
						, '''' as PASTDUE61_90	
						, '''' as PASTDUEOVER90
					Union all
					SELECT  
						 ''HCM'' as DivisionID
						, ''Chi nhánh 3 - Hồ Chí Minh'' as DivisionName
						, ''CH-HCM001'' as ShopID
						, ''Cửa hàng HCM001'' as ShopName
						,  ''2018-01-03 00:00:00.000'' as OBVoucherDate	
						, ''PBH/01/2018/002'' as OBVoucherNo	
						, ''3000000'' as OBAmount	
						, '''' as STVoucherDate	
						, '''' as STVoucherNo	
						, '''' as STAmount	
						, '''' as SCVoucherDate	
						, '''' as SCVoucherNo	
						, '''' as SCAmount	
						, '''' as SCDeductBas	
						, '''' as CBVoucherDate	
						, '''' as CBVoucherNo	
						, '''' as CBAmount	
						, '''' as OrderNo	
						, '''' as DeliveryDate	
						, '''' as DueDate	
						, '''' as paymentDate	
						, '''' as STATUSNAME	
						, '''' as CurrentAmount	
						, '''' as PASTDUEDAY	
						, '''' as PASTDUE1_30	
						, '''' as PASTDUE31_60	
						, '''' as PASTDUE61_90	
						, '''' as PASTDUEOVER90
					Union all
					SELECT  
						 ''HN'' as DivisionID
						, ''Công Ty TNHH Thiết Bị Chăm Sóc Sức Khỏe Toàn Cầu'' as DivisionName
						, ''10S1107'' as ShopID
						, ''Khách hàng hệ thống Metro Thăng Long (outside)'' as ShopName
						,  ''2018-01-03 00:00:00.000'' as OBVoucherDate	
						, ''PBH/01/2018/002'' as OBVoucherNo	
						, ''4000000'' as OBAmount	
						, '''' as STVoucherDate	
						, '''' as STVoucherNo	
						, '''' as STAmount	
						, '''' as SCVoucherDate	
						, '''' as SCVoucherNo	
						, '''' as SCAmount	
						, '''' as SCDeductBas	
						, '''' as CBVoucherDate	
						, '''' as CBVoucherNo	
						, '''' as CBAmount	
						, '''' as OrderNo	
						, '''' as DeliveryDate	
						, '''' as DueDate	
						, '''' as paymentDate	
						, '''' as STATUSNAME	
						, '''' as CurrentAmount	
						, '''' as PASTDUEDAY	
						, '''' as PASTDUE1_30	
						, '''' as PASTDUE31_60	
						, '''' as PASTDUE61_90	
						, '''' as PASTDUEOVER90
					'
	End
	EXEC (@sSQL)
	
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
