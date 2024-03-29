/*
=====================================================================
--- Script message tiếng Việt
--- select * from a00002 where id like '%MTFML%'
--- Delete from a00002 where id = 'MTFML000001'
=====================================================================
*/
------------------------------------------------------------------------------------------------------
-- Script tạo message MT - Dùng chung
------------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
@MessageValue NVARCHAR(400),
------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
@Finished BIT

------------------------------------------------------------------------------------------------------
-- Set value và Execute query
------------------------------------------------------------------------------------------------------
/*
 - Tieng Viet: vi-VN 
 - Tieng Anh: en-US 
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/
SET @Language = 'ja-JP' 
SET @ModuleID = 'HRM';

SET @MessageValue = N'インポートしている単位コードが使用している単位コードと違います。';
EXEC ERP9AddMessage @ModuleID, 'OOFML000001' , @MessageValue, @Language;

SET @MessageValue = N'インポートしている期間が使用している期間と違います。';
EXEC ERP9AddMessage @ModuleID, 'OOFML000002' , @MessageValue, @Language;

SET @MessageValue = N'部門のコードが未だ入力されていません。';
EXEC ERP9AddMessage @ModuleID, 'OOFML000003' , @MessageValue, @Language;

SET @MessageValue = N'課のコードが未だ入力されていません。';
EXEC ERP9AddMessage @ModuleID, 'OOFML000004' , @MessageValue, @Language;

SET @MessageValue = N'係りのコードが未だ入力されていません。';
EXEC ERP9AddMessage @ModuleID, 'OOFML000005' , @MessageValue, @Language;

SET @MessageValue = N'工程のコードが未だ入力されていません。';
EXEC ERP9AddMessage @ModuleID, 'OOFML000006' , @MessageValue, @Language;

SET @MessageValue = N'シフトのコードが未だ入力されていません。';
EXEC ERP9AddMessage @ModuleID, 'OOFML000007' , @MessageValue, @Language;

SET @MessageValue = N'従業員のＩＤが未だ入力されていません。';
EXEC ERP9AddMessage @ModuleID, 'OOFML000008' , @MessageValue, @Language;

SET @MessageValue = N'従業員とＩＤ番号が違います。';
EXEC ERP9AddMessage @ModuleID, 'OOFML000009' , @MessageValue, @Language;

SET @MessageValue = N'コードが重なっています。他のコードを入力ください。';
EXEC ERP9AddMessage @ModuleID, 'OOFML000010' , @MessageValue, @Language;

SET @MessageValue = N'承認者の情報が未だ入力されていません。';
EXEC ERP9AddMessage @ModuleID, 'OOFML000011' , @MessageValue, @Language;

SET @MessageValue = N'承認者が選んだ部・課・係り・工程の中にいません。';
EXEC ERP9AddMessage @ModuleID, 'OOFML000012' , @MessageValue, @Language;

SET @MessageValue = N'ステップ ';
EXEC ERP9AddMessage @ModuleID, 'OOFML000013' , @MessageValue, @Language;

SET @MessageValue = N'従業員のシフトがシフト表で作成されました。シフト追加が出来ません。';
EXEC ERP9AddMessage @ModuleID, 'OOFML000014' , @MessageValue, @Language;


SET @MessageValue = N'このコードが他のユーザーで使用されています! 保存してください';
EXEC ERP9AddMessage @ModuleID, 'OOFML000015' , @MessageValue, @Language;

SET @MessageValue = N'承認権限レベル確認が必要';
EXEC ERP9AddMessage @ModuleID,'OOFML000016' , @MessageValue, @Language;

SET @MessageValue = N'従業員の休暇申請の時間が重なっています。';
EXEC ERP9AddMessage @ModuleID,'OOFML000017' , @MessageValue, @Language;

SET @MessageValue = N'従業員の出掛申請の時間が重なっています。';
EXEC ERP9AddMessage @ModuleID,'OOFML000018' , @MessageValue, @Language;

SET @MessageValue = N'従業員の残業申請の時間が重なっています。';
EXEC ERP9AddMessage @ModuleID,'OOFML000019' , @MessageValue, @Language;


SET @MessageValue = N'従業員のカード強打追加申請の時間が重なっています。';
EXEC ERP9AddMessage @ModuleID,'OOFML000020' , @MessageValue, @Language;

SET @MessageValue = N'従業員の更新時間が重なっています。';
EXEC ERP9AddMessage @ModuleID,'OOFML000021' , @MessageValue, @Language;

SET @MessageValue = N'日付からの時間は日付までの時間より前です。';
EXEC ERP9AddMessage @ModuleID,'OOFML000022' , @MessageValue, @Language;

SET @MessageValue = N'処理方法を選んでください。';
EXEC ERP9AddMessage @ModuleID,'OOFML000023' , @MessageValue, @Language;

SET @MessageValue = N'承認待ちの状態を選ばないでください。' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000024' , @MessageValue, @Language;

SET @MessageValue = N'後継【コピー？】の為に1欄しか選んでください。' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000025' , @MessageValue, @Language;

SET @MessageValue = N'従業員がHRMで勤怠されました為再度承認できません。' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000026' , @MessageValue, @Language;

SET @MessageValue = N'現在日付の後の時間を選んでください。' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000027' , @MessageValue, @Language;

SET @MessageValue = N'あなたは時間の小さい最後の時間から始めなければなりません。' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000028' , @MessageValue, @Language;

SET @MessageValue = N'従業員 {0} 有る 日 {1} 等しい シフト {2}。' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000029' , @MessageValue, @Language;

SET @MessageValue = N'会計期間に今日に至るまで、から選択する必要があります。' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000030' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên này không thuộc Khối, Phòng, Ban, Công đoạn vừa được khai báo' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000031' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên này đã được phân ca. Bạn không thể phân ca thêm!' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000032' , @MessageValue, @Language;

SET @MessageValue = N'Thời gian xin phép có nhiều hơn 1 ca làm việc. Vui lòng chọn lại thời gian xin phép!' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000033' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên {0} không có email' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000034' , @MessageValue, @Language;

SET @MessageValue = N'Đơn {0} chưa/không được duyệt. Bạn không thể in!' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000035' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên {0} có thời gian OT vượt quá thời gian cho phép!' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000036' , @MessageValue, @Language;

SET @MessageValue = N'Phiếu đã được xử lý' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000037' , @MessageValue, @Language;

SET @MessageValue = N'Mã nhân viên bị trùng trong file import' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000038' , @MessageValue, @Language;

SET @MessageValue = N'Số ngày phép ban đầu phải > 0!' ;
EXEC ERP9AddMessage @ModuleID,'HFML000537' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên {0} đã bị trùng!' ;
EXEC ERP9AddMessage @ModuleID,'HFML000538' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên {0} chưa có trong hồ sơ phép!' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000039' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên {0} đã được khai báo số ngày nghỉ phép ban đầu!' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000040' , @MessageValue, @Language;

SET @MessageValue = N'Số ngày nghỉ phép ban đầu phải > 0!' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000041' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa chọn dòng nào!' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000042' , @MessageValue, @Language;

SET @MessageValue = N'Kế thừa thành công' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000043' , @MessageValue, @Language;

SET @MessageValue = N'Kế thừa không thành công!' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000044' , @MessageValue, @Language;

SET @MessageValue = N'Tính phép thành công!' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000045' , @MessageValue, @Language;

SET @MessageValue = N'Tính phép không thành công!' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000046' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa chọn phòng ban hoặc tổ nhóm ' ;
EXEC ERP9AddMessage @ModuleID,'OOFML000047' , @MessageValue, @Language;

SET @MessageValue = N'{0} đã được sử dụng. Bạn không được xóa!' ;
EXEC ERP9AddMessage @ModuleID,'HRMFML000001' , @MessageValue, @Language;

SET @MessageValue = N'Vượt quá số lượng!' ;
EXEC ERP9AddMessage @ModuleID,'HRMFML000028' , @MessageValue, @Language;

SET @MessageValue=N'The editor [{0}] is not in the position of approved setting' 
EXEC ERP9AddMessage @ModuleID,'HRMFML000040', @MessageValue, @Language; 