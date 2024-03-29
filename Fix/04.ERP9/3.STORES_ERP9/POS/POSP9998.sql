IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP9998]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP9998]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
----Do POS-CLOUD ẩn màn hình khóa sổ và mở sổ kỳ kế toán nên sử dụng Store này để sinh kỳ tự động-> Giống khóa sổ module POS
----
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---- Create on 02/02/2017 by Hoang Vu
---- 
-- <Example>
---- EXEC POSP9998 'AS', '2017-05-15 00:00:00.000', 1, 'hoangvu002'

CREATE PROCEDURE POSP9998
(
	@DivisionID VARCHAR(50),
	@VoucherDate DATETIME,
	@Mode int, --1: Thêm; 0: Sửa nghiệp vụ theo pos-cloud
	@UserID VARCHAR(50)
)
AS
BEGIN
		DECLARE @StrDivisionID varchar(50),
				@StrTranMonth int,
				@StrTranYear int,
				@StrBeginDate varchar(50),
				@StrEndDate varchar(50),
				@BeginVoucherDate Datetime
		Set @StrDivisionID = @DivisionID
		Set @StrTranMonth = Month(@VoucherDate)
		Set @StrTranYear = Year(@VoucherDate)
		Set @StrBeginDate = LTRIM(RTRIM(STR(@StrTranMonth)))+'/01/'+LTRIM(RTRIM(STR(@StrTranYear)))
		Set @StrEndDate = DATEADD(DAY, -1, DATEADD(MONTH, 1, LTRIM(RTRIM(STR(@StrTranMonth))) + '/01/' + LTRIM(RTRIM(STR(@StrTranYear)))))
		Set @BeginVoucherDate = (Select M.BeginDate
								 from POST9999 M inner join AT1101 D on M.DivisionID = D.DivisionID and M.TranYear = D.BeginYear and M.Tranmonth = D.Beginmonth
								 Where M.DivisionID = @StrDivisionID)
		IF @Mode = 1 --Thêm nghiệp vụ
		Begin
			IF @VoucherDate >= @BeginVoucherDate
			Begin
				--Check kiểm tra lấy tháng và năm của ngày chứng từ nhập liệu chưa có trong bảng quản lý kỳ thì khi Lưu se tự động bắn kỳ xuống
				IF NOT EXISTS (SELECT TOP 1 1 FROM POST9999 WHERE DivisionID = @StrDivisionID and TranYear = @StrTranYear and TranMonth = @StrTranMonth)
					INSERT  POST9999  (DivisionID, TranMonth, TranYear, [Disabled],  BeginDate, EndDate )
					SELECT @StrDivisionID, @StrTranMonth, @StrTranYear, 0, @StrBeginDate, @StrEndDate
			End
			--Thiết lập kỳ mặt định là kỳ cũa ngày chứng từ vừa 
			IF NOT EXISTS (SELECT  TOP 1 1 FROM POST0000 WHERE DivisionID = @StrDivisionID)
				INSERT  POST0000  (DivisionID, TranMonth, TranYear, PageSize, IsNegativeStock, IsPosCloud)
				Select @StrDivisionID, @StrTranMonth, @StrTranYear, 2, 1, 1
			Else
				Update POST0000 Set PageSize = 2, IsPosCloud = 1 Where DivisionID = @StrDivisionID

		End

		IF @Mode = 0 --Sửa nghiệp vụ
		Begin
			IF @VoucherDate >= @BeginVoucherDate
			Begin
				--Check kiểm tra lấy tháng và năm của ngày chứng từ nhập liệu chưa có trong bảng quản lý kỳ thì khi Lưu se tự động bắn kỳ xuống
				IF NOT EXISTS (SELECT TOP 1 1 FROM POST9999 WHERE DivisionID = @StrDivisionID and TranYear = @StrTranYear and TranMonth = @StrTranMonth)
					INSERT  POST9999  (DivisionID, TranMonth, TranYear, [Disabled],  BeginDate, EndDate )
					SELECT @StrDivisionID, @StrTranMonth, @StrTranYear, 0, @StrBeginDate, @StrEndDate
			End
			--Check kiểm tra lấy tháng và năm của ngày chứng từ nhập liệu chưa có trong bảng quản lý kỳ thì khi Lưu se tự động bắn kỳ xuống
			IF EXISTS (SELECT TOP 1 1 FROM POST9999 WHERE DivisionID = @StrDivisionID and TranYear = @StrTranYear and TranMonth = @StrTranMonth)
			Update  POST9999  Set Closing = 0 WHERE DivisionID = @StrDivisionID and TranYear = @StrTranYear and TranMonth = @StrTranMonth

			--Thiết lập kỳ mặt định là kỳ cũa ngày chứng từ vừa 
			IF NOT EXISTS (SELECT  TOP 1 1 FROM POST0000 WHERE DivisionID = @StrDivisionID)
				INSERT  POST0000  (DivisionID, TranMonth, TranYear, PageSize, IsNegativeStock, IsPosCloud)
				Select @StrDivisionID, @StrTranMonth, @StrTranYear, 2, 1, 1
			Else
				Update POST0000 Set PageSize = 2, IsPosCloud = 1 Where DivisionID = @StrDivisionID
		End
		
		Select @StrDivisionID as DivisionID, @StrTranYear as TranYear, @StrTranMonth as TranMonth
END
