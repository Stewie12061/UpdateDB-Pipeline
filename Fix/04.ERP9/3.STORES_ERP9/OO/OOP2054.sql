IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[OOP2054]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[OOP2054]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- <Summary>
---- Xét duyệt đơn 
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Quốc Tuấn, Date: 09/12/2015
----Modified by Bảo Thy on 05/07/2016: bỏ Insert bảng phân ca where theo kỳ
--- Modify on 23/07/2018 by Bảo Anh: Bổ sung các cột D32, D33 cho bảng phân ca
--- Modify on 03/01/2019 by Bảo Anh: Bổ sung biến @APKDetail
--- Modify on 07/05/2020 by Tuấn Anh: Bổ sung trường hợp Trạng thái là Bỏ duyệt(Status = 2) => Xóa bảng phân ca
--- Modify on 10/05/2020 by Văn Tài : Bổ sung lấy top 1 thẻ vân tay từ HT1407 theo thời gian kết thúc lớn nhất.
--- Modify on 05/10/2022 by Xuân Nguyên : Bổ sung update bảng phân ca khi duyệt nhiều đợt
--- Modify on 18/10/2022 by Nhật Thanh : Thay đổi vị trí End vì sai logic
--- Modify on 05/11/2022 by Văn Tài	   : Xử lý trường hợp 1 Cấp duyệt hoặc nhiều cấp duyệt cùng 1 người duyệt.
--- Modify on 11/09/2023 by Kiều Nga   : [2023/09/IS/0036] Fix lỗi làm đơn xin bổ sung quẹt thẻ nhưng không quét lên dữ liệu bất thường (lấy TranMonth, TranYear theo thời gian bổ sung quẹt thẻ)
/*-- <Example>
	OOP2054 @DivisionID='NTY',@UserID='ASOFTADMIN',@TranMonth=7,@TranYear=2018,@APKMaster='CD9AB8B7-DCF9-442E-A0C8-9A7F069E45C9',
	@Type='DXLTG',@Status=1
----*/


CREATE PROCEDURE OOP2054
( 
  @DivisionID VARCHAR(50),
  @UserID VARCHAR(50),
  @TranMonth INT,
  @TranYear INT,
  @APKMaster VARCHAR(50),
  @Type VARCHAR(50),
  @Status TINYINT, --- 1 là chấp nhận; 2 là từ chối
  @APKDetail VARCHAR(50)
) 
AS 
DECLARE @sSQL NVARCHAR(MAX)='',
@Cur CURSOR, @EmployeeID NVARCHAR(50),
@D01 VARCHAR(50),
@D02 VARCHAR(50),
@D03 VARCHAR(50),
@D04 VARCHAR(50),
@D05 VARCHAR(50),
@D06 VARCHAR(50),
@D07 VARCHAR(50),
@D08 VARCHAR(50),
@D09 VARCHAR(50),
@D10 VARCHAR(50),
@D11 VARCHAR(50),
@D12 VARCHAR(50),
@D13 VARCHAR(50),
@D14 VARCHAR(50),
@D15 VARCHAR(50),
@D16 VARCHAR(50),
@D17 VARCHAR(50),
@D18 VARCHAR(50),
@D19 VARCHAR(50),
@D20 VARCHAR(50),
@D21 VARCHAR(50),
@D22 VARCHAR(50),
@D23 VARCHAR(50),
@D24 VARCHAR(50),
@D25 VARCHAR(50),
@D26 VARCHAR(50),
@D27 VARCHAR(50),
@D28 VARCHAR(50),
@D29 VARCHAR(50),
@D30 VARCHAR(50),
@D31 VARCHAR(50),
@D32 VARCHAR(50),
@D33 VARCHAR(50)

