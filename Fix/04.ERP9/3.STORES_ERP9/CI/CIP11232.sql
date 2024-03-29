IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'CIP11232') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE CIP11232
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- load lên sơ đồ tổ chức (mỗi ngày chỉ có 1 cây tổ chức)
---- 
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 17/08/2017
----Modify by: 
-- <Example> Exec CIP11232 

CREATE PROCEDURE CIP11232 
AS 
Begin
		Select x.NodeTypeID, x.NodeID, x.NodeParentID, x.NodeName, x.Paths, x.OrderNo 
		From
				(
						Select D.NodeTypeID, D.NodeID, D.NodeParentID
								, Case when D.NodeTypeID = 'DivisionID' and Isnull(A.ContactPerson, '')!='' then D.NodeName + ' (' + A3.FullName+ ')'
									   when D.NodeTypeID = 'DepartmentID' and Isnull(B.ContactPerson, '')!='' then D.NodeName + ' (' + B3.FullName+ ')'
									   when D.NodeTypeID = 'TeamID' and Isnull(C.ContactPerson, '')!='' then D.NodeName + ' (' + C3.FullName+ ')'
									   Else D.NodeName end NodeName
								, D.Paths, D.OrderNo 
						From CIT1100 M  With (NOLOCK) Inner join CIT1101 D  With (NOLOCK) on M.APK = D.APKMaster
										Left join AT1101 A With (NOLOCK) on D.NodeID = A.DivisionID and D.NodeTypeID = 'DivisionID'
										Left join AT1103 A3 With (NOLOCK) on A.ContactPerson = A3.EmployeeID and Isnull(A3.Disabled, 0) = 0
										Left join AT1102 B With (NOLOCK) on D.NodeID = B.DepartmentID and D.NodeTypeID = 'DepartmentID' and Isnull(B.Disabled, 0) = 0
										Left join AT1103 B3 With (NOLOCK) on B.ContactPerson = B3.EmployeeID and Isnull(B3.Disabled, 0) = 0
										Left join HT1101 C With (NOLOCK) on D.NodeID = C.TeamID and D.NodeTypeID = 'TeamID' and Isnull(C.Disabled, 0) = 0
										Left join AT1103 C3 With (NOLOCK) on C.ContactPerson = C3.EmployeeID and Isnull(C3.Disabled, 0) = 0
						Where M.APK = (Select Top 1 APK from CIT1100 Order by VoucherDate DESC)
		
				) x
		Order by x.OrderNo
End
