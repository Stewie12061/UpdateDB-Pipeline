/*
=====================================================================
--- Script message tiếng Việt
--- select * from a00002 where id like '%A00ML%'
--- Delete from a00002 where id = 'A00ML000001'
=====================================================================
*/
------------------------------------------------------------------------------------------------------
-- Script tạo message A00 - Dùng chung
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
SET @ModuleID = '00';
SET @FormID = 'A00';
------------------------------------------------------------------------------------------------------
-- Button
------------------------------------------------------------------------------------------------------
SET @MessageValue = N'保存してほしですか？';
EXEC ERP9AddMessage @ModuleID, 'A00ML000001' , @MessageValue, @Language;

SET @MessageValue = N'削除してほしですか？';
EXEC ERP9AddMessage @ModuleID, 'A00ML000002' , @MessageValue, @Language;

SET @MessageValue = N'行をまだ選ばれていません。';
EXEC ERP9AddMessage @ModuleID, 'A00ML000003' , @MessageValue, @Language;

SET @MessageValue = N'データーがありません。';
EXEC ERP9AddMessage @ModuleID, 'A00ML000004' , @MessageValue, @Language;

SET @MessageValue = N'保存できません。';
EXEC ERP9AddMessage @ModuleID, 'A00ML000005' , @MessageValue, @Language;

SET @MessageValue = N'削除ができません。';
EXEC ERP9AddMessage @ModuleID, 'A00ML000006' , @MessageValue, @Language;

SET @MessageValue = N'ログイン情報が正しくありません。再確認ください。';
EXEC ERP9AddMessage @ModuleID, 'A00ML000007' , @MessageValue, @Language;

SET @MessageValue = N'Khóa sổ thành công.';
EXEC ERP9AddMessage @ModuleID, 'A00ML000008' , @MessageValue, @Language;

SET @MessageValue = N'Khóa sổ không thành công.';
EXEC ERP9AddMessage @ModuleID, 'A00ML000009' , @MessageValue, @Language;

SET @MessageValue = N'Mở sổ thành công.';
EXEC ERP9AddMessage @ModuleID, 'A00ML000010' , @MessageValue, @Language;

SET @MessageValue = N'Mở sổ không thành công.';
EXEC ERP9AddMessage @ModuleID, 'A00ML000011' , @MessageValue, @Language;

SET @MessageValue = N'Kỳ kế toán không tồn tại.';
EXEC ERP9AddMessage @ModuleID, 'A00ML000012' , @MessageValue, @Language;

SET @MessageValue = N'システム設定ができません。';
EXEC ERP9AddMessage @ModuleID, 'A00ML000013' , @MessageValue, @Language;

SET @MessageValue = N'処理の際エラーが発生します。再作業ください。';
EXEC ERP9AddMessage @ModuleID, 'A00ML000014' , @MessageValue, @Language;

SET @MessageValue = N'文字は[{0}]で入力されません。';
EXEC ERP9AddMessage @ModuleID, 'A00ML000015' , @MessageValue, @Language;

SET @MessageValue = N'[{0}]はリストの中にありません。';
EXEC ERP9AddMessage @ModuleID, 'A00ML000016' , @MessageValue, @Language;

SET @MessageValue = N'[{0}]保存されました。';
EXEC ERP9AddMessage @ModuleID, 'A00ML000017' , @MessageValue, @Language;

SET @MessageValue = N'このリストの中で選んでください。';
EXEC ERP9AddMessage @ModuleID, '00ML000001' , @MessageValue, @Language;

SET @MessageValue = N'商品コードを再度設立ください。';
EXEC ERP9AddMessage @ModuleID, '00ML000002' , @MessageValue, @Language;

SET @MessageValue = N'商品コードを入力ください。';
EXEC ERP9AddMessage @ModuleID, '00ML000003' , @MessageValue, @Language;

SET @MessageValue = N'品名を入力ください。';
EXEC ERP9AddMessage @ModuleID, '00ML000004' , @MessageValue, @Language;

SET @MessageValue = N'在庫アカウントを選んでください。';
EXEC ERP9AddMessage @ModuleID, '00ML000005' , @MessageValue, @Language;

SET @MessageValue = N'{0} のファイルのエクスポートが出来ました。';
EXEC ERP9AddMessage @ModuleID, '00ML000006' , @MessageValue, @Language;

SET @MessageValue = N'計算単位を入力ください。';
EXEC ERP9AddMessage @ModuleID, '00ML000007' , @MessageValue, @Language;

SET @MessageValue = N'在庫のコードを選んでください。';
EXEC ERP9AddMessage @ModuleID, '00ML000008' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải chọn Mã loại định mức.';
EXEC ERP9AddMessage @ModuleID, '00ML000009' , @MessageValue, @Language;

SET @MessageValue = N'最低レベルより大きい最大レベルを入力ください。';
EXEC ERP9AddMessage @ModuleID, '00ML000010' , @MessageValue, @Language;

SET @MessageValue = N'注文の量は最低レベルより大きいあるいは同じで最大レベルより小さいあるいは同じです。';
EXEC ERP9AddMessage @ModuleID, '00ML000011' , @MessageValue, @Language;

SET @MessageValue = N'数が大きすぎます。';
EXEC ERP9AddMessage @ModuleID, '00ML000012' , @MessageValue, @Language;

SET @MessageValue = N'対象のコードへ入力ください。';
EXEC ERP9AddMessage @ModuleID, '00ML000013' , @MessageValue, @Language;

SET @MessageValue = N'対象の名前へ入力ください。';
EXEC ERP9AddMessage @ModuleID, '00ML000014' , @MessageValue, @Language;

SET @MessageValue = N'データーが保存されました。';
EXEC ERP9AddMessage @ModuleID, '00ML000015' , @MessageValue, @Language;

SET @MessageValue = N'保存してほしですか？';
EXEC ERP9AddMessage @ModuleID, '00ML000016' , @MessageValue, @Language;

SET @MessageValue = N'コードが重なっています。他のコードを入力ください。';
EXEC ERP9AddMessage @ModuleID, '00ML000017' , @MessageValue, @Language;

SET @MessageValue = N'税コードが対象と重なっています。';
EXEC ERP9AddMessage @ModuleID, '00ML000018' , @MessageValue, @Language;

SET @MessageValue = N'続けていますか？';
EXEC ERP9AddMessage @ModuleID, '00ML000019' , @MessageValue, @Language;

SET @MessageValue = N'長さは指定されたレベルを超えています。';
EXEC ERP9AddMessage @ModuleID, '00ML000020' , @MessageValue, @Language;

SET @MessageValue = N'この対象の長さを設定してください。';
EXEC ERP9AddMessage @ModuleID, '00ML000021' , @MessageValue, @Language;

SET @MessageValue = N'完了した材料のコードへ入力ください。';
EXEC ERP9AddMessage @ModuleID, '00ML000022' , @MessageValue, @Language;

SET @MessageValue = N'完了した材料の数へ入力ください。';
EXEC ERP9AddMessage @ModuleID, '00ML000023' , @MessageValue, @Language;

SET @MessageValue = N'削除しますか？。';
EXEC ERP9AddMessage @ModuleID, '00ML000024' , @MessageValue, @Language;

SET @MessageValue = N'社員コードへ入力ください。';
EXEC ERP9AddMessage @ModuleID, '00ML000025' , @MessageValue, @Language;

SET @MessageValue = N'社員の名前へ入力ください。';
EXEC ERP9AddMessage @ModuleID, '00ML000026' , @MessageValue, @Language;

SET @MessageValue = N'データーが更新されました。';
EXEC ERP9AddMessage @ModuleID, '00ML000027' , @MessageValue, @Language;

