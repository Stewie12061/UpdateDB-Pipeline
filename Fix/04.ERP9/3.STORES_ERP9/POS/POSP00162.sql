IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP00162]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP00162]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Lấy giá nhập gần nhất (Phiếu nhập và số dư) để gán cho phiếu nhập khi lập phiếu trả hàng/phiếu đổi hàng
---- Lưu ý: POS chỉ đang xử lý lấy giá đích danh và giá của phương pháp bình quân cuối kỳ, liên hoàn, chưa xử lý cho phương pháp nhập trước xuất trước
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 08/08/2017
----Edited by: Phan thanh hoàng vũ, Date: 11/09/2017: xử lý lấy giá đích danh cao nhất và giá bình quân từ ti
-- <Example> exec POSP00162 @DivisionID=N'MSA',@ShopID=N'CH_CNBL001',@InventoryIDList='ALIBOS8888'',''ALIBOS6666'',''VT000009'

CREATE PROCEDURE POSP00162 ( 
        @DivisionID VARCHAR(50),			--Biến môi trường
		@ShopID VARCHAR(50),				--Biến môi trường
		@InventoryIDList NVARCHAR(2000)     --Danh sách mặt hàng đổi/trả hàng
        ) 
AS 
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX)
	
	SET @sWhere = ''
	
	--Check Para DivisionIDList null then get DivisionID 
	IF Isnull(@DivisionID, '')!=''
		SET @sWhere = @sWhere + ' AND M.DivisionID = N'''+@DivisionID+''''
	
	IF Isnull(@ShopID, '') != ''
		SET @sWhere = @sWhere + ' AND M.ShopID = N'''+@ShopID+''''
	
	IF Isnull(@InventoryIDList, '')!=''
		SET @sWhere = @sWhere + ' AND D.InventoryID IN ('''+@InventoryIDList+''') '
	
	SET @sSQL = '	Select M.VoucherDate, D.CreateDate, N''POST0015'' as TypeID, D.DivisionID, D.ShopID
							, D.InventoryID, D.UnitPrice
							into #gianhapgannhat
					from POST0015 M With (NOLOCK) inner join POST00151 D With (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
												  Inner join AT1302 A  With (NOLOCK) on D.InventoryID = A.InventoryID and A.MethodID = 3
					Where M.DeleteFlg = 0 '+@sWhere+'
					Union all
					Select M.VoucherDate, D.CreateDate, N''POST0038'' as TypeID, D.DivisionID, D.ShopID
							, D.InventoryID, D.UnitPrice
					from POST0038 M With (NOLOCK) inner join POST0039 D With (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
												   Inner join AT1302 A  With (NOLOCK) on D.InventoryID = A.InventoryID and A.MethodID = 3
					Where M.DeleteFlg = 0 '+@sWhere+'

					SELECT  max(VoucherDate) as VoucherDate, max(CreateDate) as CreateDate, DivisionID, ShopID, InventoryID 
					into #gianhapgannhatA
					FROM #gianhapgannhat
					Group by DivisionID, ShopID, InventoryID

					SELECT Year(A.VoucherDate) as TranYear, Month(A.CreateDate) as TranMonth, B.TypeID, A.DivisionID, A.ShopID, A.InventoryID , B.UnitPrice
					FROM #gianhapgannhatA A inner join #gianhapgannhat B on A.VoucherDate = B.VoucherDate and A.CreateDate = B.CreateDate and A.InventoryID = B.InventoryID 
					Union all
					Select Max(TranYear) as TranYear, Max(TranMonth) as TranMonth, ''AT2008'' as TypeID, A.DivisionID, P10.ShopID, A.InventoryID , M.UnitPrice 
					From AT2008 M With (NOLOCK) Inner join AT1302 A  With (NOLOCK) on M.InventoryID = A.InventoryID and A.MethodID not in (1,3)
												Inner join POST0010 P10 With (NOLOCK) on M.DivisionID = P10.DivisionID and P10.ShopID = '''+@ShopID+''' and M.WareHouseID = P10.WareHouseID 
					Where M.DivisionID = '''+@DivisionID+'''
						 and M.InventoryID IN ('''+@InventoryIDList+''') 
					Group by A.DivisionID, P10.ShopID, A.InventoryID , M.UnitPrice 
				'
	
	EXEC (@sSQL)
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

