IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[EDMF1003]') AND XTYPE IN (N'FN', N'IF', N'TF'))
	DROP FUNCTION [DBO].EDMF1003
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
---- <Summary>
---- Truyền học sinh lấy thông tin hiện tại của học sinh như: Năm học, Khối, Lớp, Xếp lớp, và các tháng của năm học  (Customize = BLUESKY)
---- <Param>
---- 
---- <Return>
---- 
---- <Reference>
---- 
---- <History>
---- Created on 19/02/2019 by Hoàng Vũ: Trường hợp người dùng chọn Học sinh thì thực thi Function này để load Năm học, Khối, Lớp, Xếp lớp. => Trước tiên phục vụ cho bên APP
---- <Example> SELECT * FROM EDMF1003('BE', 'BE-U003', 'PH-A001')

CREATE FUNCTION EDMF1003 (  
    @DivisionID VARCHAR(50),	--Biến môi trường
    @StudentID  NVARCHAR(50),
	@UserID NVARCHAR(50) 		--Biến môi trường (User đăng nhập là Bố/mẹ)
	
) 
RETURNS @MonthYear table (		DivisionID varchar(50),		--Trường/đơn vị
								SchoolYearID varchar(50),	--Năm học được chọn từ Combo [Năm học]
								ArrangeClassID varchar(50),	--Tháng được tính từ Năm học
								GradeID varchar(50),		--Năm được tính từ Năm học
								ClassID varchar(50),		--Tháng năm được tính từ Năm học
								StudentID varchar(50),		--Học sinh
								TranMonth int,				--Tháng học
								TranYear int,				--Năm học
								MonthYear varchar(50),		--Tháng/Năm học
								FromDate Datetime,			--Từ ngày: Lấy từ lịch hệ thống
								ToDate Datetime,			--Đến ngày: Lấy từ lịch hệ thống
								SchoolFromDate Datetime,	--Từ ngày: khai báo trong năm học
								SchoolToDate Datetime,		--Đến ngày: khai báo trong năm học
								OrderNo int
								)
AS
BEGIN
		DECLARE @DateTo DATETIME,
				@strSchoolYearID Varchar(50),
				@strArrangeClassID Varchar(50)	

		SELECT @DateTo = MAX(DateTo) FROM EDMT1040 WITH (NOLOCK) INNER JOIN EDMT2020 WITH (NOLOCK) ON EDMT2020.SchoolYearID = EDMT1040.SchoolYearID and EDMT2020.DeleteFlg = 0 WHERE EDMT2020.DivisionID in (@DivisionID, '@@@') and EDMT1040.Disabled = 0
		
		SELECT  @strSchoolYearID= EDMT2020.SchoolYearID, @strArrangeClassID = ArrangeClassID
		From EDMT2020 WITH (NOLOCK) 
					INNER JOIN EDMT2021 WITH (NOLOCK) ON EDMT2020.APK = EDMT2021.APKMaster and EDMT2020.DeleteFlg = EDMT2021.DeleteFlg
					INNER JOIN EDMT1040 WITH (NOLOCK) ON EDMT1040.DivisionID IN (EDMT2021.DivisionID, '@@@') AND EDMT1040.SchoolYearID = EDMT2020.SchoolYearID
					INNER JOIN AT1202  WITH (NOLOCK) ON AT1202.ObjectID = EDMT2021.StudentID and (Isnull(FatherObjectID, '') = @UserID or Isnull(MotherObjectID, '') = @UserID)
		WHERE EDMT2020.DivisionID = @DivisionID AND EDMT2020.DeleteFlg = 0 AND EDMT2021.StudentID = @StudentID AND EDMT1040.DateTo = @DateTo


		insert into @MonthYear (DivisionID, SchoolYearID, ArrangeClassID, GradeID, ClassID, StudentID, TranMonth, TranYear, MonthYear, FromDate, ToDate, SchoolFromDate, SchoolToDate, OrderNo)
		SELECT  EDMT2020.DivisionID,  EDMT2020.SchoolYearID, EDMT2020.ArrangeClassID,EDMT2020.GradeID, EDMT2020.ClassID, EDMT2021.StudentID
				, EDMF1001.TranMonth, EDMF1001.TranYear, EDMF1001.MonthYear, EDMF1001.FromDate, EDMF1001.ToDate, EDMF1001.SchoolFromDate, EDMF1001.SchoolToDate, EDMF1001.OrderNo
		From EDMT2020 WITH (NOLOCK) 
					INNER JOIN EDMT2021 WITH (NOLOCK) ON EDMT2020.APK = EDMT2021.APKMaster and EDMT2020.DeleteFlg = EDMT2021.DeleteFlg
					INNER JOIN EDMT1040 WITH (NOLOCK) ON EDMT1040.DivisionID IN (EDMT2021.DivisionID, '@@@') AND EDMT1040.SchoolYearID = EDMT2020.SchoolYearID
					INNER JOIN AT1202  WITH (NOLOCK) ON AT1202.ObjectID = EDMT2021.StudentID and (Isnull(FatherObjectID, '') = @UserID or Isnull(MotherObjectID, '') = @UserID)
					Inner join EDMF1001(@DivisionID, @strSchoolYearID) EDMF1001 on EDMT2020.DivisionID = EDMF1001.DivisionID and EDMT2020.SchoolYearID = EDMF1001.SchoolYearID
		WHERE EDMT2020.DivisionID = @DivisionID AND EDMT2020.DeleteFlg = 0 AND EDMT2021.StudentID = @StudentID AND EDMT2020.ArrangeClassID = @strArrangeClassID
	
		RETURN
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