SET @MessageValue = N'社員コードが重なっています。';
EXEC ERP9AddMessage @ModuleID, '00ML000028' , @MessageValue, @Language;

SET @MessageValue = N'Bạn không có quyền mở sổ.';
EXEC ERP9AddMessage @ModuleID, '00ML000029' , @MessageValue, @Language;

SET @MessageValue = N'この画面を作業できません。';
EXEC ERP9AddMessage @ModuleID, '00ML000030' , @MessageValue, @Language;

SET @MessageValue = N'データーを探されません。';
EXEC ERP9AddMessage @ModuleID, '00ML000031' , @MessageValue, @Language;

SET @MessageValue = N'Không tìm thấy chuỗi {0}';
EXEC ERP9AddMessage @ModuleID, '00ML000032' , @MessageValue, @Language;

SET @MessageValue = N'ファイルのリンクが探せません。もう一度選んでください。';
EXEC ERP9AddMessage @ModuleID, '00ML000033' , @MessageValue, @Language;

SET @MessageValue = N'長さは指定されたレベルを超えています。もう一度長さを設定ください。';
EXEC ERP9AddMessage @ModuleID, '00ML000034' , @MessageValue, @Language;

SET @MessageValue = N'エラー：長さが合いません。';
EXEC ERP9AddMessage @ModuleID, '00ML000035' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải nhập và số hợp lệ.';
EXEC ERP9AddMessage @ModuleID, '00ML000036' , @MessageValue, @Language;

SET @MessageValue = N'報告書が\n {0}のフォルダに依存していません。報告書が依存しているか確認ください。';
EXEC ERP9AddMessage @ModuleID, '00ML000037' , @MessageValue, @Language;

SET @MessageValue = N'{0}でフォーマットを正しく入力しません。';
EXEC ERP9AddMessage @ModuleID, '00ML000038' , @MessageValue, @Language;

SET @MessageValue = N'{0}をまだ入力しません。';
EXEC ERP9AddMessage @ModuleID, '00ML000039' , @MessageValue, @Language;

SET @MessageValue = N'{0}を長く入力します。{0}は{1}より超えてはいけません。';
EXEC ERP9AddMessage @ModuleID, '00ML000040' , @MessageValue, @Language;

SET @MessageValue = N'{0}は[{1}, {2}]の間に入力されます。';
EXEC ERP9AddMessage @ModuleID, '00ML000041' , @MessageValue, @Language;

SET @MessageValue = N'登録されました。資料が\n{0}で保存されます。';
EXEC ERP9AddMessage @ModuleID, '00ML000042' , @MessageValue, @Language;

SET @MessageValue = N'登録はユーザーに削除されますまたはエラーが発生します。';
EXEC ERP9AddMessage @ModuleID, '00ML000043' , @MessageValue, @Language;

SET @MessageValue = N'本当に削除してほしですか？入力された情報を削除します。';
EXEC ERP9AddMessage @ModuleID, '00ML000044' , @MessageValue, @Language;

SET @MessageValue = N'このデーターに対して作業できません。';
EXEC ERP9AddMessage @ModuleID, '00ML000045' , @MessageValue, @Language;

SET @MessageValue = N'Mở sổ thành công.';
EXEC ERP9AddMessage @ModuleID, '00ML000046' , @MessageValue, @Language;

SET @MessageValue = N'コードが有効ではありません。';
EXEC ERP9AddMessage @ModuleID, '00ML000047' , @MessageValue, @Language;

SET @MessageValue = N'Cập nhật dữ liệu bị xung đột với một transaction đang Cập nhật.';
EXEC ERP9AddMessage @ModuleID, '00ML000048' , @MessageValue, @Language;

SET @MessageValue = N'Ngày chứng từ không thuộc kỳ kế toán hiện tại';
EXEC ERP9AddMessage @ModuleID, '00ML000049' , @MessageValue, @Language;

