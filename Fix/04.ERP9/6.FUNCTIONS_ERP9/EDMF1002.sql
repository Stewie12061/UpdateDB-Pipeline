IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[EDMF1002]') AND XTYPE IN (N'FN', N'IF', N'TF'))
	DROP FUNCTION [DBO].EDMF1002
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
---- <Summary>
---- Truyền học sinh lấy thông tin hiện tại của học sinh như: Năm học, Khối, Lớp, Xếp lớp (Customize = BLUESKY)
---- <Param>
---- 
---- <Return>
---- 
---- <Reference>
---- 
---- <History>
---- Created on 19/02/2019 by Hoàng Vũ: Trường hợp người dùng chọn Học sinh thì thực thi Function này để load Năm học, Khối, Lớp, Xếp lớp. => Trước tiên phục vụ cho bên APP
---- Modified on 15/10/2019 by Thành Luân: Bỏ Inner join bảng AT1202 thay bằng bảng EDMT2010 với FatherID và MotherID.
---- Modified on 21/10/2019 by Thành Luân: Bỏ lấy năm học theo Max(DateTo) thay vào đó lấy năm học của ngày hiện tại.
---- <Example> SELECT * FROM EDMF1002('BE', 'BE-U003', 'PH-A001', 1)

CREATE FUNCTION EDMF1002 (  
    @DivisionID VARCHAR(50),	--Biến môi trường
    @StudentID  NVARCHAR(50),
	@UserID NVARCHAR(50), 		--Biến môi trường (User đăng nhập là Bố/mẹ)
	@ModeID TINYINT = NULL		--1: cho Module APP, 0: Cho module khác của BLUESKY
) 
RETURNS @MonthYear TABLE (		DivisionID VARCHAR(50),		--Trường/đơn vị
								SchoolYearID VARCHAR(50),	--Năm học được chọn từ Combo [Năm học]
								ArrangeClassID VARCHAR(50),	--Tháng được tính từ Năm học
								GradeID VARCHAR(50),		--Năm được tính từ Năm học
								ClassID VARCHAR(50),		--Tháng năm được tính từ Năm học
								StudentID VARCHAR(50)		--Học sinh
								)
AS
BEGIN
		DECLARE @DateTo AS DATETIME,
			    @Now DATETIME = GETDATE();
				
		SELECT TOP 1 @DateTo = EDMT1040.DateTo FROM EDMT1040 WITH (NOLOCK)
		INNER JOIN EDMT2020 WITH (NOLOCK) ON EDMT1040.DivisionID IN (EDMT2020.DivisionID, '@@@') AND EDMT2020.SchoolYearID = EDMT1040.SchoolYearID AND EDMT2020.DeleteFlg = 0 
		WHERE EDMT1040.DivisionID in (@DivisionID, '@@@')
			  AND CAST(@Now AS DATE) BETWEEN CAST(EDMT1040.DateFrom AS DATE) AND CAST(EDMT1040.DateTo AS DATE)
			  AND EDMT1040.Disabled = 0
		
		IF ISNULL(@ModeID, 0) = 1
		BEGIN
			INSERT INTO @MonthYear (DivisionID, SchoolYearID, ArrangeClassID, GradeID, ClassID, StudentID)
			SELECT  EDMT2020.DivisionID,  EDMT2020.SchoolYearID, EDMT2020.ArrangeClassID,EDMT2020.GradeID, EDMT2020.ClassID, EDMT2021.StudentID
			FROM EDMT2020 WITH (NOLOCK)
						INNER JOIN EDMT2021 WITH (NOLOCK) ON EDMT2020.APK = EDMT2021.APKMaster and EDMT2020.DeleteFlg = EDMT2021.DeleteFlg
						INNER JOIN EDMT1040 WITH (NOLOCK) ON EDMT1040.DivisionID IN (EDMT2021.DivisionID, '@@@') AND EDMT1040.SchoolYearID = EDMT2020.SchoolYearID
						INNER JOIN EDMT2010  WITH (NOLOCK) ON EDMT2010.StudentID = EDMT2021.StudentID AND (ISNULL(FatherID, '') = @UserID OR ISNULL(MotherID, '') = @UserID) AND EDMT2010.DeleteFlg = 0
			WHERE EDMT2020.DivisionID = @DivisionID AND EDMT2020.DeleteFlg = 0 AND EDMT2021.StudentID = @StudentID AND EDMT1040.DateTo = @DateTo
		END
		ELSE
		BEGIN
			INSERT INTO @MonthYear (DivisionID, SchoolYearID, ArrangeClassID, GradeID, ClassID, StudentID)
			SELECT  EDMT2020.DivisionID,  EDMT2020.SchoolYearID, EDMT2020.ArrangeClassID,EDMT2020.GradeID, EDMT2020.ClassID, EDMT2021.StudentID
			FROM EDMT2020 WITH (NOLOCK) 
						LEFT JOIN EDMT2021 WITH (NOLOCK) ON EDMT2020.APK = EDMT2021.APKMaster and EDMT2020.DeleteFlg = EDMT2021.DeleteFlg
						LEFT JOIN EDMT1040 WITH (NOLOCK) ON EDMT1040.DivisionID IN (EDMT2021.DivisionID, '@@@') AND EDMT1040.SchoolYearID = EDMT2020.SchoolYearID
			WHERE EDMT2020.DivisionID = @DivisionID AND EDMT2020.DeleteFlg = 0 AND EDMT1040.DateTo = @DateTo
		END
		RETURN
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

