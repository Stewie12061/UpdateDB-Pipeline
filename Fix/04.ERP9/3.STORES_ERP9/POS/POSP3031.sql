IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP3031]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP3031]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




-- <Summary>
---- BÁO CÁO CHẤM CÔNG NHÂN VIÊN – POSR3031 (Customize Nhân ngọc)
---- 
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>'
----Created by: Hoàng Vũ on 10/06/2019: Hiện tại châm công trên APP chưa biết nhân viên thuộc ca nào????
----Modify by: Hoàng Vũ on 04/07/2019: fixbug lỗi Kết quả trả ra employeeID chư hoa, chữ thường nên khi view ra báo cáo không group lại => dùng lệnh upper để chuyển hết mã/tên nhân viên sang chữ hoa
----Modify by: Hoàng Vũ on 05/07/2019: Tính toán lấy CA làm việc theo thời gian checkin
----Modify by: Thành Sang on 31/05/2023: fix lỗi bị trùng 2 dòng checkout. Chấm công sinh 2 dòng và bị double công
----Modify by: Thành Sang on 10/07/2023: sửa cách lấy CheckinTime
----Modify by: Thành Sang on 10/07/2023: sửa cách lấy tọa độ
----Modify by: Thành Sang on 16/08/2023: bổ sung điều kiện cho trường hợp 2 ca có thời gian giao nhao
-- <Example> EXEC POSP3031 '', '', '', '', 1, '2018-01-01', '2019-12-30', '', '', '', 'ASOFTADMIN'