SET @MessageValue = N'{0} không thuộc đơn vị hiện tại. Bạn không thể Sửa / Xóa';
EXEC ERP9AddMessage @ModuleID, '00ML000050' , @MessageValue, @Language;

SET @MessageValue = N'{0} đã khóa sổ. Bạn mở khóa sổ trước khi Sửa / Xóa';
EXEC ERP9AddMessage @ModuleID, '00ML000051' , @MessageValue, @Language;

SET @MessageValue = N'{0}使用されています。修正・削除ができません。';
EXEC ERP9AddMessage @ModuleID, '00ML000052' , @MessageValue, @Language;

SET @MessageValue = N'{0}が依存しています。他のコードを入力ください。';
EXEC ERP9AddMessage @ModuleID, '00ML000053' , @MessageValue, @Language;

SET @MessageValue = N'データーが変更されましたから修正できません。';
EXEC ERP9AddMessage @ModuleID, '00ML000054' , @MessageValue, @Language;

SET @MessageValue = N'データーが削除されましたから修正できません。';
EXEC ERP9AddMessage @ModuleID, '00ML000055' , @MessageValue, @Language;

SET @MessageValue = N'{0}削除されました。';
EXEC ERP9AddMessage @ModuleID, '00ML000056' , @MessageValue, @Language;

SET @MessageValue = N'削除されました。';
EXEC ERP9AddMessage @ModuleID, '00ML000057' , @MessageValue, @Language;

SET @MessageValue = N'Ngày hạch toán không hợp lệ!';
EXEC ERP9AddMessage @ModuleID, '00ML000058' , @MessageValue, @Language;

SET @MessageValue = N'{0}の入力が正しくありません。';
EXEC ERP9AddMessage @ModuleID, '00ML000059' , @MessageValue, @Language;

SET @MessageValue = N'情報が有効ではありません。';
EXEC ERP9AddMessage @ModuleID, '00ML000060' , @MessageValue, @Language;

SET @MessageValue = N'詳細な情報を入力ください。';
EXEC ERP9AddMessage @ModuleID, '00ML000061' , @MessageValue, @Language;

SET @MessageValue = N'保存されていません。';
EXEC ERP9AddMessage @ModuleID, '00ML000062' , @MessageValue, @Language;

SET @MessageValue = N'削除されていません。';
EXEC ERP9AddMessage @ModuleID, '00ML000063' , @MessageValue, @Language;

SET @MessageValue = N'{0} リストの中にありません';
EXEC ERP9AddMessage @ModuleID, '00ML000064' , @MessageValue, @Language;

SET @MessageValue = N'{0} が保存されています。';
EXEC ERP9AddMessage @ModuleID, '00ML000065' , @MessageValue, @Language;

SET @MessageValue = N'行をまだ選ばれていません。';
EXEC ERP9AddMessage @ModuleID, '00ML000066' , @MessageValue, @Language;

SET @MessageValue = N'データーがありません。';
EXEC ERP9AddMessage @ModuleID, '00ML000067' , @MessageValue, @Language;

SET @MessageValue = N'処理の際エラーが発生します。再作業ください。';
EXEC ERP9AddMessage @ModuleID, '00ML000068' , @MessageValue, @Language;

SET @MessageValue = N'Kỳ kế toán không tồn tại.';
EXEC ERP9AddMessage @ModuleID, '00ML000069' , @MessageValue, @Language;

SET @MessageValue = N'{0}が依存していません。再確認ください。';
EXEC ERP9AddMessage @ModuleID, '00ML000070' , @MessageValue, @Language;

SET @MessageValue = N'{0} {1} が依存しています。新しいコードが変更されました。';
EXEC ERP9AddMessage @ModuleID, '00ML000071' , @MessageValue, @Language;

SET @MessageValue = N'Số lượng nhận đã vượt quá số lượng xuất';
EXEC ERP9AddMessage @ModuleID, '00ML000072' , @MessageValue, @Language;

