IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0017]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP0017]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load Grid danh sách phiếu kiểm kê
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Phan thanh hoang vu; Create date: 11/04/2014
----Modify by: Phan thanh hoang vu; 14/06/2016: cải thiện tốc độ và tahy đồi control load từ kỳ, đến kỳ
----Modify by: Phan thanh hoang vu; 31/01/2018: Sắp xếp giảm dần
/*
	EXEC POSP0017 'AS','AS',1,25,1,'2011-02-01','2011-010-01','01/2016'',''02/2016'',''06/2016','CH01','1','1','1'
	
*/
 CREATE PROCEDURE POSP0017
(
	 @DivisionID VARCHAR(50),
     @DivisionIDList NVARCHAR(2000),
     @PageNumber INT,
     @PageSize INT,
     @IsDate TINYINT, --0:Datetime; 1:Period
     @FromDate DATETIME,
     @ToDate DATETIME,
	 @PeriodList NVARCHAR(2000),
	 @ShopID NVARCHAR(50),
     @VoucherNo NVARCHAR(50),
	 @EmployeeName NVARCHAR(50),
	 @Description NVARCHAR(250),
	 @ShopIDPermission NVARCHAR(MAX) = NULL
)
AS
DECLARE @sSQL01 NVARCHAR (4000),
		@sSQL02 NVARCHAR (4000),
		@sSQL03 NVARCHAR (2000),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500)

	SET @sWhere = ''
	SET @OrderBy = ' VoucherDate desc, VoucherNo'

	--Check Para DivisionIDList null then get DivisionID 
	IF Isnull(@DivisionIDList, '') != ''
		SET @sWhere = @sWhere + ' DivisionID IN ('''+@DivisionIDList+''')'
	Else 
		SET @sWhere = @sWhere + ' DivisionID IN ('''+@DivisionID+''')'
	
	IF @IsDate = 0 
		SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10),VoucherDate,112) BETWEEN '+CONVERT(VARCHAR(10),@FromDate,112)+' AND '+CONVERT(VARCHAR(10),@ToDate,112)+' '
	
	IF @IsDate = 1 
		SET @sWhere = @sWhere + ' AND (Case When  TranMonth <10 then ''0''+rtrim(ltrim(str(TranMonth)))+''/''+ltrim(Rtrim(str(TranYear))) 
							Else rtrim(ltrim(str(TranMonth)))+''/''+ltrim(Rtrim(str(TranYear))) End) IN ('''+@PeriodList+''')'

	IF Isnull(@ShopID, '')!=''
	BEGIN
		SET @sWhere = @sWhere + ' AND ISNULL(ShopID,'''') LIKE N''%'+@ShopID+'%'' '
	END
	SET @sWhere = @sWhere + ' AND ShopID IN ('''+@ShopIDPermission+''')'
	
	IF Isnull(@VoucherNo, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(VoucherNo,'''') LIKE N''%'+@VoucherNo+'%'' '
	
	IF Isnull(@EmployeeName, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(EmployeeName,'''') LIKE N''%'+@EmployeeName+'%'' '
	
	IF Isnull(@Description, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(Description,'''') LIKE N''%'+@Description+'%'' '
	
	--Lấy Distinct Phiếu kiểm kê
	SET @sSQL01 = '		DECLARE @POST0017 table 
						(	APK NVARCHAR(Max),
							DivisionID NVARCHAR(50),
							ShopID NVARCHAR(50),
							VoucherTypeID NVARCHAR(50),
							VoucherNo NVARCHAR(50),
							VoucherDate Datetime,
							TranMonth Int,
							TranYear Int,
							ObjectID  NVARCHAR(50),
							ObjectName NVARCHAR(250),
							EmployeeID NVARCHAR(50),
							EmployeeName NVARCHAR(250),
							Description NVARCHAR(250),
							Status  TINYINT
						)
						Insert into @POST0017 (APK, DivisionID, ShopID, VoucherTypeID, VoucherNo , VoucherDate, TranMonth
												, TranYear, ObjectID, ObjectName, EmployeeID, EmployeeName, Description,Status)
						Select	APK, DivisionID, ShopID, VoucherTypeID, VoucherNo , VoucherDate, TranMonth
												, TranYear, ObjectID, ObjectName, EmployeeID, EmployeeName, Description,Status
						FROM POST0017 WITH (NOLOCK)
						WHERE ' +@sWhere + 'AND DeleteFlg = 0	'

	--Kiểm tra load mac định thì lấy tổng số trang, ngược lại thì không lấy tổng số trang (Cải tiến tốc độ )
	SET @sSQL02 = '		Declare @CountTotal NVARCHAR(Max)
						IF '+Cast(@PageNumber as varchar(2)) + ' = 1
							Set @CountTotal = (Select Count(APK) From @POST0017)
						Else
							Set @CountTotal = 0
						'
	SET @sSQL03 = '
		SELECT 	ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @CountTotal AS TotalRow,
				APK, DivisionID, ShopID, VoucherTypeID, VoucherNo , VoucherDate, TranMonth
				, TranYear, ObjectID, ObjectName, EmployeeID, EmployeeName, Description,Status
		FROM @POST0017 
		ORDER BY '+@OrderBy+'
		OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
		FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

EXEC (@sSQL01+@sSQL02+@sSQL03)
