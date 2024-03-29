IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP9003]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP9003]
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
----Modified by Le Hoang on 02/04/2021 : Bổ sung thêm cột Mặt hàng (trả dữ liệu dạng : MHA,MHB,MHC,.....)
----Modified by Le Hoang on 16/07/2021 : Bổ sung thêm cột Mã hàng, tên hàng, số batch (mỗi mã hàng 1 dòng)
-- <Example>

/*
--Lọc nâng cao
EXEC QCP9003 @DivisionID='BE' , @DivisionList='', @FromDate='2020-07-01',@ToDate ='2020-07-31',@IsDate =1,@PeriodIDList ='10/2018',@VoucherNo ='a',@SHPublishPeriodID='a',@ObjectID ='',@ObjectName ='a',
@Address ='a',@Tel='a',@VATno='a',@Email ='a',@Contactor='a',@PhoneNumber='a',@IdentificationNumber ='a',@ShareHolderCategoryID ='a', @UserID ='a',@PageNumber ='1',
@PageSize ='25',@SearchWhere=N' where IsNull(VoucherNo,'''') = N''asdas'''

--Lọc thường
exec QCP9003 @DivisionID=N'VNP',@UserID=N'ASOFTADMIN ',@DivisionList=N'',@ManufacturingDate=N'',@ShiftID=N'',@MachineID=N'',@TxtSearch=N'',@PageNumber=1,@PageSize=25,@SearchWhere=N''
*/

CREATE PROCEDURE QCP9003 ( 
        @DivisionID VARCHAR(50), 
		@ManufacturingDate NVARCHAR(MAX),
		@ShiftID NVARCHAR(MAX),
		@MachineID NVARCHAR(MAX),
		@TxtSearch NVARCHAR(MAX),
		@UserID VARCHAR(50),
		@PageNumber INT,
		@PageSize INT,
		@QCT2010APK NVARCHAR(50) = ''
) 
AS 
BEGIN
	DECLARE @sSQL NVARCHAR(MAX),
			@sWhere NVARCHAR(MAX) = N'',
			@OrderBy NVARCHAR(500) = N'', 
			@TotalRow NVARCHAR(50) = N''

		IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'COUNT(*) OVER ()'
		SET @OrderBy = ' DivisionID, VoucherDate, VoucherNo, BatchNo'
		SET @sWhere = ' 1 = 1 '
		
		IF ISNULL(@DivisionID, '') != ''
			SET @sWhere = @sWhere + N' AND T1.DivisionID = '''+@DivisionID+''''
			
		IF ISNULL(@ManufacturingDate, '') != '' 
			SET @sWhere = @sWhere + N' AND CONVERT(VARCHAR(50),T1.VoucherDate,103) >= '''+@ManufacturingDate+'''
									   AND CONVERT(VARCHAR(50),T1.VoucherDate,103) <= '''+SUBSTRING(@ManufacturingDate, 0, 11) + ' 23:59:59' +''''

		IF ISNULL(@ShiftID, '') != '' 
			SET @sWhere = @sWhere + N' AND T1.ShiftID LIKE N''%'+@ShiftID+'%'''

		IF ISNULL(@MachineID, '') != '' 
			SET @sWhere = @sWhere + N' AND T1.MachineID LIKE N''%'+@MachineID+'%'''

		IF ISNULL(@TxtSearch, '') != '' 
			SET @sWhere = @sWhere + N' 
			AND (  T1.EmployeeID01 LIKE N''%'+@TxtSearch+'%''
				OR T1.EmployeeID02 LIKE N''%'+@TxtSearch+'%''
				OR T1.EmployeeID03 LIKE N''%'+@TxtSearch+'%''
				OR T1.EmployeeID04 LIKE N''%'+@TxtSearch+'%''
				OR T1.EmployeeID05 LIKE N''%'+@TxtSearch+'%''
				OR T1.EmployeeID06 LIKE N''%'+@TxtSearch+'%''
				OR T1.Description LIKE N''%'+@TxtSearch+'%''
				OR T1.VoucherNo LIKE N''%'+@TxtSearch+'%''
				OR T11.InventoryID LIKE N''%'+@TxtSearch+'%''
				OR T12.InventoryName LIKE N''%'+@TxtSearch+'%''
				OR T11.BatchNo LIKE N''%'+@TxtSearch+'%''
			)'

		SET @sSQL = N'
				SELECT T1.APK, T1.DivisionID, T1.VoucherNo, T1.VoucherDate, T1.TranMonth, T1.TranYear, 
					T1.ShiftID, T2.ShiftName, T1.DepartmentID, T03.DepartmentName, T3.MachineID, T3.MachineName,
					T4.FullName AS Employee01, T5.FullName AS Employee02,
					T6.FullName AS Employee03, T7.FullName AS Employee04,
					T8.FullName AS Employee05, T9.FullName AS Employee06,
					T1.Description, T1.Notes01, T1.Notes02, T1.Notes03,
					T1.CreateDate, T1.CreateUserID, T1.LastModifyDate, T1.LastModifyUserID,
					T11.InventoryID, T12.InventoryName, T11.BatchNo
				INTO #QCP9003
				FROM QCT2000 T1 WITH(NOLOCK)
					LEFT JOIN QCT2001 T11 WITH(NOLOCK) ON T11.DivisionID = T1.DivisionID AND T11.APKMaster = T1.APK
					LEFT JOIN AT1302 T12 WITH(NOLOCK) ON T12.DivisionID IN (T11.DivisionID,''@@@'') AND T12.InventoryID = T11.InventoryID
					LEFT JOIN HT1020 T2 WITH(NOLOCK) ON T2.DivisionID IN (T1.DivisionID,''@@@'') AND T1.ShiftID = T2.ShiftID
					LEFT JOIN CIT1150 T3 WITH(NOLOCK) ON T3.DivisionID IN (T1.DivisionID,''@@@'') AND T1.MachineID = T3.MachineID
					LEFT JOIN AT1102 T03 WITH(NOLOCK) ON T03.DivisionID IN (T1.DivisionID,''@@@'') AND T1.DepartmentID = T03.DepartmentID
					LEFT JOIN AT1103 T4 WITH(NOLOCK) ON T4.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID01 = T4.EmployeeID
					LEFT JOIN AT1103 T5 WITH(NOLOCK) ON T5.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID02 = T5.EmployeeID
					LEFT JOIN AT1103 T6 WITH(NOLOCK) ON T6.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID03 = T6.EmployeeID
					LEFT JOIN AT1103 T7 WITH(NOLOCK) ON T7.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID04 = T7.EmployeeID
					LEFT JOIN AT1103 T8 WITH(NOLOCK) ON T8.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID05 = T8.EmployeeID
					LEFT JOIN AT1103 T9 WITH(NOLOCK) ON T9.DivisionID IN (T1.DivisionID,''@@@'') AND T1.EmployeeID06 = T9.EmployeeID
				WHERE '+@sWhere+' AND T1.DeleteFlg = 0

				SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, 
						T1.APK, T1.DivisionID, T1.VoucherNo, T1.VoucherDate, T1.TranMonth, T1.TranYear, 
						T1.ShiftID, T1.ShiftName, T1.DepartmentID, T1.DepartmentName, T1.MachineID, T1.MachineName,
						T1.Employee01, T1.Employee02, T1.Employee03, T1.Employee04, T1.Employee05, T1.Employee06,
						T1.Description, T1.Notes01, T1.Notes02, T1.Notes03,
						T1.CreateDate, T1.CreateUserID, T1.LastModifyDate, T1.LastModifyUserID, T1.InventoryID, T1.InventoryName, T1.BatchNo
				FROM #QCP9003 T1
				WHERE EXISTS (  
					 SELECT DISTINCT QCT2000.APK FROM QCT2000 QCT2000 WITH(NOLOCK) 
					 JOIN QCT2001 QCT2001 WITH(NOLOCK) ON QCT2001.APKMaster = QCT2000.APK  
					 LEFT JOIN (  
						SELECT QCT2010.APK AS QCT2010APK, QCT2011.APK AS QCT2011APK, QCT2010.VoucherNo, QCT2010.VoucherDate, QCT2011.MaterialID,	QCT2011.RefAPKMaster, QCT2011.RefAPKDetail 
						FROM QCT2010 QCT2010  
						JOIN QCT2011 QCT2011 ON QCT2011.APKMaster = QCT2010.APK  
						WHERE VoucherType = ''2'' AND QCT2010.DeleteFlg = 0 AND QCT2011.DeleteFlg = 0  ) AS VoucherMaterial ON VoucherMaterial.RefAPKMaster = QCT2000.APK AND VoucherMaterial.RefAPKDetail = QCT2001.APK   
					 WHERE (QCT2010APK IS NULL OR CAST(QCT2010APK AS NVARCHAR(50)) = ''' + @QCT2010APK + ''') AND T1.APK = QCT2000.APK)  
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY'
		PRINT (@sSQL)
		EXEC (@sSQL)
END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO