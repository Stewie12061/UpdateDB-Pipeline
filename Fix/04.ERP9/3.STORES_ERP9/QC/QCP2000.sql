IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP2000]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP2000]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







-- <Summary>
---- Load Grid danh sách phiếu chất lượng đầu ca( màn hình truy vấn)
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Thanh Thi , Date: 30/07/2020
----Modified by Le Hoang on 06/04/2021 : Bổ sung custom cho VNP load thêm phiếu ở bảng tạm
----Modified by Le Hoang on 06/04/2021 : Custom cho VNP, vì phiếu chỉ có 1 mặt hàng nên Diễn giải, Ghi chú 123 ở màn hình Danh mục phiếu sẽ lấy của 1 dòng mặt hàng đó, và trả thêm trường Trạng thái của mặt hàng
----Modified by Thanh Lượng on 05/04/2023 : Bổ sung thêm dữ liêu cột @EmployeeID07,@StatusSS,@Ana04ID
---- Modified on 19/04/2023 by Nhat Thanh: Load phiếu tạm
----Modified by Anh Đô on 09/08/2023: Fix lỗi trung lặp dữ liệu ở lưới danh mục

-- <Example>

/*
--Lọc nâng cao
EXEC QCP2000 @DivisionID='BE' , @DivisionList='', @FromDate='2020-07-01',@ToDate ='2020-07-31',@IsDate =1,@PeriodIDList ='10/2018',@VoucherNo ='a',@SHPublishPeriodID='a',@ObjectID ='',@ObjectName ='a',
@Address ='a',@Tel='a',@VATno='a',@Email ='a',@Contactor='a',@PhoneNumber='a',@IdentificationNumber ='a',@ShareHolderCategoryID ='a', @UserID ='a',@PageNumber ='1',
@PageSize ='25',@SearchWhere=N' where IsNull(VoucherNo,'''') = N''asdas'''

--Lọc thường
exec QCP2000 @DivisionID=N'VNP',@UserID=N'ASOFTADMIN ',@DivisionList=N'',@VoucherTypeID=N'',@VoucherNo=N'',@VoucherDate=N'',@TranMonth=N'',@TranYear=N'',@ShiftID=N'',@ShiftName=N'',@MachineID=N'',@MachineName=N'',@EmployeeID01=N'',@EmployeeName01=N'',@EmployeeID02=N'',@EmployeeName02=N'',@EmployeeID03=N'',@EmployeeName03=N'',@EmployeeID04=N'',@EmployeeName04=N'',@EmployeeID05=N'',@EmployeeName05=N'',@EmployeeID06=N'',@EmployeeName06=N'',@Description=N'',@Notes01=N'',@Notes02=N'',@Notes03=N'',@Status=N'',@StatusName=N'',@PageNumber=1,@PageSize=25,@SearchWhere=N''
*/

