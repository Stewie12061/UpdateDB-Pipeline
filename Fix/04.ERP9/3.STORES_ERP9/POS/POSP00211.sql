IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP00211]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP00211]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- =============================================
-- Author:		MaiVu
-- Create date: 18/04/2014
-- Description:	Thực hiện xóa/ sửa Phiếu Xuất
--				- Nếu thỏa thỏa điều kiện thì cho phép xóa, ngược lại thì báo Message
--				- Không xóa trực tiếp, chỉ đổi trạng thái DeleteFlg từ 0 sang 1
--				- Nếu Mode =1 thì cho phép xóa, ngược lại Mode =0 thì thông báo để thực hiện sửa
--
-- Edited by MaiVu, Date: 02/06/2014 - Thêm kiểm tra cửa hàng trước khi xóa/ sửa
-- Edited by Tra Giang, Date: 04/12/2018 - Bổ sung kiểm tra phiếu đã được duyệt thì không cho phép sửa/xóa.
-- Edited by Tra Giang, Date: 06/06/2019 - Bổ sung kiểm tra thiết lập nếu có check tự động duyệt phiếu yêu cầu VCNB thì cho phép sửa/ xóa. 
-- Edited by Văn Tài,	Date: 19/08/2019 - Điều chỉnh lại cách kiểm tra xóa phiếu, không cần check tự động duyệt phiếu vì tự động duyệt phiếu thì phiếu đã ở trạng thái status = 1 khi được sinh ra.
-- Edited by Tra Giang,	Date: 30/09/2019 - Cần check tự động duyệt phiếu không? Nếu có tự động duyệt thì cho phép sửa xóa không cần check đã duyệt hay chưa. Nếu không duyệt tự đông-> Phiếu đã duyệt không cho sửa/ xóa. 
-- EXAMPLE: 
-- EXEC POSP00211 'KC', 'BIGC','12B5CD95-7337-4EA4-84FC-4115D0512A11'',''E919B925-FC63-483B-8EFA-418945CE01C4'',''40612274-4FA5-44DF-8AA3-5EAFDED3AFEF','POSF0021',1,null
-- EXEC POSP00211 'KC', 'BIGC','80C293FD-FB06-4713-812C-3D8708074C15','POSF0021',1,null
-- =============================================
CREATE PROCEDURE [dbo].[POSP00211]
	( @DivisionID varchar(50),--Trường hợp @DelDivisionID đúng với @DivisionID đăng nhập thì cho xóa
	  @ShopID varchar(50),
	  @APKList NVARCHAR(MAX) = NULL,
	  @FormID nvarchar(50),
	  @Mode tinyint,--1: Xóa, 0: Sửa  
	  @APK VARCHAR(50) = NULL --Truyền tham số vào khi sửa
	) 
AS
BEGIN
	DECLARE @sSQL NVARCHAR(MAX)
	IF @Mode = 1 
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
							@Closing int,
							@Status2 int
					Declare @POST0022temp table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)

					SET @Status = 0
					SET @Message = ''''
					SET @ID = ''''
					Insert into @POST0022temp (	Status, MessageID, Params) 
								Select 2 as Status, ''00ML000117'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''POSM000025'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''00ML000051'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''POSM000019'' as MessageID, Null as Params
					SET @Cur = CURSOR SCROLL KEYSET FOR
					SELECT P.APK, P.DivisionID, P.ShopID, P.VoucherNo, P.TranMonth, P.TranYear, Q.Closing,P.Status
					FROM POST0022 P inner join POST9999 Q on P.DivisionID = Q.DivisionID and P.TranMonth=Q.TranMonth and P.TranYear=Q.TranYear
					WHERE P.APK IN ('''+@APKList+''')

					OPEN @Cur
					FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelShopID, @DelVoucherNo, @DelTranMonth, @DelTranYear, @Closing ,@Status2
					WHILE @@FETCH_STATUS = 0
					BEGIN
								Exec POSP9000 @DelDivisionID, @DelShopID, @DelTranMonth, @DelTranYear, @ID, @DelAPK, '''+@FormID+''', @Status  output
								-- Kiểm tra khác division
								IF @DelDivisionID != '''+@DivisionID+'''
									Begin
										SET @Message = @DelVoucherNo
										update @POST0022temp set Params = ISNULL(Params,'''') + @Message+'','' where MessageID = ''00ML000050''
									End
								-- Kiểm tra khác cửa hàng
								ELSE IF @DelShopID != '''+@ShopID+'''
									Begin
										SET @Message = @DelVoucherNo
										update @POST0022temp set Params = ISNULL(Params,'''') + @Message+'','' where MessageID = ''POSM000025''
									End
								-- Kiểm tra khóa sổ
								ELSE IF @Closing = 1 
									Begin
										SET @Message = @DelVoucherNo
										update @POST0022temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000051''
									End
								-- Kiểm tra phiếu đã duyệt

								ELSE IF NOT EXISTS ( SELECT TOP 1 1 FROM WT0000 WITH (NOLOCK) WHERE IsAutoConfirmRequire = 1) AND @Status2 = 1 
									Begin
										SET @Message = @DelVoucherNo
										update @POST0022temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000117''
									End
								-- Kiểm tra đã được sử dụng từ POSP9000
								ELSE IF (SELECT @Status) = 1
									BEGIN
										SET @Message = @DelVoucherNo
										UPDATE @POST0022temp SET Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000052''
									END
								ELSE 
									BEGIN
										UPDATE POST0022 SET DeleteFlg = 1 WHERE APK = @DelAPK			
										UPDATE POST0023 SET DeleteFlg = 1 WHERE APKMaster = @DelAPK			
										UPDATE POST9000 SET DeleteFlg = 1 WHERE APK = @DelAPK
										DELETE WT0095 WHERE voucherID = (select distinct dt.VoucherID from WT0096 dt WHERE dt.InheritVoucherID = @DelAPK)
										DELETE WT0096 WHERE InheritVoucherID = @DelAPK		
									END

						FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelShopID, @DelVoucherNo, @DelTranMonth, @DelTranYear, @Closing  ,@Status2
					END
					CLOSE @Cur
					SELECT Status, MessageID, LEFT(Params, Len(Params)-1) AS Params From  @POST0022temp where Params is not null'
			EXEC (@sSQL)
			--PRINT (@sSQL)

		END
	IF @Mode = 0
		BEGIN
					DECLARE @Status TINYINT,
							@Status1 TINYINT,
							@Message NVARCHAR(1000),
							@Params Varchar(100),
							@DelDivisionID Varchar(50), 
							@DelShopID Varchar(50), 
							@DelTranMonth int, 
							@DelTranYear int, 
							@ID Varchar(50), 
							@DelAPK uniqueidentifier,
							@Closing tinyint,
							@Status2 int
					Declare @POST0022temp table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
					SELECT	@DelAPK = P.APK, @DelDivisionID = P.DivisionID, @DelShopID = P.ShopID, @ID=P.VoucherNo, @DelTranMonth= P.TranMonth, 
							@DelTranYear = P.TranYear, @Closing = Q.Closing ,@Status2= P.Status
					FROM POST0022 P inner join POST9999 Q on P.DivisionID = Q.DivisionID  and P.TranMonth=Q.TranMonth and P.TranYear=Q.TranYear
					Where P.APK = @APK and P.DeleteFlg = 0

					Exec POSP9000 @DelDivisionID, @DelShopID, @DelTranMonth, @DelTranYear, @ID, @DelAPK, @FormID, @Status  output
					
					-- Kiểm tra khác division
					IF @DelDivisionID != @DivisionID
						Begin
							SET @Message = '00ML000050' 
							SET	@Status1 = 2
							SET @Params = @ID
						End 
					-- Kiểm tra khác cửa hàng
					IF @DelShopID != @ShopID 
						Begin
							SET @Message = 'POSM000025'  
							SET	@Status1 = 2
							SET @Params = @ID
						End
					-- Kiểm tra phiếu đã được duyệt
					IF NOT EXISTS ( SELECT TOP 1 1 FROM WT0000 WITH (NOLOCK) WHERE IsAutoConfirmRequire = 1) AND @Status2 = 1 
					Begin
						SET @Message = '00ML000117'  
						SET	@Status1 = 2
						SET @Params = @ID
					End
					-- Kiểm tra khóa sổ
					IF @Closing = 1 
						Begin
							SET @Message = '00ML000051'  
							SET	@Status1 = 2
							SET @Params = @ID
						End
					-- Kiểm tra đã được sử dụng từ POSP9000
					IF (SELECT @Status) = 1
						Begin
							SET @Message = '00ML000052' 
							SET	@Status1 = 2
							SET @Params = @ID
						End	
					INSERT INTO @POST0022temp (	Status, MessageID, Params) 
					SELECT @Status1 as Status, @Message as MessageID, @Params as Params 			
					SELECT Status, MessageID,LEFT(Params, Len(Params)) AS Params From  @POST0022temp where Params is not null
		END
END


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
