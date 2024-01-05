IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTV8888]') AND OBJECTPROPERTY(ID, N'IsView') = 1)
DROP VIEW [DBO].[MTV8888]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Danh mục nhóm báo cáo
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Nguyễn Thanh Sơn, Date: 07/12/2013
-- <Example>
---- 
 
Create VIEW [dbo].[MTV8888] 
AS  
SELECT 'G01' AS GroupId, N'Kết quả học tập' AS GroupName , N'' AS GroupNameE
UNION ALL
SELECT 'G01' AS GroupId, N'Học bạ' AS GroupName , N'' AS GroupNameE

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

