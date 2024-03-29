IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP3016]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP3016]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
--- In báo cáo {Detail Of ReConcile Daily Report (Metro))=> Khách hàng OKIA
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Phan thanh hoang vu on 04/01/2018: Chờ QA bên CON để hoàn thiện báo cáo load dữ liệu
----Example: EXEC POSP3016 'HCM','HCM'',''HN', 'CH-HCM001', NULL,01,2018, null, NULL, '2018-01-16', '2018-01-31', '2018-01-01','2018-01-15', NULL

 CREATE PROCEDURE POSP3016 (
		 @DivisionID VARCHAR(50),
		 @DivisionIDList NVARCHAR(2000),
		 @ShopID NVARCHAR(50),
		 @ShopIDList NVARCHAR(2000),
		 @Tranmonth int,			--Chọn kỳ báo cáo
		 @TranYear int,			--Chọn kỳ báo cáo
		 @RefVoucherNo NVARCHAR(50),		--Số phiếu đặt cọc
		 @VoucherNo NVARCHAR(250) = null,	--Số phiếu bán hàng/đổi hàng/trả hàng
		 @Date01 Datetime,					--Là giá trị đi kèm khi chọn kỳ báo cáo
		 @Date02 Datetime,					--Là giá trị đi kèm khi chọn kỳ báo cáo
		 @Date03 Datetime,					--Là giá trị đi kèm khi chọn kỳ báo cáo
		 @Date04 Datetime,					--Là giá trị đi kèm khi chọn kỳ báo cáo
		 @UserID NVARCHAR(250) = Null)
