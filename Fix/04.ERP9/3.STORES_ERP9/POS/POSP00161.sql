IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP00161]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP00161]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


----<Summary>
----
----
----<History>
----<Created by>: Phan thanh hoang vu, Date: 01/04/2014
------------------Kết quả trả về: 
----------------------Status = 0 (Loại Message Info), Status = 1 (Loại Message Warning), Status = 0 (Loại Message Error)
----------------------MessageID: 00ML000050 (Kiểm tra khác DivisionID), 00ML000051 (Kiểm tra đã khóa sổ), 00ML000052 (Kiểm tra đã sử dụng)
----------------------Params (Danh sách VoucherNo không xóa được)
------------------Store xử lý: Xóa danh sách một /nhiều @ID, và chỉ Sửa 1 @ID
----------------------Nếu Xóa thành công
---- Editted by: Phan thanh hoang vu, on 12/06/2017: Bổ sung with Nolock cải tiền tiến tốc độc và dealock
---- Editted by: Phan thanh hoang vu, on 02/02/2018: MINHSANG xóa phiếu bán hàng thì xóa luôn phiếu duyệt khuyền mãi đề xuất
---- Editted by: Tra Giang, on 12/10/2018: ATTOM Xóa phiếu bán hàng cập nhật lại doanh số tích lũy theo hội viên
---- Editted by: Phan thanh hoang vu, on 14/03/2019: Thay đổi cách hiển thị message mới trên ERP9 theo cấu trúc quy định Params = Values1@,@Values2@,@Values3@....@Valuesn
---------------------------------------------------: lúc này bên Dev hiểu là hiển hiển thị message se dùng hàm Split cắt param hiện tham số tương ứng cho cho messagename
---- Editted by: Phan thanh hoang vu, on 24/04/2019: Không xóa vật lý các trường, chuyển sang xóa logix các trường để theo dõi trạng thái hủy
---- Editted by: Nhật Thanh, on 04/08/2023: Bổ sung UserID để update  ai là người xóa phiếu LastModifyUserID 
---- Example: EXEC POSP00161 'KC', 'CH01', 'CC0C68E7-8610-43DA-8A21-0F920A185941'',''5e69dd0c-5faa-4ea7-8ca8-fa1c2cde626c', 'POSF0016', '1',null
---- Example: EXEC POSP00161 'AS', 'CH01', null, 'POSF0016', '0', '5e69dd0c-5faa-4ea7-8ca8-fa1c2cde626c'
---- Editted by: Hoàng Long  on 08/08/2023         : [2023/08/IS/0085] - TL-Xóa phiếu bán hàng (đã xuất hàng và giao hàng): Đã xuất kho giao hàng thì không cho xóa phiếu bán hàng

CREATE PROCEDURE POSP00161 ( 
		  @DivisionID varchar(50),	
		  @UserID varchar(50),	 --Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
		  @ShopID varchar(50),
		  @APKList NVARCHAR(MAX) = NULL, --Truyền váo cho trường hợp xóa
		  @FormID nvarchar(50),			 -- POSF0016
		  @Mode tinyint,                 --1: Xóa, 0: Sửa  
		  @APK VARCHAR(50) = NULL )      --Truyền váo cho trường hợp sửa
AS 
BEGIN
	DECLARE @sSQL1 NVARCHAR(Max)
	DECLARE @sSQL2 NVARCHAR(Max)
	DECLARE @sSQL3 NVARCHAR(Max)

	IF @Mode = 1 
		BEGIN	
		SET @sSQL1 = N'
					DECLARE @Status TINYINT,
							@Message NVARCHAR(1000),
							@Params NVARCHAR(Max),
							@Cur CURSOR,
							@ID VARCHAR(50),
							@DelAPK  uniqueidentifier,
							@DelShopID VARCHAR(50),
							@DelDivisionID VARCHAR(50),
							@DelVoucherNo VARCHAR(50),
							@DelVoucherID VARCHAR(50),
							@DelTranMonth int,
							@DelTranYear int,
							@Closing int,
							@APPSuggestID uniqueidentifier,
							@MemberID VARCHAR(50),
							@AccruedPurchaseAmount int,
							@IsInTime int
							--IsInTime = 1 thì là đã giao hàng
					Declare @POST0016temp table (
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000))
					
					SET @Status = 0
					SET @Message = ''''
					SET @ID = ''''
					Insert into @POST0016temp (	Status, MessageID, Params) 
								Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''POSM000025'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''00ML000051'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''POSFML000121'' as MessageID, Null as Params
								--union all	--Message cũ: para trả ra là một messagename chỉ có {0}
								--Select 2 as Status, ''00ML000052'' as MessageID, Null as Params
								--union all	--Message mới: para trả ra là một messagename chỉ có {0}, {1}..., {n} theo cấu trúc {0}@,@{1}
								--Select 2 as Status, ''00ML000188'' as MessageID, Null as Params
								
				
					SET @Cur = CURSOR SCROLL KEYSET FOR
					SELECT P.APK, P.DivisionID, P.ShopID, 
							Case When P.PVoucherNo is null and P.CVoucherNo is null then P.VoucherNo 
								 When P.PVoucherNo is not null and P.CVoucherNo is null then P.PVoucherNo
								 When P.PVoucherNo is null and P.CVoucherNo is not null then P.CVoucherNo
								 end as VoucherNo, P.TranMonth, P.TranYear, Q.Closing, P.VoucherID, P.APPSuggestID
								   , P11.MemberID
						  , Case when P.PVoucherNo is not null then P.TotalInventoryAmount
								 when P.CVoucherNo is not null then (-1)* P.ChangeAmount
								 when P.PVoucherNo is null and P.CVoucherNo is null then (-1)* P.TotalInventoryAmount
								 end AccruedPurchaseAmount,P27.IsInTime
					FROM POST0016 P WITH (NOLOCK) inner join POST9999 Q WITH (NOLOCK) on P.DivisionID = Q.DivisionID and P.TranMonth=Q.TranMonth and P.TranYear=Q.TranYear
					inner join POST0011 P11 WITH (NOLOCK) on  P.MemberID=P11.MemberID
					left join POST0028 P28 WITH (NOLOCK) on  P.APK=P28.APKMInherited
					left join POST0027 P27 WITH (NOLOCK) on  P27.APK= P28.APKMaster
					WHERE P.APK IN ('''+@APKList+''')

					OPEN @Cur
					FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelShopID, @DelVoucherNo, @DelTranMonth, @DelTranYear, @Closing, @DelVoucherID, @APPSuggestID ,@MemberID,@AccruedPurchaseAmount,@IsInTime
					WHILE @@FETCH_STATUS = 0
					BEGIN
								Exec POSP9000 @DelDivisionID, @DelShopID, @DelTranMonth, @DelTranYear, @ID, @DelAPK, '''+@FormID+''', @Status  output, @Params output
								IF @DelDivisionID != '''+@DivisionID+'''
									Begin
										SET @Message = @DelVoucherNo
										update @POST0016temp set Params = ISNULL(Params,'''') + @Message+'','' where MessageID = ''00ML000050''
									End
								ELSE IF @DelShopID != '''+@ShopID+'''
									Begin
										SET @Message = @DelVoucherNo
										update @POST0016temp set Params = ISNULL(Params,'''') + @Message+'','' where MessageID = ''POSM000025''
									End
								ELSE IF @Closing = 1 
									Begin
										SET @Message = @DelVoucherNo
										update @POST0016temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000051''
									End
								ELSE IF @IsInTime IS NOT NULL 
									Begin
										SET @Message = @DelVoucherNo
										update @POST0016temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''POSFML000121''
									End

								ELSE IF @Closing = 0 and (Select @Status) = 1
									Begin
										SET @Message = @DelVoucherNo
										--update @POST0016temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000052''
										Insert into @POST0016temp (	Status, MessageID, Params) 
										Values (2, ''00ML000188'', @Message + ''@,@'' + @Params)
									End
								ELSE IF @Closing = 0 and (Select @Status) = 0 and @DelDivisionID = '''+@DivisionID+''' and @DelShopID = '''+@ShopID+'''
									Begin '
			SET @sSQL2 = N'				--Lưu vết phieu xuat kho và phiếu nhập kho sinh ra từ bán hàng/trả hàng/đổi hàng ben POS
											Select Distinct APKMaster as APK
											into #DelPOST2715
											from POST00151 WITH (NOLOCK) 
											where APKMInherited = @DelAPK  and DeleteFlg = 0
											union
											Select Distinct APKMaster from POST0028 WITH (NOLOCK)
											where APKMInherited = @DelAPK and DeleteFlg = 0
											
										--Lưu vết phieu yeu cau xuat kho và phiếu yeu cau nhập kho sinh ra từ bán hàng/trả hàng/đổi hàng ben POS
											Select Distinct M.VoucherID 
											into #DelWT9596
											From WT0095 M WITH (NOLOCK) inner join WT0096 D WITH (NOLOCK)  on M.DivisionID = D.DivisionID and M.VoucherID = D.VoucherID
											Where M.DivisionID = @DelDivisionID and D.InheritVoucherID = @DelAPK
										
										--Lưu vết phieu phieu thu sinh ra từ bán hàng/đổi hàng ben POS
											Select Distinct M.APK 
											into #DelPOST8182
											from POST00801 M WITH (NOLOCK) inner join POST00802 D WITH (NOLOCK) on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
											where D.APKMInherited = @DelAPK  and M.DeleteFlg = 0 and Isnull(IsDeposit, 0) = 0 and IsPayInvoice in (2,3)
										
										--Lưu vết phiếu de nghi chi sinh ra từ trả hàng/đổi hàng ben POS
											Select Distinct M.APK 
											into #DelPOST2021
											From POST2020 M inner join POST2021 D on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
											Where M.SuggestType in (1, 2) and D.APKMInherited = @DelAPK and M.DeleteFlg = 0
										
										--Xóa phiếu nhập và phiếu xuất
										
										Update POST0028 Set DeleteFlg = 1,LastModifyDate =GETDATE(),LastModifyUserID='''+@UserID+''' Where APKMaster in (Select  APK From #DelPOST2715) and DeleteFlg = 0
										Update POST0027 Set DeleteFlg = 1,LastModifyDate =GETDATE(),LastModifyUserID='''+@UserID+''' Where APK in (Select  APK From #DelPOST2715) and DeleteFlg = 0
										
										Update POST00151 Set DeleteFlg = 1,LastModifyDate =GETDATE(),LastModifyUserID='''+@UserID+''' Where APKMaster in (Select  APK From #DelPOST2715) and DeleteFlg = 0
										Update POST0015 Set DeleteFlg = 1,LastModifyDate =GETDATE(),LastModifyUserID='''+@UserID+''' Where APK in (Select  APK From #DelPOST2715) and DeleteFlg = 0
										
										Update POST9000 Set DeleteFlg = 1,LastModifyDate =GETDATE(),LastModifyUserID='''+@UserID+''' Where APKMaster in (Select  APK From #DelPOST2715) and DeleteFlg = 0

										--Xóa phiếu yêu cầu nhập kho và phiếu yêu cầu xuất kho
										Delete From WT0095 Where DivisionID = @DelDivisionID and VoucherID in (Select  VoucherID From #DelWT9596)
										Delete From WT0096 Where DivisionID = @DelDivisionID and VoucherID in (Select  VoucherID From #DelWT9596)
									
										--Xóa phiếu thu sinh từ phiếu bán hàng và đổi hàng
										Update POST00802 Set DeleteFlg = 1,LastModifyDate =GETDATE(),LastModifyUserID='''+@UserID+''' Where APKMaster in (Select  APK From #DelPOST8182) and DeleteFlg = 0
										Update POST00801 Set DeleteFlg = 1,LastModifyDate =GETDATE(),LastModifyUserID='''+@UserID+''' Where APK in (Select  APK From #DelPOST8182) and DeleteFlg = 0
										
										--Xóa phiếu đề nghị chi sinh từ phiếu Trả hàng và đổi hàng
										Update POST2021 Set DeleteFlg = 1 Where APKMaster in (Select  APK From #DelPOST2021) and DeleteFlg = 0
										Update POST2020 Set DeleteFlg = 1,LastModifyDate =GETDATE(),LastModifyUserID='''+@UserID+''' Where APK in (Select  APK From #DelPOST2021) and DeleteFlg = 0

										--Xoa phieu ban hang
										UPDATE POST0016 SET DeleteFlg = 1,LastModifyDate =GETDATE(),LastModifyUserID='''+@UserID+''' WHERE APK = @DelAPK			
										UPDATE POST00161 SET DeleteFlg = 1,LastModifyDate =GETDATE(),LastModifyUserID='''+@UserID+''' WHERE APKMaster = @DelAPK			
										UPDATE POST9000 SET DeleteFlg = 1,LastModifyDate =GETDATE(),LastModifyUserID='''+@UserID+''' WHERE APKMaster = @DelAPK
											
										--Update lại trạng thái phiếu đặt cọc thành chưa lập hóa đơn
										UPDATE POST2010 SET IsInvoice = 0 Where APK in (Select Distinct APKMInherited From POST00161 WHERE APKMaster = @DelAPK and APKMInherited is not null)
										
										--Update lại trạng thái Duyệt phiếu đề xuất khuyến mãi --CustomizeMINHSANG
										UPDATE POST00901 SET DeleteFlg = 1,LastModifyDate =GETDATE(),LastModifyUserID='''+@UserID+''' Where APK = @APPSuggestID 
										UPDATE POST00902 SET DeleteFlg = 1,LastModifyDate =GETDATE(),LastModifyUserID='''+@UserID+''' Where APKMaster = @APPSuggestID 

										Drop table #DelPOST2715
										Drop table #DelWT9596
										Drop table #DelPOST8182
										Drop table #DelPOST2021'
			SET @sSQL3 = N'
									Update POST0011 Set AccruedPurchase = AccruedPurchase-@AccruedPurchaseAmount  where MemberID = @MemberID
									End
						FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelShopID, @DelVoucherNo, @DelTranMonth, @DelTranYear, @Closing, @DelVoucherID, @APPSuggestID ,@MemberID,@AccruedPurchaseAmount,@IsInTime
					END
					CLOSE @Cur
					SELECT Status, MessageID, Params From  @POST0016temp where Params is not null
					'
		EXEC (@sSQL1+@sSQL2+@sSQL3)
		--Print (@sSQL1)
		--Print (@sSQL2)
		--Print (@sSQL3)
	END
	IF @Mode = 0
		BEGIN
					DECLARE @Status TINYINT,
							@Status1 TINYINT,
							@Message NVARCHAR(1000),
							@Params Varchar(100),
							@Params1 NVARCHAR(Max),
							@DelDivisionID Varchar(50), 
							@DelShopID Varchar(50),
							@DelTranMonth int, 
							@DelTranYear int, 
							@ID Varchar(50), 
							@DelAPK uniqueidentifier,
							@Closing tinyint
					Declare @POST0016temp table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
					SELECT	@DelAPK = P.APK, @DelDivisionID = P.DivisionID, @DelShopID = P.ShopID, @ID=(Case When P.PVoucherNo is null and P.CVoucherNo is null then P.VoucherNo 
								 When P.PVoucherNo is not null and P.CVoucherNo is null then P.PVoucherNo
								 When P.PVoucherNo is null and P.CVoucherNo is not null then P.CVoucherNo
								 end), @DelTranMonth= P.TranMonth, 
							@DelTranYear = P.TranYear, @Closing = Q.Closing
					FROM POST0016 P WITH (NOLOCK) inner join POST9999 Q WITH (NOLOCK) on P.DivisionID = Q.DivisionID  and P.TranMonth=Q.TranMonth and P.TranYear=Q.TranYear
					Where P.APK = @APK and P.DeleteFlg = 0

					Exec POSP9000 @DelDivisionID, @DelShopID, @DelTranMonth, @DelTranYear, @ID, @DelAPK, @FormID, @Status  output, @Params output
					Print 'a'
					IF @DelDivisionID != @DivisionID
						Begin
							SET @Message = '00ML000050' 
							SET	@Status1 = 2
							SET @Params1 = @ID
						End 
					IF @DelShopID != @ShopID
						Begin
							SET @Message = 'POSM000025' 
							SET	@Status1 = 2
							SET @Params1 = @ID
						End 
					IF @Closing = 1 
						Begin
							SET @Message = '00ML000051'  
							SET	@Status1 = 2
							SET @Params1 = @ID
						End
					IF @Closing = 0 and (Select @Status) = 1
						Begin
							Insert into @POST0016temp (	Status, MessageID, Params) 
							Values (2, '00ML000188', @ID + '@,@' + @Params)
						End
					Insert into @POST0016temp (	Status, MessageID, Params) 
					Select	@Status1 as Status, @Message as MessageID, @Params1 as Params
					SELECT Status, MessageID, Params From  @POST0016temp where Params is not null
		END
END




GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
