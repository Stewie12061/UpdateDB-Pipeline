IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP2033]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP2033]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Grid Detail Form POSF2033 (Phiếu đề nghị xuất hóa đơn) Kế thừa phiếu bán hàng
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Cao Thị Phượng, Date: 18/12/2017
----Edited by: hoàng vũ, 02/05/2018: lấy thêm 4 trường: DeliveryAddress, DeliveryContact, DeliveryMobile, DeliveryReceiver
----Edited by: hoàng vũ, 19/06/2018: Chặn những phiếu bán hàng đã kế thừa hết
----Edited by: Hoàng Vũ 26/07/2018: Dùng trường APKPackageInventoryID để truy ngược lại bảng giá bán theo gói (1 gói sản phẩm có thể khai báo 1 mặt hàng nhiều lần)
----Edited by: Hoàng Vũ 28/01/2019: Lấy chi tiết chiết khấu trước thuế
----Edited by: Trà Giang on 31/03/2020:  Tính đơn giá ( trừ phân bổ chiết khấu / giảm giá từ phiếu bán hàng ). 
-- <Example> EXEC POSP2033 'HCM' , 'E8561488-DE54-44CD-AC13-160C1CA7CA7C' , 'HCM008' ,1 ,20

Create PROCEDURE POSP2033
(
    @DivisionID VARCHAR(50), --Biến môi trường
    @APKList VARCHAR(MAX),	 --Giá trị chọn trên lưới master
	@UserID  VARCHAR(50),	 --Biến môi trường
	@PageNumber INT,		
	@PageSize INT			 --Biến môi trường
)
AS

	DECLARE @sSQL NVARCHAR(MAX),
			@sWhere AS NVARCHAR(4000),
			@OrderBy NVARCHAR(500),
			@TotalRow NVARCHAR(50)
	SET @sWhere = ' '
	SET @TotalRow = ''
	SET @OrderBy = ' D.InventoryID '

	IF @PageNumber = 1 
		SET @TotalRow = 'COUNT(*) OVER ()' 
	ELSE 
		SET @TotalRow = 'NULL'


	IF Isnull(@DivisionID, '') != ''
		SET @sWhere = @sWhere + ' D.DivisionID ='''+@DivisionID+''''
		
	IF Isnull(@APKList, '') != ''
		SET @sWhere = @sWhere + ' And D.APKMaster IN ('''+@APKList+''')'
	
	SET @sSQL = 'Select ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, D.APK, D.APKMaster, D.DivisionID
							, D.IsPackage, D.PackagePriceID, D.PackageID, D.InventoryID, D1.InventoryName, D.UnitID
							, Isnull(D.ActualQuantity, 0) as ActualQuantity
							, Case when isnull(D.IsTaxIncluded, 0) = 0 
							then D.UnitPrice -  (((D.ActualQuantity * D.UnitPrice)* ISNULL(V.Amount,0)) / ISNULL(M.TotalAmount,0))
											/ (1 + ((case when ISNULL(D.VATGroupID,'''') = '''' then AT1010.VATRate else A1.VATRate end)/ 100))
								 else ((D.BeforeVATUnitPrice + D.DiscountAmount /(Case when D.ActualQuantity = 1 then 1 else D.ActualQuantity End ) -
												(((D.ActualQuantity * D.UnitPrice)* ISNULL(V.Amount,0)) / ISNULL(M.TotalAmount,0))
														/ (1 + ((case when ISNULL(D.VATGroupID,'''') = '''' then AT1010.VATRate else A1.VATRate end)/ 100)))) end
												as UnitPrice												
							,  Isnull(D.ActualQuantity, 0) * Case when isnull(D.IsTaxIncluded, 0) = 0 
							then D.UnitPrice -  (((D.ActualQuantity * D.UnitPrice)* ISNULL(V.Amount,0)) / ISNULL(M.TotalAmount,0))
											/ (1 + ((case when ISNULL(D.VATGroupID,'''') = '''' then AT1010.VATRate else A1.VATRate end)/ 100))
								 else ((D.BeforeVATUnitPrice + D.DiscountAmount /(Case when D.ActualQuantity = 1 then 1 else D.ActualQuantity End ) -
												(((D.ActualQuantity * D.UnitPrice)* ISNULL(V.Amount,0)) / ISNULL(M.TotalAmount,0))
														/ (1 + ((case when ISNULL(D.VATGroupID,'''') = '''' then AT1010.VATRate else A1.VATRate end)/ 100)))) end
							as Amount
							, D.DiscountRate
							--, D.BeforeVATDiscountAmount as DiscountAmount
							, D.DiscountAmount
							, D.VATGroupID, D1.VATPercent
							, D.TaxAmount
							, D.TaxAmount as VATOriginalAmount
							, D.TaxAmount as VATConvertedAmount
							, D.SerialNo, M.VoucherNo, M.VoucherTypeID, M.VoucherDate, M.CurrencyID, M.ExchangeRate 
							, M.DeliveryAddress, M.DeliveryContact, M.DeliveryMobile, M.DeliveryReceiver
							, D.APKPackageInventoryID
					from POST0016 M WITH (NOLOCK) 
							inner join POST00161 D WITH (NOLOCK) On M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
							Left join POST2031 P31 WITH (NOLOCK) On P31.DivisionID = D.DivisionID and P31.APKMInherited = D.APKMaster and P31.APKDInherited = D.APK and P31.DeleteFlg = 0
							Left join AT1302 D1 WITH (NOLOCK) on D.InventoryID = D1.InventoryID
							LEFT JOIN ( select APKMaster, Amount  from POST00161 where  IsGiftVoucherUsed = 1 ) V on V.APKMaster = D.APKMaster
							left join AT1010 on  D1.VATGroupID = AT1010.VATGroupID
							left join AT1010 A1 on  D.VATGroupID = A1.VATGroupID
					WHERE '+@sWhere+' and M.DeleteFlg =0 and M.PVoucherNo is null and P31.APKMInherited is null
					ORDER BY '+@OrderBy+'
					OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
					FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
	Exec (@sSQL)
	print (@sSQL)
	

