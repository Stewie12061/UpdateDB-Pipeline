IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POST00271]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POST00271]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




----<Summary> Kiểm tra trước khi xóa/sửa phiếu xuất
----
----<Param>
---- 
----<Return>
---- 
----<Reference>
----
----<History>
----<Created by>: Phan thanh hoang vu, Date: 25/03/2014
------------------Kết quả trả về: 
----------------------Status = 0 (Loại Message Info), Status = 1 (Loại Message Warning), Status = 0 (Loại Message Error)
----------------------MessageID: POSM000020 (Kiểm tra khác DivisionID), POSM000019 (Kiểm tra đã khóa sổ), POSM000003 (Kiểm tra đã sử dụng), POSFML000114 (Kiểm tra phiếu được sinh tự động) 
----------------------Params (Danh sách VoucherNo không xóa được)
------------------Store xử lý: Xóa danh sách một /nhiều @ID, và chỉ Sửa 1 @ID
----------------------Nếu Xóa thành công
----<Editted by>: Phan thanh hoang vu, Date: 21/04/2014
------------------Bổ sung: tham số Mode và APK
----------------------Nếu xóa thì truyền danh sách tham số sau @DivisionID, @ShopID, @APKList, @FormID = 'POSF0015', @Mode ='1' , @APK = null
----------------------Nếu sửa thì truyền danh sách tham số sau @DivisionID, @ShopID, @APKList = Null, @FormID = 'POSF0015', @Mode ='0' , @APK
----<Editted by>: Phan thanh hoang vu, Date: 21/12/2015
------------------Bổ sung: tham số Mode và APK
----------------------Bổ sung luồng nghiệp vụ kiểm tra khi sửa phiếu nhập
----Modify on 11/11/2019 by Trà Giang: Bổ sung kiểm tra phiếu tự sinh ra từ nghiệp vụ khác thì cảnh báo không cho sửa/xóa. 
----<Example>
------------------EXEC POST00271 N'HCM', '50C2101', '', 'POSF00151', '0','2555CE94-BDA4-4506-BCFE-A917C830C0B0'

CREATE PROCEDURE POST00271
		( @DivisionID varchar(50),--Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
		  @ShopID varchar(50),
		  @APKList NVARCHAR(MAX) = NULL,
		  @FormID nvarchar(50),			 --Truyền vào cho trường hợp xóa
		  @Mode tinyint,                 --1: Xóa, 0: Sửa  
		  @APK VARCHAR(50) = NULL        --Truyền vào cho trường hợp sửa
  		) 
