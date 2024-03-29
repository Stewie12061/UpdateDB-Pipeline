IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CRMP30061]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[CRMP30061]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- In bao cao Thống kê cơ hội theo khu vực - CRMR3006
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---- Create on 27/06/2017 by Phan thanh hoàng vũ
--- Modify by Thị Phượng, Date 04/07/2017: Bổ sung phân quyền
--- Modify by Hoàng vũ, Date 25/09/2018: Convert chuyển lấy dữ liệu khách hàng CRM (CRMT10101)-> Khách hàng POS (POST0011)
--- Modify by Anh Đô, Date 02/11/2022: Chỉnh sửa điều kiện lọc
-- <Example> EXEC CRMP30061 'AS', 'AS'',''GS'',''GC', 0, '2017-01-01', '2017-06-30', '06/2017', '', '', '', '', '' , 'PHUONG'', ''QUI'', ''QUYNH'', ''VU'

CREATE PROCEDURE [dbo].[CRMP30061] (
				@DivisionID			NVARCHAR(50),	--Biến môi trường
				@DivisionIDList		NVARCHAR(MAX),	--Giá trị truyền Dropdown đơn vị
				@IsDate				TINYINT,		--1: Theo ngày; 0: Theo kỳ
				@FromDate			DATETIME, 
				@ToDate				DATETIME, 
				@PeriodIDList		NVARCHAR(2000),
				@EmployeeID			NVARCHAR(MAX),
				@AreaID				NVARCHAR(MAX),
				@UserID				NVARCHAR(50),
				@ConditionOpportunityID nvarchar(max),	--Biến môi trường
				@FromAreaID			NVARCHAR(MAX) = '',
				@ToAreaID			NVARCHAR(MAX) = '',
				@FromEmployeeID		NVARCHAR(MAX) = '',
				@ToEmployeeID		NVARCHAR(MAX) = ''
				)
AS
BEGIN
	DECLARE @sSQL NVARCHAR(MAX),
			@sWHERE NVARCHAR(MAX),
			@sWHERE1 NVARCHAR(MAX),
			@sFROM nvarchar(500),
			@sSELECT nvarchar(500),
			@sGROUPBY nvarchar(500)
	SET @sWHERE = ''
	SET @sWHERE1 = ''
	Set @sFROM = ''
	Set @sSELECT = ''

	--Search theo đơn vị @DivisionIDList trống thì lấy biến môi trường @DivisionID
	IF Isnull(@DivisionIDList, '') != ''
		SET @sWHERE = @sWHERE + ' M.DivisionID IN ('''+@DivisionIDList+''', ''@@@'')'
	ELSE 
		SET @sWHERE = @sWHERE + ' M.DivisionID IN ('''+@DivisionID+''', ''@@@'')'


	--Search theo điều điện thời gian
	IF @IsDate = 1	
		SET @sWHERE = @sWHERE +' AND (CONVERT(VARCHAR(10),M.CreateDate,112) BETWEEN'''+ CONVERT(VARCHAR(20),@FromDate,112)+''' AND''' + CONVERT(VARCHAR(20),@ToDate,112) +''')'
	ELSE
	Begin
		SET @sWHERE = @sWHERE +' AND M.Period IN ('''+@PeriodIDList+''')'
	End
	
	--Search theo khu vực (Dữ liệu khách hàng nhiều nên dùng control từ khu vực, đến khu vực)
	IF Isnull(@FromAreaID, '')!= '' and Isnull(@ToAreaID, '') = ''
		SET @sWHERE = @sWHERE + ' AND M.AreaID > = N'''+@FromAreaID +''''
	ELSE IF Isnull(@FromAreaID, '') = '' and Isnull(@ToAreaID, '') != ''
		SET @sWHERE = @sWHERE + ' AND M.AreaID < = N'''+@ToAreaID +''''
	ELSE IF Isnull(@FromAreaID, '') != '' and Isnull(@ToAreaID, '') != ''
		SET @sWHERE = @sWHERE + ' AND M.AreaID Between N'''+@FromAreaID+''' AND N'''+@ToAreaID+''''
	ELSE IF ISNULL(@AreaID, '') != ''
		SET @sWHERE = @sWHERE + ' AND M.AreaID IN ('''+ @AreaID +''')'

	--Search theo người bán hàng (Dữ liệu khách hàng nhiều nên dùng control từ người bán hàng, đến người bán hàng)
	IF Isnull(@FromEmployeeID, '')!= '' and Isnull(@ToEmployeeID, '') = ''
		SET @sWHERE = @sWHERE + ' AND M.EmployeeID > = N'''+@FromEmployeeID +''''
	ELSE IF Isnull(@FromEmployeeID, '') = '' and Isnull(@ToEmployeeID, '') != ''
		SET @sWHERE = @sWHERE + ' AND M.EmployeeID < = N'''+@ToEmployeeID +''''
	ELSE IF Isnull(@FromEmployeeID, '') != '' and Isnull(@ToEmployeeID, '') != ''
		SET @sWHERE = @sWHERE + ' AND M.EmployeeID Between N'''+@FromEmployeeID+''' AND N'''+@ToEmployeeID+''''
	ELSE IF ISNULL(@EmployeeID, '') != ''
		SET @sWHERE = @sWHERE + ' AND M.EmployeeID IN (SELECT Value FROM [dbo].StringSplit('''+ @EmployeeID +''', '',''))'

	--Phần quyền xem dữ liệu
	IF Isnull(@ConditionOpportunityID, '') != ''
		SET @sWhere1 = @sWhere1 + 'AND CRMT20501.AssignedToUserID in (N'''+@ConditionOpportunityID+''' )'

	SET @sSQL = ' Select M.DivisionID, M.DivisionName, M.EmployeeID, AT1103.FullName as EmployeeName, M.AreaID, AT1003.AreaName
						, Count(M.OpportunityID) as Quantity, Sum(M.Amount) as Amount
				  From  
						( Select   CRMT20501.DivisionID, AT1101.DivisionName, OpportunityID
								 , (Case When  Month(CRMT20501.CreateDate) <10 then ''0''+rtrim(ltrim(str(Month(CRMT20501.CreateDate))))+''/''
										+ltrim(Rtrim(str(Year(CRMT20501.CreateDate)))) Else rtrim(ltrim(str(Month(CRMT20501.CreateDate))))+''/''
										+ltrim(Rtrim(str(Year(CRMT20501.CreateDate)))) End) as Period, CRMT20501.CreateDate 
								 , Isnull(CRMT20501.AssignedToUserID, CRMT20501.CreateUserID) as EmployeeID
								 , CRMT20501.AccountID
								 , Isnull(CRMT20501.AreaID, POST0011.BillPostalCode) as AreaID
								 , Isnull(ExpectAmount, 0) as Amount
						 From CRMT20501  WITH (NOLOCK) Left join AT1101 WITH (NOLOCK) on AT1101.DivisionID = CRMT20501.DivisionID
										Left join POST0011 WITH (NOLOCK) on CRMT20501.AccountID = POST0011.MemberID	
						Where 1 =1 ' + @sWHERE1 + ' 								  
						) M Left join AT1003 WITH (NOLOCK) on M.AreaID = AT1003.AreaID
							Left join AT1103 WITH (NOLOCK) on M.EmployeeID = AT1103.EmployeeID
				  Where ' + @sWHERE + ' 
				  Group by M.DivisionID, M.DivisionName, M.EmployeeID, AT1103.FullName, M.AreaID, AT1003.AreaName 
				  Order by M.DivisionID, M.AreaID, M.EmployeeID '
	EXEC (@sSQL)
	
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
