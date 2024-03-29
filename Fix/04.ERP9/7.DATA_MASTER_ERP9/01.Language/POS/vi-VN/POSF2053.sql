-----------------------------------------------------------------------------------------------------
-- Script tạo ngôn ngữ OOF2010- OO
------------------------------------------------------------------------------------------------------
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
SET @ModuleID = 'POS';

/*
--Lấy Query nhanh
SELECT 'SET @LanguageValue = N''_''; EXEC ERP9AddLanguage @ModuleID, '''+IDLanguage+''' , @FormID, @LanguageValue, @Language;' FROM dbo.sysLanguage WHERE ScreenID =N'POSF2053'
*/
--POSF2053
SET @FormID ='POSF2053';

SET @LanguageValue = N'Điều phối nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF2053.Title' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên giao hàng'; 
EXEC ERP9AddLanguage @ModuleID, 'POSF2053.DeliveryEmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Đơn vị'; 
EXEC ERP9AddLanguage @ModuleID, 'POSF2053.DivisionID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên bảo hành';
EXEC ERP9AddLanguage @ModuleID, 'POSF2053.GuaranteeEmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Nhân viên sửa chữa'; 
EXEC ERP9AddLanguage @ModuleID, 'POSF2053.RepairEmployeeID' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Số phiếu yêu cầu dịch vụ'; 
EXEC ERP9AddLanguage @ModuleID, 'POSF2053.VoucherNo' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên'; 
EXEC ERP9AddLanguage @ModuleID, 'POSF2053.DeliveryEmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên'; 
EXEC ERP9AddLanguage @ModuleID, 'POSF2053.DeliveryEmployeeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF2053.GuaranteeEmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên';
EXEC ERP9AddLanguage @ModuleID, 'POSF2053.GuaranteeEmployeeName.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Mã nhân viên'; 
EXEC ERP9AddLanguage @ModuleID, 'POSF2053.RepairEmployeeID.CB' , @FormID, @LanguageValue, @Language;

SET @LanguageValue = N'Tên nhân viên'; 
EXEC ERP9AddLanguage @ModuleID, 'POSF2053.RepairEmployeeName.CB' , @FormID, @LanguageValue, @Language;