AS 
BEGIN
	DECLARE @sSQL1 NVARCHAR(MAX)
	DECLARE @sSQL2 NVARCHAR(MAX)
	DECLARE @sSQL3 NVARCHAR(MAX)
	DECLARE @sSQL4 NVARCHAR(MAX)
	IF @Mode = 1 
		BEGIN
		SET @sSQL1 = N'	DECLARE @Status TINYINT,
								@Message NVARCHAR(1000),
								@Cur CURSOR,
								@ID VARCHAR(50),
								@DelAPK  uniqueidentifier,
								@DelShopID VARCHAR(50),
								@DelDivisionID VARCHAR(50),
								@DelVoucherNo VARCHAR(50),
								@DelTranMonth int,
								@DelTranYear int,
								@Closing int,
								@RefVoucherNo NVARCHAR(250),
								@StatusWT0095 int,
								@StatusPOST0016 int

						--Luu tru ID message
						Declare @POST0027temp table 
								(
									Status tinyint,
									MessageID varchar(100),
									Params varchar(4000)
								)
						--Luu tru VoucherID phieu chuyen kho can xoa
						Declare @DelAT2006 table 
								(
									VoucherID varchar(100)
								)
						--Luu tru APKMaster phieu xuat kho can xoa
						Declare @DelPOST0027 table 
								(
									APKMaster varchar(100)
								)
						--Luu tru phieu nhap kho truoc khi Update Phieu yeu cau chuyen kho noi bo
						Declare @UpdateWT0096 table 
								(
									APKMInherited varchar(100), 
									APKDInherited varchar(100), 
									ActualQuantity decimal(28,8)
								)
								
						SET @Status = 0
						SET @Message = ''''
						SET @ID = ''''
						Insert into @POST0027temp (	Status, MessageID, Params) 
									Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
									union all
									Select 2 as Status, ''POSM000025'' as MessageID, Null as Params
									union all
									Select 2 as Status, ''00ML000051'' as MessageID, Null as Params
									union all
									Select 2 as Status, ''00ML000052'' as MessageID, Null as Params
									union all
									Select 2 as Status, ''00ML000075'' as MessageID, Null as Params
									union all
									Select 2 as Status, ''POSM000064'' as MessageID, Null as Params
									union all
									Select 2 as Status, ''POSM000065'' as MessageID, Null as Params
									union all
									Select 2 as Status, ''POSFML000114'' as MessageID, Null as Params'									

		SET @sSQL2 = N'	SET @Cur = CURSOR SCROLL KEYSET FOR
						SELECT P.APK, P.DivisionID, P.ShopID, P.VoucherNo, P.TranMonth, P.TranYear, Q.Closing,
						(Case When P16.CVoucherNo is null and W.VoucherNoYC is null and T.VoucherNoPN is null and U.VoucherNoXC is null then P16.VoucherNo 
						When P16.CVoucherNo is not null and W.VoucherNoYC is null and T.VoucherNoPN is null  and U.VoucherNoXC is null  then P16.CVoucherNo 
						When P16.CVoucherNo is null and W.VoucherNoYC is not null and T.VoucherNoPN is null  and U.VoucherNoXC is null  then W.VoucherNoYC 
						When P16.CVoucherNo is null and W.VoucherNoYC is null and T.VoucherNoPN is not null  and U.VoucherNoXC is null  then T.VoucherNoPN
						When P16.CVoucherNo is null and W.VoucherNoYC is null and T.VoucherNoPN is null  and U.VoucherNoXC is not null  then U.VoucherNoXC
						End ) as RefVoucherNo
						FROM POST0027 P inner join POST9999 Q on P.DivisionID = Q.DivisionID and P.TranMonth=Q.TranMonth and P.TranYear=Q.TranYear
						Left join POST0028 D  WITH (NOLOCK) on P.APK = D.APKmaster and P.DeleteFlg = D.Deleteflg
									left join  (Select Distinct M.DivisionID, M.VoucherID, M.VoucherNo as VoucherNoYC
												From WT0095 M  WITH (NOLOCK) inner join WT0096 D  WITH (NOLOCK) on M.DivisionID = D.DivisionID and M.VoucherID = D.VoucherID) W 
												on D.APKMInherited = W.VoucherID and D.DivisionID = W.DivisionID
									left join  (Select Distinct M.APK, M.DivisionID, M.VoucherID, M.VoucherNo as VoucherNoPN
												From POST0015 M  WITH (NOLOCK) inner join POST00151 D  WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
												Where M.DeleteFlg =0
												) T on D.APKMInherited = T.APK and D.DivisionID = T.DivisionID
									left join  (Select Distinct M.APK, D.APK as APKDetail, M.DivisionID,  M.VoucherNo as VoucherNoXC
												From AT2006 M  WITH (NOLOCK) inner join AT2007 D  WITH (NOLOCK) on M.VoucherID = D.VoucherID and M.DivisionID = D.DivisionID
												) U on D.APKMInherited = U.APK and D.APKDInherited = U.APKDetail and D.DivisionID = U.DivisionID
									Left Join POST0016 P16  WITH (NOLOCK) on P.DivisionID = P16.DivisionID 
												and (P.VoucherID = P16.VoucherID or  P.VoucherID = convert(varchar(50),P16.APK))	
						WHERE P.APK IN ('''+@APKList+''')'

		SET @sSQL3 = N'	OPEN @Cur
						FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelShopID, @DelVoucherNo, @DelTranMonth, @DelTranYear, @Closing ,@RefVoucherNo
						WHILE @@FETCH_STATUS = 0
						BEGIN
							--Chay Store kiem tra da su dung
									Exec POSP9000 @DelDivisionID, @DelShopID, @DelTranMonth, @DelTranYear, @ID, @DelAPK, '''+@FormID+''', @Status  output
								--Kiem tra khac DivisionID
									IF @DelDivisionID != '''+@DivisionID+'''
										Begin
											SET @Message = @DelVoucherNo
											update @POST0027temp set Params = ISNULL(Params,'''') + @Message+'','' where MessageID = ''00ML000050''
										End
								--Kiem tra khac ShopID
									ELSE IF @DelShopID != '''+@ShopID+'''
										Begin
											SET @Message = @DelVoucherNo
											update @POST0027temp set Params = ISNULL(Params,'''') + @Message+'','' where MessageID = ''POSM000025''
										End
								--Kiem tra bi khoa so
									ELSE IF @Closing = 1 
										Begin
											SET @Message = @DelVoucherNo
											update @POST0027temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000051''
										End
								--Kiem tra da su dung
									ELSE IF @Closing = 0 and (Select @Status) = 1
										Begin
											SET @Message = @DelVoucherNo
											update @POST0027temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000052''
										End
								-- Kiem tra phieu tu sinh tu nghiep vu
									ELSE IF @RefVoucherNo IS NOT NULL 
									Begin
											SET @Message = @RefVoucherNo
											update @POST0027temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''POSFML000114''
										
										End
								--Cho phep xoa
									ELSE IF @Closing = 0 and (Select @Status) = 0 
										Begin
												UPDATE POST0027 SET DeleteFlg = 1 WHERE APK = @DelAPK			
												UPDATE POST0028 SET DeleteFlg = 1 WHERE APKMaster = @DelAPK			
												UPDATE POST9000 SET DeleteFlg = 1 WHERE APKMaster = @DelAPK	
										End		
							FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelShopID, @DelVoucherNo, @DelTranMonth, @DelTranYear, @Closing ,@RefVoucherNo
						END
					CLOSE @Cur
					SELECT Status, MessageID, Params From  @POST0027temp where Params is not null'
		EXEC (@sSQL1 + @sSQL2+ @sSQL3) 
		--print @sSQL1
		--print @sSQL2
		--print @sSQL3
	END
	IF @Mode = 0
		BEGIN
					DECLARE @Status TINYINT,
							@Status1 TINYINT,
							@Message NVARCHAR(1000),
							@Params Varchar(100),
							@Params1 Varchar(100),
							@DelDivisionID Varchar(50), 
							@DelShopID Varchar(50), 
							@DelTranMonth int, 
							@DelTranYear int, 
							@ID Varchar(50), 
							@DelAPK uniqueidentifier,
							@Closing tinyint,
							@RefVoucherNo Varchar(250)
					Declare @POST0027temp table 
							(
								Status tinyint,
								MessageID varchar(100),
								Params varchar(4000)
							)
					SELECT	@DelAPK = P.APK, @DelDivisionID = P.DivisionID, @DelShopID = P.ShopID, @ID=P.VoucherNo, @DelTranMonth= P.TranMonth, 
							@DelTranYear = P.TranYear, @Closing = Q.Closing,
							@RefVoucherNo = (Case When P16.CVoucherNo is null and W.VoucherNoYC is null and T.VoucherNoPN is null and U.VoucherNoXC is null then P16.VoucherNo 
												When P16.CVoucherNo is not null and W.VoucherNoYC is null and T.VoucherNoPN is null  and U.VoucherNoXC is null  then P16.CVoucherNo 
												When P16.CVoucherNo is null and W.VoucherNoYC is not null and T.VoucherNoPN is null  and U.VoucherNoXC is null  then W.VoucherNoYC 
												When P16.CVoucherNo is null and W.VoucherNoYC is null and T.VoucherNoPN is not null  and U.VoucherNoXC is null  then T.VoucherNoPN
												When P16.CVoucherNo is null and W.VoucherNoYC is null and T.VoucherNoPN is null  and U.VoucherNoXC is not null  then U.VoucherNoXC
												End ) 
					FROM POST0027 P inner join POST9999 Q on P.DivisionID = Q.DivisionID  and P.TranMonth=Q.TranMonth and P.TranYear=Q.TranYear
					Left join POST0028 D  WITH (NOLOCK) on P.APK = D.APKmaster and P.DeleteFlg = D.Deleteflg
									left join  (Select Distinct M.DivisionID, M.VoucherID, M.VoucherNo as VoucherNoYC
												From WT0095 M  WITH (NOLOCK) inner join WT0096 D  WITH (NOLOCK) on M.DivisionID = D.DivisionID and M.VoucherID = D.VoucherID) W 
												on D.APKMInherited = W.VoucherID and D.DivisionID = W.DivisionID
									left join  (Select Distinct M.APK, M.DivisionID, M.VoucherID, M.VoucherNo as VoucherNoPN
												From POST0015 M  WITH (NOLOCK) inner join POST00151 D  WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
												Where M.DeleteFlg =0
												) T on D.APKMInherited = T.APK and D.DivisionID = T.DivisionID
									left join  (Select Distinct M.APK, D.APK as APKDetail, M.DivisionID,  M.VoucherNo as VoucherNoXC
												From AT2006 M  WITH (NOLOCK) inner join AT2007 D  WITH (NOLOCK) on M.VoucherID = D.VoucherID and M.DivisionID = D.DivisionID
												) U on D.APKMInherited = U.APK and D.APKDInherited = U.APKDetail and D.DivisionID = U.DivisionID
									Left Join POST0016 P16  WITH (NOLOCK) on P.DivisionID = P16.DivisionID 
												and (P.VoucherID = P16.VoucherID or  P.VoucherID = convert(varchar(50),P16.APK))
					Where P.APK = @APK and P.DeleteFlg = 0

					Exec POSP9000 @DelDivisionID, @DelShopID, @DelTranMonth, @DelTranYear, @ID, @DelAPK, @FormID, @Status  output
					
					IF @DelDivisionID != @DivisionID
						Begin --{0} không thuộc đơn vị hiện tại. Bạn không thể Sửa / Xóa
							SET @Message = '00ML000050' 
							SET	@Status1 = 2
							SET @Params = @ID
						End 
					IF @DelShopID != @ShopID
						Begin --{0} không thuộc cửa hàng hiện tại. Bạn không thể Sửa / Xóa
							SET @Message = 'POSM000025' 
							SET	@Status1 = 2
							SET @Params = @ID
						End 
					IF @Closing = 1 
						Begin --{0} đã khóa sổ. Bạn mở khóa sổ trước khi Sửa / Xóa
							SET @Message = '00ML000051'  
							SET	@Status1 = 2
							SET @Params = @ID
						End
					IF @Closing = 0 and (Select @Status) = 1
						Begin --{0} này đã được sử dụng. Bạn không thể Sửa / Xóa
							SET @Message = '00ML000052' 
							SET	@Status1 = 2
							SET @Params = @ID
						End
					IF @RefVoucherNo IS NOT NULL 
					Begin --{0} này đã được sử dụng. Bạn không thể Sửa / Xóa
							SET @Message = 'POSFML000114' 
							SET	@Status1 = 2
							SET @Params = @ID
						End
					IF NOT EXISTS (Select Top 1 1 From POST0027  WITH (NOLOCK) where APK = @APK and Status in (1 , 2))
						Begin
							SET @Message = 'POSFML000065' 
							SET	@Status1 = 2
							SET @Params = @ID
						End
					Insert into @POST0027temp (	Status, MessageID, Params) 
					Select	@Status1 as Status, @Message as MessageID, @Params as Params
					SELECT Status, MessageID, Params From  @POST0027temp where Params is not null
		END
END




GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