CREATE PROCEDURE POSP3031 
(
	@DivisionID			VARCHAR(50),
	@DivisionIDList		NVARCHAR(MAX),
	@ShopID				VARCHAR(50),
	@ShopIDList			NVARCHAR(MAX),
	@IsDate				TINYINT,  --1: Theo ngày; 0: Theo kỳ
	@FromDate			DATETIME, 
	@ToDate				DATETIME, 
	@PeriodIDList		NVARCHAR(2000),
	@ToEmployeeID		VARCHAR(MAX)='',
	@FromEmployeeID		VARCHAR(MAX)='',
	@UserID				VARCHAR(50),
	@ListEmployeeID AS NVARCHAR(MAX)=''
)
AS
BEGIN
		DECLARE @sSQL   NVARCHAR(MAX),  
				@sSQL1   NVARCHAR(MAX),  
				@sWhere NVARCHAR(MAX),
				@Date  NVARCHAR(MAX)

		SET @Date = ''
		SET @sWhere = ' 1 = 1 '

		--Nếu Danh sách @DivisionIDList trống thì lấy biến môi trường @DivisionID
		IF Isnull(@DivisionIDList, '') != ''
			SET @sWhere = @sWhere + ' AND M.DivisionID IN ('''+@DivisionIDList+''')'
		ELSE 
		Begin
			IF Isnull(@DivisionID, '') != ''
				SET @sWhere = @sWhere + ' AND M.DivisionID = N'''+@DivisionID+''''	
		End
		--Nếu Danh sách @ShopIDList trống thì lấy biến môi trường @ShopID
		IF Isnull(@ShopIDList, '')!= ''
			SET @sWhere = @sWhere + ' AND M.ObjectID IN ('''+@ShopIDList+''')'
		ELSE 
		Begin
			IF Isnull(@ShopID, '')!= ''	
				SET @sWhere = @sWhere + ' AND M.ObjectID = N'''+@ShopID+''''
		End

		IF @IsDate = 1	
			SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR, M.CheckInTime, 112) BETWEEN '''+CONVERT(VARCHAR,@FromDate,112)+''' AND '''+CONVERT(VARCHAR,@ToDate,112)+''''
		ELSE
			SET @sWhere = @sWhere + ' AND (Case When  Month(M.CheckInTime) <10 then ''0''+rtrim(ltrim(str(Month(M.CheckInTime))))+''/''+ltrim(Rtrim(str(Year(M.CheckInTime)))) 
											Else rtrim(ltrim(str(Month(M.CheckInTime))))+''/''+ltrim(Rtrim(str(Year(M.CheckInTime)))) End) IN ('''+@PeriodIDList+''')'

		--Search theo hội viên  (Dữ liệhội viên nhiều nên dùng control từ hội viên , đến hội viên
		IF Isnull(@FromEmployeeID, '')!= '' and Isnull(@ToEmployeeID, '') = ''
			SET @sWhere = @sWhere + ' AND M.UserID > = N'''+@FromEmployeeID +''''
		ELSE IF Isnull(@FromEmployeeID, '') = '' and Isnull(@ToEmployeeID, '') != ''
			SET @sWhere = @sWhere + ' AND M.UserID < = N'''+@ToEmployeeID +''''
		ELSE IF Isnull(@FromEmployeeID, '') != '' and Isnull(@ToEmployeeID, '') != ''
			SET @sWhere = @sWhere + ' AND M.UserID Between N'''+@FromEmployeeID+''' AND N'''+@ToEmployeeID+''''

		IF Isnull(@ListEmployeeID, '')!= ''
		SET @sWhere = @sWhere + ' AND  M.UserID IN (N'''+@ListEmployeeID+''')'
 	    
		SET @sSQL = N'	-- Lấy dữ liệu check out lớn nhất tránh bị đúp
		SELECT MAX(APK) APK,DivisionID,MAX(VisitID) VisitID,UserID,ObjectID,MIN(CheckinTime) CheckinTime,MAX(CheckinLongitude) CheckinLongitude,MAX(CheckinLatitude) CheckinLatitude,MAX(CheckinAddress) CheckinAddress
			,MAX(CheckoutTime) CheckoutTime,MAX(CheckoutLongitude) CheckoutLongitude,MAX(CheckoutLatitude) CheckoutLatitude,MAX(CheckoutAddress) CheckoutAddress,Notes
		INTO #APT0003_Data
		FROM APT0003 M
			Where '+@sWhere+'
		GROUP BY DivisionID,UserID,ObjectID,Notes, CONVERT(VARCHAR(10),CHECKINTIME,103)

		Select POST0069.DivisionID, POST0069.ShopID, POST0069.ShiftID
				, convert(varchar, DATEADD(HOUR, -1, POST0069.FromTime), 108) as FromTimeGoEarly		--Thiết lập quy định checkin sớm 1 tiếng
				, convert(varchar, POST0069.FromTime, 108) as FromTime									--Checkin bắt đầu giờ
				, convert(varchar, DateAdd(ms, DateDiff(ms, POST0069.FromTime, POST0069.ToTime)/2, POST0069.FromTime), 108) as TimeMidpoint	--Trung điểm của thới gian bặt đầu checkin đến thới gian checkout
				, convert(varchar, ToTime, 108) as ToTime										--Checkout cuối giờ
				, convert(varchar, DATEADD(Minute, -59, POST0069.ToTime), 108) as ToTimeGoEarly
				, M.ToTimeMax
				, POST0069.Description
		Into #CompareShift
		From POST0069  With (Nolock) Inner join (Select DivisionID, ShopID, max(convert(varchar, DATEADD(Minute, -59, ToTime), 108)) as ToTimeMax
												From POST0069  With (Nolock) 
												Group by  DivisionID, ShopID) M on POST0069.DivisionID = M.DivisionID and POST0069.ShopID = M.ShopID
		
		Select M.APK, M.DivisionID, A01.DivisionName, M.ObjectID, A02.ObjectName, Upper(M.UserID) as EmployeeID, Upper(A03.FullName) as EmployeeName
			, M.CheckInTime, convert(varchar, M.CheckInTime, 105) as VoucherDate
			--, Case When convert(varchar, M.CheckinTime, 108)  between A04.FromTimeGoEarly and A04.TimeMidpoint then A04.ShiftID end as ShiftID
							
			, Case 
			        When convert(varchar, M.CheckinTime, 108)  > A04.FromTimeGoEarly  and convert(varchar, M.CheckinTime, 108) < A04.ToTimeGoEarly
					AND convert(varchar, M.CheckinTime, 108)  between A04.FromTimeGoEarly and A04.TimeMidpoint then A04.ShiftID -- Xác định chính xác thời gian checkin thuộc ca nào
					When convert(varchar, M.CheckinTime, 108)  > A04.FromTimeGoEarly  and A04.ToTimeMax = A04.ToTimeGoEarly then A04.ShiftID 
					end as ShiftID
			, A04.FromTime, A04.ToTime, A04.FromTimeGoEarly, A04.TimeMidpoint, A04.ToTimeGoEarly, A04.ToTimeMax
			, convert(varchar, M.CheckinTime, 108) as InTime
			, convert(varchar, M.CheckoutTime, 108) as OutTime
			, DATEDIFF(minute, M.CheckinTime, M.CheckoutTime) as TotalMinuteOneDate	--Lấy tổng số phút làm trong ngày
			, DATEDIFF(minute, M.CheckinTime, M.CheckoutTime)/60 as ConvertToHour	--Lấy số giờ
			, DATEDIFF(minute, M.CheckinTime, M.CheckoutTime)%60 as ConvertToMinute	--Lấy số phút
			, Cast(DATEDIFF(minute, M.CheckinTime, M.CheckoutTime) as Decimal(28,8))/60 as TimeNo	--Số giờ làm việc
			, M.CheckinAddress, M.CheckoutTime, M.CheckoutAddress, M.Notes
		into #CheckCa
		From #APT0003_Data M With (Nolock) Left join AT1103 A03 With (Nolock) on M.UserID = A03.EmployeeID
										Left join AT1202 A02 With (Nolock) on M.ObjectID = A02.ObjectID
										Left join AT1101 A01 With (Nolock) on M.DivisionID = A01.DivisionID
										Left join #CompareShift A04 on M.DivisionID = A04.DivisionID and M.ObjectID = A04.ShopID						
		'
		SET @sSQL1 = 'Select  M.APK, M.DivisionID, M.DivisionName, M.ObjectID, M.ObjectName, M.EmployeeID, M.EmployeeName, M.VoucherDate
				, M.ShiftID					--Ca làm việc
				, M.FromTime				--Bắt đầu ca
				, M.ToTime					--Kết thúc ca
				, M.InTime					--Thời gian checkin
				, M.OutTime					--Thời gian checkout
				, M.TotalMinuteOneDate		--Lấy tổng số phút làm trong ngày
				, M.ConvertToHour			--Lấy số giờ chẵn
				, M.ConvertToMinute			--Lấy số phút lẽ
				, M.TimeNo					--Tổng số giờ làm việc
				, M.CheckInTime
				, M.CheckinAddress
				, M.CheckoutTime
				, M.CheckoutAddress
				, M.Notes
		From #CheckCa M
		Where M.ShiftID is not null
		Order by M.EmployeeID, M.CheckInTime
		 '
		Print (@sSQL)
		Print (@sSQL1)
		EXEC (@sSQL + @sSQL1)
END



GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