IF @Status =1 
BEGIN
	 IF @Type='DXP'--Đơn xin phép
		EXEC OOP2062 @DivisionID,@UserID,@TranMonth,@TranYear,@APKMaster,@Status,@APKDetail

	 IF @Type='DXRN' -- Đơn xin phép ra ngoài
	 BEGIN
	 	EXEC OOP2059 @DivisionID,@UserID,@TranMonth,@TranYear,@APKMaster,@Status
	 END
	 IF @Type ='DXBSQT' -- Đơn xin bổ sung quẹt thẻ
	 BEGIN
	 		--Bổ sung quẹt thẻ
	 	INSERT INTO HT2408_MK (APK,APKMaster,DivisionID, EmployeeID, TranMonth, TranYear,
	 	            AbsentCardNo, AbsentDate, AbsentTime, CreateUserID, CreateDate,
	 	            LastModifyUserID, LastModifyDate, IOCode,EditType)
	 	 SELECT	OT40.APK
				, OT40.APKMaster
				, OT40.DivisionID
				, OT40.EmployeeID
				,MONTH(OT40.Date) TranMonth
				,YEAR(OT40.Date) TranYear,
				 (SELECT TOP 1 AbsentCardNo 
					FROM HT1407 HT17 WITH (NOLOCK) 
					WHERE HT17.DivisionID = OT40.DivisionID AND HT17.EmployeeID = OT40.EmployeeID
					ORDER BY EndDate DESC
				 )
				, CONVERT(DATE,OT40.Date) AbsentDate
				, CONVERT(TIME(0),OT40.Date,0) AbsentTime
				, OT90.CreateUserID
				, OT90.CreateDate
				, @UserID
				, GETDATE()
				, ISNULL(InOut, 0)
				, ISNULL(OT40.EditType, 0)
	 	 FROM OOT2040 OT40 WITH (NOLOCK)
	 	 INNER JOIN OOT9000 OT90 WITH (NOLOCK) ON OT90.DivisionID = OT40.DivisionID AND OT90.APK = OT40.APKMaster
	 	 LEFT JOIN HT2408_MK HT28 WITH (NOLOCK) ON HT28.DivisionID = OT40.DivisionID AND HT28.APK = OT40.APK AND HT28.APKMaster = OT40.APKMaster AND HT28.IOCode=OT40.InOut
	 	 WHERE OT40.DivisionID = @DivisionID 
		 AND OT40.APKMaster = @APKMaster
		 AND OT40.APK = @APKDetail
		 AND ISNULL(OT40.Status,0)=1
		 AND HT28.APK IS NULL
	END
	IF @Type ='DXLTG' -- Đơn xin làm thêm giờ
	BEGIN
		EXEC OOP2056 @DivisionID,@UserID,@TranMonth,@TranYear,@APKMaster,@Status,@APKDetail
	END 
	IF @Type ='BPC' -- Bảng phân ca
	BEGIN
		print 'TEST'
			SET @Cur = CURSOR SCROLL KEYSET FOR
		select OT90.TranMonth, OT90.TranYear, OOT00.EmployeeID,
		HT25.D01, HT25.D02, HT25.D03, HT25.D04, HT25.D05, HT25.D06, HT25.D07, HT25.D08,  HT25.D09,  HT25.D10,
		HT25.D11, HT25.D12, HT25.D13, HT25.D14, HT25.D15, HT25.D16,  HT25.D17, HT25.D18, HT25.D19,HT25.D20,
		HT25.D21, HT25.D22, HT25.D23, HT25.D24,HT25.D25,HT25.D26, HT25.D27, HT25.D28,   HT25.D29, HT25.D30,
		 HT25.D31, HT25.D32, HT25.D33
			 FROM OOT2000 OOT00 WITH (NOLOCK)
				INNER JOIN OOT9000 OT90 WITH (NOLOCK) ON OT90.DivisionID = OOT00.DivisionID AND OT90.APK = OOT00.APKMaster
				LEFT JOIN HT1025 HT25 WITH (NOLOCK) ON HT25.DivisionID = OT90.DivisionID AND HT25.EmployeeID = OOT00.EmployeeID 
				AND HT25.TranMonth = OT90.TranMonth AND HT25.TranYear = OT90.TranYear
				WHERE OOT00.DivisionID=@DivisionID
				 AND OT90.APK=@APKMaster
OPEN @Cur
FETCH NEXT FROM @Cur INTO @TranMonth, @TranYear, @EmployeeID,@D01, @D02, @D03, @D04, @D05, @D06, @D07, @D08,  @D09,  @D10,
		@D11, @D12, @D13, @D14, @D15, @D16,  @D17, @D18, @D19,@D20,
		@D21, @D22, @D23, @D24,@D25,@D26, @D27, @D28,   @D29, @D30,
		 @D31, @D32, @D33