SET @MessageValue = N'支払いの方法が重なっています。';
EXEC ERP9AddMessage @ModuleID, '00ML000073' , @MessageValue, @Language;

SET @MessageValue = N'{0}支払いの方法が使用さています。修正・削除ができません。';
EXEC ERP9AddMessage @ModuleID, '00ML000074' , @MessageValue, @Language;

SET @MessageValue = N'{0} này đã được điều chỉnh kho. Bạn không thể Sửa / Xóa.';
EXEC ERP9AddMessage @ModuleID, '00ML000075' , @MessageValue, @Language;

SET @MessageValue = N'{0} này đã được kết chuyển. Bạn không thể Sửa / Xóa.';
EXEC ERP9AddMessage @ModuleID, '00ML000076' , @MessageValue, @Language;

SET @MessageValue = N'Kỳ kế toán {0} đã bị khóa sổ. Bạn không thể Thêm/ Sửa/ Xóa.';
EXEC ERP9AddMessage @ModuleID, '00ML000077' , @MessageValue, @Language;

SET @MessageValue = N'Kỳ kế toán hiện tại khác kỳ kế toán đầu, Bạn không được phép Thêm/Xóa/Sửa';
EXEC ERP9AddMessage @ModuleID, '00ML000079' , @MessageValue, @Language;

SET @MessageValue = N'この内容をアクセスできません。';
EXEC ERP9AddMessage @ModuleID, '00ML000080' , @MessageValue, @Language;

SET @MessageValue = N'この{0}が使用されています。削除できません。';
EXEC ERP9AddMessage @ModuleID, '00ML000081' , @MessageValue, @Language;

SET @MessageValue = N'この{0}が使用されています。削除できません。';
EXEC ERP9AddMessage @ModuleID, '00ML000082' , @MessageValue, @Language;

SET @MessageValue = N'{0}：メールのフォーマットが有効ではありません。';
EXEC ERP9AddMessage @ModuleID, '00ML000083' , @MessageValue, @Language;

SET @MessageValue = N'内容が引き渡されません。';
EXEC ERP9AddMessage @ModuleID, '00ML000084' , @MessageValue, @Language;

SET @MessageValue = N'{0} phải chọn ngày trong kỳ.';
EXEC ERP9AddMessage @ModuleID, '00ML000085' , @MessageValue, @Language;

SET @MessageValue = N'Giá trị nhập trên [{0}] không khớp với giá trị trên [{0}]';
EXEC ERP9AddMessage @ModuleID, '00ML000086' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa thiết lập mail server';
EXEC ERP9AddMessage @ModuleID, '00ML000097' , @MessageValue, @Language;

SET @MessageValue = N'Quá trình: {0} gặp lỗi!';
EXEC ERP9AddMessage @ModuleID, '00ML000125' , @MessageValue, @Language;

SET @MessageValue = N'{0} can not be smaller then {1}'
EXEC ERP9AddMessage @ModuleID, '00ML000184' , @MessageValue, @Language;

SET @MessageValue = N'{0} can not be greater then {1}'
EXEC ERP9AddMessage @ModuleID, '00ML000185' , @MessageValue, @Language;

--- Modify by Tấn Thành on 05/08/2020
SET @MessageValue=N'You have a new message!'
EXEC ERP9AddMessage @ModuleID,'00ML000222', @MessageValue, @Language;

--- Modify by Vĩnh Tâm on 02/10/2020
SET @MessageValue=N'Authenticate fail! Login cout: {0}.'
EXEC ERP9AddMessage @ModuleID,'00ML000223', @MessageValue, @Language;

SET @MessageValue=N'You are assigned a/an {0}: {1}'
EXEC ERP9AddMessage @ModuleID,'00ML000228', @MessageValue, @Language;

SET @MessageValue=N'You have just been assigned a {1} priority {0}: {2}'
EXEC ERP9AddMessage @ModuleID,'00ML000229', @MessageValue, @Language;
