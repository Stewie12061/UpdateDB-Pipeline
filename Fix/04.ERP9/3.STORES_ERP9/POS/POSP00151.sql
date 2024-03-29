IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP00151]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP00151]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


----<Summary>
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
----------------------MessageID: POSM000020 (Kiểm tra khác DivisionID), POSM000019 (Kiểm tra đã khóa sổ), POSM000003 (Kiểm tra đã sử dụng)
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
----<Editted by>: Cao Thị Phượng, Date: 21/12/2015: Bổ sung trường hợp kiểm tra khi sửa phiếu nhập
----<Example>
------------------EXEC POSP00151 N'HCM', '50C2101', '', 'POSF00151', '0','2555CE94-BDA4-4506-BCFE-A917C830C0B0'





CREATE PROCEDURE POSP00151
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
		SET @sSQL1 = '	DECLARE @Status TINYINT,
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
								@StatusWT0095 int,
								@StatusPOST0016 int

						--Luu tru ID message
						Declare @POST0015temp table 
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
						Insert into @POST0015temp (	Status, MessageID, Params) 
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
									Select 2 as Status, ''POSM000065'' as MessageID, Null as Params'									

		SET @sSQL2 = '	SET @Cur = CURSOR SCROLL KEYSET FOR
						SELECT P.APK, P.DivisionID, P.ShopID, P.VoucherNo, P.TranMonth, P.TranYear, Q.Closing
						FROM POST0015 P inner join POST9999 Q on P.DivisionID = Q.DivisionID and P.TranMonth=Q.TranMonth and P.TranYear=Q.TranYear
									
						WHERE P.APK IN ('''+@APKList+''')

						OPEN @Cur
						FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelShopID, @DelVoucherNo, @DelTranMonth, @DelTranYear, @Closing 
						WHILE @@FETCH_STATUS = 0
						BEGIN
								--Kiem tra xoa phieu nhap, duoc ke thua tu phieu yeu cau da hoan tat chua
									Set @StatusWT0095 = Isnull((Select Status as StatusWT0095 From WT0095 
														 Where VoucherID = (Select Distinct APKMInherited From POST00151 
																		    Where APKMaster = @DelAPK and DeleteFlg = 0) 
														),0) 
								--Kiem tra phieu nhap sinh ra tu phieu tra hang/phieu doi hang
									Set @StatusPOST0016 = Isnull((Select Top 1 1 From POST0016 
														   Where APK in (Select Distinct APKMinherited From POST00151 
																		 Where APKMaster = @DelAPK and DeleteFlg = 0) and DeleteFlg = 0), 0)
								--Chay Store kiem tra da su dung
									Exec POSP9000 @DelDivisionID, @DelShopID, @DelTranMonth, @DelTranYear, @ID, @DelAPK, '''+@FormID+''', @Status  output
								--Kiem tra khac DivisionID
									IF @DelDivisionID != '''+@DivisionID+'''
										Begin
											SET @Message = @DelVoucherNo
											update @POST0015temp set Params = ISNULL(Params,'''') + @Message+'','' where MessageID = ''00ML000050''
										End
								--Kiem tra khac ShopID
									ELSE IF @DelShopID != '''+@ShopID+'''
										Begin
											SET @Message = @DelVoucherNo
											update @POST0015temp set Params = ISNULL(Params,'''') + @Message+'','' where MessageID = ''POSM000025''
										End
								--Kiem tra bi khoa so
									ELSE IF @Closing = 1 
										Begin
											SET @Message = @DelVoucherNo
											update @POST0015temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000051''
										End
								--Kiem tra da su dung
									ELSE IF @Closing = 0 and (Select @Status) = 1
										Begin
											SET @Message = @DelVoucherNo
											update @POST0015temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000052''
										End
								--Kiem tra da dieu chinh
									ELSE IF @Closing = 0 and (Select @Status) = 2
										Begin
											SET @Message = @DelVoucherNo
											update @POST0015temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000075''
										End
								--Kiem tra da hoan tat
									ELSE IF @StatusWT0095 = 8 
										Begin 
											SET @Message = @DelVoucherNo
											update @POST0015temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''POSM000064''
										End
								--Kiem tra phieu nhap sinh ra tu phieu tra hang/phieu doi hang
									ELSE IF @StatusPOST0016 = 1
										Begin 
											SET @Message = @DelVoucherNo
											update @POST0015temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''POSM000065''
										End
								--Cho phep xoa
									ELSE IF @StatusWT0095 != 8 and @StatusPOST0016 != 1 and  @Closing = 0 and (Select @Status) = 0 
															   and @DelDivisionID = '''+@DivisionID+''' and @DelShopID = '''+@ShopID+'''
										Begin'
		SET @sSQL3 = '	--Luu tru phieu nhap kho truoc khi Update Phieu yeu cau chuyen kho noi bo
								Insert into @UpdateWT0096 (APKMInherited, APKDInherited, ActualQuantity)
								SELECT APKMInherited, APKDInherited, Sum(Isnull(ActualQuantity,0)) as ActualQuantity
								FROM POST00151 
								WHERE APKMInherited in (Select Distinct APKMInherited 
															From POST00151 
															Where APKMaster in (@DelAPK) and 
																	DeleteFlg = 0
															) and DeleteFlg = 0
								Group by APKMInherited, APKDInherited
						--Delete [phieu nhap kho] ben POS
								UPDATE POST0015 SET DeleteFlg = 1 WHERE APK = @DelAPK			
								UPDATE POST00151 SET DeleteFlg = 1 WHERE APKMaster = @DelAPK			
								UPDATE POST9000 SET DeleteFlg = 1 WHERE APKMaster = @DelAPK	
						--Delete [phieu chenh lech] bên POS [Nếu có]
								Delete From POST0025
										Where APKMInherited in (Select Distinct APKMInherited From POST00151 where APKMaster = @DelAPK)
								Delete From POST0024
										Where APKImport in (Select Distinct APKMInherited From POST00151 where APKMaster = @DelAPK)
						--Delete [phieu xuat kho] ben POS
								Insert into @DelPOST0027 (APKMaster) 
										Select Distinct APKMaster 
										from POST0028 
										Where APKMInherited in (Select Distinct APKMInherited From POST00151 where APKMaster = @DelAPK)
											  or APKMInherited in (Select Distinct APKMaster From POST00151 where APKMaster = @DelAPK)
								Delete From POST0028 
										Where APKMInherited in (Select Distinct APKMInherited From POST00151 where APKMaster = @DelAPK)
											 or APKMInherited in (Select Distinct APKMaster From POST00151 where APKMaster = @DelAPK)
								Delete From POST0027 
										Where APK in (Select APKMaster from  @DelPOST0027)	
								Delete From POST9000 Where APKMaster in (Select APKMaster from  @DelPOST0027)	
						--Delete [phieu chuyen kho noi bo] bên ERP
								Insert into @DelAT2006 (VoucherID) 
										Select Distinct VoucherID 
										from AT2007 
										Where (InheritVoucherID in (Select Distinct APKMInherited From POST00151 where APKMaster = @DelAPK)
											  or InheritVoucherID in (Select Distinct APKMaster From POST00151 where APKMaster = @DelAPK)) and InheritTableID = ''POST0015''
								Delete From AT2007 
										Where (InheritVoucherID in (Select Distinct APKMInherited From POST00151 where APKMaster = @DelAPK)
											  or InheritVoucherID in (Select Distinct APKMaster From POST00151 where APKMaster = @DelAPK)) and InheritTableID = ''POST0015''
								Delete From AT2006 
										Where VoucherID in (Select VoucherID from  @DelAT2006 )
										
										'
		SET @sSQL4 = '	--Update [phieu yeu cau van chuyen noi bo] ben ERP, so luong va trang thai
								DECLARE @Cur2 CURSOR,
										@APKMInherited  VARCHAR(50),
										@APKDInherited VARCHAR(50),
										@ActualQuantity VARCHAR(50)
					
								SET @Cur2 = CURSOR SCROLL KEYSET FOR
									SELECT U.APKMInherited, U.APKDInherited
											, Isnull(U.ActualQuantity, 0)-Isnull(W.ActualQuantity, 0) as ActualQuantity
									FROM @UpdateWT0096 U Left join (
																	SELECT APKMInherited, APKDInherited
																			, DeleteFlg, Sum(Isnull(ActualQuantity, 0)) as ActualQuantity
																	FROM POST00151 
																	WHERE APKMaster in (@DelAPK) and DeleteFlg = 1
																	Group by APKMInherited, APKDInherited, DeleteFlg
																	) W
											on U.APKMInherited = W.APKMInherited and U.APKDInherited = W.APKDInherited 
								OPEN @Cur2
								FETCH NEXT FROM @Cur2 INTO @APKMInherited, @APKDInherited, @ActualQuantity
								WHILE @@FETCH_STATUS = 0
								BEGIN
											Update WT0096 Set ReceiveQuantity = @ActualQuantity, Status = 0
													where VoucherID = @APKMInherited and TransactionID = @APKDInherited

											Update WT0095 Set Status = 0
													where VoucherID = @APKMInherited 
															
											Update POST00151 Set Status = 0 Where APKMInherited = @APKMInherited 
											Delete from @UpdateWT0096
								FETCH NEXT FROM @Cur2 INTO @APKMInherited, @APKDInherited, @ActualQuantity
								END
								CLOSE @Cur2
							End
				FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelShopID, @DelVoucherNo, @DelTranMonth, @DelTranYear, @Closing 
			END
			CLOSE @Cur
			SELECT Status, MessageID, Params From  @POST0015temp where Params is not null'
		EXEC (@sSQL1 + @sSQL2 + @sSQL3 + @sSQL4) 
		
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
							@Closing tinyint
					Declare @POST0015temp table 
							(
								Status tinyint,
								MessageID varchar(100),
								Params varchar(4000)
							)
					SELECT	@DelAPK = P.APK, @DelDivisionID = P.DivisionID, @DelShopID = P.ShopID, @ID=P.VoucherNo, @DelTranMonth= P.TranMonth, 
							@DelTranYear = P.TranYear, @Closing = Q.Closing
					FROM POST0015 P inner join POST9999 Q on P.DivisionID = Q.DivisionID  and P.TranMonth=Q.TranMonth and P.TranYear=Q.TranYear
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
					IF @Closing = 0 AND EXISTS (SELECT TOP 1 1 FROM AT2006 M WITH (NOLOCK) inner join AT2007 D WITH (NOLOCK) on M.DivisionID = D.DivisionID and M.VoucherID = D.VoucherID
						WHERE M.DivisionID = @DivisionID and InheritTableID ='POST0015' AND  D.InheritVoucherID = @APK and KindVoucherID = 3)
						BEGIN
							SET @Message = 'POSFML000109' 
							SET	@Status1 = 2
							SET @Params = @ID
							SET @Params = @Params+ ',' + (SELECT TOP 1 M.VoucherNo FROM AT2006 M WITH (NOLOCK) inner join AT2007 D WITH (NOLOCK) on M.DivisionID = D.DivisionID and M.VoucherID = D.VoucherID
						WHERE M.DivisionID = @DivisionID and InheritTableID ='POST0015' AND  D.InheritVoucherID = @APK and KindVoucherID = 3)
						END
					--IF @Closing = 0 and (Select @Status) = 2
					--	Begin --{0} này đã được điều chỉnh kho. Bạn không thể Sửa / Xóa
					--		SET @Message = '00ML000075' 
					--		SET	@Status1 = 2
					--		SET @Params = @ID
					--	End
					Insert into @POST0015temp (	Status, MessageID, Params) 
					Select	@Status1 as Status, @Message as MessageID, @Params as Params
					SELECT Status, MessageID, Params From  @POST0015temp where Params is not null
		END
END


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
