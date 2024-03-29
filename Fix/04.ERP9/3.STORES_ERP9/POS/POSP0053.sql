IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0053]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP0053]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
----<Summary>
----Kiểm tra xóa và sửa dữ liệu trên lưới form POSF0056
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
------------------EXEC POSP0053 'KC', 'PHUCLONG', 'd832acf2-b78f-460e-8ad9-008c92909eb1'',''5e02c89e-47e0-472a-b15f-00f8179d5a7e','1',null, '5e02c89e-47e0-472a-b15f-00f8179d5a7e', 1, 2013
------------------


CREATE PROCEDURE POSP0053
		( @DivisionID varchar(50),		 --Trường hợp @DivisionID đúng với DivisionID của biến môi trường thì cho xóa
		  @ShopID varchar(50),			 --Trường hợp @ShopID đúng với DivisionID của biến môi trường thì cho xóa
		  @APKDetailList NVARCHAR(MAX) = NULL, --Xóa 1 record hay Xóa danh sách nhiều record
		  @Mode tinyint,                 --1: Xóa, 0: Sửa  
		  @APKDetail Varchar(50),		 
		  @APKMaster Varchar(50),
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
							@DelInventoryID VARCHAR(50),
							@DelTranMonth int,
							@DelTranYear int,
							@Closing int
					Declare @POSP0053 table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
					SET @Status = 0
					SET @Message = ''''
					Insert into @POSP0053 (	Status, MessageID, Params) 
								Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''POSM000025'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''00ML000051'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''00ML000079'' as MessageID, Null as Params			
					SET @Cur = CURSOR SCROLL KEYSET FOR
					SELECT D.APK, D.DivisionID, D.ShopID, D.InventoryID, Q.TranMonth, Q.TranYear, Q.Closing
					FROM POST0038 M inner join POST0039 D on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
									inner join POST9999 Q on M.DivisionID = Q.DivisionID and M.TranMonth=Q.TranMonth and M.TranYear=Q.TranYear
					WHERE D.APK IN ('''+@APKDetailList+''') and M.APK = '''+ @APKMaster +'''and M.DeleteFlg = 0
					OPEN @Cur
					FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelShopID, @DelInventoryID, @DelTranMonth, @DelTranYear, @Closing 
					WHILE @@FETCH_STATUS = 0
					BEGIN
								IF @DelDivisionID != '''+@DivisionID+'''
									Begin
										SET @Message = @DelInventoryID
										update @POSP0053 set Params = ISNULL(Params,'''') + @Message+'','' where MessageID = ''00ML000050''
									End
								ELSE IF @DelShopID != '''+@ShopID+'''
									Begin
										SET @Message = @DelInventoryID
										update @POSP0053 set Params = ISNULL(Params,'''') + @Message+'','' where MessageID = ''POSM000025''
									End
								ELSE IF @Closing = 1 
									Begin
										SET @Message = @DelInventoryID
										update @POSP0053 set Params = ISNULL(Params,'''') + @Message+'', '' where MessageID = ''00ML000051''
									End
								ELSE IF (@DelTranMonth != '''+Convert(nvarchar,@TranMonth)+''' and @DelTranYear != '''+Convert(nvarchar,@TranYear)+''')
									   or (@DelTranMonth = '''+Convert(nvarchar,@TranMonth)+''' and @DelTranYear != '''+Convert(nvarchar,@TranYear)+''')
									    or (@DelTranMonth != '''+Convert(nvarchar,@TranMonth)+''' and @DelTranYear = '''+Convert(nvarchar,@TranYear)+''')
									Begin
										SET @Message = @DelInventoryID
										update @POSP0053 set Params = ISNULL(Params,'''') + @Message+'','' where MessageID = ''00ML000079''
									End
								ELSE IF @Closing = 0 and @DelDivisionID = '''+@DivisionID+''' and @DelShopID = '''+@ShopID+'''
									 and @DelTranMonth = '''+Convert(nvarchar,@TranMonth)+''' and @DelTranYear = '''+Convert(nvarchar,@TranYear)+'''
												Begin
													UPDATE POST0039 SET DeleteFlg = 1 WHERE APK = @DelAPK			
													UPDATE POST9000 SET DeleteFlg = 1 WHERE APK = @DelAPK			
												End
						FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelShopID, @DelInventoryID, @DelTranMonth, @DelTranYear, @Closing 
					END
					CLOSE @Cur
					SELECT Status, MessageID, Params From  @POSP0053 where Params is not null'
					
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
					Declare @POSP0053 table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
					SELECT	@DelAPK = D.APK, @DelDivisionID = D.DivisionID, @DelShopID = D.ShopID, @ID=D.InventoryID, @DelTranMonth= Q.TranMonth, 
							@DelTranYear = M.TranYear, @Closing = Q.Closing
					FROM POST0038 M inner join POST0039 D on M.APK = D.APKMaster and M.DeleteFlg = D.DeleteFlg
									inner join POST9999 Q on M.DivisionID = Q.DivisionID  and M.TranMonth=Q.TranMonth and M.TranYear=Q.TranYear
					Where D.APK = @APKDetail and D.APKMaster = @APKMaster and D.DeleteFlg = 0
					
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
					Insert into @POSP0053 (	Status, MessageID, Params) 
					Select	@Status as Status, @Message as MessageID, @Params as Params
					SELECT Status, MessageID, Params From  @POSP0053 where Params is not null
		END
END