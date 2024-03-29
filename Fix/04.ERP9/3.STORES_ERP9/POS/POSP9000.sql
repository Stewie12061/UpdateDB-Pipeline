IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP9000]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP9000]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
----<Summary>
----Kiểm tra @ID hoặc @APK đã sử dụng trước khi xóa
---- 
----<Param>
---- 
----<Return>
---- 
----<Reference>
----
----<History>
----<Created by>: Phan thanh hoang vu, Date: 25/03/2014
----<Modify by>: Lê Thị Hạnh on 15/07/2014
---------------: Bổ sung kiểm tra form POSF0034 - Danh mục khu vực
----<Modify by>: Lê Thị Hạnh on 18/07/2014
---------------: Bổ sung kiểm tra form POSF0052 - Danh mục bàn
----<Modify by>: Lê Thị Hạnh on 22/07/2014
---------------: Bổ sung kiểm tra form POSF0060 - Danh mục thời điểm
----<Modify by>: Lê Thị Hạnh on 13/08/2014
---------------: Bổ sung kiểm tra form POSF0010 - Danh mục cửa hàng (Thêm kiểm tra POST0033,34,31,32,36,37)
----<Modify by>: Phan thanh hoàng vũ on 21/12/2015
---------------: Bổ sung kiểm tra form POSF0015 - Danh mục phiếu nhập kế thừa bên ERP
----<Modify by>: Phan thanh hoàng vũ on 07/08/2017
---------------: Bổ sung kiểm tra form POSF011 - Danh mục đơn hàng trên APP (POS)
---Modified by Thị Phượng on 08/12/2017:Bổ sung kiểm tra xóa phiếu thu 
---Modified by Thị Phượng on 19/12/2017:Bổ sung kiểm tra phiếu đề nghị chi, đề nghị xuất hóa đơn 
---Modify by hoàng vũ on 30/01/2018: sửa cách lấy dữ liệu hóa đơn truy xuất qua bảng AT9000 do 1 phiếu đề nghị bây chờ có thể lập được nhiều phiếu hóa đơn bán hàng), bỏ điều kiện search xuất hóa đơn
---Modify by hoàng vũ on 16/03/2018: Check thêm trường hợp xóa/sửa phiếu đặt cọc thì kiểm tra phiếu bút toán tổng hợp đã kế thừa chưa
---Modify by Thị Phượng on 16/03/2018: Fix bug kiểm tra xóa phiếu đề nghị chi
----<Modify by>: Phan thanh hoàng vũ on 07/08/2017
---------------: Bổ sung kiểm tra form POSF2010 - bị kế thừa từ phiếu thu tiền mặt/phiếu thu qua ngân hàng (OKIA)
----<Modify by>: Phan thanh hoàng vũ on 02/10/2018: Bổ sung đã dụng dụng phiếu xuất kho bên phiếu bảo hành (Customize OKIA)
----<Modify by>: Tra Giang on 17/10/2018: Bổ sung kiểm tra đã sư dụng danh mục chốt ca bán hàng
----<Modify by>: Tra Giang on 07/01/2018: Fix lỗi không convert được dữ liệu -> không xóa được phiếu bán hàng
----<Modify by>: Phan thanh hoàng vũ on 24/04/2019: bổ xóa đơn hàng trên APP
----<Example>
/*	--Với cách hiển thị message cũ
	Declare @Status TINYINT
	Exec POSP9000 'HCM',null, null, null, null, '11C79483-20E5-4739-96E6-6A43E4F69C4E' ,'POSF0016',@Status  output
	SELECT @sTATUS

	--Với cách hiển thị message mới
	Declare @Status TINYINT
	Declare @Params  Nvarchar(Max)
	Exec POSP9000 'HCM','50E0001', null, null, null, '11C79483-20E5-4739-96E6-6A43E4F69C4E' ,'POSF0016',@Status  output, @Params output
	SELECT @sTATUS, @Params

*/
CREATE PROCEDURE [dbo].[POSP9000] 	
			(
				@DivisionID varchar(50),
				@ShopID varchar(50),
				@TranMonth int = null,
				@TranYear int = null,
				@ID varchar(Max) = null,
				@APK uniqueidentifier = null,
				@FormID  nvarchar(50),
				@Status  TINYINT OUTPUT,
				@Params  Nvarchar(Max) = null OUTPUT 
			)
