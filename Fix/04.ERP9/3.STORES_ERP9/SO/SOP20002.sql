IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SOP20002]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[SOP20002]
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
----<Created by>: Phan thanh hoang vu, Date: 01/04/2014
------------------Kết quả trả về: Status = 0 (Loại Message Info), Status = 1 (Loại Message Warning), Status = 2 (Loại Message Error)
----------------------MessageID: 00ML000050 (Kiểm tra khác DivisionID), 00ML000051 (Kiểm tra đã khóa sổ), 00ML000052 (Kiểm tra đã sử dụng)
----------------------Params (Danh sách VoucherNo không xóa được)
------------------Store xử lý: Xóa danh sách một /nhiều @ID, và chỉ Sửa 1 @ID
----------------------Nếu Xóa thành công
---Mdified by Thị Phượng on 25/04/2017: Bổ sung xóa thêm quy cách 
---- Modified by Thị Phượng, Date 23/06/2017 Bổ sung set lại giá trị @Status khi chạy con trỏ
---- Modified by Tra Ginag, Date 06/12/2018 Bổ sung đã kế thừa thì không cho xóa.
---- Modified by Đình Hoà, Date 13/07/2020 Bổ sung xoá tiến độ giao hàng của đơn hàng.
---- Modified by Đình Hoà, Date 08/01/2021 Bổ sung Update kiểm tra Phiếu báo giá đã tạo đơn hàng.
---- Modified by Văn Tài , Date 23/03/2022 Loại bỏ kiểm tra kỳ kế toán cho SO, PO trên ERP 9.
---- Modified by Nhật Thanh , Date 30/05/2023: Xóa thông tin ví chiết khấu của đơn hàng
---- <Example>
---- EXEC SOP20002 'AS', 'SO/12/2015/0001'',''SO/01/2015/0002'',''SO/01/2015/0003', 'OT2001', 1, '5e69dd0c-5faa-4ea7-8ca8-fa1c2cde626c', ''

CREATE PROCEDURE SOP20002
		( @DivisionID varchar(50),--Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
		  @VoucherIDList NVARCHAR(MAX) = NULL, --Truyền váo cho trường hợp xóa
		  @TableName  nvarchar(50),
		  @Mode tinyint,                 --1: Xóa, 0: Sửa  
		  @VoucherID VARCHAR(50) = NULL,        --Truyền vào cho trường hợp sửa
		  @UserID varchar(50)
		) 
AS 

BEGIN
	DECLARE @sSQL1 NVARCHAR(Max)
	DECLARE @sSQL2 NVARCHAR(Max)

	IF @Mode = 1 
		BEGIN	
		SET @sSQL1 = N'
					DECLARE @Status TINYINT,
							@Message NVARCHAR(1000),
							@Cur CURSOR,
							@ID VARCHAR(50),

							@DelDivisionID VARCHAR(50),
							@DelSOrderID VARCHAR(50),
							@DelVoucherNo VARCHAR(50),
							@DelTranMonth int,
							@DelTranYear int,
							@DelClosing int,
							@DelIsConfirm int,
							@DelIsConfirm01 int,
							@DelIsConfirm02 int,
							@DelStatus int,
							@QuotationID VARCHAR(50)

					Declare @OT2001temp table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
					
					SET @Status = 0
					SET @Message = ''''
					SET @ID = ''''
					Insert into @OT2001temp (	Status, MessageID, Params) 
								--Nếu khác DivisionID thì cảnh báo.
								Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
								union all
								--Nếu đã khóa sổ thì cảnh báo.
								Select 2 as Status, ''00ML000051'' as MessageID, Null as Params
								union all
								--Nếu đã duyệt thì cảnh báo.
								Select 2 as Status, ''OFML000067'' as MessageID, Null as Params
								union all
								--Nếu đã sử dụng thì cảnh báo.
								Select 2 as Status, ''00ML000052'' as MessageID, Null as Params
				
					SET @Cur = CURSOR SCROLL KEYSET FOR
					SELECT O01.DivisionID, O01.SOrderID, O01.VoucherNo, O01.TranMonth, O01.TranYear, O99.Closing
							, Isnull(IsConfirm, 0) as IsConfirm, Isnull(IsConfirm01, 0) as IsConfirm01, Isnull(IsConfirm02, 0) as IsConfirm02, Isnull(O01.Status,0) as Status, O01.QuotationID
					FROM OT2001 O01 inner join OT9999 O99 on O01.DivisionID = O99.DivisionID and O01.TranMonth= O99.TranMonth and O01.TranYear= O99.TranYear
					WHERE O01.SOrderID IN ('''+@VoucherIDList+''')

					OPEN @Cur
					FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelSOrderID, @DelVoucherNo, @DelTranMonth, @DelTranYear
											, @DelClosing, @DelIsConfirm, @DelIsConfirm01, @DelIsConfirm02, @DelStatus, @QuotationID
					WHILE @@FETCH_STATUS = 0 '