AS
DECLARE @sSQL01 NVARCHAR (MAX),
		@sSQL02 NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
		@sWhereDudau NVARCHAR(MAX),
		@sWherePhatsinh NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
		@TotalRow VARCHAR(50),
		@CustomerName INT

	CREATE Table #CustomerName (CustomerName INT, ImportExcel int)
	INSERT #CustomerName EXEC AP4444
	SET @CustomerName = (SELECT TOP 1 CustomerName FROM #CustomerName)

	SET @sWhere = ''
	
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
	
	
		--SET @sWhereDudau = @sWhere + ' AND (Case When  M.TranMonth <10 then ''0''+rtrim(ltrim(str(M.TranMonth)))+''/''+ltrim(Rtrim(str(M.TranYear))) 
		--					Else rtrim(ltrim(str(M.TranMonth)))+''/''+ltrim(Rtrim(str(M.TranYear))) End) < N'''+@PeriodID+''''
		--SET @sWherePhatsinh = @sWhere + ' AND (Case When  M.TranMonth <10 then ''0''+rtrim(ltrim(str(M.TranMonth)))+''/''+ltrim(Rtrim(str(M.TranYear))) 
		--					Else rtrim(ltrim(str(M.TranMonth)))+''/''+ltrim(Rtrim(str(M.TranYear))) End) = '''+@PeriodID+''''

	SET @sWhereDudau = @sWhere + N' AND M.TranYear*100 + M.TranMonth < '+STR(@Tranyear*100+@Tranmonth)+' '
	SET @sWherePhatsinh = @sWhere + N' AND M.TranYear*100 + M.TranMonth = '+STR(@Tranyear*100+@Tranmonth)+' '

	
	IF @CustomerName = 87
	Begin
		SET @sSQL01 = ' 
					
					Declare @Datatemp table (
							  APK uniqueidentifier
							, DivisionID varchar(50)
							, DivisionName nvarchar(250)
							, ShopID varchar(50)
							, ShopName nvarchar(250)
							, OBVoucherDate Datetime
							, OBVoucherNo varchar(50)
							, OBAmount Decimal(28,8)
							, STVoucherDate Datetime
							, STVoucherNo varchar(50)
							, STAmount Decimal(28,8)
							, SCVoucherDate	Datetime
							, SCVoucherNo varchar(50)	
							, SCAmount Decimal(28,8)
							, SutmitDate Datetime	
							, SutmitAmount Decimal(28,8)
							, Date01 Datetime
							, Date02 Datetime
							, Date03 Datetime
							, Date04 Datetime
							, Type	int	--0: Phieu dat coc; 1: Phieu ban hàng; 2: Phieu tra hang; 3: Phieu doi hang
							)
					
					INSERT INTO @Datatemp (APK, DivisionID, DivisionName, ShopID, ShopName
											, OBVoucherDate, OBVoucherNo, OBAmount, STVoucherDate, STVoucherNo, STAmount, SutmitDate, SutmitAmount
											, Date01, Date02, Date03, Date04, Type)
					--Lấy số du dau
						SELECT M.APK, M.DivisionID, A01.DivisionName, M.ShopID, P10.ShopName
								, M.VoucherDate, M.VoucherNo, P801.Amount
								, NULL as STVoucherDate, NULL as STVoucherNo, 0.0 as STAmount
								, M.VoucherDate as SutmitDate, P801.Amount as SutmitAmount
								, '''+CAST(@Date01 as nvarchar(50))+ ''' as Date01
								, '''+CAST(@Date02 as nvarchar(50))+ ''' as Date02
								, '''+CAST(@Date03 as nvarchar(50))+ ''' as Date03
								, '''+CAST(@Date04 as nvarchar(50))+ ''' as Date04
								, 0 as Type
						From POST2010 M WITH (NOLOCK) Inner join AT1101 A01 WITH (NOLOCK) on M.DivisionID = A01.DivisionID
										Inner join POST0010 P10 WITH (NOLOCK) on M.ShopID = P10.ShopID
										Left join ( Select D.DivisionID, D.ShopID, Sum(D.Amount) as Amount, D.APKMInherited
													From POST00801 M WITH (NOLOCK) inner join POST00802 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
													Where M.DeleteFlg = 0 and M.IsDeposit = 1
													Group by D.DivisionID, D.ShopID, D.APKMInherited
												  ) P801 on M.APK = P801.APKMInherited
						Where M.DeleteFlg = 0 and M.IsInvoice !=0
						' + @sWhereDudau + '
						Union all
						SELECT M.APK, M.DivisionID, A01.DivisionName, M.ShopID, P10.ShopName
								, M.VoucherDate, M.VoucherNo, M.TotalAmount
								, NULL as STVoucherDate, NULL as STVoucherNo, 0.0 as STAmount
								, M.VoucherDate as SutmitDate, M.TotalAmount as SutmitAmount
								, '''+CAST(@Date01 as nvarchar(50))+ ''' as Date01
								, '''+CAST(@Date02 as nvarchar(50))+ ''' as Date02
								, '''+CAST(@Date03 as nvarchar(50))+ ''' as Date03
								, '''+CAST(@Date04 as nvarchar(50))+ ''' as Date04
								, 1 as Type
						From POST0016 M WITH (NOLOCK) Inner join AT1101 A01 WITH (NOLOCK) on M.DivisionID = A01.DivisionID
										Inner join POST0010 P10 WITH (NOLOCK) on M.ShopID = P10.ShopID
						Where M.PVoucherNo is null and M.CVoucherNo is null  and M.DeleteFlg = 0
						' + @sWhereDudau + '
					--Lấy số phat sinh	
						Union all
						SELECT M.APK, M.DivisionID, A01.DivisionName, M.ShopID, P10.ShopName
							, NULL as VoucherDate, NULL as VoucherNo, 0.0 as TotalAmount
							, M.VoucherDate as STVoucherDate, M.VoucherNo as STVoucherNo, M.BookingAmount as STAmount
							, M.VoucherDate as SutmitDate, M.BookingAmount as SutmitAmount
								, '''+CAST(@Date01 as nvarchar(50))+ ''' as Date01
								, '''+CAST(@Date02 as nvarchar(50))+ ''' as Date02
								, '''+CAST(@Date03 as nvarchar(50))+ ''' as Date03
								, '''+CAST(@Date04 as nvarchar(50))+ ''' as Date04
							, 0 as Type '
		SET @sSQL02 = '
						From POST2010 M WITH (NOLOCK) Inner join AT1101 A01 WITH (NOLOCK) on M.DivisionID = A01.DivisionID
										Inner join POST0010 P10 WITH (NOLOCK) on M.ShopID = P10.ShopID
						Where M.DeleteFlg = 0
						' + @sWherePhatsinh + '
						Union all
						SELECT M.APK, M.DivisionID, A01.DivisionName, M.ShopID, P10.ShopName
							, NULL as VoucherDate, NULL as VoucherNo, 0.0 as TotalAmount
							, M.VoucherDate as STVoucherDate, M.VoucherNo as STVoucherNo, M.TotalAmount as STAmount
							,  M.VoucherDate as SutmitDate, M.TotalAmount as SutmitAmount
								, '''+CAST(@Date01 as nvarchar(50))+ ''' as Date01
								, '''+CAST(@Date02 as nvarchar(50))+ ''' as Date02
								, '''+CAST(@Date03 as nvarchar(50))+ ''' as Date03
								, '''+CAST(@Date04 as nvarchar(50))+ ''' as Date04
							, 1 as Type
						From POST0016 M WITH (NOLOCK) Inner join AT1101 A01 WITH (NOLOCK) on M.DivisionID = A01.DivisionID
										Inner join POST0010 P10 WITH (NOLOCK) on M.ShopID = P10.ShopID
						Where M.PVoucherNo is null and M.CVoucherNo is null and M.DeleteFlg = 0
						' + @sWherePhatsinh + '
						
						
						Select 
							  M.APK
							, '''' as PeriodID
							, M.Type
							, M.DivisionID
							, M.DivisionName
							, M.ShopID
							, M.ShopName
							, M.OBVoucherDate, M.OBVoucherNo, M.OBAmount
							, M.STVoucherDate, M.STVoucherNo, M.STAmount
							, M.SCVoucherDate, M.SCVoucherNo, M.SCAmount	
							, Isnull(M.OBVoucherDate,M.STVoucherDate)  as CBVoucherDate	
							, Isnull(M.OBVoucherNo,M.STVoucherNo)  as CBVoucherNo	
							, Isnull(M.OBAmount, 0) + Isnull(M.STAmount, 0) + Isnull(M.SCAmount, 0) as CBAmount
							, M.Date01
							, M.Date02
							, M.Date03
							, M.Date04
							, M.SutmitDate	
							, M.SutmitAmount	
							, Case when M.SutmitDate < Getdate() - 1 and M.SutmitDate<Isnull(M.OBVoucherDate,M.STVoucherDate) then ''past due'' else ''current'' end as StatusName	
							, Case when (Case when M.SutmitDate < Getdate() - 1 and M.SutmitDate<Isnull(M.OBVoucherDate,M.STVoucherDate) then ''past due'' else ''current'' end) = ''past due'' 
								   then  DATEDIFF(day, Getdate() - 1, Isnull(M.OBVoucherDate,M.STVoucherDate))
								   else NULL
								   end as daypastdue
							, Case when  M.SutmitDate between M.Date01 and M.Date02
								   then  Isnull(M.OBAmount, 0) + Isnull(M.STAmount, 0) + Isnull(M.SCAmount, 0)
								   else 0.0
								   end as Day15monthly	
							, Case when  M.SutmitDate between M.Date03 and M.Date04
								   then  Isnull(M.OBAmount, 0) + Isnull(M.STAmount, 0) + Isnull(M.SCAmount, 0)
								   else 0.0
								   end as Day30monthly	
							, Case when (Case when M.SutmitDate < Getdate() - 1 and M.SutmitDate<Isnull(M.OBVoucherDate,M.STVoucherDate) then ''past due'' else ''current'' end) = ''past due'' 
								   then  Isnull(M.OBAmount, 0) + Isnull(M.STAmount, 0) + Isnull(M.SCAmount, 0)
								   else 0.0
								   end as Notsubmit	
							, Case When (Case when (Case when M.SutmitDate < Getdate() - 1 and M.SutmitDate<Isnull(M.OBVoucherDate,M.STVoucherDate) then ''past due'' else ''current'' end) = ''past due'' 
											   then  DATEDIFF(day, Getdate() - 1, Isnull(M.OBVoucherDate,M.STVoucherDate))
											   else NULL
											   end) between 61 and 90
								   then  Isnull(M.OBAmount, 0) + Isnull(M.STAmount, 0) + Isnull(M.SCAmount, 0)
								   else 0.0
								   end as PastdueOver91	
							, Case when (Case when M.SutmitDate < Getdate() - 1 and M.SutmitDate<Isnull(M.OBVoucherDate,M.STVoucherDate) then ''past due'' else ''current'' end) = ''current'' 
								   then  DATEDIFF(day, M.SutmitDate, Isnull(M.OBVoucherDate,M.STVoucherDate))
								   else NULL
								   end as DateNo	
							, '''' as Remark
						from 	@Datatemp M
						Order by Isnull(M.OBVoucherDate,M.STVoucherDate), M.Type
						'


	End
	EXEC (@sSQL01+@sSQL02)
	--PRINT (@sSQL01)
	--PRINT (@sSQL02)
	--EXEC POSP3016 'HCM','HCM'',''HN', 'CH-HCM001', NULL,01,2018, null, NULL, '2018-01-16', '2018-01-31', '2018-01-01','2018-01-15', NULL
	--TODO: Số dư lấy chưa đầu lấy chưa đúng, Sale collection chưa đúng, Ngày nộp và số tiền submit của aeon

	
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
