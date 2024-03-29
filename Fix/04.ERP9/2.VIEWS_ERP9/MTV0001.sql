IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTV0001]') AND OBJECTPROPERTY(ID, N'IsView') = 1)
DROP VIEW [DBO].[MTV0001]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Đổ nguồn cho các Combo
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Nguyễn Thanh Sơn, Date: 17/10/2013: Combo Thứ (ngày)
---- Modified by Thanh Sơn on 11/10/2013: Combo Khách hàng đến từ nguồn (Source)
---- Modified by Thanh Sơn on 10/12/2013: Combo Tình trạng học viên (Status)
---- Modified by Thanh Sơn on 11/12/2013: Combo Lý do hoàn học phí (ReturnReason)
-- <Example>
---- 

CREATE VIEW MTV0001
AS 
---------------------------- Day ------------------------------
SELECT 'Day' AS TypeID, 'T2' AS Code, N'Thứ hai' AS [Description], 'Monday' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Day' AS TypeID, 'T3' AS Code, N'Thứ ba' AS [Description], 'Tuesday' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Day' AS TypeID, 'T4' AS Code, N'Thứ tư' AS [Description], 'Wednesday' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Day' AS TypeID, 'T5' AS Code, N'Thứ năm' AS [Description], 'Thursday' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Day' AS TypeID, 'T6' AS Code, N'Thứ sáu' AS [Description], 'Friday' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Day' AS TypeID, 'T7' AS Code, N'Thứ bảy' AS [Description], 'Saturday' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Day' AS TypeID, 'CN' AS Code, N'Chủ nhật' AS [Description], 'Sunday' AS DescriptionE, 0 AS [Disabled]

---------------------------- Source -----------------------------
UNION ALL
SELECT 'Source' AS TypeID, '001' AS Code, N'HV cũ' AS [Description], 'Old student' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Source' AS TypeID, '002' AS Code, N'Quan hệ đối tác' AS [Description], '' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Source' AS TypeID, '003' AS Code, N'Website' AS [Description], 'Website' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Source' AS TypeID, '004' AS Code, N'Câu lạc bộ' AS [Description], 'Club' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Source' AS TypeID, '005' AS Code, N'HV giới thiệu' AS [Description], '' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Source' AS TypeID, '006' AS Code, N'Tờ rơi' AS [Description], '' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Source' AS TypeID, '007' AS Code, N'Street Marketing' AS [Description], 'Street Marketing' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Source' AS TypeID, '008' AS Code, N'Các sự kiện Aston tổ chức' AS [Description], '' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Source' AS TypeID, '009' AS Code, N'GV/NV giới thiệu' AS [Description], '' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Source' AS TypeID, '010' AS Code, N'Phiếu ưu đãi' AS [Description], '' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Source' AS TypeID, '011' AS Code, N'Xem TV' AS [Description], 'TV' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Source' AS TypeID, '012' AS Code, N'Ở gần/ Đi ngang qua trường' AS [Description], '' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Source' AS TypeID, '013' AS Code, N'Học bổng' AS [Description], '' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Source' AS TypeID, '014' AS Code, N'Báo/ Tạp chí' AS [Description], 'Magazine' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Source' AS TypeID, '015' AS Code, N'Khác' AS [Description], 'Other' AS DescriptionE, 0 AS [Disabled]

---------------------------- Status -----------------------------

UNION ALL
SELECT 'Status' AS TypeID, '0' AS Code, N'Học thử' AS [Description], '' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Status' AS TypeID, '1' AS Code, N'Đang học' AS [Description], '' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Status' AS TypeID, '9' AS Code, N'Thôi học' AS [Description], '' AS DescriptionE, 0 AS [Disabled]

----------------------------ReturnReason----------------------------

UNION ALL
SELECT 'ReturnReason' AS TypeID, '0' AS Code, N'Giảm học phí' AS [Description], '' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'ReturnReason' AS TypeID, '1' AS Code, N'Học bổng' AS [Description], '' AS DescriptionE, 0 AS [Disabled]

----------------------------Result----------------------------


UNION ALL
SELECT 'Result' AS TypeID, 'A' AS Code, 'A' AS [Description], '' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Result' AS TypeID, 'B' AS Code, 'B' AS [Description], '' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Result' AS TypeID, 'C' AS Code, 'C' AS [Description], '' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Result' AS TypeID, 'D' AS Code, 'D' AS [Description], '' AS DescriptionE, 0 AS [Disabled]
UNION ALL
SELECT 'Result' AS TypeID, 'E' AS Code, 'E' AS [Description], '' AS DescriptionE, 0 AS [Disabled]

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
