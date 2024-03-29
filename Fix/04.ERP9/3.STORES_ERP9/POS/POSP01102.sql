IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP01102]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP01102]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
----<Summary>
----
----
----<History>
----<Created by>: Phan thanh hoang vu, Date: 07/08/2017
------------------Kết quả trả về: 
----------------------Status = 0 (Loại Message Info), Status = 1 (Loại Message Warning), Status = 0 (Loại Message Error)
----------------------MessageID: 00ML000050 (Kiểm tra khác DivisionID), 00ML000051 (Kiểm tra đã khóa sổ), 00ML000052 (Kiểm tra đã sử dụng)
----------------------Params (Danh sách VoucherNo không xóa được)
------------------Store xử lý: Xóa danh sách một /nhiều @ID, và chỉ Sửa 1 @ID
----------------------Nếu Xóa thành công
---- Editted by: Hoàng vũ on 27/06/2018: 
-----------------Bổ sung đơn hàng bán trên APP/Mobile bị sử dụng bên hóa đơn bán hàng/ hoặc đã bị duyệt thì không cho xóa sửa
-----------------Xóa đơn hàng trên APP không xóa duyệt hàng khuyến mãi
---- Editted by: Hoàng vũ on 05/07/2019: Fixbug không xóa được chứng từ do POS chưa mở kỳ kế toán, nhưng APP vẫn lưu được phiếu
---- Example: EXEC POSP01102 'MS', 'CH001', '', '',1


CREATE PROCEDURE POSP01102 ( 
		  @DivisionID varchar(50),		 --Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
		  @ShopID varchar(50),
		  @APKList NVARCHAR(MAX) = NULL, --Truyền váo cho trường hợp xóa
		  @FormID nvarchar(50),			 -- POSF0110
		  @Mode tinyint					 --1: xóa; 0: sửa
		 )      