WHILE @@FETCH_STATUS = 0
BEGIN
			if EXISTS( select TOP 1 1 FROM HT1025 HT25 WITH (NOLOCK)
		WHERE HT25.DivisionID=@DivisionID
				 AND HT25.TranMonth=@TranMonth
				 AND HT25.TranYear=@TranYear
				 AND HT25.EmployeeID = @EmployeeID)
			begin
			print 'Da vao Update'
			--select * FROM OOT2000 OOT00 WITH (NOLOCK)
			--	INNER JOIN OOT9000 OT90 WITH (NOLOCK) ON OT90.DivisionID = OOT00.DivisionID AND OT90.APK = OOT00.APKMaster
			--	LEFT JOIN HT1025 HT25 WITH (NOLOCK) ON HT25.DivisionID = OT90.DivisionID AND HT25.EmployeeID = OOT00.EmployeeID 
			--	AND HT25.TranMonth = OT90.TranMonth AND HT25.TranYear = OT90.TranYear
			--	WHERE OOT00.DivisionID=@DivisionID
		 --AND OT90.TranMonth=@TranMonth
		 --AND OT90.TranYear=@TranYear
		 --AND OT90.APK=@APKMaster
		 print @EmployeeID
		 print @TranMonth
				Update HT1025 SET 
			D01 = ISNULL(NULLIF(OOT00.D01,''),@D01),D02 = ISNULL(NULLIF(OOT00.D02,''),@D02),D03 = ISNULL(NULLIF(OOT00.D03,''),@D03),
			D04 = ISNULL(NULLIF(OOT00.D04,''),@D04),D05 = ISNULL(NULLIF(OOT00.D05,''),@D05),D06 = ISNULL(NULLIF(OOT00.D06,''),@D06),
			D07 = ISNULL(NULLIF(OOT00.D07,''),@D07),D08 = ISNULL(NULLIF(OOT00.D08,''),@D08),D09 = ISNULL(NULLIF(OOT00.D09,''),@D09),
			D10 = ISNULL(NULLIF(OOT00.D10,''),@D10),D11 = ISNULL(NULLIF(OOT00.D11,''),@D11),D12 = ISNULL(NULLIF(OOT00.D12,''),@D12),
			D13 = ISNULL(NULLIF(OOT00.D13,''),@D13),D14 = ISNULL(NULLIF(OOT00.D14,''),@D14),D15 = ISNULL(NULLIF(OOT00.D15,''),@D15),
			D16 = ISNULL(NULLIF(OOT00.D16,''),@D16),D17 = ISNULL(NULLIF(OOT00.D17,''),@D17),D18 = ISNULL(NULLIF(OOT00.D18,''),@D18),
			D19 = ISNULL(NULLIF(OOT00.D19,''),@D19),D20 = ISNULL(NULLIF(OOT00.D20,''),@D20),D21 = ISNULL(NULLIF(OOT00.D21,''),@D21),
			D22 = ISNULL(NULLIF(OOT00.D22,''),@D22),D23 = ISNULL(NULLIF(OOT00.D23,''),@D23),D24 = ISNULL(NULLIF(OOT00.D24,''),@D24),
			D25 = ISNULL(NULLIF(OOT00.D25,''),@D25),D26 = ISNULL(NULLIF(OOT00.D26,''),@D26),D27 = ISNULL(NULLIF(OOT00.D27,''),@D27),
			D28 = ISNULL(NULLIF(OOT00.D28,''),@D28),D29 = ISNULL(NULLIF(OOT00.D29,''),@D29),D30 = ISNULL(NULLIF(OOT00.D30,''),@D30),
			D31 = ISNULL(NULLIF(OOT00.D31,''),@D31),D32 = ISNULL(NULLIF(OOT00.D32,''),@D32),D33 = ISNULL(NULLIF(OOT00.D33,''),@D33),
			Notes = OOT00.Note
		FROM OOT2000 OOT00 WITH (NOLOCK)
				INNER JOIN OOT9000 OT90 WITH (NOLOCK) ON OT90.DivisionID = OOT00.DivisionID AND OT90.APK = OOT00.APKMaster
				LEFT JOIN HT1025 HT25 WITH (NOLOCK) ON HT25.DivisionID = OT90.DivisionID AND HT25.EmployeeID = OOT00.EmployeeID 
				AND HT25.TranMonth = OT90.TranMonth AND HT25.TranYear = OT90.TranYear
				WHERE OOT00.DivisionID=@DivisionID
		 AND OT90.TranMonth=@TranMonth
		 AND OT90.TranYear=@TranYear
		  AND HT25.EmployeeID=@EmployeeID
		 AND OT90.APK=@APKMaster
		 end
		  ELSE
			BEGIN
			print'Vao insert'
				-- xử lý đẩy ca xuống
				INSERT INTO HT1025(APK, DivisionID, TransactionID, EmployeeID, TranMonth,
				            TranYear, D01, D02, D03, D04, D05, D06, D07, D08, D09, D10,
				            D11, D12, D13, D14, D15, D16, D17, D18, D19, D20, D21, D22,
				            D23, D24, D25, D26, D27, D28, D29, D30, D31, D32, D33, Notes,
				            CreateUserID, CreateDate, LastModifyUserID, LastModifyDate)
				SELECT OOT00.APK,OOT00.DivisionID, OOT00.APK, OOT00.EmployeeID,OT90.TranMonth,
					   OT90.TranYear,OOT00.D01, OOT00.D02, OOT00.D03, OOT00.D04, OOT00.D05,
					   OOT00.D06, OOT00.D07, OOT00.D08, OOT00.D09, OOT00.D10, OOT00.D11,
					   OOT00.D12, OOT00.D13, OOT00.D14, OOT00.D15, OOT00.D16, OOT00.D17,
					   OOT00.D18, OOT00.D19, OOT00.D20, OOT00.D21, OOT00.D22, OOT00.D23,
					   OOT00.D24, OOT00.D25, OOT00.D26, OOT00.D27, OOT00.D28, OOT00.D29,
					   OOT00.D30, OOT00.D31, OOT00.D32, OOT00.D33, OOT00.Note,OT90.CreateUserID,OT90.CreateDate,
					   @UserID,GETDATE()
				FROM OOT2000 OOT00 WITH (NOLOCK)
				INNER JOIN OOT9000 OT90 WITH (NOLOCK) ON OT90.DivisionID = OOT00.DivisionID AND OT90.APK = OOT00.APKMaster
				LEFT JOIN HT1025 HT25 WITH (NOLOCK) ON HT25.DivisionID = OT90.DivisionID AND HT25.EmployeeID = OOT00.EmployeeID 
				AND HT25.TranMonth = OT90.TranMonth AND HT25.TranYear = OT90.TranYear
				WHERE OOT00.DivisionID=@DivisionID
				 --AND OT90.TranMonth=@TranMonth
				 --AND OT90.TranYear=@TranYear
				 AND OT90.APK=@APKMaster
				 AND ISNULL(OOT00.Status,0)=1
				 AND HT25.APK IS NULL
			END

	FETCH NEXT FROM @Cur INTO @TranMonth, @TranYear, @EmployeeID,@D01, @D02, @D03, @D04, @D05, @D06, @D07, @D08,  @D09,  @D10,
		@D11, @D12, @D13, @D14, @D15, @D16,  @D17, @D18, @D19,@D20,
		@D21, @D22, @D23, @D24,@D25,@D26, @D27, @D28,   @D29, @D30,
		 @D31, @D32, @D33
	
