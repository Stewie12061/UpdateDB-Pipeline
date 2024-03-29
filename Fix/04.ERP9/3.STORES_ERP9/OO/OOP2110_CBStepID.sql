IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[OOP2110_CBSTEPID]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[OOP2110_CBSTEPID]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- <Summary>
--- Load dữ liệu Combobox OOF2110.ProcessID - Load Danh sách bước công việc
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Bùi Đức Nhân ON 19/04/2018
----Edited by: Truong Lam ON 02/08/2019
----Edited by: Vĩnh Tâm ON 30/03/2020: Bổ sung điều kiện Lọc bước theo Quy trình dự án
----Edited by: Tấn Lộc ON 10/07/2020 : Bổ sung thêm điều kiện lọc bước công việc
--- ObjectTypeID = 1 : Bước
--- ObjectTypeID = 2 : Quy trình
-- <Example>
/*
    EXEC OOP2110_CBStepID 'KY','',''
*/


CREATE PROCEDURE [dbo].[OOP2110_CBStepID]
(
	@DivisionID NVARCHAR(250),
	@ProcessID NVARCHAR(250),
	@ProjectID NVARCHAR(250)
)
AS
BEGIN
	IF ISNULL(@ProjectID, '') != ''
		BEGIN
			SELECT O2.APK AS StepAPK, O2.ObjectID AS StepID, O2.ObjectName AS StepName, O2.NodeLevel AS StepNodeLevel, O2.NodeOrder AS StepNodeOrder
			FROM OOT2100 O1 WITH (NOLOCK)
				INNER JOIN OOT2102 O2 WITH (NOLOCK) ON O2.APKMaster = O1.APK AND O2.ObjectTypeID = '1' AND ISNULL(O2.DeleteFlg,0) = 0
				INNER JOIN OOT2102 O3 WITH (NOLOCK) ON O2.APKMaster = O1.APK AND O3.ObjectID = @ProcessID AND O3.APK = O2.NodeParent
			WHERE O1.ProjectID = @ProjectID
			ORDER BY O2.ObjectID
		END
	ELSE
		BEGIN
			SELECT N.APK AS StepAPK, N.StepID, N.StepName, N.NodeLevel AS StepNodeLevel, N.NodeOrder AS StepNodeOrder
			FROM OOT1020 L WITH (NOLOCK)
				LEFT JOIN OOT1021 N WITH (NOLOCK) ON N.APKMaster = L.APK
			WHERE L.ProcessID = @ProcessID AND N.StepID IS NOT NULL
			ORDER BY N.StepID
		END
END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO