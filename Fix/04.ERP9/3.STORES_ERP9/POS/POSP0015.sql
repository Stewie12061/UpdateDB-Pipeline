IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0015]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP0015]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load Grid danh sách phiếu nhập hàng
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Phan thanh hoang vu
----Create date: 25/03/2014
--- Modify by hoàng vũ, on 31/01/2018: Sắp xếp giảm dần
/*
	EXEC POSP0015 'TMQ3',null,1,25,1,'2014-01-01','2017-01-01', '01/2016'',''06/2016',null,null,null,null,null,null, 1, 'a'
	EXEC POSP0015 'TMQ3',null,1,25,1,'2014-01-01','2017-01-01', '01/2016'',''06/2016','a','a','a','a','a','a', 1, 'a'
*/
 CREATE PROCEDURE POSP0015
(
	 @DivisionID VARCHAR(50),
     @DivisionIDList NVARCHAR(2000),
     @PageNumber INT,
     @PageSize INT,
     @IsDate TINYINT, --0:Datetime; 1:Period
     @FromDate DATETIME,
     @ToDate DATETIME,
	 @PeriodIDList NVARCHAR(4000),
     @ShopID NVARCHAR(50),
     @VoucherNo NVARCHAR(50),
	 @EmployeeID NVARCHAR(50),
	 @EmployeeName NVARCHAR(250),
	 @DelivererName NVARCHAR(250),
	 @Description NVARCHAR(250),
	 @Status NVARCHAR(50),
	 @RefVoucherNo NVARCHAR(50),
	 @ShopIDPermission NVARCHAR(MAX) = NULL
)
AS
DECLARE @sSQL01 NVARCHAR (MAX),
		@sSQL02 NVARCHAR (MAX),
		@sSQL03 NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
		@OrderBy NVARCHAR(500)

	SET @sWhere = ''
	SET @OrderBy = ' x.VoucherDate Desc, x.VoucherNo'
	
	--Check Para DivisionIDList null then get DivisionID 
	IF Isnull(@DivisionIDList, '') != '' 
		SET @sWhere = @sWhere + ' M.DivisionID IN ('''+@DivisionIDList+''')'
	Else 
		SET @sWhere = @sWhere + ' M.DivisionID IN ('''+@DivisionID+''')'
		
	IF Isnull(@ShopID, '')!=''
	BEGIN
		SET @sWhere = @sWhere + ' AND ISNULL(M.ShopID,'''') LIKE N''%'+@ShopID+'%'' '
	END
	SET @sWhere = @sWhere + ' AND M.ShopID IN ('''+@ShopIDPermission+''')'

	IF Isnull(@VoucherNo, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.VoucherNo,'''') LIKE N''%'+@VoucherNo+'%'' '
	IF Isnull(@EmployeeID, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.EmployeeID,'''') LIKE N''%'+@EmployeeID+'%'' '
	IF Isnull(@EmployeeName, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.EmployeeName,'''') LIKE N''%'+@EmployeeName+'%'' '
	IF Isnull(@DelivererName, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.DelivererName,'''') LIKE N''%'+@DelivererName+'%'' '
	IF Isnull(@Description, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.Description,'''') LIKE N''%'+@Description+'%'' '
	IF @IsDate = 0 
		SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10),M.VoucherDate,112) BETWEEN '+CONVERT(VARCHAR(10),@FromDate,112)+' AND '+CONVERT(VARCHAR(10),@ToDate,112)+' '
	IF @IsDate = 1 
		SET @sWhere = @sWhere + ' AND (Case When  M.TranMonth <10 then ''0''+rtrim(ltrim(str(M.TranMonth)))+''/''+ltrim(Rtrim(str(M.TranYear))) 
									Else rtrim(ltrim(str(M.TranMonth)))+''/''+ltrim(Rtrim(str(M.TranYear))) End) IN ('''+@PeriodIDList+''')'
	IF Isnull(@Status, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(D.Status,'''') LIKE N''%'+@Status+'%'''

	IF Isnull(@RefVoucherNo, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL((Case When P16.PVoucherNo is not null then P16.PVoucherNo 
												  When P16.CVoucherNo is not null then P16.CVoucherNo 
												  When P16.VoucherNo is not null then P16.VoucherNo 
												  else D.EVoucherNo End),'''') LIKE N''%'+@RefVoucherNo+'%'' '

	   --Lấy Distinct phiếu bán hàng
			SET @sSQL01 = '		DECLARE @POST0015 table 
								(	APK NVARCHAR(Max),
									DivisionID NVARCHAR(50),
									ShopID NVARCHAR(50),
									VoucherTypeID NVARCHAR(50),
									VoucherNo NVARCHAR(50),
									RefVoucherNo NVARCHAR(50),
									VoucherDate Datetime,
									EmployeeID NVARCHAR(50),
									EmployeeName NVARCHAR(250),
									DelivererName NVARCHAR(250),
									Description NVARCHAR(250)
								)
								Insert into @POST0015 (APK, DivisionID, ShopID, VoucherTypeID, VoucherNo , RefVoucherNo, VoucherDate
														, EmployeeID, EmployeeName, DelivererName, Description)
								Select	Distinct M.APK, M.DivisionID, M.ShopID, M.VoucherTypeID, M.VoucherNo
										,	(Case When P16.PVoucherNo is not null then P16.PVoucherNo 
												  When P16.CVoucherNo is not null then P16.CVoucherNo 
												  When P16.VoucherNo is not null then P16.VoucherNo 
												  else D.EVoucherNo End) as RefVoucherNo
										, M.VoucherDate, M.EmployeeID, M.EmployeeName, M.DelivererName, M.Description

								FROM POST0015 M WITH (NOLOCK) left join POST00151 D WITH (NOLOCK) On M.DivisionID = D.DivisionID and M.APK=D.APKMaster 
														Left Join POST0016 P16 WITH (NOLOCK) on M.DivisionID = P16.DivisionID and (M.VoucherID = P16.VoucherID or M.VoucherID = Convert(varchar(50),P16.APK))
								WHERE ' +@sWhere + 'AND M.DeleteFlg = 0 '
		--Kiểm tra load mac định thì lấy tổng số trang, ngược lại thì không lấy tổng số trang (Cải tiến tốc độ )
			SET @sSQL02 = '		Declare @CountTotal NVARCHAR(Max)
								IF '+Cast(@PageNumber as varchar(2)) + ' = 1
									Set @CountTotal = (Select Count(APK) From @POST0015)
								Else
									Set @CountTotal = 0
								'
			SET @sSQL03 = '		SELECT 	ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @CountTotal AS TotalRow,
										x.APK, x.DivisionID, x.ShopID, x.VoucherTypeID, x.VoucherNo , x.RefVoucherNo, x.VoucherDate
														, x.EmployeeID, x.EmployeeName, x.DelivererName, x.Description
								FROM @POST0015 x
								ORDER BY '+@OrderBy+'
								OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
								FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '


EXEC (@sSQL01+@sSQL02+@sSQL03)


