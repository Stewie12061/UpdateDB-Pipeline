IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP30131]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP30131]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- BANG TONG HOP TINH LUONG (Cuatomize MINHSANG)
---- 
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Hoàng Vũ on 16/08/2017
----Modify by: 
-- <Example> EXEC POSP30131 'KC', '', 'GS-RS-1-K001', '', 1, '2017-01-01', '2017-08-29', '','','',''

CREATE PROCEDURE POSP30131 (
	@DivisionID			VARCHAR(50),
	@DivisionIDList		NVARCHAR(MAX),
	@ShopID				VARCHAR(50),
	@ShopIDList			NVARCHAR(MAX),
	@IsDate				TINYINT,  --1: Theo ngày; 0: Theo kỳ
	@FromDate			DATETIME, 
	@ToDate				DATETIME, 
	@PeriodIDList		NVARCHAR(2000),
	@FromEmployeeID		VARCHAR(MAX),
	@ToEmployeeID		VARCHAR(MAX),
	@UserID				VARCHAR(50)
)
AS
BEGIN
		DECLARE @sSQL01   NVARCHAR(MAX),  
				@sSQL02   NVARCHAR(MAX),  
				@sWhere NVARCHAR(MAX),
				@cols01 NVARCHAR(Max),
				@cols02 NVARCHAR(Max)
	
		SET @sWhere = ''

		--Nếu Danh sách @DivisionIDList trống thì lấy biến môi trường @DivisionID
		IF Isnull(@DivisionIDList, '') != ''
			SET @sWhere = @sWhere + ' AND M.DivisionID IN ('''+@DivisionIDList+''')'
		ELSE 
			SET @sWhere = @sWhere + ' AND M.DivisionID = N'''+@DivisionID+''''	
	
		--Nếu Danh sách @ShopIDList trống thì lấy biến môi trường @ShopID
		IF Isnull(@ShopIDList, '')!= ''
			SET @sWhere = @sWhere + ' AND M.ShopID IN ('''+@ShopIDList+''')'
		ELSE 
			SET @sWhere = @sWhere + ' AND M.ShopID = N'''+@ShopID+''''

		IF @IsDate = 1	
			SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR,M.VoucherDate,112) BETWEEN '''+CONVERT(VARCHAR,@FromDate,112)+''' AND '''+CONVERT(VARCHAR,@ToDate,112)+''''
		ELSE
			SET @sWhere = @sWhere + ' AND (Case When  M.TranMonth <10 then ''0''+rtrim(ltrim(str(M.TranMonth)))+''/''+ltrim(Rtrim(str(M.TranYear))) 
											Else rtrim(ltrim(str(M.TranMonth)))+''/''+ltrim(Rtrim(str(M.TranYear))) End) IN ('''+@PeriodIDList+''')'

		--Search theo đối tượng nhân viên
		IF Isnull(@FromEmployeeID, '')!= '' and Isnull(@ToEmployeeID, '') = ''
			SET @sWhere = @sWhere + ' AND Isnull(M.SaleManID, M.EmployeeID) > = N'''+@FromEmployeeID +''''
		ELSE IF Isnull(@FromEmployeeID, '') = '' and Isnull(@ToEmployeeID, '') != ''
			SET @sWhere = @sWhere + ' AND Isnull(M.SaleManID, M.EmployeeID) < = N'''+@ToEmployeeID +''''
		ELSE IF Isnull(@FromEmployeeID, '') != '' and Isnull(@ToEmployeeID, '') != ''
			SET @sWhere = @sWhere + ' AND Isnull(M.SaleManID, M.EmployeeID) Between N'''+@FromEmployeeID+''' AND N'''+@ToEmployeeID+''''

		SET @sSQL01 = N'
			
			--Lấy Ngay/Nhanvien/CA
				Select  M.DivisionID as CADivisionID, M.VoucherDate as CAVoucherDate, Day(VoucherDate) as CADATE,  Month(VoucherDate) as CAMONTH, Year(VoucherDate) as CAYEAR
						, Isnull(M.SaleManID, M.EmployeeID) as SaleManID
						, Sum(Case when D.UnitPrice > 400000 then D.CA Else 0 end) as CAGOAL
						Into #Temp01 
				From POST0016 M  WITH (NOLOCK) Left join POST00161 D  WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
				Where M.DeleteFlg = 0 and M.CVoucherNo is null and M.PVoucherNo is null '+@sWhere+'
				Group by M.DivisionID, M.VoucherDate, Day(M.VoucherDate),  Month(M.VoucherDate), Year(M.VoucherDate), Isnull(M.SaleManID, M.EmployeeID)
			
			--Lấy Ngay/Nhanvien/Diem
				Select  M.DivisionID as GOALDivisionID, M.VoucherDate as GOALVoucherDate, Day(VoucherDate) as GOALDATE,  Month(VoucherDate) as GOALMONTH, Year(VoucherDate) as GOALYEAR
						, Isnull(M.SaleManID, M.EmployeeID) as SaleManID
						, Sum(Isnull(Case  when D.UnitPrice < 100000 then 0
								when D.UnitPrice >= 100000 and D.UnitPrice < 200000 then 1
								when D.UnitPrice >= 200000 and D.UnitPrice < 300000 then 2
								when D.UnitPrice >= 300000 and D.UnitPrice < 400000 then 3
								end, 0)) as CAGOAL
						Into #Temp02 
				from POST0016 M  WITH (NOLOCK) Left join POST00161 D  WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
				Where M.DeleteFlg = 0 and M.CVoucherNo is null and M.PVoucherNo is null '+@sWhere+'
				Group by M.DivisionID, M.VoucherDate, Day(M.VoucherDate),  Month(M.VoucherDate), Year(M.VoucherDate), Isnull(M.SaleManID, M.EmployeeID)
			

				DECLARE @columns001 NVARCHAR(MAX), 
						@columns002 NVARCHAR(MAX), 
						@sql NVARCHAR(MAX);
				SET @columns001 = N'''';
				SELECT @columns001 += N'', '' + quotename(SaleManID)
				FROM (SELECT SaleManID FROM #Temp01  group by SaleManID ) AS x;
				'
		SET @sSQL02 = N'
				SET @columns002 = N'''';
				SELECT @columns002 += N'', '' + quotename(SaleManID)
				FROM (SELECT SaleManID FROM #Temp02  group by SaleManID ) AS x;

				SET @sql = N''
				SELECT CADivisionID, CAVoucherDate, CADATE,  CAMONTH, CAYEAR,  '' + STUFF(@columns001, 1, 2, '''') + ''
				into #Result001
				FROM
				(
					SELECT  CADivisionID, CAVoucherDate, CADATE,  CAMONTH, CAYEAR, SaleManID, CAGOAL
					FROM #Temp01
					) AS j
				PIVOT
				(
					SUM(CAGOAL) FOR SaleManID IN (''
					+ STUFF(REPLACE(@columns001, '', ['', '',[''), 1, 1, '''')
					+ '')
				) AS p;		
				SELECT GOALDivisionID, GOALVoucherDate, GOALDATE,  GOALMONTH, GOALYEAR,  '' + STUFF(@columns002, 1, 2, '''') + ''
				into #Result002
				FROM
				(
					SELECT  GOALDivisionID, GOALVoucherDate, GOALDATE,  GOALMONTH, GOALYEAR, SaleManID, CAGOAL
					FROM #Temp02
					) AS j
				PIVOT
				(
					SUM(CAGOAL) FOR SaleManID IN (''
					+ STUFF(REPLACE(@columns002, '', ['', '',[''), 1, 1, '''')
					+ '')
				) AS p;
				Select M.*, A.DivisionName as CADivisionName, D.* From #Result001 M inner join #Result002  D on M.CADivisionID = D.GOALDivisionID and M.CADATE = D.GOALDATE and M.CAMONTH = D.GOALMONTH and M.CAYEAR = D.GOALYEAR
										Left join AT1101 A WITH (NOLOCK) on M.CADivisionID = A.DivisionID
				Order by M.CAVoucherDate
				'';
				EXEC sp_executesql @sql;
			'
		
		EXEC (@sSQL01+@sSQL02)
		
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
