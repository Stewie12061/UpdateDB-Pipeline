IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP2030]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP2030]
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
-- <Example>

/*
--Lọc nâng cao
EXEC QCP2010 @DivisionID='BE' , @DivisionList='', @FromDate='2020-07-01',@ToDate ='2020-07-31',@IsDate =1,@PeriodIDList ='10/2018',@VoucherNo ='a',@SHPublishPeriodID='a',@ObjectID ='',@ObjectName ='a',
@Address ='a',@Tel='a',@VATno='a',@Email ='a',@Contactor='a',@PhoneNumber='a',@IdentificationNumber ='a',@ShareHolderCategoryID ='a', @UserID ='a',@PageNumber ='1',
@PageSize ='25',@SearchWhere=N' where IsNull(VoucherNo,'''') = N''asdas'''

--Lọc thường
exec QCP2010 @DivisionID=N'VNP',@UserID=N'ASOFTADMIN ',@DivisionList=N'',@VoucherTypeID=N'',@VoucherNo=N'',@VoucherDate=N'',@TranMonth=N'',@TranYear=N'',@ShiftID=N'',@ShiftName=N'',@MachineID=N'',@MachineName=N'',@EmployeeID01=N'',@EmployeeName01=N'',@EmployeeID02=N'',@EmployeeName02=N'',@EmployeeID03=N'',@EmployeeName03=N'',@EmployeeID04=N'',@EmployeeName04=N'',@EmployeeID05=N'',@EmployeeName05=N'',@EmployeeID06=N'',@EmployeeName06=N'',@Description=N'',@Notes01=N'',@Notes02=N'',@Notes03=N'',@Status=N'',@StatusName=N'',@PageNumber=1,@PageSize=25,@SearchWhere=N''
*/

CREATE PROCEDURE QCP2030 ( 
        @DivisionID VARCHAR(50), 
		@UserID VARCHAR(50), 
		@DivisionList VARCHAR(MAX), 
		@VoucherNo NVARCHAR(MAX),
		@FromDate NVARCHAR(MAX),
		@ToDate NVARCHAR(MAX),
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

				IF ISNULL(@FromDate, '') != '' 
					SET @sWhere = @sWhere + N' AND CONVERT(VARCHAR(8), T1.VoucherDate, 112) >= '''+@FromDate+''''

				IF ISNULL(@ToDate, '') != '' 
					SET @sWhere = @sWhere + N' AND CONVERT(VARCHAR(8), T1.VoucherDate, 112) <= '''+@ToDate+''''

				IF ISNULL(@VoucherNo, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.VoucherNo LIKE N''%'+@VoucherNo+'%'''
					
				IF ISNULL(@ManufacturingDate, '') != '' 
					SET @sWhere = @sWhere + N' AND CONVERT(VARCHAR(8), T4.VoucherDate, 112) = '''+@ManufacturingDate+''''

				IF ISNULL(@VoucherNo, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.VoucherNo LIKE N''%'+@VoucherNo+'%'''

				IF ISNULL(@ShiftID, '') != '' 
					SET @sWhere = @sWhere + N' AND (T4.ShiftID LIKE N''%'+@ShiftID+'%''
													T1.InheritShift LIKE N''%'+@ShiftID+'%''
												   )
					'

				IF ISNULL(@DepartmentID, '') != '' 
					SET @sWhere = @sWhere + N' AND T4.DepartmentID LIKE N''%'+@DepartmentID+'%'''
				
				IF ISNULL(@MachineID, '') != '' 
					SET @sWhere = @sWhere + N' AND (T4.MachineID LIKE N''%'+@MachineID+'%'' OR
													T1.InheritMachine LIKE N''%'+@MachineID+'%''
												   )
					'

				--IF ISNULL(@Voucher_QCT2000, '') != '' 
					--SET @sWhere = @sWhere + N' AND T1.APKMaster = '''+@Voucher_QCT2000+''''


				--nếu giá trị NULL thì set về rổng 
				SET @SearchWhere = Isnull(@SearchWhere, '')
		End

		SET @sSQL = N'
				SELECT T1.APK, T1.DivisionID, T1.VoucherNo, T1.VoucherDate, T1.TranMonth, T1.TranYear, 
					--T4.VoucherDate AS ManufacturingDate,
					--T4.ShiftID, T2.ShiftName, T4.DepartmentID, T5.DepartmentName, T3.MachineID, T3.MachineName, 
					CASE WHEN T4.VoucherDate IS NOT NULL THEN T4.VoucherDate ELSE T1.InheritDate END AS ManufacturingDate,
					CASE WHEN T4.ShiftID IS NOT NULL THEN T4.ShiftID ELSE T1.InheritShift END AS ShiftID, 
					CASE WHEN T4.ShiftID IS NOT NULL THEN T2.ShiftName ELSE T21.ShiftName END AS ShiftName, 
					CASE WHEN T4.MachineID IS NOT NULL THEN T4.DepartmentID ELSE T31.DepartmentID END AS DepartmentID, 
					CASE WHEN T4.MachineID IS NOT NULL THEN T5.DepartmentName ELSE T51.DepartmentName END AS DepartmentName, 
					CASE WHEN T4.MachineID IS NOT NULL THEN T4.MachineID ELSE T1.InheritMachine END AS MachineID, 
					CASE WHEN T4.MachineID IS NOT NULL THEN T3.MachineName ELSE T31.MachineName END AS MachineName, 
					T1.APKMaster, T1.Notes,
					T1.CreateDate, T6.FullName CreateUserID, T1.LastModifyDate, T1.LastModifyUserID
				INTO #QCP2030
				FROM QCT2010 T1
					LEFT JOIN QCT2000 T4 ON T4.DivisionID = T1.DivisionID AND T4.APK = T1.APKMaster
					LEFT JOIN HT1020 T2 ON T4.ShiftID = T2.ShiftID
					LEFT JOIN CIT1150 T3 ON T3.DivisionID IN (T1.DivisionID,''@@@'') AND T4.MachineID = T3.MachineID
					LEFT JOIN AT1102 T5 ON T5.DivisionID IN (T1.DivisionID,''@@@'') AND T5.DepartmentID = T3.DepartmentID
					LEFT JOIN HT1020 T21 WITH (NOLOCK) ON T1.InheritShift = T21.ShiftID 
					LEFT JOIN CIT1150 T31 WITH (NOLOCK) ON T31.DivisionID IN (T1.DivisionID,''@@@'') AND T1.InheritMachine = T31.MachineID
					LEFT JOIN AT1102 T51 ON T51.DivisionID IN (T1.DivisionID,''@@@'') AND T51.DepartmentID = T31.DepartmentID
					LEFT JOIN AT1103 T6 ON T6.DivisionID IN (T1.DivisionID,''@@@'') AND T6.EmployeeID = T1.CreateUserID
				WHERE '+@sWhere+' AND T1.VoucherType = ''0'' AND T1.DeleteFlg = 0 
				--AND ISNULL(T4.DeleteFlg,0) = 0

				SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, 
						APK, DivisionID, VoucherNo, VoucherDate, TranMonth, TranYear, ManufacturingDate,
						ShiftID, ShiftName, DepartmentID, DepartmentName, MachineID, MachineName, APKMaster, Notes,
						CreateDate, CreateUserID, LastModifyDate, LastModifyUserID
				FROM #QCP2030
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY'
		EXEC (@sSQL)
		PRINT (@sSQL)
END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO