IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0051]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP0051]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
----<Summary>
----Xóa nghiệp vụ số dư đầu kỳ hàng tồn kho
----<Param>
---- 
----<Return>
---- 
----<Reference>
----
----<History>
----<Created by>: Phan thanh hoang vu, Date: 05/08/2014
------------------Kết quả trả về: 
----------------------Status = 0 (Loại Message Info), Status = 1 (Loại Message Warning), Status = 2 (Loại Message Error)
----------------------MessageID: 00ML000050 (Kiểm tra khác DivisionID), 00ML000051 (Kiểm tra đã khóa sổ), POSM000025 (Kiểm tra khác ShopID)
----------------------Params (Danh sách VoucherNo không xóa được)
------------------Store xử lý: 
----------------------Nếu xóa thì dùng tham số: @DivisionID, @ShopID, @APKList, @Mode ='1' , @APK = null
----------------------Nếu sửa thì dùng tham số: @DivisionID, @ShopID, @APKList = Null, @Mode ='0' , @APK
----<Example>
------------------EXEC POSP0051 'PL', 'DVPHL001', '64DC1CCD-98C1-4896-8FB8-E3A7FE07E5B8'',''216E2F6E-58DF-4B6C-93DC-137DD9C18850', 1, null, 1,2013
------------------EXEC POSP0051 'KC', 'PHUCLONG', null, '0', '216E2F6E-58DF-4B6C-93DC-137DD9C18850'

CREATE PROCEDURE POSP0051
		( @DivisionID varchar(50),		 --Trường hợp @DivisionID đúng với DivisionID của biến môi trường thì cho xóa
		  @ShopID varchar(50),			 --Trường hợp @ShopID đúng với DivisionID của biến môi trường thì cho xóa
		  @APKList NVARCHAR(MAX) = NULL, --Xóa 1 record hay Xóa danh sách nhiều record
		  @Mode tinyint,                 --1: Xóa, 0: Sửa  
		  @APK VARCHAR(50) = NULL,       --Sửa 1 record hay sửa 1 APK
		  @TranMonth int,				 --Truyền biến môi trường
		  @TranYear int					 --Truyền biến môi trường
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
							@DelAPK  uniqueidentifier,
							@DelShopID VARCHAR(50),
							@DelDivisionID VARCHAR(50),
							@DelVoucherNo VARCHAR(50),
							@DelTranMonth int,
							@DelTranYear int,
							@Closing int
					Declare @POSP0051 table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
					SET @Status = 0
					SET @Message = ''''
					Insert into @POSP0051 (	Status, MessageID, Params) 
								Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''POSM000025'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''00ML000051'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''00ML000079'' as MessageID, Null as Params
											
					SET @Cur = CURSOR SCROLL KEYSET FOR
					SELECT P.APK, P.DivisionID, P.ShopID, P.VoucherNo, Q.TranMonth, Q.TranYear, Q.Closing
					FROM POST0038 P inner join POST9999 Q on P.DivisionID = Q.DivisionID and P.TranMonth=Q.TranMonth and P.TranYear=Q.TranYear
					WHERE P.APK IN ('''+@APKList+''') and P.DeleteFlg = 0
					OPEN @Cur
					FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelShopID, @DelVoucherNo, @DelTranMonth, @DelTranYear, @Closing 
					WHILE @@FETCH_STATUS = 0
					BEGIN
								IF @DelDivisionID != '''+@DivisionID+'''
									Begin
										SET @Message = @DelVoucherNo
										update @POSP0051 set Params = ISNULL(Params,'''') + @Message+'','' where MessageID = ''00ML000050''
									End
								ELSE IF @DelShopID != '''+@ShopID+'''
									Begin
										SET @Message = @DelVoucherNo
										update @POSP0051 set Params = ISNULL(Params,'''') + @Message+'','' where MessageID = ''POSM000025''
									End
								ELSE IF @Closing = 1 
									Begin
										SET @Message = @DelVoucherNo
										update @POSP0051 set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000051''
									End
								ELSE IF (@DelTranMonth != '+Convert(nvarchar,@TranMonth)+' and @DelTranYear != '+Convert(nvarchar,@TranYear)+')
										or (@DelTranMonth = '+Convert(nvarchar,@TranMonth)+' and @DelTranYear != '+Convert(nvarchar,@TranYear)+')
										or (@DelTranMonth != '+Convert(nvarchar,@TranMonth)+' and @DelTranYear = '+Convert(nvarchar,@TranYear)+')
									Begin
										SET @Message = @DelVoucherNo
										update @POSP0051 set Params = ISNULL(Params,'''') + @Message+'','' where MessageID = ''00ML000079''
									End
								ELSE IF @Closing = 0 and @DelDivisionID = '''+@DivisionID+''' and @DelShopID = '''+@ShopID+'''
									 and @DelTranMonth = '''+Convert(nvarchar,@TranMonth)+''' and @DelTranYear = '''+Convert(nvarchar,@TranYear)+'''
									Begin
										UPDATE POST0038 SET DeleteFlg = 1 WHERE APK = @DelAPK			
										UPDATE POST0039 SET DeleteFlg = 1 WHERE APKMaster = @DelAPK			
										UPDATE POST9000 SET DeleteFlg = 1 WHERE APKMaster = @DelAPK			
									End
												
						FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelShopID, @DelVoucherNo, @DelTranMonth, @DelTranYear, @Closing 
					END
					CLOSE @Cur
					SELECT Status, MessageID, Params From  @POSP0051 where Params is not null'
					
		EXEC (@sSQL)
		
		
	END
	IF @Mode = 0
		BEGIN
					DECLARE @Status TINYINT,
							@Message NVARCHAR(1000),
							@Params Varchar(100),
							@DelDivisionID Varchar(50), 
							@DelShopID Varchar(50), 
							@DelTranMonth int, 
							@DelTranYear int, 
							@ID Varchar(50), 
							@DelAPK uniqueidentifier,
							@Closing tinyint
					Declare @POSP0051 table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
					SELECT	@DelAPK = P.APK, @DelDivisionID = P.DivisionID, @DelShopID = P.ShopID, @ID=P.VoucherNo, @DelTranMonth= Q.TranMonth, 
							@DelTranYear = P.TranYear, @Closing = Q.Closing
					FROM POST0038 P inner join POST9999 Q on P.DivisionID = Q.DivisionID  and P.TranMonth=Q.TranMonth and P.TranYear=Q.TranYear
					Where P.APK = @APK and P.DeleteFlg = 0
					
					IF @DelDivisionID != @DivisionID
						Begin
							SET @Message = '00ML000050' 
							SET	@Status = 2
							SET @Params = @ID
						End 
					IF @DelShopID != @ShopID
						Begin
							SET @Message = 'POSM000025' 
							SET	@Status = 2
							SET @Params = @ID
						End 
					IF @Closing = 1 
						Begin
							SET @Message = '00ML000051'  
							SET	@Status = 2
							SET @Params = @ID
						End
					IF @DelTranMonth != @TranMonth and @DelTranYear != @TranYear
						Begin
							SET @Message = '00ML000079'  
							SET	@Status = 2
							SET @Params = @ID
						End
					Insert into @POSP0051 (	Status, MessageID, Params) 
					Select	@Status as Status, @Message as MessageID, @Params as Params
					SELECT Status, MessageID, Params From  @POSP0051 where Params is not null
		END
END