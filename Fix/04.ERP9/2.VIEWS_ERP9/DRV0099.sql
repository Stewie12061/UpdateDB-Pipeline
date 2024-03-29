IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[DRV0099]') AND OBJECTPROPERTY(ID, N'IsView') = 1)
DROP VIEW [DBO].[DRV0099]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW DRV0099 AS
(
SELECT N'Contract' EmailGroup, 'ID' ColumnID, N'Mã' ColumnName UNION ALL
SELECT N'Contract' EmailGroup, 'Description', N'Diễn giải đơn' UNION ALL
SELECT N'Contract' EmailGroup, 'CreateUserName', N'Người đề nghị' UNION ALL
SELECT N'Contract' EmailGroup, 'Level', N'Cấp duyệt' UNION ALL
SELECT N'Contract' EmailGroup, 'TypeName', N'Loại' UNION ALL
SELECT N'Contract' EmailGroup, 'ApprovePersonName', N'Tên người duyệt' UNION ALL
SELECT N'Contract' EmailGroup, 'Status', N'Tình trạng' UNION ALL
SELECT N'Contract' EmailGroup, 'Note', N'Ghi chú người duyệt' UNION ALL
SELECT N'Contract' EmailGroup, 'NextApprovePersonName', N'Tên người duyệt tiếp theo' UNION ALL
SELECT N'Contract' EmailGroup, 'ApproveTime', N'Thời gian xin phép' UNION ALL
SELECT N'Contract' EmailGroup, 'CreateUserName', N'Nhân viên xin phép' UNION ALL
SELECT N'Contract' EmailGroup, 'Reason', N'Lý do xin phép' 
) 

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO