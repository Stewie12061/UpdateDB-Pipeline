IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CRMP10401_SYSTEMSTT]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[CRMP10401_SYSTEMSTT]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






-- <Summary>
--- Load dữ liệu Combobox CRMP10401_CB_SystemStatus - Load Danh sách trạng thái hệ thống của Giai đoạn bán hàng
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Ngọc Long ON 01/07/2021
-- <Example>
/*
   
*/

CREATE PROCEDURE [dbo].[CRMP10401_SystemStt] 
( 
	@DivisionID NVARCHAR(250),
	@StageType NVARCHAR(250)
) 
AS
BEGIN
	IF ISNULL(@StageType, '') != ''
		BEGIN
			SELECT cast(A1.ID as Tinyint) as SystemStatusID, A1.Description as SystemStatusName, A1.DescriptionE as SystemStatusNameE, A1.ID1
			FROM AT0099 A1 WITH (NOLOCK)
			WHERE A1.CodeMaster = 'CRMT10401.SystemStatus' AND
				((ISNULL(@StageType, '') = '0' AND ISNULL(A1.ID1, '') = '0') --- Đầu mối
					OR (ISNULL(@StageType, '') = '1' AND ISNULL(A1.ID1, '') = '1') -- Cơ hội
					OR (ISNULL(@StageType, '') = '2' AND ISNULL(A1.ID1, '') = '2') -- Chiến dịch marketing
					OR (ISNULL(@StageType, '') = '3' AND ISNULL(A1.ID1, '') = '3')) -- Nguồn dữ liệu online
		END
END







GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
