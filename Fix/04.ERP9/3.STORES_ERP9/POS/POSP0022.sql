IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0022]') 
													AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP0022]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		MaiVu
-- Create date: 18/04/2014
-- Description:	Thực hiện xóa Phiếu Xuất
--				- Nếu thỏa thỏa điều kiện thì cho phép xóa, ngược lại thì báo Message
--				- Không xóa trực tiếp, chỉ đổi trạng thái DeleteFlg từ 0 sang 1
-- EXAMPLE: 
-- EXEC POSP0022 'AS', 'CH01', '91AC23AA-8356-4EBD-A8C8-0903961C2382'',''E41D60FE-0EAC-43F8-B9D9-43DC4ABCFDB1', 'POSF0022'
-- =============================================
CREATE PROCEDURE [dbo].[POSP0022]
	( @DivisionID varchar(50),--Trường hợp @DelDivisionID đúng với @DivisionID đăng nhập thì cho xóa
	  @ShopID varchar(50),
	  @APKList NVARCHAR(MAX) = NULL,
	  @FormID nvarchar(50)  
	) 
AS  DECLARE @Status TINYINT,
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
	 DECLARE @POST0022temp table (Status int,
								  Closing int,
						          Message nvarchar(Max)
									)
SET @Status = 0
SET @Message = ''
SET @ID = ''
Insert into @POST0022temp (	status, Closing, Message) 
							Select 0 as status, 1 as Closing, Null as Message
							union all
							Select 1 as status, 0 as Closing, Null as Message	
SET @Cur = CURSOR SCROLL KEYSET FOR			
				SELECT P.APK, P.DivisionID, P.ShopID, P.VoucherNo, P.TranMonth, P.TranYear, Q.Closing
				FROM POST0022 P inner join POST9999 Q on P.DivisionID = Q.DivisionID and P.TranMonth=Q.TranMonth and P.TranYear=Q.TranYear
				WHERE P.APK IN (@APKList)
OPEN @Cur
		FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelShopID, @DelVoucherNo, @DelTranMonth, @DelTranYear, @Closing 
		WHILE @@FETCH_STATUS = 0
		BEGIN
		Exec POSP9000 @DelDivisionID, @DelShopID, @DelTranMonth, @DelTranYear, @ID, @DelAPK, @FormID, @Status  output
		IF @Closing = 1 
			Begin
			SET @Message = @DelVoucherNo
			update @POST0022temp set Message = ISNULL(Message,'') + @Message+',' where Closing = 1
			End
		ELSE IF @Closing = 0 and (Select @Status) = 1
			Begin
			SET @Message = @DelVoucherNo
			update @POST0022temp set Message = ISNULL(Message,'')+@Message+',' Where Closing = 0 and Status = 1
			End
		ELSE IF @Closing = 0 and (Select @Status) = 0 and @DelDivisionID = @DivisionID and  @DelShopID = @ShopID
			Begin
			UPDATE POST0022 SET DeleteFlg = 1 WHERE APK = @DelAPK			
			UPDATE POST0023 SET DeleteFlg = 1 WHERE APKMaster = @DelAPK			
			UPDATE POST9000 SET DeleteFlg = 1 WHERE APKMaster = @DelAPK			
			End		
		FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelShopID, @DelVoucherNo, @DelTranMonth, @DelTranYear, @Closing 
		END
CLOSE @Cur
SELECT Status, Closing, Message From  @POST0022temp 
GO