CREATE PROCEDURE QCP2000 ( 
        @DivisionID VARCHAR(50), 
		@DivisionList VARCHAR(MAX), 
		@VoucherNo NVARCHAR(MAX),
		@FromDate NVARCHAR(MAX),
		@ToDate NVARCHAR(MAX),
		@ShiftID NVARCHAR(MAX),
		@DepartmentID NVARCHAR(MAX),
		@MachineID NVARCHAR(MAX),
		@EmployeeID01 NVARCHAR(MAX),
		@EmployeeID02 NVARCHAR(MAX),
		@EmployeeID03 NVARCHAR(MAX),
		@EmployeeID04 NVARCHAR(MAX),
		@EmployeeID05 NVARCHAR(MAX),
		@EmployeeID06 NVARCHAR(MAX),
		@EmployeeID07 NVARCHAR(MAX),
		@Description NVARCHAR(MAX),
		@StatusSS NVARCHAR(250) ='',
		@Ana04ID NVARCHAR(250) ='',
		@UserID VARCHAR(50),
		@PageNumber INT,
		@PageSize INT,
		@SearchWhere NVARCHAR(MAX) = NULL --#NULL: Lọc nâng cao; =NULL: Lọc thường
) 
AS 
BEGIN
	DECLARE @sSQL NVARCHAR(MAX),
			@sSQL01 NVARCHAR(MAX) = '',
			@sSQL02 NVARCHAR(MAX) = '',
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

				IF ISNULL(@ShiftID, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.ShiftID LIKE N''%'+@ShiftID+'%'''
				
				IF ISNULL(@DepartmentID, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.DepartmentID LIKE N''%'+@DepartmentID+'%'''

				IF ISNULL(@MachineID, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.MachineID LIKE N''%'+@MachineID+'%'''

				IF ISNULL(@EmployeeID01, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.EmployeeID01 LIKE N''%'+@EmployeeID01+'%'''

				IF ISNULL(@EmployeeID02, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.EmployeeID02 LIKE N''%'+@EmployeeID02+'%'''

				IF ISNULL(@EmployeeID03, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.EmployeeID03 LIKE N''%'+@EmployeeID03+'%'''

				IF ISNULL(@EmployeeID04, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.EmployeeID04 LIKE N''%'+@EmployeeID04+'%'''

				IF ISNULL(@EmployeeID05, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.EmployeeID05 LIKE N''%'+@EmployeeID05+'%'''

				IF ISNULL(@EmployeeID06, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.EmployeeID06 LIKE N''%'+@EmployeeID06+'%'''

				IF ISNULL(@EmployeeID07, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.EmployeeID07 LIKE N''%'+@EmployeeID07+'%'''

				IF ISNULL(@Description, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.Description LIKE N''%'+@Description+'%'''
					
				IF ISNULL(@StatusSS,'') !=''
					SET @sWhere = @sWhere + ' AND (ISNULL(T1.StatusSS, '''')) = '''+@StatusSS+''''

				IF ISNULL(@Ana04ID,'') !=''
					SET @sWhere = @sWhere + ' AND (ISNULL(T1.StatusSS, '''')) = '''+@Ana04ID+''''

				--nếu giá trị NULL thì set về rổng 
				SET @SearchWhere = Isnull(@SearchWhere, '')
		End

		SET @sSQL = N'
				SELECT T1.APK, T1.DivisionID, T1.VoucherNo, T1.VoucherDate, T1.TranMonth, T1.TranYear, 
					T1.ShiftID, T2.ShiftName, T1.DepartmentID, T03.DepartmentName, T3.MachineID, T3.MachineName,
					T1.EmployeeID01, T4.FullName AS EmployeeName01,
					T1.EmployeeID02, T5.FullName AS EmployeeName02,
					T1.EmployeeID03, T6.FullName AS EmployeeName03,
					T1.EmployeeID04, T7.FullName AS EmployeeName04,
					T1.EmployeeID05, T8.FullName AS EmployeeName05,
					T1.EmployeeID06, T9.FullName AS EmployeeName06,
					T1.EmployeeID07, T10.FullName AS EmployeeName07,
					T1.Description,S3.Description As StatusSS,T1.Ana04ID,T1.ApprovalNotes, A11.AnaName AS Ana04Name, T1.Notes01, T1.Notes02, T1.Notes03,
					T1.CreateDate, T1.CreateUserID, T1.LastModifyDate, T1.LastModifyUserID, 
					1 AS VoucherType
				INTO #QCP2000
				FROM QCT2000 T1 WITH(NOLOCK) 
					LEFT JOIN HT1020 T2 WITH(NOLOCK) ON T2.DivisionID IN (T1.DivisionID,''@@@'') AND T1.ShiftID = T2.ShiftID
					LEFT JOIN CIT1150 T3 WITH(NOLOCK) ON T3.DivisionID IN (T1.DivisionID,''@@@'') AND T1.MachineID = T3.MachineID
					LEFT JOIN AT1102 T03 WITH(NOLOCK) ON T03.DivisionID IN (T1.DivisionID,''@@@'') AND T1.DepartmentID = T03.DepartmentID
					LEFT JOIN AT1103 T4 WITH(NOLOCK) ON T4.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID01 = T4.EmployeeID
					LEFT JOIN AT1103 T5 WITH(NOLOCK) ON T5.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID02 = T5.EmployeeID
					LEFT JOIN AT1103 T6 WITH(NOLOCK) ON T6.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID03 = T6.EmployeeID
					LEFT JOIN AT1103 T7 WITH(NOLOCK) ON T7.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID04 = T7.EmployeeID
					LEFT JOIN AT1103 T8 WITH(NOLOCK) ON T8.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID05 = T8.EmployeeID
					LEFT JOIN AT1103 T9 WITH(NOLOCK) ON T9.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID06 = T9.EmployeeID
					LEFT JOIN AT1103 T10 WITH(NOLOCK) ON T10.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID07 = T10.EmployeeID
					LEFT JOIN OOT0099 S3 WITH(NOLOCK) ON T1.StatusSS = S3.ID AND S3.CodeMaster = ''Status''
					LEFT JOIN AT1011 A11 WITH (NOLOCK) ON A11.AnaID = T1.Ana04ID and A11.DivisionID IN (T1.DivisionID,''@@@'') 
				WHERE '+@sWhere+' AND T1.DeleteFlg = 0'
		IF EXISTS (SELECT TOP 1 1 FROM CustomerIndex WHERE CustomerName in( 128,151 ))---VINAPAPER dùng bảng tạm để lưu những phiếu đầu ca tạm
		BEGIN
			SET @sSQL = N'
				SELECT T1.APK, T1.DivisionID, T1.VoucherNo, T1.VoucherDate, T1.TranMonth, T1.TranYear, 
					T1.ShiftID, T2.ShiftName, T1.DepartmentID, T03.DepartmentName, T3.MachineID, T3.MachineName,
					T1.EmployeeID01, T4.FullName AS EmployeeName01,
					T1.EmployeeID02, T5.FullName AS EmployeeName02,
					T1.EmployeeID03, T6.FullName AS EmployeeName03,
					T1.EmployeeID04, T7.FullName AS EmployeeName04,
					T1.EmployeeID05, T8.FullName AS EmployeeName05,
					T1.EmployeeID06, T9.FullName AS EmployeeName06,
					T1.EmployeeID07, T11.FullName AS EmployeeName07,
					T1.CreateDate, T1.CreateUserID, T1.LastModifyDate, T1.LastModifyUserID, 
					1 AS VoucherType
				INTO #QCP2000
				FROM QCT2000 T1 WITH(NOLOCK) 
					LEFT JOIN HT1020 T2 WITH(NOLOCK) ON T2.DivisionID IN (T1.DivisionID,''@@@'') AND T1.ShiftID = T2.ShiftID
					LEFT JOIN CIT1150 T3 WITH(NOLOCK) ON T3.DivisionID IN (T1.DivisionID,''@@@'') AND T1.MachineID = T3.MachineID
					LEFT JOIN AT1102 T03 WITH(NOLOCK) ON T03.DivisionID IN (T1.DivisionID,''@@@'') AND T1.DepartmentID = T03.DepartmentID
					LEFT JOIN AT1103 T4 WITH(NOLOCK) ON T4.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID01 = T4.EmployeeID
					LEFT JOIN AT1103 T5 WITH(NOLOCK) ON T5.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID02 = T5.EmployeeID
					LEFT JOIN AT1103 T6 WITH(NOLOCK) ON T6.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID03 = T6.EmployeeID
					LEFT JOIN AT1103 T7 WITH(NOLOCK) ON T7.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID04 = T7.EmployeeID
					LEFT JOIN AT1103 T8 WITH(NOLOCK) ON T8.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID05 = T8.EmployeeID
					LEFT JOIN AT1103 T9 WITH(NOLOCK) ON T9.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID06 = T9.EmployeeID
					LEFT JOIN AT1103 T11 WITH(NOLOCK) ON T11.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID06 = T11.EmployeeID
				WHERE '+@sWhere+' AND T1.DeleteFlg = 0'

			SET @sSQL01 = N'
					INSERT INTO #QCP2000 (APK, DivisionID, VoucherNo, VoucherDate, TranMonth, TranYear, ShiftID, ShiftName,
										  DepartmentID, DepartmentName, MachineID, MachineName, EmployeeID01, EmployeeName01,
										  EmployeeID02, EmployeeName02, EmployeeID03, EmployeeName03, EmployeeID04, EmployeeName04,
										  EmployeeID05, EmployeeName05, EmployeeID06, EmployeeName06, EmployeeID07, EmployeeName07,
										  CreateDate, CreateUserID, LastModifyDate, LastModifyUserID, VoucherType)
					SELECT T1.APK, T1.DivisionID, T1.VoucherNo, T1.VoucherDate, T1.TranMonth, T1.TranYear, 
						T1.ShiftID, T2.ShiftName, T1.DepartmentID, T03.DepartmentName, T3.MachineID, T3.MachineName,
						T1.EmployeeID01, T4.FullName AS EmployeeName01,
						T1.EmployeeID02, T5.FullName AS EmployeeName02,
						T1.EmployeeID03, T6.FullName AS EmployeeName03,
						T1.EmployeeID04, T7.FullName AS EmployeeName04,
						T1.EmployeeID05, T8.FullName AS EmployeeName05,
						T1.EmployeeID06, T9.FullName AS EmployeeName06,
						T1.EmployeeID07, T11.FullName AS EmployeeName07,
						T1.CreateDate, T1.CreateUserID, T1.LastModifyDate, T1.LastModifyUserID, 
						0 AS VoucherType
						
					FROM QCT2000_TEMP T1 WITH(NOLOCK) 
						LEFT JOIN HT1020 T2 WITH(NOLOCK) ON T2.DivisionID IN (T1.DivisionID,''@@@'') AND T1.ShiftID = T2.ShiftID
						LEFT JOIN CIT1150 T3 WITH(NOLOCK) ON T3.DivisionID IN (T1.DivisionID,''@@@'') AND T1.MachineID = T3.MachineID
						LEFT JOIN AT1102 T03 WITH(NOLOCK) ON T03.DivisionID IN (T1.DivisionID,''@@@'') AND T1.DepartmentID = T03.DepartmentID
						LEFT JOIN AT1103 T4 WITH(NOLOCK) ON T4.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID01 = T4.EmployeeID
						LEFT JOIN AT1103 T5 WITH(NOLOCK) ON T5.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID02 = T5.EmployeeID
						LEFT JOIN AT1103 T6 WITH(NOLOCK) ON T6.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID03 = T6.EmployeeID
						LEFT JOIN AT1103 T7 WITH(NOLOCK) ON T7.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID04 = T7.EmployeeID
						LEFT JOIN AT1103 T8 WITH(NOLOCK) ON T8.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID05 = T8.EmployeeID
						LEFT JOIN AT1103 T9 WITH(NOLOCK) ON T9.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID06 = T9.EmployeeID
						LEFT JOIN AT1103 T11 WITH(NOLOCK) ON T11.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID06 = T11.EmployeeID
					WHERE '+@sWhere+' AND T1.DeleteFlg = 0 '
		END
		SET @sSQL02 = N'SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, 
						*
				FROM #QCP2000
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY'
				print @sSQL
				print @sSQL01
				print @sSQL02
		EXEC (@sSQL + @sSQL01 + @sSQL02)
END





GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
