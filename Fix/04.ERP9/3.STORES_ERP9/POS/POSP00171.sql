IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP00171]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP00171]
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
----<Created by>: Phan thanh hoang vu, Date: 14/04/2014
------------------Kết quả trả về: 
----------------------Status = 0 (Loại Message Info), Status = 1 (Loại Message Warning), Status = 0 (Loại Message Error)
----------------------MessageID: POSM000020 (Kiểm tra khác DivisionID), POSM000019 (Kiểm tra đã khóa sổ), POSM000003 (Kiểm tra đã sử dụng)
----------------------Params (Danh sách VoucherNo không xóa được)
------------------Store xử lý: Xóa danh sách một /nhiều @ID, và chỉ Sửa 1 @ID
----------------------Nếu Xóa thành công
----<Editted by>: Phan thanh hoang vu, Date: 21/04/2014
------------------Bổ sung: tham số Mode và APK
----------------------Nếu xóa thì truyền danh sách tham số sau @DivisionID, @ShopID, @APKList, @FormID = 'POSF0017', @Mode ='1' , @APK = null
----------------------Nếu sửa thì truyền danh sách tham số sau @DivisionID, @ShopID, @APKList = Null, @FormID = 'POSF0017', @Mode ='0' , @APK
----<Example>
------------------EXEC POSP00171 'AS', 'CH01', 'df3539d7-94a6-443c-ace6-05ca5a2b7377'',''eaf8cf6a-3b18-4ce9-b49f-efa71ae9073f', 'POSF0017', '1',null
------------------EXEC POSP00171 'AS', 'CH01', null, 'POSF0017', '0', '003e9d69-db4f-4166-bc64-7daf888a5ad1'


CREATE PROCEDURE POSP00171
		( @DivisionID varchar(50),--Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
		  @ShopID varchar(50),
		  @APKList NVARCHAR(MAX) = NULL,
		  @FormID nvarchar(50),			 --Truyền váo cho trường hợp xóa
		  @Mode tinyint,                 --1: Xóa, 0: Sửa  
		  @APK VARCHAR(50) = NULL        --Truyền váo cho trường hợp sửa
  
		) 
AS 
BEGIN
	DECLARE @sSQL NVARCHAR(MAX)
	IF @Mode = 1 
		BEGIN
		SET @sSQL = '
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
					Declare @POST0017temp table 
							(
								Status tinyint,
								MessageID varchar(100),
								Params varchar(4000)

							)

					SET @Status = 0
					SET @Message = ''''
					SET @ID = ''''
					Insert into @POST0017temp (	Status, MessageID, Params) 
									Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
									union all
									Select 2 as Status, ''POSM000025'' as MessageID, Null as Params
									union all
									Select 2 as Status, ''00ML000051'' as MessageID, Null as Params
									union all
									Select 2 as Status, ''00ML000052'' as MessageID, Null as Params
					SET @Cur = CURSOR SCROLL KEYSET FOR
					SELECT P.APK, P.DivisionID, P.ShopID, P.VoucherNo, P.TranMonth, P.TranYear, Q.Closing
					FROM POST0017 P inner join POST9999 Q on P.DivisionID = Q.DivisionID and P.TranMonth=Q.TranMonth and P.TranYear=Q.TranYear
					WHERE P.APK IN ('''+@APKList+''')

					OPEN @Cur
					FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelShopID, @DelVoucherNo, @DelTranMonth, @DelTranYear, @Closing 
					WHILE @@FETCH_STATUS = 0
					BEGIN
								Exec POSP9000 @DelDivisionID, @DelShopID, @DelTranMonth, @DelTranYear, @ID, @DelAPK, '''+@FormID+''', @Status  output
								IF @DelDivisionID != '''+@DivisionID+'''
									Begin
										SET @Message = @DelVoucherNo
										update @POST0017temp set Params = ISNULL(Params,'''') + @Message+'','' where MessageID = ''00ML000050''
									End
								ELSE IF @DelShopID != '''+@ShopID+'''
									Begin
										SET @Message = @DelVoucherNo
										update @POST0017temp set Params = ISNULL(Params,'''') + @Message+'','' where MessageID = ''POSM000025''
									End

								ELSE IF @Closing = 1 
									Begin
										SET @Message = @DelVoucherNo
										update @POST0017temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000051''
									End
								ELSE IF @Closing = 0 and (Select @Status) = 1
									Begin
										SET @Message = @DelVoucherNo
										update @POST0017temp set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000052''
									End
								ELSE IF @Closing = 0 and (Select @Status) = 0 and @DelDivisionID = '''+@DivisionID+''' and @DelShopID = '''+@ShopID+'''
												Begin
													UPDATE POST0017 SET DeleteFlg = 1 WHERE APK = @DelAPK			
													UPDATE POST00171 SET DeleteFlg = 1 WHERE APKMaster = @DelAPK			
													UPDATE POST9000 SET DeleteFlg = 1 WHERE APKMaster = @DelAPK			
												End

						FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelShopID, @DelVoucherNo, @DelTranMonth, @DelTranYear, @Closing 
					END
					CLOSE @Cur
					SELECT Status, MessageID, Params From  @POST0017temp where Params is not null'

		EXEC (@sSQL)
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
							@Closing tinyint
					Declare @POST0017temp table 
							(
								Status tinyint,
								MessageID varchar(100),
								Params varchar(4000)

							)
					SELECT	@DelAPK = P.APK, @DelDivisionID = P.DivisionID, @DelShopID = P.ShopID, @ID=P.VoucherNo, @DelTranMonth= P.TranMonth, 
							@DelTranYear = P.TranYear, @Closing = Q.Closing
					FROM POST0017 P inner join POST9999 Q on P.DivisionID = Q.DivisionID  and P.TranMonth=Q.TranMonth and P.TranYear=Q.TranYear
					Where P.APK = @APK and P.DeleteFlg = 0

					Exec POSP9000 @DelDivisionID, @DelShopID, @DelTranMonth, @DelTranYear, @ID, @DelAPK, @FormID, @Status  output
					
					IF @DelDivisionID != @DivisionID
						Begin
							SET @Message = '00ML000050' 
							SET	@Status1 = 2
							SET @Params = @ID
						End 
					IF @DelShopID != @ShopID
						Begin
							SET @Message = 'POSM000025' 
							SET	@Status1 = 2
							SET @Params = @ID
						End 

					IF @Closing = 1 
						Begin
							SET @Message = '00ML000051'  
							SET	@Status1 = 2
							SET @Params = @ID
						End
					IF @Closing = 0 and (Select @Status) = 1
						Begin
							SET @Message = '00ML000052' 
							SET	@Status1 = 2
							SET @Params = @ID
						End
					Insert into @POST0017temp (	Status, MessageID, Params) 
					Select	@Status1 as Status, @Message as MessageID, @Params as Params
					SELECT Status, MessageID, Params From  @POST0017temp where Params is not null
		END

END