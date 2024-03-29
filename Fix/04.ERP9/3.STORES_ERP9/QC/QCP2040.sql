IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP2040]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP2040]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- <Summary>
---- Load Grid danh sách đăng ký mua cổ phần( màn hình truy vấn)
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Thanh Thi , Date: 30/07/2020
----Modified by : Le Hoang on 19/07/2021 : Trả chi tiết từng dòng mặt hàng cho VNP
-- <Example>

/*
--Lọc nâng cao
EXEC QCP2010 @DivisionID='BE' , @DivisionList='', @FromDate='2020-07-01',@ToDate ='2020-07-31',@IsDate =1,@PeriodIDList ='10/2018',@VoucherNo ='a',@SHPublishPeriodID='a',@ObjectID ='',@ObjectName ='a',
@Address ='a',@Tel='a',@VATno='a',@Email ='a',@Contactor='a',@PhoneNumber='a',@IdentificationNumber ='a',@ShareHolderCategoryID ='a', @UserID ='a',@PageNumber ='1',
@PageSize ='25',@SearchWhere=N' where IsNull(VoucherNo,'''') = N''asdas'''

--Lọc thường
exec QCP2010 @DivisionID=N'VNP',@UserID=N'ASOFTADMIN ',@DivisionList=N'',@VoucherTypeID=N'',@VoucherNo=N'',@VoucherDate=N'',@TranMonth=N'',@TranYear=N'',@ShiftID=N'',@ShiftName=N'',@MachineID=N'',@MachineName=N'',@EmployeeID01=N'',@EmployeeName01=N'',@EmployeeID02=N'',@EmployeeName02=N'',@EmployeeID03=N'',@EmployeeName03=N'',@EmployeeID04=N'',@EmployeeName04=N'',@EmployeeID05=N'',@EmployeeName05=N'',@EmployeeID06=N'',@EmployeeName06=N'',@Description=N'',@Notes01=N'',@Notes02=N'',@Notes03=N'',@Status=N'',@StatusName=N'',@PageNumber=1,@PageSize=25,@SearchWhere=N''
*/

