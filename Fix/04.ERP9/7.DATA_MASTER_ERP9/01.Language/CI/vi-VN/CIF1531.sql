------------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ CIF1531
-----------------------------------------------------------------------------------------------------
DECLARE
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(10),
------------------------------------------------------------------------------------------------------
-- Tham so gen tu dong
------------------------------------------------------------------------------------------------------
@LanguageValue NVARCHAR(4000),

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
@Finished BIT
------------------------------------------------------------------------------------------------------
-- Gan gia tri tham so va thu thi truy van
------------------------------------------------------------------------------------------------------
/*
 - Tieng Viet: vi-VN 
 - Tieng Anh: en-US 
 - Tieng Nhat: ja-JP
 - Tieng Trung: zh-CN
*/
SET @Language = 'vi-VN' 
SET @ModuleID = 'CI';
SET @FormID = 'CIF1531';
------------------------------------------------------------------------------------------------------
--- Title
SET @LanguageValue = N'Cập nhật ví chiết khấu khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử tích lũy chiết khấu';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.AddDiscount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Lịch sử dùng chiết khấu';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.UsedDiscount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Quản lý tiền cọc theo chương trình';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.ManagerDiscount' , @FormID, @LanguageValue, @Language;
-----------------------------------------------------------------------------------------------------

SET @LanguageValue = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.ObjectID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng chiết khấu giá trị khả dụng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.SumDiscountValue' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tổng chiết khấu tỉ lệ khả dụng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.SumDiscountRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Danh sách quà tặng khả dụng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.ListInventoryGiftName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.SOrderID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.OrderDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Giá trị đơn hàng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.OrderAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chiết khấu giá trị';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.DiscountValue' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chiết khấu tỉ lệ (%)';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.DiscountRate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã quà tặng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.InventoryGiftID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên quà tặng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.InventoryGiftName' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số lượng quà tặng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.GiftQuantity' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.Notes' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Loại chiết khấu';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.DiscountTypeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày trả quà';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.GiftDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Ngày sử dụng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.UsedDate' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Khả dụng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.IsAvailable' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.ObjectID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.ObjectID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên đối tượng';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.ObjectName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Chương trình khuyến mãi';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.PromoteID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Điểm';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.DiscountScores' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã điều kiện';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.ConditionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền cọc';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.DepositAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền đã chi';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.TatolPaidAmount' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số tiền còn lại';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.RemainedAmount' , @FormID, @LanguageValue, @Language;


SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.PromoteID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.PromoteName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.ConditionID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên';
EXEC ERP9AddLanguage @ModuleID, 'CIF1531.ConditionName.CB' , @FormID, @LanguageValue, @Language;

------------------------------------------------------------------------------------------------------
-- Finished
------------------------------------------------------------------------------------------------------
SET @Finished = 0;