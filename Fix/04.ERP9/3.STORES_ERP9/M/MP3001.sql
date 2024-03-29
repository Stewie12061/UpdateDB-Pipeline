IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MP3001]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MP3001]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






-- <Summary>
--- Báo cáo theo dõi tiến độ mặt hàng theo công đoạn
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
---- Created by: Kiều Nga on: 14/04/2021
---- Modified on 05/10/2021 by Văn Tài : Bổ sung trường hợp check không phát sinh các dữ liệu công đoạn để không gây lỗi.
---- Modified on 09/05/2023 by Phương Thảo:[2023/04/IS/0088]-[EXEDY] Cho cái cũ vào customize MAITHU(117)- luồng chuẩn(EXEDY) lấy theo đơn hàng sản xuất không dùng thông tin sản xuất cũ của MAITHU
---- Modified on 09/05/2023 by Phương Thảo:[2023/06/IS/0205]-[THABICO] Cho cái cũ vào customize MAITHU(117)- luồng chuẩn(THABICO) lấy theo đơn hàng sản xuất không dùng thông tin sản xuất cũ của MAITHU 
                                              -- số lượng công đoạn = Tổng số lượng thực tế( ItemActual) công đoạn ở Thống kê kết quả sản xuất/ số lượng Tp ở KHSX
---- Modified on 14/08/2023 by Mạnh Cường:[2023/08/IS/0133]-[MAITHU] FIX lỗi M/MF3000 - Khi in Báo cáo Theo dõi tiến độ mặt hàng theo công đoạn đã chọn các điều kiện in nhưng in không hiện dữ liệu


-- <Example>
/*
	MP3001 'HD','', 1, 2015, 6, 2015
*/
CREATE PROCEDURE MP3001
(
	@DivisionID VARCHAR(50),
	@DivisionIDList NVARCHAR(2000),
	@IsDate INT, ---- 1: là ngày, 0: là kỳ
	@FromDate DATETIME,
	@ToDate DATETIME,
	@PeriodList NVARCHAR(MAX),
	@PhaseID NVARCHAR(MAX),
	@InventoryID NVARCHAR(MAX)
)
AS

DECLARE @sSQL NVARCHAR (MAX)='',
        @sSQL1 NVARCHAR (MAX)='',
		@sSQL2 NVARCHAR (MAX)='',
        @sWhere NVARCHAR(MAX)='',
		@sWhere1 NVARCHAR(MAX)='',
		@sJoin NVARCHAR(MAX)='',
		@sSelect NVARCHAR(MAX)='',
		@CustomerIndex INT
-- Lấy customer index hiện tại
SELECT TOP(1) @CustomerIndex = CustomerName FROM CustomerIndex



        
--Search theo đơn vị @DivisionIDList trống thì lấy biến môi trường @DivisionID
IF Isnull(@DivisionIDList, '') != ''
	BEGIN
		SET @sWhere = ' T1.DivisionID IN ('''+@DivisionIDList+''')'
		SET @sWhere1 = ' TT.DivisionID IN ('''+@DivisionIDList+''')'
	END
ELSE 
	BEGIN
		SET @sWhere = ' T1.DivisionID = N'''+@DivisionID+''''	
		SET @sWhere1 = ' TT.DivisionID = N'''+@DivisionID+''''	
	END

IF @IsDate = 0
	BEGIN
	IF ISNULL(@PeriodList,'') <> ''
		SET @sWhere = @sWhere + ' AND ((CASE WHEN T1.TranMonth <10 THEN ''0'' ELSE '''' END) + rtrim(ltrim(str(T1.TranMonth)))+''/''+ltrim(Rtrim(str(T1.TranYear))) in ('''+@PeriodList +'''))'
		SET @sWhere1 = @sWhere1 + ' AND ((CASE WHEN TT.TranMonth <10 THEN ''0'' ELSE '''' END) + rtrim(ltrim(str(TT.TranMonth)))+''/''+ltrim(Rtrim(str(TT.TranYear))) in ('''+@PeriodList +'''))'
	END
ELSE
	BEGIN
	IF ISNULL(@FromDate,'') <> '' AND ISNULL(@ToDate,'') <> ''
		SET @sWhere = @sWhere + ' AND (Convert(varchar(20),T1.OrderDate,112) Between ''' + Convert(varchar(20),@FromDate,112) + ''' AND ''' + Convert(varchar(20),Isnull(@ToDate,'12/31/9999'),112) + ''')'
		SET @sWhere1 = @sWhere1 + ' AND (Convert(varchar(20),TT.VoucherDate,112) Between ''' + Convert(varchar(20),@FromDate,112) + ''' AND ''' + Convert(varchar(20),Isnull(@ToDate,'12/31/9999'),112) + ''')'
	END

IF ISNULL(@InventoryID,'') <> ''
BEGIN
	SET @sWhere = @sWhere + 'AND T2.InventoryID IN ( '''+@InventoryID+''')'
	SET @sWhere1 = @sWhere1 + 'AND TT.InventoryID IN ( '''+@InventoryID+''')'
END

-- Lấy dữ liệu công đoạn
DECLARE @cols  AS NVARCHAR(MAX)='';

IF(ISNULL(@PhaseID,'') <> '')
BEGIN
	SELECT @cols = @cols + QUOTENAME(Value) + ',' FROM (select Value from dbo.StringSplit(Replace(@PhaseID,'''',''),',')
															) as tmp
	SET @sSQL2 = '
	-- load caption công đoạn 
	select PhaseName from AT0126 WITH (NOLOCK) where Disabled =0 AND PhaseID in ('''+@PhaseID+''')'
END
ELSE
BEGIN
	SELECT @cols = @cols + QUOTENAME(PhaseID) + ',' FROM (select PhaseID
															from AT0126 WITH (NOLOCK)
															where Disabled =0
															) as tmp
	SET @sSQL2 = '
	-- load caption công đoạn 
	select PhaseName from AT0126 WITH (NOLOCK) where Disabled =0'
END

SELECT @cols = substring(@cols, 0, len(@cols))

IF(@CustomerIndex = 117)---customize cho MaiTHU
BEGIN
	IF ISNULL(@cols, '') <> ''
	BEGIN

		SET @sJoin = 
				' INNER JOIN (SELECT * from 
					(
						SELECT DISTINCT T2.APK as APKSOT2080,T5.PhaseID,T3.Quantity as MT2141Quantity,T5.Quantity
						FROM SOT2080 T2 WITH (NOLOCK)
						INNER JOIN OT2202 OT02 WITH (NOLOCK) ON OT02.MOrderID = T2.VoucherNo
						INNER JOIN MT2141 T3 WITH (NOLOCK) ON  T3.InheritVoucherID = OT02.EstimateID
						INNER JOIN MT2140 MT40 WITH(NOLOCK) ON MT40.APK =T3.APKMaster
						INNER JOIN MT2160 T4 WITH (NOLOCK) ON T4.InheritMT2140 = 1 AND T4.MPlanID = MT40.VoucherNo
						INNER JOIN MT2211 T5 WITH (NOLOCK) ON T5.InheritTableID =''MT2160'' AND T5.InheritVoucherID = T4.APK
					) src
					pivot 
					(
						max(Quantity) for PhaseID in (' + @cols + ')
					) piv ) as P ON P.APKSOT2080 = TT.APK
				'
		SET @sSelect = ',P.*'
		-------------------------------------------------

		SET @sSQL = N' 
		SELECT T1.VoucherNo, T2.InventoryID, T3.InventoryName,T2.OrderQuantity '+@sSelect+'
		FROM OT2001 T1 WITH (NOLOCK)
		LEFT JOIN OT2002 T2 ON T1.SOrderID = T2.SOrderID
		LEFT JOIN AT1302 T3 ON T2.InventoryID = T3.InventoryID AND T3.DivisionID IN (''@@@'',T2.DivisionID)
		INNER JOIN SOT2080 TT ON CONVERT(nvarchar(50),T2.SOrderID) =  CONVERT(nvarchar(50),TT.APKInherit)
		'+@sJoin+'
		WHERE '+@sWhere+'
		'

		SET @sSQL1=N'
		UNION ALL
		SELECT TT.VoucherNo, TT.InventoryID, T3.InventoryName,T2.ActualQuantity as OrderQuantity '+@sSelect+'
		FROM SOT2080 TT WITH (NOLOCK)
		LEFT JOIN SOT2081 T2 ON TT.APK = T2.APKMaster
		LEFT JOIN AT1302 T3 ON TT.InventoryID = T3.InventoryID AND T3.DivisionID IN (''@@@'',TT.DivisionID)
		LEFT JOIN OT2001 T4 ON CONVERT(nvarchar(50),T4.SOrderID) =  CONVERT(nvarchar(50),TT.APKInherit)
		'+@sJoin+'
		WHERE '+@sWhere1+' AND T4.SOrderID IS NULL

		'

	END
	ELSE
	BEGIN

		SET @sJoin = ' '
		SET @sSelect = ' '
		-------------------------------------------------

		SET @sSQL = N' 
		SELECT T1.VoucherNo, T2.InventoryID, T3.InventoryName,T2.OrderQuantity '+@sSelect+'
		FROM OT2001 T1 WITH (NOLOCK)
		LEFT JOIN OT2002 T2 ON T1.SOrderID = T2.SOrderID
		LEFT JOIN AT1302 T3 ON T2.InventoryID = T3.InventoryID AND T3.DivisionID IN (''@@@'',T2.DivisionID)
		INNER JOIN SOT2080 TT ON CONVERT(nvarchar(50),T2.SOrderID) =  CONVERT(nvarchar(50),TT.APKInherit)
		'+@sJoin+'
		WHERE '+@sWhere+'
		'

		SET @sSQL1=N'
		UNION ALL
		SELECT TT.VoucherNo, TT.InventoryID, T3.InventoryName,T2.ActualQuantity as OrderQuantity '+@sSelect+'
		FROM SOT2080 TT WITH (NOLOCK)
		LEFT JOIN SOT2081 T2 ON TT.APK = T2.APKMaster
		LEFT JOIN AT1302 T3 ON TT.InventoryID = T3.InventoryID AND T3.DivisionID IN (''@@@'',TT.DivisionID)
		LEFT JOIN OT2001 T4 ON CONVERT(nvarchar(50),T4.SOrderID) =  CONVERT(nvarchar(50),TT.APKInherit)
		'+@sJoin+'
		WHERE '+@sWhere1+' AND T4.SOrderID IS NULL

		'
	END

END
ELSE----luồng chuẩn(THABICO)
BEGIN

	IF ISNULL(@cols, '') <> ''
	BEGIN
			SET @sSQL = N'
				SELECT P.*
				FROM
				(
					SELECT 
					       T1.VoucherNo,
						   T2.InventoryID,
						   T3.InventoryName,
						   T2.OrderQuantity,
						   T2.APK as APKOT2001,
						   MT11.PhaseID,
						   T41.Quantity AS MT2141Quantity,
						   MT11.ItemActual AS Quantity
					FROM MT2211 MT11 WITH (NOLOCK)
					INNER JOIN MT2160 T60 WITH (NOLOCK) ON MT11.InheritVoucherID = T60.apk AND ISNULL(IsWaste, 0) = 0
					INNER JOIN MT2142 T42 WITH (NOLOCK) ON T60.InheritTransactionID = T42.APK
					INNER JOIN MT2141 T41 WITH (NOLOCK) ON T42.APK_MT2141 = T41.apk
					INNER JOIN OT2202 T22 WITH (NOLOCK) ON T41.InheritTransactionID = CONVERT(VARCHAR(50), T22.apk)
					INNER JOIN OT2002 T2 WITH (NOLOCK) ON T22.InheritTransactionID = T2.apk
					INNER JOIN OT2001 T1 WITH (NOLOCK) ON T1.SOrderID = T2.SOrderID
					INNER JOIN AT1302 T3 ON T2.InventoryID = T3.InventoryID AND T3.DivisionID IN (''@@@'', MT11.DivisionID)
					WHERE '+@sWhere+'
   
				) src
				PIVOT
				(
					SUM(Quantity) FOR PhaseID IN (' + @cols + ')
				) P;'
	END

END

EXEC (@sSQL + @sSQL1 +@sSQL2)

PRINT (@sSQL)
PRINT (@sSQL1)
PRINT (@sSQL2)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