SET @sSQL2 = N'		
					BEGIN

								EXEC SOP90000 @DelDivisionID, @DelTranMonth, @DelTranYear, @DelSOrderID, '''+@TableName+''', 0, @Status output, @Message output
								--Nếu khác DivisionID thì cảnh báo.
								IF @DelDivisionID != '''+@DivisionID+'''
									Begin
										SET @Message = @DelVoucherNo
										update @OT2001temp set Params = ISNULL(Params,'''') + @Message+'','' where MessageID = ''00ML000050''
									End
								--Nếu đã khóa sổ thì cảnh báo.
								--ELSE IF @DelClosing = 1 
								--	Begin
								--		SET @Message = @DelVoucherNo
								--		update @OT2001temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000051''
								--	End
								--Nếu đã duyệt thì cảnh báo.
								ELSE IF (@DelIsConfirm = 1 or @DelIsConfirm01 = 1 or @DelIsConfirm02 = 1 or @DelStatus =1 or (@Status = 2 and @Message = ''OFML000067'')) 
									Begin
										SET @Message = @DelVoucherNo
										update @OT2001temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''OFML000067''
									End
									
								--Nếu đã sử dụng thì cảnh báo.
								ELSE IF @Status != 2 and @Message != ''OFML000067''
									Begin
										SET @Message = @DelVoucherNo
										update @OT2001temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000052''
									End
								--Nếu đã ke thua thì cảnh báo.
								ELSE IF @Status = 2 and @Message = ''00ML000052''
									Begin
										SET @Message = @DelVoucherNo
										update @OT2001temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000052''
									End
								
								ELSE 
									Begin
										-- Đẩy dữ liệu bị xóa vào table lịch sử xóa
										EXEC AP2089 @DelDivisionID, @DelSOrderID,2

										--Xoa thông tin duyệt
										DELETE FROM OOT9001 WHERE APKMaster =(select APKMaster_9000 from OT2001 where SOrderID =@DelSOrderID)
										DELETE FROM OOT9000 WHERE APK =(select APKMaster_9000 from OT2001 where SOrderID =@DelSOrderID)

										--Xoa phieu Detail đơn hàng bán
											Delete From OT2002 Where DivisionID = @DelDivisionID and SOrderID = @DelSOrderID
										--Xoa phieu Master đơn hàng bán
											Delete From OT2001 Where DivisionID = @DelDivisionID and SOrderID = @DelSOrderID
										--xoa phieu ma phan tich so 8
										Delete From AT1011 Where DivisionID = @DelDivisionID and AnaID = @DelVoucherNo AND AnaTypeID = ''A08''

										--Update kiểm tra Phiếu báo giá đã tạo đơn hàng
										IF NOT EXISTS (SELECT TOP 1 1 FROM OT2001 WITH(NOLOCK) WHERE QuotationID = @QuotationID)
										BEGIN
											UPDATE OT2101 SET IsSO = 0 WHERE QuotationID = @QuotationID
										END

										--Xóa quy cách
										If exists (SELECT top 1 1  FROM AT0000 WHERE DefDivisionID = '''+@DivisionID+''' AND IsSpecificate = 1)
												Delete From OT8899 where DivisionID = @DelDivisionID and VoucherID = @DelSOrderID and TableID =''OT2002''


										-- Xóa master tiến độ giao hàng OT2003
										DELETE FROM OT2003 WHERE SOrderID = @DelSOrderID
									
										-- Xóa thông tin tiến độ giao hàng OT2003_MT
										IF EXISTS(SELECT TOP 1 * FROM CustomerIndex WHERE CustomerName = 117) 
										BEGIN									
											DELETE FROM OT2003_MT WHERE SOrderID = @DelSOrderID
										END
										-- Xóa dữ liệu ví chiết khấu
										DELETE FROM CIT1530 WHERE DivisionID = @DelDivisionID and SOrderID = @DelVoucherNo
									End
								
						FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelSOrderID, @DelVoucherNo, @DelTranMonth, @DelTranYear
											, @DelClosing, @DelIsConfirm, @DelIsConfirm01, @DelIsConfirm02, @DelStatus, @QuotationID
						Set @Status = 0
					END
					CLOSE @Cur
					SELECT Status, MessageID, Params From  @OT2001temp where Params is not null'
		EXEC (@sSQL1+@sSQL2)
		print @sSQL1
		Print @sSQL2
	END
	--IF @Mode = 0
	--	BEGIN
	--				DECLARE @Status TINYINT,
	--						@Status1 TINYINT,
	--						@Message NVARCHAR(1000),
	--						@Params Varchar(100),
	--						@DelDivisionID Varchar(50), 
	--						@DelShopID Varchar(50),
	--						@DelTranMonth int, 
	--						@DelTranYear int, 
	--						@ID Varchar(50), 
	--						@@DelSOrderID uniqueidentifier,
	--						@Closing tinyint
	--				Declare @OT2001temp table 
	--						(
	--						Status tinyint,
	--						MessageID varchar(100),
	--						Params varchar(4000)
	--						)
	--				SELECT	@@DelSOrderID = P.APK, @DelDivisionID = P.DivisionID, @DelShopID = P.ShopID, @ID=(Case When P.PVoucherNo is null and P.CVoucherNo is null then P.VoucherNo 
	--							 When P.PVoucherNo is not null and P.CVoucherNo is null then P.PVoucherNo
	--							 When P.PVoucherNo is null and P.CVoucherNo is not null then P.CVoucherNo
	--							 end), @DelTranMonth= P.TranMonth, 
	--						@DelTranYear = P.TranYear, @Closing = Q.Closing
	--				FROM OT2001 P inner join POST9999 Q on P.DivisionID = Q.DivisionID  and P.TranMonth=Q.TranMonth and P.TranYear=Q.TranYear
	--				Where P.APK = @SOrderID and P.DeleteFlg = 0

	--				Exec POSP9000 @DelDivisionID, @DelShopID, @DelTranMonth, @DelTranYear, @ID, @@DelSOrderID, @FormID, @Status  output
					
	--				IF @DelDivisionID != @DivisionID
	--					Begin
	--						SET @Message = '00ML000050' 
	--						SET	@Status1 = 2
	--						SET @Params = @ID
	--					End 
	--				IF @DelShopID != @ShopID
	--					Begin
	--						SET @Message = 'POSM000025' 
	--						SET	@Status1 = 2
	--						SET @Params = @ID
	--					End 
	--				IF @Closing = 1 
	--					Begin
	--						SET @Message = '00ML000051'  
	--						SET	@Status1 = 2
	--						SET @Params = @ID
	--					End
	--				IF @Closing = 0 and (Select @Status) = 1
	--					Begin
	--						SET @Message = '00ML000052' 
	--						SET	@Status1 = 2
	--						SET @Params = @ID
	--					End
	--				Insert into @OT2001temp (	Status, MessageID, Params) 
	--				Select	@Status1 as Status, @Message as MessageID, @Params as Params
	--				SELECT Status, MessageID, Params From  @OT2001temp where Params is not null
	--	END
END



GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