CREATE PROCEDURE QCP2040 ( 
        @DivisionID VARCHAR(50), 
		@UserID VARCHAR(50), 
		@DivisionList VARCHAR(MAX), 
		@FromDate NVARCHAR(MAX),
		@ToDate NVARCHAR(MAX),
		@VoucherNo NVARCHAR(MAX),
		@ManufacturingDate NVARCHAR(MAX),
		@ShiftID NVARCHAR(MAX),
		@DepartmentID NVARCHAR(MAX),
		@MachineID NVARCHAR(MAX),
		@Voucher_QCT2000 NVARCHAR(MAX),
		@PageNumber INT,
		@PageSize INT,
		@SearchWhere NVARCHAR(MAX) = NULL --#NULL: Lọc nâng cao; =NULL: Lọc thường
) 
AS 
BEGIN
	DECLARE @sSQL NVARCHAR(MAX),
			@sSQL1 NVARCHAR(MAX),
			@sWhere NVARCHAR(MAX) = N'',
			@OrderBy NVARCHAR(500) = N'', 
			@TotalRow NVARCHAR(50) = N''

		IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
		SET @OrderBy = ' DivisionID, VoucherDate, VoucherNo'
		SET @sWhere = ' 1 = 1 '
		
		If Isnull(@SearchWhere, '') = '' --Lọc thường
		Begin
				IF ISNULL(@DivisionList, '') != ''
					SET @sWhere = @sWhere + N' AND T1.DivisionID IN ('''+@DivisionList+''')'
				ELSE 
					SET @sWhere = @sWhere + N' AND T1.DivisionID = '''+@DivisionID+''''
					
				IF ISNULL(@VoucherNo, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.VoucherNo LIKE N''%'+@VoucherNo+'%'''

				IF ISNULL(@FromDate, '') != '' 
					SET @sWhere = @sWhere + N' AND CONVERT(VARCHAR(8), T1.VoucherDate, 112) >= '''+@FromDate+''''

				IF ISNULL(@ToDate, '') != '' 
					SET @sWhere = @sWhere + N' AND CONVERT(VARCHAR(8), T1.VoucherDate, 112) <= '''+@ToDate+''''

				IF ISNULL(@ManufacturingDate, '') != '' 
					SET @sWhere = @sWhere + N' AND CONVERT(VARCHAR(8), T4.VoucherDate, 112) = '''+@ManufacturingDate+''''

				IF ISNULL(@ShiftID, '') != '' 
					SET @sWhere = @sWhere + N' AND T4.ShiftID LIKE N''%'+@ShiftID+'%'''

				IF ISNULL(@DepartmentID, '') != '' 
					SET @sWhere = @sWhere + N' AND T4.DepartmentID LIKE N''%'+@DepartmentID+'%'''

				IF ISNULL(@MachineID, '') != '' 
					SET @sWhere = @sWhere + N' AND T4.MachineID LIKE N''%'+@MachineID+'%'''

				IF ISNULL(@Voucher_QCT2000, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.APKMaster = '''+@Voucher_QCT2000+''''
					

				--nếu giá trị NULL thì set về rổng 
				SET @SearchWhere = Isnull(@SearchWhere, '')
		End

		IF EXISTS (SELECT TOP 1 1 FROM CustomerIndex WHERE CustomerName = 128)---VINAPAPER 
		BEGIN

			SET @sSQL = N'
				SELECT T1.APK, T1.DivisionID, T1.VoucherNo, T1.VoucherDate, T1.TranMonth, T1.TranYear, T4.VoucherDate AS ManufacturingDate,
					T4.ShiftID, T2.ShiftName, T4.DepartmentID, T5.DepartmentName, T3.MachineID, T3.MachineName, T1.APKMaster, T1.Notes,
					T12.InventoryID, T13.InventoryName, T12.BatchNo,
					T1.CreateDate, T1.CreateUserID, T1.LastModifyDate, T1.LastModifyUserID
				INTO #QCP2040
				FROM QCT2010 T1 WITH(NOLOCK)
					JOIN QCT2000 T4 WITH(NOLOCK) ON T4.DivisionID = T1.DivisionID AND T4.APK = T1.APKMaster
					LEFT JOIN QCT2001 T12 WITH(NOLOCK) ON T4.DivisionID = T12.DivisionID AND T4.APK = T12.APKMaster
					LEFT JOIN AT1302 T13 WITH(NOLOCK) ON T13.DivisionID IN (T12.DivisionID,''@@@'') AND T13.InventoryID = T12.InventoryID
					LEFT JOIN HT1020 T2 WITH(NOLOCK) ON T2.DivisionID IN (T4.DivisionID,''@@@'') AND T4.ShiftID = T2.ShiftID
					LEFT JOIN CIT1150 T3 WITH(NOLOCK) ON T3.DivisionID IN (T4.DivisionID,''@@@'') AND T4.MachineID = T3.MachineID
					LEFT JOIN AT1102 T5 WITH(NOLOCK) ON T5.DivisionID IN (T4.DivisionID,''@@@'') AND T5.DepartmentID = T4.DepartmentID
				WHERE '+@sWhere+' AND T1.VoucherType = ''1'' AND T1.DeleteFlg = 0 AND T4.DeleteFlg = 0'
		END
		ELSE
		BEGIN
			SET @sSQL = N'
				SELECT T1.APK, T1.DivisionID, T1.VoucherNo, T1.VoucherDate, T1.TranMonth, T1.TranYear, T4.VoucherDate AS ManufacturingDate,
					T4.ShiftID, T2.ShiftName, T4.DepartmentID, T5.DepartmentName, T3.MachineID, T3.MachineName, T1.APKMaster, T1.Notes,
					T1.CreateDate, T1.CreateUserID, T1.LastModifyDate, T1.LastModifyUserID
				INTO #QCP2040
				FROM QCT2010 T1 WITH(NOLOCK)
					JOIN QCT2000 T4 WITH(NOLOCK) ON T4.DivisionID = T1.DivisionID AND T4.APK = T1.APKMaster
					LEFT JOIN HT1020 T2 WITH(NOLOCK) ON T2.DivisionID IN (T4.DivisionID,''@@@'') AND T4.ShiftID = T2.ShiftID
					LEFT JOIN CIT1150 T3 WITH(NOLOCK) ON T3.DivisionID IN (T4.DivisionID,''@@@'') AND T4.MachineID = T3.MachineID
					LEFT JOIN AT1102 T5 WITH(NOLOCK) ON T5.DivisionID IN (T4.DivisionID,''@@@'') AND T5.DepartmentID = T4.DepartmentID
				WHERE '+@sWhere+' AND T1.VoucherType = ''1'' AND T1.DeleteFlg = 0 AND T4.DeleteFlg = 0'
		END

		SET @sSQL1 = N'
				SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, *
				FROM #QCP2040
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY'

		EXEC (@sSQL+@sSQL1)
END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO