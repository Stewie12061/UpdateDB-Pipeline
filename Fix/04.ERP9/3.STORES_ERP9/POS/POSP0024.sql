IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0024]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP0024]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load Grid danh sách phiếu chênh lệch
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Phan thanh hoang vu
----Create date: 17/04/2014
----Modify by: Hoàng vũ; on 21/06/2016 - Cải tiến tốc độ và chạy đọc lập POS
----Modify by: Hoàng vũ; on 31/01/2018 - Sắp xếp giảm dần
----EXEC POSP0024 'HT',1,'2014-02-01','2014-010-01','01/2016'',''02/2016'',''06/2016','KC'',''GS','a','a','a','a',1,25

CREATE PROCEDURE [dbo].[POSP0024]
	@DivisionID NVARCHAR(50),
	@IsDate tinyint, --0: Tìm theo ngày, 1: Tìm theo kỳ
	@FromDate datetime,
	@ToDate datetime,
	@PeriodIDList NVARCHAR(4000),
	@DivisionIDList NVARCHAR(2000),
	@ShopID varchar(50),
	@VoucherNo varchar(50),
	@EmployeeID varchar(50),
	@EmployeeName nvarchar(250),
	@PageNumber INT,
	@PageSize INT,
	@ShopIDPermission NVARCHAR(MAX) = NULL
AS
BEGIN
		DECLARE @sWhere NVARCHAR(2000),
				@OrderBy NVARCHAR(500),
				@sSQL01 NVARCHAR (MAX),
				@sSQL02 NVARCHAR (MAX),
				@sSQL03 NVARCHAR (MAX)
		SET @sWhere = ''
		SET @OrderBy = ' VoucherDate Desc, VoucherNo'
		
		--Check Para DivisionIDList null then get DivisionID 
		IF Isnull(@DivisionIDList, '')!=''
			SET @sWhere = @sWhere + ' DivisionID IN ('''+@DivisionIDList+''')'
		Else 
			SET @sWhere = @sWhere + ' DivisionID IN ('''+@DivisionID+''')'

		IF @IsDate = 0 
			SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10),VoucherDate,112) BETWEEN '+CONVERT(VARCHAR(10),@FromDate,112)+' AND '+CONVERT(VARCHAR(10),@ToDate,112)+' '
		IF @IsDate = 1 
			SET @sWhere = @sWhere + ' AND (Case When  TranMonth <10 then ''0''+rtrim(ltrim(str(TranMonth)))+''/''+ltrim(Rtrim(str(TranYear))) 
									Else rtrim(ltrim(str(TranMonth)))+''/''+ltrim(Rtrim(str(TranYear))) End) IN ('''+@PeriodIDList+''')'
		IF Isnull(@ShopID, '')!=''
		BEGIN
			SET @sWhere = @sWhere + ' AND ISNULL(ShopID,'''') LIKE N''%'+@ShopID+'%'' '
		END
		SET @sWhere = @sWhere + ' AND ShopID IN ('''+@ShopIDPermission+''')'

		IF Isnull(@VoucherNo, '') != '' 
			SET @sWhere = @sWhere + ' AND ISNULL(VoucherNo,'''') LIKE N''%'+@VoucherNo+'%'' '
		IF Isnull(@EmployeeID, '') != ''
			SET @sWhere = @sWhere + ' AND ISNULL(EmployeeID,'''') LIKE N''%'+@EmployeeID+'%'' '
		IF Isnull(@EmployeeName, '') != ''
			SET @sWhere = @sWhere + ' AND ISNULL(EmployeeName,'''') LIKE N''%'+@EmployeeName+'%''  '
		
		--Lọc dữ liệu
		SET @sSQL01 = '		DECLARE @POST0024 table 
							(	APK NVARCHAR(Max),
								DivisionID NVARCHAR(50),
								ShopID NVARCHAR(50),
								VoucherDate Datetime,
								VoucherNo NVARCHAR(50),
								EVoucherNo NVARCHAR(50),
								EmployeeID NVARCHAR(50),
								EmployeeName NVARCHAR(250),
								Description NVARCHAR(250)
							)
							Insert into @POST0024 (APK, DivisionID, ShopID, VoucherDate, VoucherNo, EVoucherNo, EmployeeID, EmployeeName, Description)
							Select	APK, DivisionID, ShopID, VoucherDate, VoucherNo, EVoucherNo, EmployeeID, EmployeeName, Description
							FROM POST0024 WITH (NOLOCK) 
							WHERE ' +@sWhere + 'AND DeleteFlg = 0	'
		--Xử lý phân trang
		SET @sSQL02 = '		Declare @CountTotal NVARCHAR(Max)
							IF '+Cast(@PageNumber as varchar(2)) + ' = 1
								Set @CountTotal = (Select Count(APK) From @POST0024)
							Else
								Set @CountTotal = 0 '
		--Lấy kết quả
		SET @sSQL03 = '		SELECT 	ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @CountTotal AS TotalRow,
									APK, DivisionID, ShopID, VoucherDate, VoucherNo, EVoucherNo, EmployeeID, EmployeeName, Description
							FROM @POST0024 
							ORDER BY '+@OrderBy+'
							OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
							FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
		EXEC (@sSQL01+@sSQL02+@sSQL03)
END