AS

	DECLARE @Message AS NVARCHAR(250)
	SET @Status = 0

	--Biến bảng dùng để trả ra những nghiệp vụ hoặc danh mục kế thừa từ danh mục hoặc nghiệp vụ đang cần check
	Declare @POSP9000temp table (
									FormID nvarchar(max),
									Params nvarchar(Max)
								)

	IF @FormID = 'POST2010' --Kiểm tra xóa Phiếu đặt cọc
	BEGIN 
		IF EXISTS (--Phiếu bán hàng POS kế thừa từ phiếu đặt cọc POS
				   SELECT TOP 1 1 FROM POST00161 WITH (NOLOCK) WHERE DivisionID = @DivisionID and APKMInherited = @APK and DeleteFlg = 0
				   Union all
				   --Phiếu thu POS kế thừ từ phiếu đặt coc POS
				   Select TOP 1 1 From POST00801 M WITH (NOLOCK) inner join POST00802 D WITH (NOLOCK) on M.APK = D.APKMaster  and M.DeleteFlg = D.DeleteFlg
				   Where Isnull(M.IsDeposit, 0) = 1 and Isnull(M.IsPayInvoice, 0) = 0 and D.APKMInherited = @APK and M.DeleteFlg = 0
				   --Phiếu đề nghị chi POS kế thừa từ phiếu thu đặt cọc POS
				   Union all
				   Select TOP 1 1 from POST2020 M WITH (NOLOCK) inner join POST2021 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
						 inner join POST00801 P801 WITH (NOLOCK) on D.APKMInherited = P801.APK
						 inner join POST00802 P802 WITH (NOLOCK) on P801.APK = P802.APKMaster and P801.DeleteFlg = P802.DeleteFlg
						 inner join POST2010 P201 WITH (NOLOCK) on P201.APK = P802.APKMInherited
				   Where P201.APK = @APK and D.DeleteFlg = 0 and Isnull(P801.IsDeposit, 0) = 1
				   --Phiếu bút toán tổng hợp/Phiếu thu tiến mặt/Phiếu thu qua ngân hàng ERP kế thừ từ phiếu đặt coc POS
				   Union all
				   Select Top 1 1 From AT9000 With (Nolock) 
				   Where DivisionID = @DivisionID and IsDeposit =  2 and InheritVoucherID = @APK
				  )
		BEGIN
			SET @Status = 1
			SET @Message = N'POSM000003'
			GOTO Mess
		END

	END
	
	IF @FormID = 'POSF0043' --Kiểm tra xóa danh mục loại thẻ
	BEGIN 
		IF EXISTS (SELECT TOP 1 1 FROM POST0020
								  WHERE DivisionID = @DivisionID and TypeNo = @ID
				   )
		BEGIN
			SET @Status = 1
			SET @Message = N'POSM000003'
			GOTO Mess
		END
	END
	IF @FormID = 'POSF0010' --Kiểm tra xóa danh mục cửa hàng
	BEGIN 
		IF EXISTS (
					SELECT TOP 1 1 FROM POST0017 M WITH (NOLOCK) inner join POST00171 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
								  WHERE M.DivisionID = @DivisionID and M.ShopID = @ID and M.DeleteFlg = 0
				   Union all
				   SELECT TOP 1 1 FROM POST0015 M WITH (NOLOCK) inner join POST00151 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
								  WHERE M.DivisionID = @DivisionID and M.ShopID = @ID and M.DeleteFlg = 0
				   Union all
				   SELECT TOP 1 1 FROM POST0016 M WITH (NOLOCK) inner join POST00161 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
								  WHERE M.DivisionID = @DivisionID and M.ShopID = @ID and M.DeleteFlg = 0
				   Union all
				   SELECT TOP 1 1 FROM POST0019 M WITH (NOLOCK) inner join POST00191 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
								  WHERE M.DivisionID = @DivisionID and M.ShopID = @ID and M.DeleteFlg = 0
				   Union all
				   SELECT TOP 1 1 FROM POST0022 M WITH (NOLOCK) inner join POST0023 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DivisionID=D.DivisionID
								  WHERE M.DivisionID = @DivisionID and M.ShopID = @ID and M.DeleteFlg = 0
				   Union all
				   SELECT TOP 1 1 FROM POST0024 M WITH (NOLOCK) inner join POST0025 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DivisionID=D.DivisionID
								  WHERE M.DivisionID = @DivisionID and M.ShopID = @ID and M.DeleteFlg = 0
				   Union all
				   SELECT TOP 1 1 FROM POST9000  WITH (NOLOCK) WHERE DivisionID = @DivisionID and ShopID = @ID and DeleteFlg = 0
				   UNION ALL
				   SELECT TOP 1 1 FROM POST0033 P33 WITH (NOLOCK) WHERE P33.DivisionID = @DivisionID AND P33.ShopID = @ID
				   UNION ALL 
				   SELECT TOP 1 1 FROM POST0033 P33 WITH (NOLOCK) INNER JOIN POST0034 P34 WITH (NOLOCK) ON P34.APKMaster = P33.APK
				   WHERE P33.DivisionID = @DivisionID AND P33.ShopID = @ID
				   UNION ALL 
				   SELECT TOP 1 1 FROM POST0031 P31 WITH (NOLOCK) WHERE P31.DivisionID = @DivisionID AND P31.ShopID = @ID
				   UNION ALL
				   SELECT TOP 1 1 FROM POST0032 P32 WITH (NOLOCK) WHERE P32.DivisionID = @DivisionID AND P32.ShopID = @ID
				   UNION ALL 
				   SELECT TOP 1 1 FROM POST0036 P36 WITH (NOLOCK) WHERE P36.DivisionID = @DivisionID AND P36.ShopID = @ID
				   UNION ALL
				   SELECT TOP 1 1 FROM POST0037 P37 WITH (NOLOCK) WHERE P37.DivisionID = @DivisionID AND P37.ShopID = @ID
				   )
		BEGIN
			SET @Status = 1
			SET @Message = N'POSM000003'
			GOTO Mess
		END
	END
	IF @FormID = 'POSF0110' or @FormID = 'APF0019' or @FormID = 'APF0020' --Kiểm tra xóa danh mục đơn hàng trên APP/Mobile
	BEGIN
		--Do store WP0141 đặt dưới bảng chuẩn ERP8, nhưng lấy bảng trên ERP9, nếu khách hàng không dùng ERP9 thì chạy store bị lỗi 
		--để xử lý vấn đề này kiểm tra thì kiểm tra bên ERP8 chạy vào không có bảng POST0016 thì không chạy vào store này
		IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POST00161]') AND type in (N'U'))
		BEGIN
				IF EXISTS (SELECT TOP 1 1 FROM POST00161  WHERE DivisionID = @DivisionID and APKMAster = @APK and DeleteFlg = 0
						   Union all
						   SELECT TOP 1 1 FROM POST00161  WHERE DivisionID = @DivisionID and APKMInherited = @APK and DeleteFlg = 0
						   )
				BEGIN
					SET @Status = 1
					SET @Message = N'POSM000003'
					GOTO Mess
				END
		END
	END
	IF @FormID = 'POSF0011' --Kiểm tra xóa danh mục hội viên
	BEGIN
		IF EXISTS (SELECT TOP 1 1 FROM POST0016 WITH (NOLOCK)  WHERE DivisionID = @DivisionID and MemberID = @ID and DeleteFlg = 0
				   Union all
				   SELECT TOP 1 1 FROM POST9000 WITH (NOLOCK)  WHERE DivisionID = @DivisionID and MemberID = @ID and DeleteFlg = 0)
		BEGIN
			SET @Status = 1
			SET @Message = N'POSM000003'
			GOTO Mess
		END
	END
	IF @FormID = 'POSF0015' --Kiểm tra xóa/Sửa phiếu nhập hàng
	BEGIN
		IF EXISTS (SELECT TOP 1 1 FROM POST0016 M WITH (NOLOCK) inner join POST00161 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
				   WHERE M.DivisionID = @DivisionID and M.ShopID = @ShopID  and (D.APKMInherited = @APK or D.APKDInherited = @APK)  and M.DeleteFlg = 0
				    )
					BEGIN
						SET @Status = 1
						GOTO Mess
					END
		ELSE IF EXISTS (SELECT TOP 1 1 FROM AT2006 M WITH (NOLOCK) inner join AT2007 D WITH (NOLOCK) on M.DivisionID = D.DivisionID and M.VoucherID = D.VoucherID
						WHERE M.DivisionID = @DivisionID and D.InheritVoucherID = Cast(@APK as Nvarchar(50)) and (KindVoucherID = 1 or KindVoucherID=2))
						BEGIN
							SET @Status = 1
							GOTO Mess
						END
		ELSE IF EXISTS (--Kết chuyển POS -> ERP (7: Phiếu nhập)
						SELECT TOP 1 1 FROM AT2006 M WITH (NOLOCK) inner join AT2007 D WITH (NOLOCK) on M.DivisionID = D.DivisionID and M.VoucherID = D.VoucherID
						WHERE M.DivisionID = @DivisionID and (D.ReVoucherID = Cast(@APK as Nvarchar(50)) or D.InheritVoucherID = Cast(@APK as Nvarchar(50))) and KindVoucherID=7)
						BEGIN
							SET @Status = 1
							GOTO Mess
						END
	END

	IF @FormID = 'POSF0027' --Kiểm tra xóa/Sửa phiếu xuất
	BEGIN
		IF EXISTS (--Kết chuyển POS -> ERP (4: Phiếu xuất)
						SELECT TOP 1 1 FROM AT2006 M WITH (NOLOCK) inner join AT2007 D WITH (NOLOCK) on M.DivisionID = D.DivisionID and M.VoucherID = D.VoucherID
						WHERE M.DivisionID = @DivisionID and (D.ReVoucherID = Cast(@APK as Nvarchar(50)) or D.InheritVoucherID = Cast(@APK as Nvarchar(50))) and KindVoucherID=4)
						BEGIN
							SET @Status = 1
							GOTO Mess
						END
		ELSE IF EXISTS (--Kế thừa bên Phiếu bảo hành
						SELECT TOP 1 1 FROM CRMT2090 M WITH (NOLOCK) inner join CRMT2091 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
						WHERE M.DivisionID = @DivisionID and Cast(D.APKMInherited as nvarchar(50)) = Cast(@APK as Nvarchar(50)) and M.DeleteFlg=0)
						BEGIN
							SET @Status = 1
							GOTO Mess
						END
	END

	IF @FormID = 'POSF0016' --Kiểm tra xóa phiếu bán hàng/trả hàng/đổi hàng 
	BEGIN
		Insert into @POSP9000temp (FormID, Params)
		Select Distinct @FormID, M.VoucherNo From POST0016 M WITH (NOLOCK) Where M.DivisionID = @DivisionID and M.APK = @APK and M.ShopID = @ShopID and M.IsTransferred !=0 and M.DeleteFlg = 0
		Union all
		Select Distinct @FormID, A9.VoucherNo From POST00161 M WITH (NOLOCK) inner join AT9000 A9 WITH (NOLOCK) on  
																	A9.DivisionID = M.DivisionID and A9.InheritVoucherID = Cast(M.APKMaster as Varchar(50)) and A9.InheritTransactionID = Cast(M.APK as Varchar(50))
		Where M.DivisionID = @DivisionID and M.ShopID = @ShopID and M.APKMaster = @APK and M.DeleteFlg = 0
		Union all
		--Bị kế thừa: Phiếu bán hàng bị kế thừa bởi Phiếu thu tiền mặt/Phiếu thu ngân hàng/Bút toán tổng hợp trên ERP8
		Select Distinct @FormID, A.VoucherNo From AT9000 A WITH (NOLOCK) inner join POST0016 B WITH (NOLOCK) on A.DivisionID = B.DivisionID and A.InheritInvoicePOS = B.APK and A.IsInheritInvoicePOS = 1 
		Where B.DivisionID = @DivisionID and B.APK = @APK and B.DeleteFlg = 0
		Union all
		--Phiếu yêu cầu xuất kho ERP đã bị kế thừa bên xuất kho ERP8, Phiếu yêu cầu nhập kho ERP đã bị kế thừa bên nhập kho ERP8
		Select Distinct @FormID, A.VoucherNo From AT2006 A WITH (NOLOCK) inner join AT2007 B WITH (NOLOCK) on A.DivisionID = B.DivisionID and A.VoucherID = B.VoucherID and A.KindVoucherID in (2, 1)
													inner join WT0096 W WITH (NOLOCK) on B.DivisionID = W.DivisionID and B.InheritVoucherID = W.VoucherID and B.InheritTransactionID = W.TransactionID 
		Where W.DivisionID = @DivisionID and W.InheritVoucherID = Cast( @APK as Varchar(50))
		Union all
		--Bị kế thừa: Phiếu thu trên POS
		Select Distinct @FormID, M.VoucherNo From POST00801 M inner join POST00802 D on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
		Where M.DivisionID = @DivisionID and D.APKMInherited = @APK and D.DeleteFlg = 0 and Isnull(IsDeposit,0) = 0 and Isnull(IsPayInvoice, 0) = 0
		--Bị kế thừa: Phiếu thu trên POS bị kế thừa  bởi Phiếu thu tiên mặt/ Phiếu thu ngân hàng/ Bút toán tổng hợp trên ERP8
		Union all
		Select Distinct @FormID, A.VoucherNo From AT9000 A WITH (NOLOCK) inner join POST00801 B WITH (NOLOCK) on A.DivisionID = B.DivisionID and A.InheritVoucherID = B.APK and A.IsReceived = 1 
													Inner join POST00802 C WITH (NOLOCK) on C.DivisionID = B.DivisionID and C.APKMaster = B.APK and C.DeleteFlg = B.DeleteFlg 
		Where B.DivisionID = @DivisionID and C.APKMInherited = @APK and B.DeleteFlg = 0
		Union all
		--Bị kế thừa: Sinh ngầm Phiếu đề nghị chi kho POS (Trả hàng, đối hàng giá trị thấp hon)-> phiếu chi trên ERP8
		Select Distinct @FormID, A.VoucherNo From AT9000 A WITH (NOLOCK) inner join POST2021 B WITH (NOLOCK) on A.InheritPayPOS = B.APKMaster and A.IsInheritPayPOS = 1 
													inner join POST2020 D WITH (NOLOCK) on D.APK = B.APKMaster and D.DeleteFlg = B.DeleteFlg
		Where B.DivisionID = @DivisionID and B.APKMInherited = @APK and D.DeleteFlg = 0 and D.SuggestType in (1, 2)
		Union all
		--Bị kế thừa: Phiếu trả hàng/đổi trên POS
		SELECT Distinct @FormID, Isnull(M.PVoucherNo, M.CVoucherNo) as VoucherNo FROM POST0016 M WITH (NOLOCK) inner join POST00161 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg and M.APK !=D.APKMInherited
		WHERE M.DivisionID = @DivisionID and M.ShopID = @ShopID  and D.APKMInherited = @APK and M.DeleteFlg = 0
		Union all
		--Bị kế thừa: Phiếu đề nghị xuất hóa đơn trên POS
		SELECT Distinct @FormID, M.VoucherNo FROM POST2030 M WITH (NOLOCK) inner join POST2031 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
		Where M.DivisionID = @DivisionID and D.APKMInherited = @APK and M.DeleteFlg = 0

		--Kiểm tra từ biến bảng form = 'POSF0016' có giá trị không
		IF EXISTS (	Select Top 1 1 From @POSP9000temp Where FormID = 'POSF0016')
		BEGIN 
			SET @Status = 1
			SET @Params = (stuff((select ', '+Params from @POSP9000temp for xml path('')),1,1,''))
			GOTO Mess
		END
	END


	IF @FormID = 'POSF0017' --Kiểm tra xóa phiếu kiểm kê
	BEGIN
		IF EXISTS (SELECT TOP 1 1 FROM POST0015 M WITH (NOLOCK) inner join POST00151 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
				   WHERE M.DivisionID = @DivisionID and M.ShopID = @ShopID and (D.APKMInherited = @APK or D.APKDInherited = @APK)  and M.DeleteFlg = 0
				   Union all
				   SELECT TOP 1 1 FROM POST0016 M WITH (NOLOCK) inner join POST00161 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
				   WHERE M.DivisionID = @DivisionID and M.ShopID = @ShopID  and (D.APKMInherited = @APK or D.APKDInherited = @APK)  and M.DeleteFlg = 0)
		BEGIN
			SET @Status = 1
			GOTO Mess
		END
	END
	IF @FormID = 'POSF0019' --Kiểm tra xóa phiếu nhật ký hàng hóa
	BEGIN
		IF EXISTS (SELECT TOP 1 1 FROM POST0015 M WITH (NOLOCK) inner join POST00151 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
				   WHERE M.DivisionID = @DivisionID and M.ShopID = @ShopID and (D.APKMInherited = @APK or D.APKDInherited = @APK) and M.DeleteFlg = 0
				   Union all
				   SELECT TOP 1 1 FROM POST0016 M WITH (NOLOCK) inner join POST00161 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
				   WHERE M.DivisionID = @DivisionID and M.ShopID = @ShopID  and (D.APKMInherited = @APK or D.APKDInherited = @APK) and M.DeleteFlg = 0)
		BEGIN
			SET @Status = 1
			GOTO Mess
		END
	END
	IF @FormID = 'POSF0021' OR @FormID = 'POSF0022'--Kiểm tra xóa phiếu xuất hàng
	BEGIN
		IF EXISTS (SELECT TOP 1 1 FROM POST0022 M WITH (NOLOCK) inner join WT0095 D95 WITH (NOLOCK) on M.VoucherNo= D95.RefNo01
						inner join AT2006 on D95.VoucherNo=AT2006.VoucherNo
				   WHERE M.DivisionID = @DivisionID and M.ShopID = @ShopID AND M.APK = @APK and M.DeleteFlg = 0)
		BEGIN
			SET @Status = 1
			GOTO Mess
		END
	END
	IF @FormID = 'POSF0020' --Kiểm tra xóa thẻ hội viên
	BEGIN
		IF EXISTS (SELECT TOP 1 1 FROM POST0020 WITH (NOLOCK) where DivisionID = @DivisionID AND MemberCardID = @ID AND Disabled = 1)
		BEGIN
			SET @Status = 1
			GOTO Mess
		END
	END
	IF @FormID = 'POSF0012' --Kiểm tra xóa thông tin hàng hóa tại cửa hàng
	BEGIN
		IF EXISTS (SELECT TOP 1 1 FROM POST0017 M WITH (NOLOCK) inner join POST00171 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
								  WHERE M.DivisionID = @DivisionID and M.ShopID = @ShopID and InventoryID =  @ID AND M.DeleteFlg = 0
				   Union all
				   SELECT TOP 1 1 FROM POST0015 M WITH (NOLOCK) inner join POST00151 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
								  WHERE M.DivisionID = @DivisionID and M.ShopID = @ShopID and InventoryID =  @ID AND M.DeleteFlg = 0
				   Union all
				   SELECT TOP 1 1 FROM POST0016 M WITH (NOLOCK) inner join POST00161 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
								  WHERE M.DivisionID = @DivisionID and M.ShopID = @ShopID and InventoryID =  @ID AND M.DeleteFlg = 0
				   Union all
				   SELECT TOP 1 1 FROM POST0019 M WITH (NOLOCK) inner join POST00191 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
								  WHERE M.DivisionID = @DivisionID and M.ShopID = @ShopID and InventoryID =  @ID AND M.DeleteFlg = 0
				   Union all
				   SELECT TOP 1 1 FROM POST0022 M WITH (NOLOCK) inner join POST0023 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DivisionID=D.DivisionID
								  WHERE M.DivisionID = @DivisionID and M.ShopID = @ShopID and InventoryID =  @ID AND M.DeleteFlg = 0
				   Union all
				   SELECT TOP 1 1 FROM POST0024 M WITH (NOLOCK) inner join POST0025 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DivisionID=D.DivisionID
								  WHERE M.DivisionID = @DivisionID and M.ShopID = @ShopID and InventoryID =  @ID AND M.DeleteFlg = 0)
		BEGIN
			SET @Status = 1
			GOTO Mess
		END
	END
	IF @FormID = 'POSF0034' --- kiểm tra xóa/sửa thông tin danh mục khu vực tại cửa hàng
	BEGIN
		IF EXISTS (SELECT TOP 1 1 FROM POST0033 P33 WITH (NOLOCK) INNER JOIN POST0034 P34 WITH (NOLOCK) ON P34.APKMaster = P33.APK
		           WHERE P33.DivisionID = @DivisionID AND P33.ShopID = @ShopID AND P33.AreaID = @ID AND P34.DeleteFlg = 0
		           UNION ALL
				   SELECT TOP 1 1
				   FROM POST0033 P33 WITH (NOLOCK) 
				   WHERE P33.DivisionID = @DivisionID AND P33.ShopID = @ShopID AND P33.AreaID = @ID
		           UNION ALL
		           SELECT TOP 1 1 FROM POST0016 P16 WITH (NOLOCK) INNER JOIN POST00161 P161 WITH (NOLOCK) ON P161.APKMaster = P16.APK
		           WHERE P16.DivisionID = @DivisionID AND P16.ShopID = @ShopID AND P16.AreaID = @ID AND P161.DeleteFlg = 0
				   UNION ALL 
				   SELECT TOP 1 1 FROM POST0032 P32 WITH (NOLOCK) WHERE P32.DivisionID = @DivisionID AND P32.ShopID = @ShopID AND P32.AreaID = @ID
				   UNION ALL 
				   SELECT TOP 1 1 FROM POST0037 P37 WITH (NOLOCK) WHERE P37.DivisionID = @DivisionID AND P37.ShopID = @ShopID AND P37.AreaID = @ID		   
				   )
		BEGIN
			SET @Status = 1
			--SET @Message = N'00ML000052'
			GOTO Mess
		END           
	END
	IF @FormID = 'POSF0052' --- Kiểm tra xóa/sửa thông tin danh mục bàn tại cửa hàng
	BEGIN
		IF EXISTS ( SELECT TOP 1 1 FROM POST0033 P33 WITH (NOLOCK) INNER JOIN POST0034 P34 WITH (NOLOCK) ON P34.APKMaster = P33.APK
					WHERE P33.DivisionID = @DivisionID AND P33.ShopID = @ShopID AND P33.TableID = @ID AND P34.DeleteFlg = 0
					UNION ALL
				   SELECT TOP 1 1
				   FROM POST0033 P33 WITH (NOLOCK) 
				   WHERE P33.DivisionID = @DivisionID AND P33.ShopID = @ShopID AND P33.TableID = @ID
					UNION ALL
					SELECT TOP 1 1 FROM POST0016 P16 WITH (NOLOCK) INNER JOIN POST00161 P161 WITH (NOLOCK) ON P161.APKMaster = P16.APK
					WHERE P16.DivisionID = @DivisionID AND P16.ShopID = @ShopID AND P16.TableID = @ID AND P161.DeleteFlg = 0)
					BEGIN
						SET @Status = 1
						--SET @Message = N'00ML000052'
						GOTO Mess
					END
	END
	IF @FormID = 'POSF0060' --- Kiểm tra xóa/sửa thông tin danh mục thời điểm
	BEGIN
		IF EXISTS ( SELECT TOP 1 1 FROM POST0037 P37 WITH (NOLOCK) WHERE P37.DivisionID = @DivisionID AND P37.TimeID = @ID)
		            BEGIN
		            	SET @Status = 1
		            	GOTO Mess
		            END		           
	END
	IF (@FormID = 'POSF0080' or @FormID = 'POSF0081' or @FormID = 'POSF0082') --- Kiểm tra xóa/sửa thông tin danh mục phiếu thu
	BEGIN
		IF EXISTS ( SELECT TOP 1 1 FROM POST00801 A WITH (NOLOCK) WHERE A.DivisionID = @DivisionID AND Cast(A.APK as Varchar(50))= @ID and isnull(A.IsPayInvoice,0) != 0 and A.DeleteFlg = 0)
		            BEGIN
		            	SET @Status = 1
		            	GOTO Mess
		            END	

		IF EXISTS ( SELECT TOP 1 1 FROM POST2021 A WITH (NOLOCK) WHERE A.DivisionID = @DivisionID AND A.APKMInherited= @ID  and A.DeleteFlg = 0 )
				  BEGIN
				   SET @Status = 1
				   GOTO Mess
				  END	 
		--Bị kế thừa: Phiếu thu tiền mặt/Phiếu thu ngân hàng/Bút toán tổng hợp trên ERP          
		IF EXISTS ( SELECT TOP 1 1 FROM AT9000 A WITH (NOLOCK) WHERE A.DivisionID = @DivisionID AND A.IsReceived = 1 AND A.InheritVoucherID= @ID )
				  BEGIN
				   SET @Status = 1
				   GOTO Mess
				  END	           
	END
IF (@FormID = 'POST2020') --- Kiểm tra xóa/sửa thông tin danh mục phiếu đề nghị chi
BEGIN
	If exists ( select top 1 1 from POST2020 WITH (NOLOCK)  Where DivisionID = @DivisionID AND  (isnull(IsConfirm,0) = 1) and Cast(APK as Varchar(50)) =  Cast(@APK as Varchar(50)) ) --Check đã duyệt
	Begin
			Set @Status =1
			Set @Message ='POSFML000096'
			Goto Mess
	End 	
	
	If exists (Select top 1 1 From AT9000 WITH (NOLOCK)  Where DivisionID = @DivisionID AND IsInheritPayPOS = 1 and InheritPayPOS = Cast(@APK as Varchar(50))) --Check đã sử dụng
	Begin
			Set @Status =1
			Set @Message ='00ML000052'
			Goto Mess
	End 
	If exists (Select Top 1 1 From POST2020 WITH (NOLOCK)  Where DivisionID = @DivisionID and  Cast(APK as Varchar(50)) = Cast(@APK as Varchar(50)) and SuggestType in (1,2) ) --Check đã sử dụng
	Begin
			Set @Status =1
			Set @Message ='POSFML000097'
			Goto Mess
	End 
END

IF (@FormID = 'POST2030') --- Kiểm tra xóa/sửa thông tin danh sách phiếu đề nghị xuất hóa đơn
BEGIN
	If exists ( Select  Top 1 1 From  AT9000  WITH (NOLOCK)
				Where	DivisionID= @DivisionID
						and (ReVoucherID = Convert(varchar(50),@APK) or InheritVoucherID = Convert(varchar(50),@APK))
						and ReTableID = 'POST2030'
						and IsInvoiceSuggest = 1
				) --Check đã xuất hóa đơn
	Begin
			Set @Status =1
			Set @Message ='POSFML000100'
			Goto Mess
	End 	
END

	 IF @FormID = 'POSF2035' --Kiểm tra xóa danh mục ca lam viec
	BEGIN
		IF EXISTS (SELECT TOP 1 1 FROM POST2033 M WITH (NOLOCK) inner join POST2034 D WITH (NOLOCK)
		 on M.ShopID = D.ShopID and M.ShiftID = D.ShiftID and M.ShiftDate = D.ShiftDate WHERE M.DivisionID = @DivisionID and M.ShopID= @ShopID and M.ShiftID = @ID  )
			
		BEGIN
			SET @Status = 1
			GOTO Mess
		END
	END
Mess:

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

