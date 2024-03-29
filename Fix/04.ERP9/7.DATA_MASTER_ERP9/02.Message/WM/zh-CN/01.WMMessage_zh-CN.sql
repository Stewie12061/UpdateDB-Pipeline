DECLARE @ModuleID VARCHAR(10),
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
SET @Language = 'zh-CN'
SET @ModuleID = 'WM'

SET @MessageValue=N'您必須輸入到   日！'
EXEC ERP9AddMessage @ModuleID,'WFML000195', @MessageValue, @Language;

SET @MessageValue=N'請選擇規格！'
EXEC ERP9AddMessage @ModuleID,'WFML000199', @MessageValue, @Language;

SET @MessageValue=N'請選擇同階段優惠券'
EXEC ERP9AddMessage @ModuleID,'WFML000202', @MessageValue, @Language;

SET @MessageValue=N'第 {0} 階段（共 {1} 個）：總數量超過生產數量（{2} 個產品）'
EXEC ERP9AddMessage @ModuleID,'WFML000207', @MessageValue, @Language;

SET @MessageValue=N'參數個數不正確，請重新檢查！'
EXEC ERP9AddMessage @ModuleID,'WFML000208', @MessageValue, @Language;

SET @MessageValue=N'請選擇同一對象的投票'
EXEC ERP9AddMessage @ModuleID,'WFML000214', @MessageValue, @Language;

SET @MessageValue=N'更改 SQL 執行方式將刪除該 Statement 或 Stored 以及網格上的所有數據，是否繼續？'
EXEC ERP9AddMessage @ModuleID,'WFML000220', @MessageValue, @Language;

SET @MessageValue=N'更改對象將刪除所有執行條件和新增的操作，是否繼續？'
EXEC ERP9AddMessage @ModuleID,'WFML000221', @MessageValue, @Language;

SET @MessageValue=N'這種關係已經存在。 你無法保存！'
EXEC ERP9AddMessage @ModuleID,'WFML000222', @MessageValue, @Language;

SET @MessageValue=N'程式碼重複！ 請再次輸入另一個代碼'
EXEC ERP9AddMessage @ModuleID,'WFML000225', @MessageValue, @Language;

SET @MessageValue=N'數據太大了！ 請選擇評價較低的套裝。'
EXEC ERP9AddMessage @ModuleID,'WFML000228', @MessageValue, @Language;

SET @MessageValue=N'BOM {0} 已在使用，無法刪除。'
EXEC ERP9AddMessage @ModuleID,'WFML000238', @MessageValue, @Language;

SET @MessageValue=N'文件下載過程失敗。'
EXEC ERP9AddMessage @ModuleID,'WFML000245', @MessageValue, @Language;

SET @MessageValue=N'不要讓商務桌空著！'
EXEC ERP9AddMessage @ModuleID,'WFML000251', @MessageValue, @Language;

SET @MessageValue=N'您的促銷活動符合資格 {0}，需要批准'
EXEC ERP9AddMessage @ModuleID,'WFML000258', @MessageValue, @Language;

SET @MessageValue=N'生產資訊表「{0}」：交貨時間小於生產完成時間'
EXEC ERP9AddMessage @ModuleID,'WFML000264', @MessageValue, @Language;

SET @MessageValue=N'從關聯用戶中刪除了{0}。'
EXEC ERP9AddMessage @ModuleID,'WFML000271', @MessageValue, @Language;

SET @MessageValue=N'當儀表板數量大於 {0} 時，工作區可能載入緩慢！ 你還要加嗎？'
EXEC ERP9AddMessage @ModuleID,'WFML000275', @MessageValue, @Language;

SET @MessageValue=N'請選擇行動！'
EXEC ERP9AddMessage @ModuleID,'WFML000276', @MessageValue, @Language;

SET @MessageValue=N'請選擇參考資料！'
EXEC ERP9AddMessage @ModuleID,'WFML000277', @MessageValue, @Language;

SET @MessageValue=N'生產人員超標！ 員工總數上限：{0} 人。'
EXEC ERP9AddMessage @ModuleID,'WFML000282', @MessageValue, @Language;

SET @MessageValue=N'儲存不存在，請重新檢查！'
EXEC ERP9AddMessage @ModuleID,'WFML000283', @MessageValue, @Language;


SET @MessageValue=N'該提案已獲得批准。您無法編輯或刪除。您是否想查看？'
EXEC ERP9AddMessage @ModuleID,'WMFML000058', @MessageValue, @Language;


SET @MessageValue=N'您必須輸入估價資訊！'
EXEC ERP9AddMessage @ModuleID,'WMFML000061', @MessageValue, @Language;


SET @MessageValue=N'請輸入所有必需的目的地數據'
EXEC ERP9AddMessage @ModuleID,'WMFML000084', @MessageValue, @Language;