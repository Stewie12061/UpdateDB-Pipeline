DECLARE 
@ModuleID VARCHAR(10),
@FormID VARCHAR(200),
@Language VARCHAR(200),
--------------------------------------------------------
@LanguageValue NVARCHAR(4000)
--------------------------------------------------------

SET @Language = 'vi-VN';
SET @ModuleID = 'KPI';
SET @FormID = 'KPIF1011'
---------------------------------------------------------------

SET @LanguageValue  = N'Cập nhật nhóm chỉ tiêu'
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.Title',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.DivisionID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Mã nhóm chỉ tiêu';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.TargetsGroupID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Tên nhóm chỉ tiêu';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.TargetsGroupName',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Thứ tự nhóm';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.OrderNo',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Loại đánh giá';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.TargetsTypeID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Tỷ trọng';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.Percentage',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Điểm';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.Goal',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.Note',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Dùng chung';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.IsCommon',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Không hiển thị';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.Disabled',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Người tạo';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.CreateUserID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Ngày tạo';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.CreateDate',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Người cập nhật';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.LastModifyUserID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Ngày cập nhật';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.LastModifyDate',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Đính kèm';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.TabCRMT00002',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Ghi chú';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.TabCRMT90031',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Lịch sử';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.TabCRMT00003',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Thông tin nhóm chỉ tiêu';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.ThongTinNhomChiTieu',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Đánh giá KPI';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.RatedKPI',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Đánh giá năng lực';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.RatedCapacity',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.DepartmentID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Đợt đánh giá';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.EvaluationPhaseID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Mã đợt đánh giá';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.EvaluationPhaseID.CB',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Tên đợt đánh giá';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.EvaluationPhaseName.CB',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.DepartmentID',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Mã phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.DepartmentID.CB',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Tên phòng ban';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.DepartmentName.CB',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Mã đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.DivisionID.CB',  @FormID, @LanguageValue, @Language;

SET @LanguageValue  = N'Tên đơn vị';
EXEC ERP9AddLanguage @ModuleID, 'KPIF1011.DivisionName.CB',  @FormID, @LanguageValue, @Language;
