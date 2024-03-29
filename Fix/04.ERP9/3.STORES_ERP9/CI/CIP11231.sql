IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'CIP11231') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE CIP11231
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Insert dữ liệu vào bảng tạm Master và detail để load lên sơ đồ tổ chức (mỗi ngày chỉ có 1 cây tổ chức)
---- 
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 10/08/2017
----Modify by:  Phan thanh hoàng vũ, Date: 24/09/2020 xoa tất cả dữ liệu sơ đồ tổ chức cũ, chỉ để lại sơ đồ tổ chức mới nhất - fix bugs lỗi load combo KPI
----Modify by:  Huỳnh Thanh Minh, Date: 30/12/2021 Kiểm tra trùng nodeID trong cây sơ đồ tổ chức và loại bỏ NodeID trùng
-- <Example> Exec CIP11231 

CREATE PROCEDURE CIP11231 
AS 
Begin
		Declare @LastAPK nvarchar(max),
				@InsAPK nvarchar(max),
				@SearchNodeID nvarchar(max),
				@APKMaster nvarchar(max)

		Set @InsAPK = NewID()
				
		--Bước 1: Insert lại cây tổ chức
		--Bước 1.1: Lấy dữ liệu đơn vị, Phòng ban, Tổ nhóm, Người dùng insert vào bảng Detail		
				Declare @Bangtam table (	NodeTypeID  varchar(50),	--Loai Node
											DivisionID	Varchar(50),
											DepartmentID Varchar(50),
											TeamID Varchar(50),
											NodeID		varchar(50),	--Node
											NodeParentID varchar(50),	--Node cha
											UserID  varchar(50)	
											);

				Insert into @Bangtam (NodeTypeID, DivisionID, DepartmentID, TeamID, NodeID, NodeParentID, UserID)
				--Lay don vi
				Select N'DivisionID' as NodeTypeID, DivisionID, NULL as DepartmentID, NULL as TeamID, DivisionID as NodeID, ParentDivisionID as NodeParentID, ContactPerson
				from AT1101 With (Nolock)
				Union all
				--Lấy phong ban
				Select N'DepartmentID' as NodeTypeID, M.DivisionID, D.DepartmentID, NULL as TeamID, D.DepartmentID as NodeID, M.DivisionID as NodeParentID, D.ContactPerson
				from AT1101 M With (Nolock) inner join AT1102 D With (Nolock) on M.DivisionID = D.DivisionID
				Where Isnull(D.IsCommon, 0) = 0 and Isnull(D.IsOrganizationDiagram, 0) = 1  and Isnull(D.Disabled, 0) = 0
				Union all
				Select N'DepartmentID', M.DivisionID, D.DepartmentID, NULL as TeamID, D.DepartmentID as NodeID, M.DivisionID as NodeParentID, D.ContactPerson
				from AT1101 M With (Nolock), AT1102 D With (Nolock)
				Where Isnull(D.IsCommon, 0) = 1 and Isnull(D.IsOrganizationDiagram, 0) = 1  and Isnull(D.Disabled, 0) = 0
				Union all
				--Lay to nhom
				Select N'TeamID' as NodeTypeID, x.DivisionID, x.DepartmentID, N.TeamID, N.TeamID as NodeID, x.DepartmentID as NodeParentID, N.ContactPerson
				From (
						Select M.DivisionID, D.DepartmentID from AT1101 M With (Nolock) inner join AT1102 D With (Nolock) on M.DivisionID = D.DivisionID
						Where Isnull(D.IsCommon, 0) = 0 and Isnull(D.IsOrganizationDiagram, 0) = 1  and Isnull(D.Disabled, 0) = 0
						Union all
						Select M.DivisionID, D.DepartmentID as DeparmentUserID from AT1101 M With (Nolock), AT1102 D With (Nolock)
						Where Isnull(D.IsCommon, 0) = 1 and Isnull(D.IsOrganizationDiagram, 0) = 1  and Isnull(D.Disabled, 0) = 0
						) x Left join HT1101 N With (Nolock) on x.DivisionID = N.DivisionID and x.DepartmentID = N.DepartmentID and Isnull(N.Disabled, 0) = 0
				Where N.TeamID is not null and Isnull(N.IsOrganizationDiagram, 0) = 1 

				--Lay nguoi dung
				Insert into @Bangtam (NodeTypeID, DivisionID, DepartmentID, TeamID, NodeID, NodeParentID, UserID)
				Select N'UserID' as NodeTypeID, x.DivisionID, x.DepartmentID, x.TeamID, x.EmployeeID, Isnull(x.TeamID, x.DepartmentID) as NodeParentID, x.EmployeeID
				From

				(		----Lấy người dung tổ nhóm (Phòng ban có tổ nhóm)
						Select M.DivisionID, M.DepartmentID, M.TeamID, A03.EmployeeID
						From @Bangtam M Inner join 
								(
									Select M.DivisionID, D.EmployeeID, D.DepartmentID, D.TeamID
									from AT1101 M With (Nolock) inner join AT1103 D With (Nolock) on M.DivisionID =D.DivisionID 
									Where Isnull(D.IsCommon, 0) = 0 and Isnull(D.TeamID, '') != '' and Isnull(D.Disabled, 0) = 0
									Union all
									Select M.DivisionID, D.EmployeeID, D.DepartmentID, D.TeamID
									from AT1101 M With (Nolock), AT1103 D With (Nolock)
									Where Isnull(D.IsCommon, 0) = 1 and Isnull(D.TeamID, '') != ''  and Isnull(D.Disabled, 0) = 0

								) A03 on M.DivisionID = A03.DivisionID and M.DepartmentID = A03.DepartmentID and M.TeamID = A03.TeamID
						-- 30.12.2021 Minh kiem tra trường hợp trùng EmployeeID và TeamID
						Where Isnull(M.TeamID, '') != '' and Isnull(M.TeamID, '') != Isnull(A03.EmployeeID,'')

						Union all
						----Lấy người dung phòng ban (Phòng ban không có tổ nhóm)
						Select M.DivisionID, M.DepartmentID, M.TeamID, A03.EmployeeID
						From @Bangtam M Inner join 
								(
									Select M.DivisionID, D.EmployeeID, D.DepartmentID, D.TeamID
									from AT1101 M With (Nolock) inner join AT1103 D With (Nolock) on M.DivisionID =D.DivisionID
									Where Isnull(D.IsCommon, 0) = 0 and Isnull(D.TeamID, '') = ''  and Isnull(D.Disabled, 0) = 0
									Union all
									Select M.DivisionID, D.EmployeeID, D.DepartmentID, D.TeamID
									from AT1101 M With (Nolock), AT1103 D With (Nolock)
									Where Isnull(D.IsCommon, 0) = 1 and Isnull(D.TeamID, '') = ''  and Isnull(D.Disabled, 0) = 0

								) A03 on M.DivisionID = A03.DivisionID and M.DepartmentID = A03.DepartmentID
						-- 30.12.2021 Minh kiem tra trường hợp trùng EmployeeID và DepartmentID
						Where Isnull(M.TeamID, '') = '' and Isnull(M.DepartmentID, '') != Isnull(A03.EmployeeID,'')
				) x
				Order by x.DivisionID, x.DepartmentID

				Select DivisionID, DepartmentID, TeamID, UserID, NodeTypeID, NodeID, NodeParentID, 
						Case when Isnull(DepartmentID, '') = '' then '['+DivisionID+']' 
							when Isnull(TeamID, '') = '' and Isnull(UserID, '') = '' then '['+DivisionID+'].['+DepartmentID+']' 
							when Isnull(TeamID, '') != '' and Isnull(UserID, '') = '' then '['+DivisionID+'].['+DepartmentID+'].['+TeamID+']' 
							when Isnull(TeamID, '') = '' and Isnull(UserID, '') != '' then '['+DivisionID+'].['+DepartmentID+'].['+UserID+']' 
							when Isnull(TeamID, '') != '' and Isnull(UserID, '') != '' then '['+DivisionID+'].['+DepartmentID+'].['+TeamID+'].['+UserID+']' 
							end as [Paths]
				into #ketqua 
				from @Bangtam
		
				--Bước 1.2: Dung ket qua insert vao bang detail
				Insert into CIT1101 (APKMaster, NodeTypeID, NodeID, NodeParentID, NodeName, Paths, OrderNo, DivisionID,DepartmentID,TeamID,UserID)

				Select @InsAPK, M.NodeTypeID, M.NodeID, M.NodeParentID
						, Case when M.NodeTypeID = 'DivisionID' then A.DivisionName 
								when M.NodeTypeID = 'DepartmentID' then D.DepartmentName
								when M.NodeTypeID = 'TeamID' then H.TeamName
								when M.NodeTypeID = 'UserID' then A03.FullName
								Else '' end NodeName
						, M.[Paths], ROW_NUMBER() over( order by M.[Paths]) as OrderNode, M.DivisionID, M.DepartmentID, M.TeamID, M.UserID

				From #ketqua M Left join AT1101 A With (Nolock) on M.NodeID = A.DivisionID and M.NodeTypeID = 'DivisionID'
								Left join AT1102 D With (Nolock) on M.NodeID = D.DepartmentID and M.NodeTypeID = 'DepartmentID'  and Isnull(D.Disabled, 0) = 0
								Left join HT1101 H With (Nolock) on M.NodeID = H.TeamID and M.NodeTypeID = 'TeamID' and Isnull(H.Disabled, 0) = 0
								Left join AT1103 A03 With (Nolock) on M.NodeID = A03.EmployeeID and M.NodeTypeID = 'UserID'  and Isnull(A03.Disabled, 0) = 0
			
				order by M.[Paths]

				--Bước 1.3: Insert vào bảng Master
				Insert into CIT1100 (APK, VoucherDate, TranMonth, TranYear)
				Select @InsAPK, GETDATE(), month(GETDATE()), Year(GETDATE())

		  -- 24.09.2020 Minh/Vu bo kiem tra, luon xoa so do to chuc cu, chi luu so do to chuc moi nhat
		  --Bước 2: Kiểm tra trong cùng ngày có sinh ra sơ đồ cây tổ chức thì xóa đi
		  Set @LastAPK = (SELECT top 1 APK FROM CIT1100 With (Nolock) order by VoucherDate desc)
		  Delete From CIT1100 Where APK != @LastAPK
		  Delete From CIT1101 Where APKMaster != @LastAPK
End
