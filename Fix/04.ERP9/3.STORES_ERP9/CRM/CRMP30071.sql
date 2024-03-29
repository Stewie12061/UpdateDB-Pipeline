IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CRMP30071]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[CRMP30071]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- In bao cao Thống kê cơ hội theo lĩnh vực - CRMR3007
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
-- <Example> EXEC CRMP30071 'HCM', 'AS'',''GS'',''GC', 1, '2017-01-01', '2017-06-30', '06/2017', '', '', '', '',  '' , 'PHUONG'', ''QUI'', ''QUYNH'', ''VU'

CREATE PROCEDURE [dbo].[CRMP30071] (
				@DivisionID				NVARCHAR(50),	--Biến môi trường
				@DivisionIDList			NVARCHAR(MAX),	--Giá trị truyền Dropdown đơn vị
				@IsDate					TINYINT,		--1: Theo ngày; 0: Theo kỳ
				@FromDate				DATETIME, 
				@ToDate					DATETIME, 
				@PeriodIDList			NVARCHAR(2000),
				@BusinessLinesID		NVARCHAR(MAX),
				@EmployeeID				NVARCHAR(MAX),
				@UserID					NVARCHAR(50),
				@ConditionOpportunityID nvarchar(max),	--Biến môi trường
				@FromBusinessLinesID	NVARCHAR(MAX) = '',
				@ToBusinessLinesID		NVARCHAR(MAX) = '',
				@FromEmployeeID			NVARCHAR(MAX) = '',
				@ToEmployeeID			NVARCHAR(MAX) = ''
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
		SET @sWHERE = @sWHERE + ' AND M.DivisionID IN ('''+@DivisionIDList+''', ''@@@'')'
	ELSE 
		SET @sWHERE = @sWHERE + ' AND M.DivisionID IN ('''+@DivisionID+''', ''@@@'')'

	--Search theo điều điện thời gian
	IF @IsDate = 1	
		SET @sWHERE =  @sWHERE + ' AND (CONVERT(VARCHAR(10),M.CreateDate,112) BETWEEN'''+ CONVERT(VARCHAR(20),@FromDate,112)+''' AND''' + CONVERT(VARCHAR(20),@ToDate,112) +''')'
	ELSE
		SET @sWHERE =  @sWHERE + ' AND M.Period IN ('''+@PeriodIDList+''')'
	
	--Search theo lĩnh vực (Dữ liệu khách hàng nhiều nên dùng control từ lĩnh vực, đến lĩnh vực)
	IF Isnull(@FromBusinessLinesID, '')!= '' and Isnull(@ToBusinessLinesID, '') = ''
		SET @sWHERE = @sWHERE + ' AND M.BusinessLinesID > = N'''+@FromBusinessLinesID +''''
	ELSE IF Isnull(@FromBusinessLinesID, '') = '' and Isnull(@ToBusinessLinesID, '') != ''
		SET @sWHERE = @sWHERE + ' AND M.BusinessLinesID < = N'''+@ToBusinessLinesID +''''
	ELSE IF Isnull(@FromBusinessLinesID, '') != '' and Isnull(@ToBusinessLinesID, '') != ''
		SET @sWHERE = @sWHERE + ' AND M.BusinessLinesID Between N'''+@FromBusinessLinesID+''' AND N'''+@ToBusinessLinesID+''''
	ELSE IF ISNULL(@BusinessLinesID, '') != ''
		SET @sWHERE = @sWHERE + ' AND M.BusinessLinesID IN ('''+ @BusinessLinesID +''')'

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
		SET @sWhere1 = @sWhere1 + ' AND ISNULL(CRMT20501.AssignedToUserID,CRMT20501.CreateUserID) in (N'''+@ConditionOpportunityID+''' )'

	SET @sSQL = ' Select M.DivisionID, M.DivisionName, M.EmployeeID, AT1103.FullName as EmployeeName
						, M.BusinessLinesID, CRMT10701.BusinessLinesName 
						, Count(M.OpportunityID) as Quantity, Sum(M.Amount) as Amount
				  From  
						( Select   CRMT20501.DivisionID, AT1101.DivisionName, OpportunityID
								 , (Case When  Month(CRMT20501.CreateDate) <10 then ''0''+rtrim(ltrim(str(Month(CRMT20501.CreateDate))))+''/''
										+ltrim(Rtrim(str(Year(CRMT20501.CreateDate)))) Else rtrim(ltrim(str(Month(CRMT20501.CreateDate))))+''/''
										+ltrim(Rtrim(str(Year(CRMT20501.CreateDate)))) End) as Period, CRMT20501.CreateDate 
								 , Isnull(CRMT20501.AssignedToUserID, CRMT20501.CreateUserID) as EmployeeID
								 , CRMT20501.AccountID
								 , Isnull(CRMT20501.BusinessLinesID, POST0011.BusinessLinesID) as BusinessLinesID
								 , Isnull(ExpectAmount, 0) as Amount
						 From CRMT20501 WITH (NOLOCK) Left join AT1101 WITH (NOLOCK) on AT1101.DivisionID = CRMT20501.DivisionID
										Left join POST0011 WITH (NOLOCK) on CRMT20501.AccountID = POST0011.MemberID			
						Where 1 = 1 ' + @sWHERE1 + ' 							  
						) M Left join CRMT10701 WITH (NOLOCK) on M.BusinessLinesID = CRMT10701.BusinessLinesID
							Left join AT1103 WITH (NOLOCK) on M.EmployeeID = AT1103.EmployeeID
				  Where  1 = 1  ' + @sWHERE + ' 
				  Group by M.DivisionID, M.DivisionName, M.EmployeeID, AT1103.FullName, M.BusinessLinesID, CRMT10701.BusinessLinesName 
				  Order by M.DivisionID, M.BusinessLinesID, M.EmployeeID '
	EXEC (@sSQL)
	--Print @sSQL
END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
