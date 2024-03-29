/*
=====================================================================
--- Script message tiếng Việt
--- select * from a00002 where id like'%MTFML%'
--- Delete from a00002 where id ='MTFML000001'
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
SET @Language ='zh-CN' 
SET @ModuleID ='00';
SET @FormID ='A00';
------------------------------------------------------------------------------------------------------
-- Button
------------------------------------------------------------------------------------------------------
SET @MessageValue = N'Bạn có muốn lưu?';
EXEC ERP9AddMessage @ModuleID,'A00ML000001' , @MessageValue, @Language;

SET @MessageValue = N'Bạn có muốn xóa?';
EXEC ERP9AddMessage @ModuleID,'A00ML000002' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa chọn dòng nào.';
EXEC ERP9AddMessage @ModuleID,'A00ML000003' , @MessageValue, @Language;

SET @MessageValue = N'Không có dữ liệu.';
EXEC ERP9AddMessage @ModuleID,'A00ML000004' , @MessageValue, @Language;

SET @MessageValue = N'Lưu không thành công.';
EXEC ERP9AddMessage @ModuleID,'A00ML000005' , @MessageValue, @Language;

SET @MessageValue = N'Xóa không thành công.';
EXEC ERP9AddMessage @ModuleID,'A00ML000006' , @MessageValue, @Language;

SET @MessageValue = N'Thông tin đăng nhập không đúng, vui lòng kiểm tra lại.';
EXEC ERP9AddMessage @ModuleID,'A00ML000007' , @MessageValue, @Language;

SET @MessageValue = N'Khóa sổ thành công.';
EXEC ERP9AddMessage @ModuleID,'A00ML000008' , @MessageValue, @Language;

SET @MessageValue = N'Khóa sổ không thành công.';
EXEC ERP9AddMessage @ModuleID,'A00ML000009' , @MessageValue, @Language;

SET @MessageValue = N'Mở sổ thành công.';
EXEC ERP9AddMessage @ModuleID,'A00ML000010' , @MessageValue, @Language;

SET @MessageValue = N'Mở sổ không thành công.';
EXEC ERP9AddMessage @ModuleID,'A00ML000011' , @MessageValue, @Language;

SET @MessageValue = N'Kỳ kế toán không tồn tại.';
EXEC ERP9AddMessage @ModuleID,'A00ML000012' , @MessageValue, @Language;

SET @MessageValue = N'Thiết lập hệ thống không thành công.';
EXEC ERP9AddMessage @ModuleID,'A00ML000013' , @MessageValue, @Language;

SET @MessageValue = N'Có lỗi trong quá trình xử lý. Vui lòng thực hiện lại thao tác.';
EXEC ERP9AddMessage @ModuleID,'A00ML000014' , @MessageValue, @Language;

SET @MessageValue = N'Các ký tự không được phép nhập tại [{0}]';
EXEC ERP9AddMessage @ModuleID,'A00ML000015' , @MessageValue, @Language;

SET @MessageValue = N'[{0}] không có trong danh sách.';
EXEC ERP9AddMessage @ModuleID,'A00ML000016' , @MessageValue, @Language;

SET @MessageValue = N'Đã lưu thành công [{0}].';
EXEC ERP9AddMessage @ModuleID,'A00ML000017' , @MessageValue, @Language;

------------------------------------------------------------------------------------------------------
-- New Key
------------------------------------------------------------------------------------------------------
SET @MessageValue = N'網格上有資料。您想要更換嗎？選擇 YES 進行替換，選擇 NO 進行新增。';
EXEC ERP9AddMessage @ModuleID,'00FML000230' , @MessageValue, @Language;

SET @MessageValue = N'{0} 必須早於或等於 {1}。';
EXEC ERP9AddMessage @ModuleID,'00FML000231' , @MessageValue, @Language;

SET @MessageValue = N'{0} 必須等於或晚於 {1}。';
EXEC ERP9AddMessage @ModuleID,'00FML000232' , @MessageValue, @Language;

SET @MessageValue = N'優惠券已獲批准。您只能編輯部分資訊（訂單狀態、描述）！';
EXEC ERP9AddMessage @ModuleID,'00FML000233' , @MessageValue, @Language;

SET @MessageValue = N'您必須從列表中選擇。';
EXEC ERP9AddMessage @ModuleID,'00ML000001' , @MessageValue, @Language;

SET @MessageValue = N'請重置此産品代碼.';
EXEC ERP9AddMessage @ModuleID,'00ML000002' , @MessageValue, @Language;

SET @MessageValue = N'請輸入産品代碼.';
EXEC ERP9AddMessage @ModuleID,'00ML000003' , @MessageValue, @Language;

SET @MessageValue = N'請輸入産品名稱。';
EXEC ERP9AddMessage @ModuleID,'00ML000004' , @MessageValue, @Language;

SET @MessageValue = N'請選擇庫存帳戶。';
EXEC ERP9AddMessage @ModuleID,'00ML000005' , @MessageValue, @Language;

SET @MessageValue = N'已成功導出 {0}文件';
EXEC ERP9AddMessage @ModuleID,'00ML000006' , @MessageValue, @Language;

SET @MessageValue = N'您必須輸入計算單位。';
EXEC ERP9AddMessage @ModuleID,'00ML000007' , @MessageValue, @Language;

SET @MessageValue = N'您必須選擇倉庫代碼。';
EXEC ERP9AddMessage @ModuleID,'00ML000008' , @MessageValue, @Language;

SET @MessageValue = N'您必須選擇定額類型代碼。';
EXEC ERP9AddMessage @ModuleID,'00ML000009' , @MessageValue, @Language;

SET @MessageValue = N'您輸入的最大值必須大于最小值。';
EXEC ERP9AddMessage @ModuleID,'00ML000010' , @MessageValue, @Language;

SET @MessageValue = N'再訂購金額必須大于或等于最小金額且小于或等于最大金額。';
EXEC ERP9AddMessage @ModuleID,'00ML000011' , @MessageValue, @Language;

SET @MessageValue = N'數量太大。';
EXEC ERP9AddMessage @ModuleID,'00ML000012' , @MessageValue, @Language;

SET @MessageValue = N'您必須輸入對象代碼。';
EXEC ERP9AddMessage @ModuleID,'00ML000013' , @MessageValue, @Language;

SET @MessageValue = N'您必須輸入對象名稱。';
EXEC ERP9AddMessage @ModuleID,'00ML000014' , @MessageValue, @Language;

SET @MessageValue = N'數據已成功保存。';
EXEC ERP9AddMessage @ModuleID,'00ML000015' , @MessageValue, @Language;

SET @MessageValue = N'您想保存嗎？';
EXEC ERP9AddMessage @ModuleID,'00ML000016' , @MessageValue, @Language;

SET @MessageValue = N'代碼重複，請重新輸入另一個代碼。';
EXEC ERP9AddMessage @ModuleID,'00ML000017' , @MessageValue, @Language;

SET @MessageValue = N'稅碼與對象重複。';
EXEC ERP9AddMessage @ModuleID,'00ML000018' , @MessageValue, @Language;

SET @MessageValue = N'您想繼續？';
EXEC ERP9AddMessage @ModuleID,'00ML000019' , @MessageValue, @Language;

SET @MessageValue = N'長度超過規定的限制。';
EXEC ERP9AddMessage @ModuleID,'00ML000020' , @MessageValue, @Language;

SET @MessageValue = N'請重置該對象的長度';
EXEC ERP9AddMessage @ModuleID,'00ML000021' , @MessageValue, @Language;

SET @MessageValue = N'您必須輸入成品物料代碼';
EXEC ERP9AddMessage @ModuleID,'00ML000022' , @MessageValue, @Language;

SET @MessageValue = N'您必須輸入成品材料的數量';
EXEC ERP9AddMessage @ModuleID,'00ML000023' , @MessageValue, @Language;

SET @MessageValue = N'您想刪除嗎？';
EXEC ERP9AddMessage @ModuleID,'00ML000024' , @MessageValue, @Language;

SET @MessageValue = N'請輸入員工代碼。';
EXEC ERP9AddMessage @ModuleID,'00ML000025' , @MessageValue, @Language;

SET @MessageValue = N'請輸入員工姓名。';
EXEC ERP9AddMessage @ModuleID,'00ML000026' , @MessageValue, @Language;

SET @MessageValue = N'數據已成功更新。';
EXEC ERP9AddMessage @ModuleID,'00ML000027' , @MessageValue, @Language;

SET @MessageValue = N'員工代碼重複。';
EXEC ERP9AddMessage @ModuleID,'00ML000028' , @MessageValue, @Language;

SET @MessageValue = N'您沒有開賬的權限。';
EXEC ERP9AddMessage @ModuleID,'00ML000029' , @MessageValue, @Language;

SET @MessageValue = N'您對此屏幕沒有權限。';
EXEC ERP9AddMessage @ModuleID,'00ML000030' , @MessageValue, @Language;

SET @MessageValue = N'未找到數據。';
EXEC ERP9AddMessage @ModuleID,'00ML000031' , @MessageValue, @Language;

SET @MessageValue = N'未找到{0}鏈';
EXEC ERP9AddMessage @ModuleID,'00ML000032' , @MessageValue, @Language;

SET @MessageValue = N'找不到文件路徑。 您應該重新選擇。';
EXEC ERP9AddMessage @ModuleID,'00ML000033' , @MessageValue, @Language;

SET @MessageValue = N'長度超出規定的限制。\n請重置此票據的長度。';
EXEC ERP9AddMessage @ModuleID,'00ML000034' , @MessageValue, @Language;

SET @MessageValue = N'錯誤：長度無效！';
EXEC ERP9AddMessage @ModuleID,'00ML000035' , @MessageValue, @Language;

SET @MessageValue = N'您必須輸入有效的號碼。';
EXEC ERP9AddMessage @ModuleID,'00ML000036' , @MessageValue, @Language;

SET @MessageValue = N'此文件夾中不存在報告\n {0}。 請檢查該報告是否存在！';
EXEC ERP9AddMessage @ModuleID,'00ML000037' , @MessageValue, @Language;

SET @MessageValue = N'您在 {0}輸入的格式錯誤。';
EXEC ERP9AddMessage @ModuleID,'00ML000038' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chưa nhập {0}';
EXEC ERP9AddMessage @ModuleID,'00ML000039' , @MessageValue, @Language;

SET @MessageValue = N'您輸入的 {0}太長。 {0}不能超過 {1} 個字符。';
EXEC ERP9AddMessage @ModuleID,'00ML000040' , @MessageValue, @Language;

SET @MessageValue = N'{0}只能輸入[{1},{2}]範圍內的數值。';
EXEC ERP9AddMessage @ModuleID,'00ML000041' , @MessageValue, @Language;

SET @MessageValue = N'簽署成功。 文檔保存在文件夾：\n{0}';
EXEC ERP9AddMessage @ModuleID,'00ML000042' , @MessageValue, @Language;

SET @MessageValue = N'簽名過程已被用戶取消或出現錯誤。';
EXEC ERP9AddMessage @ModuleID,'00ML000043' , @MessageValue, @Language;

SET @MessageValue = N'您是否確定？ 此操作將刪除之前輸入的信息。';
EXEC ERP9AddMessage @ModuleID,'00ML000044' , @MessageValue, @Language;

SET @MessageValue = N'您對此數據沒有權限。';
EXEC ERP9AddMessage @ModuleID,'00ML000045' , @MessageValue, @Language;

SET @MessageValue = N'開賬成功。';
EXEC ERP9AddMessage @ModuleID,'00ML000046' , @MessageValue, @Language;

SET @MessageValue = N'代碼無效。';
EXEC ERP9AddMessage @ModuleID,'00ML000047' , @MessageValue, @Language;

SET @MessageValue = N'更新數據與正在更新的交易沖突。';
EXEC ERP9AddMessage @ModuleID,'00ML000048' , @MessageValue, @Language;

SET @MessageValue = N'單據日期不屬于當前會計期間';
EXEC ERP9AddMessage @ModuleID,'00ML000049' , @MessageValue, @Language;

SET @MessageValue = N'{0} 不屬於目前單位。您無法編輯/刪除';
EXEC ERP9AddMessage @ModuleID,'00ML000050' , @MessageValue, @Language;

SET @MessageValue = N'{0}已結賬。 您在修改/刪除之前解鎖凍結';
EXEC ERP9AddMessage @ModuleID,'00ML000051' , @MessageValue, @Language;

SET @MessageValue = N'{0} này đã được sử dụng. Bạn không thể Sửa / Xóa';
EXEC ERP9AddMessage @ModuleID,'00ML000052' , @MessageValue, @Language;

SET @MessageValue = N'{0}已存在。 請輸入另一個代碼！';
EXEC ERP9AddMessage @ModuleID,'00ML000053' , @MessageValue, @Language;

SET @MessageValue = N'由于數據已更改，不允許修改';
EXEC ERP9AddMessage @ModuleID,'00ML000054' , @MessageValue, @Language;

SET @MessageValue = N'不允許修改因爲數據已被刪除';
EXEC ERP9AddMessage @ModuleID,'00ML000055' , @MessageValue, @Language;

SET @MessageValue = N'{0}刪除成功。';
EXEC ERP9AddMessage @ModuleID,'00ML000056' , @MessageValue, @Language;

SET @MessageValue = N'刪除成功';
EXEC ERP9AddMessage @ModuleID,'00ML000057' , @MessageValue, @Language;

SET @MessageValue = N'核算日期無效！';
EXEC ERP9AddMessage @ModuleID,'00ML000058' , @MessageValue, @Language;

SET @MessageValue = N'您輸入的{0}不正確！';
EXEC ERP9AddMessage @ModuleID,'00ML000059' , @MessageValue, @Language;

SET @MessageValue = N'信息無效！';
EXEC ERP9AddMessage @ModuleID,'00ML000060' , @MessageValue, @Language;

SET @MessageValue = N'您必須輸入相信信息！';
EXEC ERP9AddMessage @ModuleID,'00ML000061' , @MessageValue, @Language;

SET @MessageValue = N'保存失敗！';
EXEC ERP9AddMessage @ModuleID,'00ML000062' , @MessageValue, @Language;
	
SET @MessageValue = N'刪除失敗！';
EXEC ERP9AddMessage @ModuleID,'00ML000063' , @MessageValue, @Language;

SET @MessageValue = N'{0}不在列表中';
EXEC ERP9AddMessage @ModuleID,'00ML000064' , @MessageValue, @Language;

SET @MessageValue = N'{0}保存成功';
EXEC ERP9AddMessage @ModuleID,'00ML000065' , @MessageValue, @Language;

SET @MessageValue = N'您尚未選擇任何行。';
EXEC ERP9AddMessage @ModuleID,'00ML000066' , @MessageValue, @Language;

SET @MessageValue = N'沒有數據';
EXEC ERP9AddMessage @ModuleID,'00ML000067' , @MessageValue, @Language;

SET @MessageValue = N'處理過程中出現錯誤。 請重新進行操作。';
EXEC ERP9AddMessage @ModuleID,'00ML000068' , @MessageValue, @Language;

SET @MessageValue = N'會計期間不存在';
EXEC ERP9AddMessage @ModuleID,'00ML000069' , @MessageValue, @Language;

SET @MessageValue = N'{0}不存在。 請再檢查一次。';
EXEC ERP9AddMessage @ModuleID, '00ML000070' , @MessageValue, @Language;

SET @MessageValue = N'{0}{1} 已存在。 新代碼變更成功！';
EXEC ERP9AddMessage @ModuleID, '00ML000071' , @MessageValue, @Language;

SET @MessageValue = N'收到的數量超過輸出的數量';
EXEC ERP9AddMessage @ModuleID, '00ML000072' , @MessageValue, @Language;

SET @MessageValue = N'付款方式重複';
EXEC ERP9AddMessage @ModuleID, '00ML000073' , @MessageValue, @Language;

SET @MessageValue = N'{0}的付款方式已在使用。 您無法修改/刪除';
EXEC ERP9AddMessage @ModuleID, '00ML000074' , @MessageValue, @Language;

SET @MessageValue = N'此{0}已被調整倉庫。 您無法修改/刪除';
EXEC ERP9AddMessage @ModuleID, '00ML000075' , @MessageValue, @Language;

SET @MessageValue = N'該{0}已被結轉。 您無法修改/刪除';
EXEC ERP9AddMessage @ModuleID, '00ML000076' , @MessageValue, @Language;

SET @MessageValue = N'{0}的會計期間已結賬。 您無法添加/修改/刪除';
EXEC ERP9AddMessage @ModuleID, '00ML000077' , @MessageValue, @Language;

SET @MessageValue = N'當前會計期間與初始會計期間不同，不允許添加/刪除/修改';
EXEC ERP9AddMessage @ModuleID, '00ML000079' , @MessageValue, @Language;

SET @MessageValue = N'您沒有訪問該內容的權限';
EXEC ERP9AddMessage @ModuleID, '00ML000080' , @MessageValue, @Language;

SET @MessageValue = N'此 {0} 已被使用。您無法刪除';
EXEC ERP9AddMessage @ModuleID, '00ML000081' , @MessageValue, @Language;

SET @MessageValue = N'{0}已在使用，您無法刪除！';
EXEC ERP9AddMessage @ModuleID, '00ML000082' , @MessageValue, @Language;

SET @MessageValue = N'{0}：格式不正確';
EXEC ERP9AddMessage @ModuleID, '00ML000083' , @MessageValue, @Language;

SET @MessageValue = N'內容不能爲空';
EXEC ERP9AddMessage @ModuleID, '00ML000084' , @MessageValue, @Language;

SET @MessageValue = N'{0}必須選擇期間內的日期';
EXEC ERP9AddMessage @ModuleID, '00ML000085' , @MessageValue, @Language;

SET @MessageValue = N'[{0}] 上輸入的數值與 [{0}] 上輸入的數值不匹配';
EXEC ERP9AddMessage @ModuleID, '00ML000086' , @MessageValue, @Language;

SET @MessageValue = N'會計期間不存在！';
EXEC ERP9AddMessage @ModuleID, '00ML000089' , @MessageValue, @Language;

SET @MessageValue = N'長度{0}超出了指定的等級。請再檢查一次！';
EXEC ERP9AddMessage @ModuleID, '00ML000092' , @MessageValue, @Language;

SET @MessageValue = N'您尚未設置郵件服務器';
EXEC ERP9AddMessage @ModuleID, '00ML000097' , @MessageValue, @Language;

SET @MessageValue = N'長度超出規定的限制。\n請重置對象長度！';
EXEC ERP9AddMessage @ModuleID, '00ML000098' , @MessageValue, @Language;

SET @MessageValue = N'長度超過指定的限制。\n請重設項目長度。';
EXEC ERP9AddMessage @ModuleID, '00ML000099' , @MessageValue, @Language;

SET @MessageValue = N'您無權更改屬于該分支機構的用戶密碼';
EXEC ERP9AddMessage @ModuleID, '00ML000100' , @MessageValue, @Language;

SET @MessageValue = N'您當前的帳戶已在其他地方登錄！<br>您想保持登錄狀態！';
EXEC ERP9AddMessage @ModuleID, '00ML000108' , @MessageValue, @Language;

SET @MessageValue = N'您的帳戶已在其他地方登錄！';
EXEC ERP9AddMessage @ModuleID, '00ML000109' , @MessageValue, @Language;

SET @MessageValue = N'下次登入時不顯示';
EXEC ERP9AddMessage @ModuleID, '00ML000110' , @MessageValue, @Language;

SET @MessageValue = N'這是該軟體的使用說明。你想要指導嗎？';
EXEC ERP9AddMessage @ModuleID, '00ML000111' , @MessageValue, @Language;

SET @MessageValue = N'{0}的角色已有子角色。您必須先刪除子角色！';
EXEC ERP9AddMessage @ModuleID, '00ML000112' , @MessageValue, @Language;

SET @MessageValue = N'Tiền thanh toán phải lớn hơn 0!';
EXEC ERP9AddMessage @ModuleID, '00ML000116' , @MessageValue, @Language;

SET @MessageValue = N'{0} đã được duyệt. Bạn không được phép sửa /xóa!';
EXEC ERP9AddMessage @ModuleID, '00ML000117' , @MessageValue, @Language;

SET @MessageValue = N'Tổng {0} chưa đủ 100%, Bạn vui lòng kiểm tra lại!';
EXEC ERP9AddMessage @ModuleID, '00ML000118' , @MessageValue, @Language;

SET @MessageValue = N'Tổng chi tiết của nhóm tỷ trọng {0} chưa đủ 100%, Bạn vui lòng kiểm tra lại!';
EXEC ERP9AddMessage @ModuleID, '00ML000119' , @MessageValue, @Language;

SET @MessageValue = N'Nhóm chỉ tiêu {0} có {1} % khác nhau, Bạn vui lòng kiểm tra lại!';
EXEC ERP9AddMessage @ModuleID, '00ML000120' , @MessageValue, @Language;

SET @MessageValue = N'Kết quả in/xuất báo cáo lớn hơn {0} sẽ gây chậm. Bạn có muốn tiếp tục in/xuất báo cáo?';
EXEC ERP9AddMessage @ModuleID, '00ML000121' , @MessageValue, @Language;

SET @MessageValue = N'Bạn chỉ được chọn 1 dòng!';
EXEC ERP9AddMessage @ModuleID, '00ML000126' , @MessageValue, @Language;

SET @MessageValue = N'Quá trình: {0} gặp lỗi!';
EXEC ERP9AddMessage @ModuleID, '00ML000125' , @MessageValue, @Language;

SET @MessageValue = N'Bạn phải nhập điều kiện lọc đầy đủ và hợp lệ !';
EXEC ERP9AddMessage @ModuleID, '00ML000128' , @MessageValue, @Language;

SET @MessageValue = N'Số lượng trong kho {0} không đủ để xuất';
EXEC ERP9AddMessage @ModuleID, '00ML000158' , @MessageValue, @Language;


SET @MessageValue = N'Không được phân ca từ ngày {0} trở về sau cho nhân viên {1}!'
EXEC ERP9AddMessage @ModuleID, 'OOFML000053' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn phải phân ca thử việc vào các ngày {0} cho nhân viên {1}!'
EXEC ERP9AddMessage @ModuleID, 'OOFML000065' , @MessageValue, @Language; 

SET @MessageValue = N'Không được xin phép trước ngày {0} cho nhân viên {1}!'
EXEC ERP9AddMessage @ModuleID, 'OOFML000066' , @MessageValue, @Language; 

SET @MessageValue = N'Không được xin phép trước từ ngày {0} trở về sau cho nhân viên {1}!'
EXEC ERP9AddMessage @ModuleID, 'OOFML000067' , @MessageValue, @Language; 

SET @MessageValue = N'Bạn phải phân ca thử việc cho nhân viên {0} từ ngày {1} đến ngày {2}!'
EXEC ERP9AddMessage @ModuleID, 'OOFML000064' , @MessageValue, @Language; 

SET @MessageValue = N'Mã {0} bị trùng.'
EXEC ERP9AddMessage @ModuleID, 'CSFML000003' , @MessageValue, @Language; 

SET @MessageValue = N'{0} bị trùng.'
EXEC ERP9AddMessage @ModuleID, 'OOFML000077' , @MessageValue, @Language; 

SET @MessageValue = N'[{0}] không có trong danh sách.';
EXEC ERP9AddMessage @ModuleID,'OOFML000038' , @MessageValue, @Language;

SET @MessageValue = N'[{0}] không có trong danh sách.';
EXEC ERP9AddMessage @ModuleID,'00ML000130' , @MessageValue, @Language;

SET @MessageValue = N'Tổ nhóm không thuộc phòng ban hiện tại.';
EXEC ERP9AddMessage @ModuleID,'00ML000133' , @MessageValue, @Language;

SET @MessageValue = N'Tên nhân viên và mã nhân viên không đồng nhất.';
EXEC ERP9AddMessage @ModuleID,'OOFML000009' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên [{0}] chưa được phân ca trong kỳ.';
EXEC ERP9AddMessage @ModuleID,'OOFML000068' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên không thuộc phòng ban hiện tại.';
EXEC ERP9AddMessage @ModuleID,'00ML000134' , @MessageValue, @Language;

SET @MessageValue = N'Nhân viên không thuộc tổ nhóm hiện tại.';
EXEC ERP9AddMessage @ModuleID,'00ML000135' , @MessageValue, @Language;

SET @MessageValue = N'Không được phân ca trước ngày {0} cho nhân viên {1}.';
EXEC ERP9AddMessage @ModuleID,'OOFML000049' , @MessageValue, @Language;

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
SET @MessageValue=N'本產品沒有設定額定值，請為本產品設定設定額定值'
EXEC ERP9AddMessage @ModuleID,'ASML000108', @MessageValue, @Language;