AS 
BEGIN
	--Do store WP0141 đặt dưới bảng chuẩn ERP8, nhưng lấy bảng trên ERP9, nếu khách hàng không dùng ERP9 thì chạy store bị lỗi 
	--để xử lý vấn đề này kiểm tra thì kiểm tra bên ERP8 chạy vào không có bảng POST0016 thì không chạy vào store này
	DECLARE @sSQL NVARCHAR(Max)
	IF @Mode = 1
	Begin	
			IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POST0016]') AND type in (N'U'))
			BEGIN
				SET @sSQL = N'
								DECLARE @Status TINYINT,
										@Message NVARCHAR(1000),
										@Cur CURSOR,
										@ID VARCHAR(50),
										@DelAPK  uniqueidentifier,
										@DelShopID VARCHAR(50),
										@DelDivisionID VARCHAR(50),
										@DelVoucherNo VARCHAR(50),
										@DelTranMonth int,
										@DelTranYear int,
										@Closing int
								Declare @POST01101temp table (
										Status tinyint,
										MessageID varchar(100),
										Params varchar(4000))
								--Luu tru APKMaster phieu xuat kho can xoa
								Declare @DelPOST2715 table (
											APK Varchar(50))
					
								SET @Status = 0
								SET @Message = ''''
								SET @ID = ''''
								Insert into @POST01101temp (	Status, MessageID, Params) 
											Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
											union all
											Select 2 as Status, ''POSM000025'' as MessageID, Null as Params
											union all
											Select 2 as Status, ''00ML000051'' as MessageID, Null as Params
											union all
											Select 2 as Status, ''00ML000052'' as MessageID, Null as Params
											union all
											Select 2 as Status, ''00ML000117'' as MessageID, Null as Params
				
								SET @Cur = CURSOR SCROLL KEYSET FOR
								SELECT P.APK, P.DivisionID, P.ShopID, P.VoucherNo, P.TranMonth, P.TranYear, Isnull(Q.Closing, 0) as Closing
								FROM POST01101 P WITH (NOLOCK) left join POST9999 Q WITH (NOLOCK) on P.DivisionID = Q.DivisionID and P.TranMonth=Q.TranMonth and P.TranYear=Q.TranYear
								WHERE P.APK IN ('''+@APKList+''')

								OPEN @Cur
								FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelShopID, @DelVoucherNo, @DelTranMonth, @DelTranYear, @Closing
								WHILE @@FETCH_STATUS = 0
								BEGIN
											Exec POSP9000 @DelDivisionID, @DelShopID, @DelTranMonth, @DelTranYear, @ID, @DelAPK, '''+@FormID+''', @Status  output
											IF @DelDivisionID != '''+@DivisionID+'''
												Begin
													SET @Message = @DelVoucherNo
													update @POST01101temp set Params = ISNULL(Params,'''') + @Message+'','' where MessageID = ''00ML000050''
												End
											ELSE IF @DelShopID != '''+@ShopID+'''
												Begin
													SET @Message = @DelVoucherNo
													update @POST01101temp set Params = ISNULL(Params,'''') + @Message+'','' where MessageID = ''POSM000025''
												End
											ELSE IF @Closing = 1 
												Begin
													SET @Message = @DelVoucherNo
													update @POST01101temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000051''
												End
											ELSE IF EXISTS (Select Top 1 1 From POST00902 Where DivisionID = @DelDivisionID and APKMaster = @DelAPK and DeleteFlg = 0 and IsConfirmDetail = 1) 
														Begin
															SET @Message = @DelVoucherNo
															update @POST01101temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000117''
														End
											ELSE IF @Closing = 0 and (Select @Status) = 1
												Begin
													SET @Message = @DelVoucherNo
													update @POST01101temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000052''
												End
											ELSE IF @Closing = 0 and (Select @Status) = 0 and @DelDivisionID = '''+@DivisionID+''' and @DelShopID = '''+@ShopID+'''
												Begin 
													--Xoa phieu đơn hang
													UPDATE POST01101 SET DeleteFlg = 1 WHERE APK = @DelAPK			
													UPDATE POST01102 SET DeleteFlg = 1 WHERE APKMaster = @DelAPK			
													UPDATE POST00901 SET DeleteFlg = 1 WHERE APK = @DelAPK			
													UPDATE POST00902 SET DeleteFlg = 1 WHERE APKMaster = @DelAPK	
												End
									FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelShopID, @DelVoucherNo, @DelTranMonth, @DelTranYear, @Closing
								END
								CLOSE @Cur
								SELECT Status, MessageID, Params From  @POST01101temp where Params is not null'
					EXEC (@sSQL)
				END
		END

		IF @Mode = 0 --
		Begin	
			IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POST0016]') AND type in (N'U'))
			BEGIN
				SET @sSQL = N'
								DECLARE @Status TINYINT,
										@Message NVARCHAR(1000),
										@Cur CURSOR,
										@ID VARCHAR(50),
										@DelAPK  uniqueidentifier,
										@DelShopID VARCHAR(50),
										@DelDivisionID VARCHAR(50),
										@DelVoucherNo VARCHAR(50),
										@DelTranMonth int,
										@DelTranYear int,
										@Closing int
								Declare @POST01101temp table (
										Status tinyint,
										MessageID varchar(100),
										Params varchar(4000))
								--Luu tru APKMaster phieu xuat kho can xoa
								Declare @DelPOST2715 table (
											APK Varchar(50))
					
								SET @Status = 0
								SET @Message = ''''
								SET @ID = ''''
								Insert into @POST01101temp (	Status, MessageID, Params) 
											Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
											union all
											Select 2 as Status, ''POSM000025'' as MessageID, Null as Params
											union all
											Select 2 as Status, ''00ML000051'' as MessageID, Null as Params
											union all
											Select 2 as Status, ''00ML000052'' as MessageID, Null as Params
											union all
											Select 2 as Status, ''00ML000117'' as MessageID, Null as Params
				
								SET @Cur = CURSOR SCROLL KEYSET FOR
								SELECT P.APK, P.DivisionID, P.ShopID, P.VoucherNo, P.TranMonth, P.TranYear, Q.Closing
								FROM POST01101 P WITH (NOLOCK) inner join POST9999 Q WITH (NOLOCK) on P.DivisionID = Q.DivisionID and P.TranMonth=Q.TranMonth and P.TranYear=Q.TranYear
								WHERE P.APK IN ('''+@APKList+''')

								OPEN @Cur
								FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelShopID, @DelVoucherNo, @DelTranMonth, @DelTranYear, @Closing
								WHILE @@FETCH_STATUS = 0
								BEGIN
											Exec POSP9000 @DelDivisionID, @DelShopID, @DelTranMonth, @DelTranYear, @ID, @DelAPK, '''+@FormID+''', @Status  output
											IF @DelDivisionID != '''+@DivisionID+'''
												Begin
													SET @Message = @DelVoucherNo
													update @POST01101temp set Params = ISNULL(Params,'''') + @Message+'','' where MessageID = ''00ML000050''
												End
											ELSE IF @DelShopID != '''+@ShopID+'''
												Begin
													SET @Message = @DelVoucherNo
													update @POST01101temp set Params = ISNULL(Params,'''') + @Message+'','' where MessageID = ''POSM000025''
												End
											ELSE IF @Closing = 1 
												Begin
													SET @Message = @DelVoucherNo
													update @POST01101temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000051''
												End
											ELSE IF EXISTS (Select Top 1 1 From POST00902 Where DivisionID = @DelDivisionID and APKMaster = @DelAPK and DeleteFlg = 0 and IsConfirmDetail = 1) 
														Begin
															SET @Message = @DelVoucherNo
															update @POST01101temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000117''
														End
											ELSE IF @Closing = 0 and (Select @Status) = 1
												Begin
													SET @Message = @DelVoucherNo
													update @POST01101temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000052''
												End
									FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelShopID, @DelVoucherNo, @DelTranMonth, @DelTranYear, @Closing
								END
								CLOSE @Cur
								SELECT Status, MessageID, Params From  @POST01101temp where Params is not null'
					EXEC (@sSQL)
				END
		END
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