END
CLOSE @Cur

		
	END 
	IF @Type ='DXDC' -- Đơn xin đổi ca
	BEGIN
		EXEC OOP2057 @DivisionID, @UserID, @TranMonth, @TranYear, @APKMaster, @Status, @APKDetail
	END
END
ELSE
BEGIN
	--Đơn xin phép
	IF @Type ='DXP'
	BEGIN
		DELETE HT24
	 	FROM HT2401_MK HT24
		INNER JOIN OOT2010 OOT20 WITH (NOLOCK) ON OOT20.DivisionID = HT24.DivisionID AND OOT20.APKMaster = HT24.APKMaster AND OOT20.APK = HT24.APKDetail
	 		AND OOT20.APKMaster =@APKMaster AND OOT20.APK = @APKDetail
			--AND ISNULL(OOT20.Status,0)=0		

		--- 1 Cấp duyệt hoặc nhiều cấp duyệt cùng 1 người duyệt.
		IF EXISTS
			(
				SELECT TOP 1 1
				FROM OOT9001 WITH (NOLOCK) 
				WHERE DivisionID = @DivisionID AND APKMaster = @APKMaster
				HAVING COUNT(DISTINCT ApprovePersonID) = 1
			)
		BEGIN
					
		UPDATE OOT9001 SET Status = 2 WHERE DivisionID = @DivisionID AND APKMaster = @APKMaster AND APKDetail = @APKDetail
		UPDATE OOT9001 SET Status = 0 WHERE DivisionID = @DivisionID AND APKMaster = @APKMaster AND APKDetail = @APKDetail AND Level > 1

		UPDATE OOT2010 SET Status = 2, ApprovingLevel = 1 WHERE DivisionID = @DivisionID AND APKMaster = @APKMaster

		UPDATE OOT9000 SET Status = 2, ApprovingLevel = 1 WHERE DivisionID = @DivisionID AND APK = @APKMaster

		END
	END
	 IF @Type='DXRN' -- Đơn xin phép ra ngoài
	 BEGIN
	 	DELETE HT24
	 	FROM HT2408_MK HT24
	 	INNER JOIN OOT2020 OOT20 ON OOT20.DivisionID = HT24.DivisionID AND OOT20.APK = HT24.APK AND OOT20.APKMaster = HT24.APKMaster
	 	AND OOT20.APKMaster = @APKMaster AND OOT20.APK = @APKDetail
		AND ISNULL(OOT20.Status,0)=0
	 	
	 	INSERT INTO HT2401_MK (APKMaster, DivisionID, AbsentDate, EmployeeID,
							TranMonth, DepartmentID, TranYear, TeamID, AbsentTypeID,
							AbsentAmount, CreateUserID,CreateDate, LastModifyUserID,LastModifyDate)
				SELECT OOT20.APK,OOT20.DivisionID,CONVERT(DATE,OOT20.GoFromDate),OOT20.EmployeeID,
					   OT90.TranMonth,HT14.DepartmentID,OT90.TranYear,HT14.TeamID,H13.AbsentTypeID,
					   -(CASE WHEN H13.UnitID='H' THEN OOT20.TotalTime ELSE OOT20.TotalTime/8 END) AbsentAmount,
					   OT90.CreateUserID,OT90.CreateDate,@UserID,GETDATE()
					   FROM OOT2020 OOT20 WITH (NOLOCK)
					   INNER JOIN OOT9000 OT90 WITH (NOLOCK) ON OT90.DivisionID = OOT20.DivisionID AND OT90.APK = OOT20.APKMaster
					   LEFT JOIN HT1013 H13 WITH (NOLOCK) ON H13.DivisionID = OOT20.DivisionID 
											AND H13.AbsentTypeID = (SELECT TOP 1 AbsentTypeID FROM OOT0010 WITH (NOLOCK) WHERE TranMonth=@TranMonth
																	AND TranYear=@TranYear AND DivisionID=@DivisionID AND AbsentType=@Type)
					   LEFT JOIN HT1400 HT14 WITH (NOLOCK) ON HT14.DivisionID = OOT20.DivisionID AND HT14.EmployeeID = OOT20.EmployeeID
					   LEFT JOIN HT2401_MK HMK WITH (NOLOCK) ON HMK.DivisionID = HT14.DivisionID AND HMK.APKMaster = OOT20.APKMaster
					   WHERE OOT20.DivisionID=@DivisionID 
					   AND OOT20.APKMaster =@APKMaster AND OOT20.APK = @APKDetail
					   AND ISNULL(OOT20.Status,0)=0
					   AND HMK.APK IS NULL
	 END
	 IF @Type ='DXBSQT' -- Đơn xin bổ sung quẹt thẻ
	 BEGIN
	 	--Bo sung quet the
		 DELETE HT24
		 FROM HT2408_MK HT24
		 INNER JOIN OOT2040 OOT40 WITH (NOLOCK) ON OOT40.DivisionID = HT24.DivisionID AND OOT40.EmployeeID = HT24.EmployeeID
								  AND OOT40.APK=HT24.APK AND OOT40.APKMaster = HT24.APKMaster
		 WHERE HT24.DivisionID=@DivisionID
		 --AND HT24.TranMonth=@TranMonth
		 --AND HT24.TranYear=@TranYear
		 AND OOT40.APKMaster=@APKMaster
		 AND OOT40.APK = @APKDetail
	END
	IF @Type ='DXLTG' -- Đơn xin làm thêm giờ
	BEGIN		
		EXEC OOP2056 @DivisionID,@UserID,@TranMonth,@TranYear,@APKMaster,@Status,@APKDetail
	END
	IF @Type ='BPC' -- Bảng phân ca
	BEGIN
	
		DELETE HT12
	 	FROM HT1025  HT12
		INNER JOIN OOT2000 OOT20 WITH (NOLOCK) ON OOT20.DivisionID = HT12.DivisionID AND OOT20.EmployeeID = HT12.EmployeeID
	 	AND OOT20.APKMaster =@APKMaster
	 	AND HT12.DivisionID=@DivisionID
	 	AND HT12.TranMonth=@TranMonth
	 	AND HT12.TranYear=@TranYear
		--- [Tuấn Anh] Updated Bổ sung trường hợp Trạng thái là Bỏ duyệt(Status = 2) => Xóa bảng phân ca
		AND ISNULL(OOT20.Status,0) IN (0,2)

	END		
END


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
