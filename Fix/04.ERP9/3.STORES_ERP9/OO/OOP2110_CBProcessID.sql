IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[OOP2110_CBPROCESSID]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[OOP2110_CBPROCESSID]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- <Summary>
--- Load dữ liệu Combobox OOF2110.ProcessID  - Load Danh sách quy trình
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Bùi Đức Nhân ON 19/04/2018
----Edited by: Truong Lam ON 02/08/2019
----Edited by: Tấn Lộc ON 10/07/2020 : Bổ sung thêm điều kiện lọc cho Danh sách quy trình
----ObjectTypeID = 2 : Quy trình
-- <Example>
/*
    EXEC OOP2110_CBProcessID 'KY',''
*/

CREATE PROCEDURE [dbo].[OOP2110_CBProcessID] 
( 
	@DivisionID NVARCHAR(250),
	@ProjectID NVARCHAR(250)
) 
AS
BEGIN
	IF ISNULL(@ProjectID, '') != ''
		BEGIN
			SELECT O2.NodeParent AS ProcessNodeParent, O2.ObjectID AS ProcessID, O2.ObjectName AS ProcessName
			FROM OOT2100 O1 WITH (NOLOCK)
				LEFT JOIN OOT2102 O2 WITH (NOLOCK) ON O2.APKMaster = O1.APK AND ISNULL(O2.DeleteFlg,0) = 0
			WHERE O2.ObjectTypeID = '2' AND O1.ProjectID = @ProjectID
			ORDER BY O2.ObjectID
		END
	ELSE
		BEGIN
			SELECT APK AS ProcessNodeParent, ProcessID, ProcessName
			FROM OOT1020 WITH (NOLOCK)
			WHERE DivisionID IN ('@@@', @DivisionID)
			AND ISNULL(Disabled, 0) = 0 
			ORDER BY ProcessID
		END
END


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
