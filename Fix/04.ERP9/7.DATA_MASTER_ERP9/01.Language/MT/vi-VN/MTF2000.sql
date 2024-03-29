-----------------------------------------------------------------------------------------------------
-- Script tạo message - MT
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(5),
@FormID VARCHAR(50),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000),
@LanguageCustomValue NVARCHAR(4000),

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
@Finished BIT

/*
 - Tieng Viet: vi-VN 
 - Tieng Anh: en-US 
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/
SET @Language = 'vi-VN'; 
SET @ModuleID = 'MT';
SET @FormID = 'MTF2000';

SET @LanguageValue = N'Địa chỉ';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Address' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Ngày sinh';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.BirthDay' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Chi nhánh';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.BranchID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Ngày xếp lớp';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.ClassDate' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Lớp học';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.ClassID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Email 1';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.ContactEmail1' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Email 2';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.ContactEmail2' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Người liên hệ 1';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.ContactPerson1' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Người liên hệ 2';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.ContactPerson2' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Điện thoại 1';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.ContactTel1' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Điện thoại 2';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.ContactTel2' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Học kỳ';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.CourseName' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Quận';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.District' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Đơn vị';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.DivisionID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Email';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Email' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Nghề nghiệp bố';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.FatherJob' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Nữ';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.FeMale' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Tên';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.FirstName' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Từ ngày';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.FromDate' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Từ tháng';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.FromPeriod' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Khối lớp';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Grade' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Điểm cần khắc phục';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Improvement' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Người xếp lớp';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Interviewer' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Giới tính';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.IsMale' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Theo phần thi';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.IsNotSkill' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Theo kỹ năng';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.IsSkill' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Khác';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.IsTAOthers' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'TA thường';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.IsTASimple' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'TATC';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.IsTATC' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Họ và chữ lót';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.LastName' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'CT đào tạo';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.LevelName' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Nghe';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Listen' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Nam';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Male' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Nghề nghiệp mẹ';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.MotherJob' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Quản lý học viên';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.MTF2000Title' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Cập nhật thông tin học viên';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.MTF2001Title' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Xem thông tin học viên';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.MTF2002Title' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Ghi chú';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Notes' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Ghi chú khác';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.OtherNotes' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Part 1';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Part1' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Part 2';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Part2' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Part 3';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Part3' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Part 4';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Part4' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Tổng';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.PartTotal' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Xếp vào cấp độ';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.PlacementLevel' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Đọc';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Read' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Nhân viên tiếp nhận';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Reception' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Phân loại';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.S' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Trường đang học';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.School' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Nguồn 1';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Source1' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Nguồn 2';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Source2' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Nguồn 3';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Source3' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Nói';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Speak' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Ghi chú nhập học';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.SpecNotes' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Ngày nhập học';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.StartDate' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Tình trạng';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Status' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Trạng thái';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.StatusID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Điểm mạnh';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Strenghts' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'STT';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.STT' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Mã học viên';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.StudentID' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Tên học viên';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.StudentName' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Tên tiếng Anh';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.StudentNameE' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Kết quả thi đầu vào';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.TabInfoExams' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Thông tin bổ sung';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.TabInfoExtension' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Quá trình học tập';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.TabInfoProcess' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Thông tin cá nhân';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.TabInfoStudent' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Chương trình';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.TATC' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Nhận xét GV';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.TeacherCommentEK' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Điện thoại 1';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Tel1' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Điện thoại 2';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Tel2' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Số điện thoại';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.TelFilter' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Đến ngày';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.ToDate' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Đến kì';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.ToPeriod' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Tổng';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Total' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Phường';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Ward' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;

SET @LanguageValue = N'Viết';
SET @LanguageCustomValue = N'';
EXEC ERP9AddLanguage @ModuleID, 'MTF2000.Write' , @FormID, @LanguageValue, @Language, @LanguageCustomValue;
