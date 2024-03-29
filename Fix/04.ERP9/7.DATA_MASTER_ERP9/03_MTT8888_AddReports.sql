--- Create by Nguyễn Thanh Sơn on 12/12/2013
--- Bổ sung các báo cáo vào quản lý báo cáo MTT8888

DECLARE
    @GroupID NVARCHAR(50),
    @ModuleID NVARCHAR(50),
    @ReportID NVARCHAR(50),
    @ReportName NVARCHAR(250),
    @ReportNameE NVARCHAR(250),
    @ReportTitle NVARCHAR(250),
    @ReportTitleE NVARCHAR(250),
    @Description NVARCHAR(250),
    @DescriptionE NVARCHAR(250),
    @Type TINYINT,
    @Disabled TINYINT,
    @SQLstring NVARCHAR(4000),
    @Orderby NVARCHAR(200),
    @IsCommon TINYINT
------------------------------------------KẾT QUẢ HỌC TẬP---------------------------------------------------    
--------------------------------------------Giữa khóa-------------------------------------------------------
SET @ReportID = N'MTR2010'
SET @ReportName = N'Kết quả học tập giữa khóa'
SET @ReportNameE = N'Midterm report'
SET @ReportTitle = N'KẾT QUẢ HỌC TẬP GIỮA KHÓA'
SET @ReportTitleE = N'MIDTERM REPORT'
SET @Description = N'Kết quả học tập giữa khóa'
SET @DescriptionE = N'Midterm report'
SET @GroupID = N'G01'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''
--------------------------------------------
-- Thêm thông tin báo cáo
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT8888 WHERE ReportID = @ReportID)
INSERT INTO MTT8888( ReportID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
VALUES (@ReportID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE UPDATE MTT8888 SET ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, [Disabled] = @Disabled, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID

--------------------------------------------Cuối khóa-------------------------------------------------------
SET @ReportID = N'MTR2011'
SET @ReportName = N'Kết quả học tập cuối khóa'
SET @ReportNameE = N'Final report'
SET @ReportTitle = N'KẾT QUẢ HỌC TẬP CUỐI KHÓA'
SET @ReportTitleE = N'FINAL REPORT'
SET @Description = N'Kết quả học tập cuối khóa'
SET @DescriptionE = N'Final report'
SET @GroupID = N'G01'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''
--------------------------------------------
-- Thêm thông tin báo cáo
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT8888 WHERE ReportID = @ReportID)
INSERT INTO MTT8888( ReportID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
VALUES (@ReportID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, 0, @SQLstring, @Orderby, 1)
ELSE UPDATE MTT8888 SET ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, [Disabled] = @Disabled, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
     
--------------------------------------------Học bạ-------------------------------------------------------
SET @ReportID = N'MTR2012'
SET @ReportName = N'Học bạ'
SET @ReportNameE = N'Student academic history'
SET @ReportTitle = N'HỌC BẠ'
SET @ReportTitleE = N'STUDENT ACADEMIC HISTORY'
SET @Description = N'Học bạ'
SET @DescriptionE = N'Student academic history'
SET @GroupID = N'G01'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''
--------------------------------------------
-- Thêm thông tin báo cáo
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT8888 WHERE ReportID = @ReportID)
INSERT INTO MTT8888( ReportID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
VALUES (@ReportID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, 0, @SQLstring, @Orderby, 1)
ELSE UPDATE MTT8888 SET ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, [Disabled] = @Disabled, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
     
--------------------------------------------Phiếu hoàn học phí-------------------------------------------------------
SET @ReportID = N'MTR2013'
SET @ReportName = N'Phiếu hoàn học phí'
SET @ReportNameE = N'Tuition return voucher'
SET @ReportTitle = N'PHIẾU HOÀN HỌC PHÍ'
SET @ReportTitleE = N'TUITION RETURN VOUCHER'
SET @Description = N'Phiếu hoàn học phí'
SET @DescriptionE = N'Tuition return voucher'
SET @GroupID = N'G01'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

--------------------------------------------Quá trình học tập-------------------------------------------------------
SET @ReportID = N'MTR2019'
SET @ReportName = N'Quá trình học tập'
SET @ReportNameE = N'Learning Process'
SET @ReportTitle = N'QUÁ TRÌNH HỌC TẬP'
SET @ReportTitleE = N'LEARNING PROCESS'
SET @Description = N'Quá trình học tập'
SET @DescriptionE = N'Learning Process'
SET @GroupID = N'G01'
SET @Type = 2
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''
--------------------------------------------
-- Thêm thông tin báo cáo
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT8888 WHERE ReportID = @ReportID)
INSERT INTO MTT8888( ReportID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
VALUES (@ReportID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, 0, @SQLstring, @Orderby, 1)
ELSE UPDATE MTT8888 SET ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, [Disabled] = @Disabled, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
     
------------------------------------------Học viên---------------------------------------------------------   
------------------------------------------Báo cáo nguồn học viên-------------------------------------------------------
SET @ReportID = N'MTR3010'
SET @ReportName = N'Báo cáo nguồn học viên'
SET @ReportNameE = N'Students source report'
SET @ReportTitle = N'BÁO CÁO NGUỒN HỌC VIÊN'
SET @ReportTitleE = N'STUDENTS SOURCE REPORT'
SET @Description = N'Báo cáo nguồn học viên'
SET @DescriptionE = N'Students source report'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''
--------------------------------------------
-- Thêm thông tin báo cáo
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT8888 WHERE ReportID = @ReportID)
INSERT INTO MTT8888( ReportID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
VALUES (@ReportID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, 0, @SQLstring, @Orderby, 1)
ELSE UPDATE MTT8888 SET ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, [Disabled] = @Disabled, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
     
------------------------------------------Báo cáo số học viên-------------------------------------------------------
SET @ReportID = N'MTR3011'
SET @ReportName = N'Báo cáo số học viên'
SET @ReportNameE = N'Students source report'
SET @ReportTitle = N'BÁO CÁO SỐ HỌC VIÊN'
SET @ReportTitleE = N'STUDENTS SUM'
SET @Description = N'Báo cáo số học viên'
SET @DescriptionE = N'Students sum'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''
--------------------------------------------
-- Thêm thông tin báo cáo
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT8888 WHERE ReportID = @ReportID)
INSERT INTO MTT8888( ReportID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
VALUES (@ReportID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, 0, @SQLstring, @Orderby, 1)
ELSE UPDATE MTT8888 SET ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, [Disabled] = @Disabled, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
     
------------------------------------------Báo cáo hoàn học phí-------------------------------------------------------
SET @ReportID = N'MTR3012'
SET @ReportName = N'Báo cáo hoàn học phí'
SET @ReportNameE = N'Tuition return report'
SET @ReportTitle = N'BÁO CÁO HOÀN HỌC PHÍ'
SET @ReportTitleE = N'TUITION  RETURN REPORT'
SET @Description = N'Báo cáo hoàn học phí'
SET @DescriptionE = N'Tuition return report'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''
--------------------------------------------
-- Thêm thông tin báo cáo
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT8888 WHERE ReportID = @ReportID)
INSERT INTO MTT8888( ReportID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
VALUES (@ReportID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, 0, @SQLstring, @Orderby, 1)
ELSE UPDATE MTT8888 SET ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, [Disabled] = @Disabled, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
     
------------------------------------------Báo cáo giảm học phí-------------------------------------------------------
SET @ReportID = N'MTR3013'
SET @ReportName = N'Báo cáo giảm học phí'
SET @ReportNameE = N'Students reduce report'
SET @ReportTitle = N'BÁO CÁO GIẢM HỌC PHÍ'
SET @ReportTitleE = N'TUITION REDUCE REPORT'
SET @Description = N'Báo cáo giảm học phí'
SET @DescriptionE = N'Tuition reduce report'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''
--------------------------------------------
-- Thêm thông tin báo cáo
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT8888 WHERE ReportID = @ReportID)
INSERT INTO MTT8888( ReportID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
VALUES (@ReportID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, 0, @SQLstring, @Orderby, 1)
ELSE UPDATE MTT8888 SET ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, [Disabled] = @Disabled, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
     
------------------------------------------Báo cáo số lớp học viên đã học-------------------------------------------------------
SET @ReportID = N'MTR3014'
SET @ReportName = N'Báo cáo số lớp học viên đã học'
SET @ReportNameE = N'Sum of Class Report'
SET @ReportTitle = N'BÁO CÁO SỐ LỚP HỌC VIÊN ĐÃ HỌC'
SET @ReportTitleE = N'SUM OF COURCE REPORT'
SET @Description = N'Báo cáo số lớp học viên đã học'
SET @DescriptionE = N'Sum of Class Report'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''
--------------------------------------------
-- Thêm thông tin báo cáo
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT8888 WHERE ReportID = @ReportID)
INSERT INTO MTT8888( ReportID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
VALUES (@ReportID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, 0, @SQLstring, @Orderby, 1)
ELSE UPDATE MTT8888 SET ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, [Disabled] = @Disabled, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
     
------------------------------------------Báo cáo sỉ số học viên theo lớp-------------------------------------------------------
SET @ReportID = N'MTR3015'
SET @ReportName = N'Báo cáo sỉ số học viên theo lớp'
SET @ReportNameE = N'Current Students in Class Report'
SET @ReportTitle = N'BÁO CÁO SỈ SỐ HỌC VIÊN THEO LỚP'
SET @ReportTitleE = N'CURRENT STUDENTS IN CLASS REPORT'
SET @Description = N'Báo cáo sỉ số học viên theo lớp'
SET @DescriptionE = N'Current Students in Class Report'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''
--------------------------------------------
-- Thêm thông tin báo cáo
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT8888 WHERE ReportID = @ReportID)
INSERT INTO MTT8888( ReportID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
VALUES (@ReportID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, 0, @SQLstring, @Orderby, 1)
ELSE UPDATE MTT8888 SET ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, [Disabled] = @Disabled, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
     
------------------------------------------Danh sách họ viên thôi học-------------------------------------------------------
SET @ReportID = N'MTR3016'
SET @ReportName = N'Danh sách học viên thôi học'
SET @ReportNameE = N'Leave_School Students'
SET @ReportTitle = N'BÁO CÁO SỈ SỐ HỌC VIÊN THEO LỚP'
SET @ReportTitleE = N'LEAVE_SCHOOL STUDENTS'
SET @Description = N'Danh sách học viên thôi học'
SET @DescriptionE = N'Leave_School Students'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''
--------------------------------------------
-- Thêm thông tin báo cáo
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT8888 WHERE ReportID = @ReportID)
INSERT INTO MTT8888( ReportID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
VALUES (@ReportID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, 0, @SQLstring, @Orderby, 1)
ELSE UPDATE MTT8888 SET ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, [Disabled] = @Disabled, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
     
------------------------------------------Báo cáo học viên thôi học-------------------------------------------------------
SET @ReportID = N'MTR3017'
SET @ReportName = N'Báo cáo học viên thôi học'
SET @ReportNameE = N'Leave_School Reason Report'
SET @ReportTitle = N'BÁO CÁO HỌC VIÊN THÔI HỌC'
SET @ReportTitleE = N'LEAVE_SCHOOL REASON REPORT'
SET @Description = N'Báo cáo học viên thôi học'
SET @DescriptionE = N'Leave_School Reason Report'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''
--------------------------------------------
-- Thêm thông tin báo cáo
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT8888 WHERE ReportID = @ReportID)
INSERT INTO MTT8888( ReportID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
VALUES (@ReportID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, 0, @SQLstring, @Orderby, 1)
ELSE UPDATE MTT8888 SET ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, [Disabled] = @Disabled, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
     
------------------------------------------Báo cáo học viên hiện có và đang chờ lớp-------------------------------------------------------
SET @ReportID = N'MTR3018'
SET @ReportName = N'Báo cáo học viên hiện có và đang chờ lớp theo chương trình'
SET @ReportNameE = N'Current and waiting students'
SET @ReportTitle = N'BÁO CÁO HỌC VIÊN HIỆN CÓ VÀ ĐANG CHỜ LỚP THEO CHƯƠNG TRÌNH'
SET @ReportTitleE = N'CURRENT AND WAITING STUDENTS'
SET @Description = N'Báo cáo học viên hiện có và đang chờ lớp theo chương trình'
SET @DescriptionE = N'Current and waiting students'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''
--------------------------------------------
-- Thêm thông tin báo cáo
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT8888 WHERE ReportID = @ReportID)
INSERT INTO MTT8888( ReportID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
VALUES (@ReportID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, 0, @SQLstring, @Orderby, 1)
ELSE UPDATE MTT8888 SET ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, [Disabled] = @Disabled, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
     
--------------------------------------------Báo cáo học viên hiện có và đang chờ lớp-------------------------------------------------------
SET @ReportID = N'MTR3019'
SET @ReportName = N'Báo cáo học viên mới'
SET @ReportNameE = N'New students report'
SET @ReportTitle = N'BÁO CÁO HỌC VIÊN MỚI'
SET @ReportTitleE = N'NEW STUDENT REPORT'
SET @Description = N'Báo cáo học viên mới'
SET @DescriptionE = N'New students report'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''
--------------------------------------------
-- Thêm thông tin báo cáo
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT8888 WHERE ReportID = @ReportID)
INSERT INTO MTT8888( ReportID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
VALUES (@ReportID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, 0, @SQLstring, @Orderby, 1)
ELSE UPDATE MTT8888 SET ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, [Disabled] = @Disabled, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
     
--------------------------------------------Báo cáo học viên đang chờ lớp-------------------------------------------------------
SET @ReportID = N'MTR3020'
SET @ReportName = N'Báo cáo học viên đang chờ lớp'
SET @ReportNameE = N'Students waiting for class'
SET @ReportTitle = N'BÁO CÁO HỌC VIÊN ĐANG CHỜ LỚP'
SET @ReportTitleE = N'STUDENTS WAITING FOR CLASS'
SET @Description = N'Báo cáo học viên đang chờ lớp'
SET @DescriptionE = N'Students waiting for class'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''
--------------------------------------------
-- Thêm thông tin báo cáo
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT8888 WHERE ReportID = @ReportID)
INSERT INTO MTT8888( ReportID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
VALUES (@ReportID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, 0, @SQLstring, @Orderby, 1)
ELSE UPDATE MTT8888 SET ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, [Disabled] = @Disabled, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID

--------------------------------------------Báo cáo Re-sign-------------------------------------------------------
SET @ReportID = N'MTR3021'
SET @ReportName = N'Báo cáo Re-sign'
SET @ReportNameE = N'Re-sign Report'
SET @ReportTitle = N'RE-SIGN'
SET @ReportTitleE = N'RE-SIGN'
SET @Description = N'Báo cáo Re-sign'
SET @DescriptionE = N'Re-sign Report'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''
--------------------------------------------
-- Thêm thông tin báo cáo
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT8888 WHERE ReportID = @ReportID)
INSERT INTO MTT8888( ReportID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
VALUES (@ReportID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, 0, @SQLstring, @Orderby, 1)
ELSE UPDATE MTT8888 SET ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, [Disabled] = @Disabled, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
     
--------------------------------------------Báo cáo tỉ lệ Re-sign theo từng lớp -------------------------------------------------------
SET @ReportID = N'MTR3022'
SET @ReportName = N'Báo cáo tỉ lệ Re-sign theo từng lớp'
SET @ReportNameE = N'Class-Resign Report'
SET @ReportTitle = N'BÁO CÁO TỈ LỆ RE-SIGN THEO TỪNG LỚP'
SET @ReportTitleE = N'CLASS-RESIGN REPORT'
SET @Description = N'Báo cáo tỉ lệ Re-sign theo từng lớp'
SET @DescriptionE = N'Class-Resign Report'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''
--------------------------------------------
-- Thêm thông tin báo cáo
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT8888 WHERE ReportID = @ReportID)
INSERT INTO MTT8888( ReportID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
VALUES (@ReportID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, 0, @SQLstring, @Orderby, 1)
ELSE UPDATE MTT8888 SET ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, [Disabled] = @Disabled, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
    
--------------------------------------------Báo cáo Doanh thu tháng - quý - năm -------------------------------------------------------
SET @ReportID = N'MTR3100'
SET @ReportName = N'Báo cáo doanh thu tháng - quý - năm'
SET @ReportNameE = N'Month - Quater - Year Revenue Report'
SET @ReportTitle = N'BÁO CÁO DOANH THU THÁNG - QUÝ - NĂM'
SET @ReportTitleE = N'MONTH - QUATER - YEAR REVENUE REPORT'
SET @Description = N'Báo cáo doanh thu tháng - quý - năm'
SET @DescriptionE = N'Month - Quater - Year Revenue Report'
SET @GroupID = N'G03'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''
--------------------------------------------
-- Thêm thông tin báo cáo
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT8888 WHERE ReportID = @ReportID)
INSERT INTO MTT8888( ReportID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
VALUES (@ReportID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, 0, @SQLstring, @Orderby, 1)
ELSE UPDATE MTT8888 SET ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, [Disabled] = @Disabled, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
     
--------------------------------------------Báo cáo Học viên và doanh thu  -------------------------------------------------------
SET @ReportID = N'MTR3101'
SET @ReportName = N'Báo cáo Học viên và doanh thu'
SET @ReportNameE = N'Student and Revenue Report'
SET @ReportTitle = N'BÁO CÁO HỌC VIÊN VÀ DOANH THU'
SET @ReportTitleE = N'STUDENT AND REVENUE REPORT'
SET @Description = N'Báo cáo Học viên và doanh thu'
SET @DescriptionE = N'Student and Revenue Report'
SET @GroupID = N'G03'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''
--------------------------------------------
-- Thêm thông tin báo cáo
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT8888 WHERE ReportID = @ReportID)
INSERT INTO MTT8888( ReportID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
VALUES (@ReportID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, 0, @SQLstring, @Orderby, 1)
ELSE UPDATE MTT8888 SET ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, [Disabled] = @Disabled, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID