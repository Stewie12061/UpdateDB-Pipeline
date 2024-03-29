IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'POSP01231') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE POSP01231
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- load lên sơ đồ tổ chức (mỗi cửa hàng có một quản lý khu vực tại thời điểm)
---- 
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 21/08/2017
----Modify by: 
-- <Example> Exec POSP01231 'KY', 'CH001', '2017-08-21' , 'aaa', 'aaa'

CREATE PROCEDURE POSP01231 
(
	@DivisionID Varchar(50),		--Biến môi trường
	@ShopID Varchar(50),			--Biến môi trường
	@ManagerDate DATETIME NULL,
	@ManagerEmployeeID Varchar(50),
	@UserID Varchar(50)				--Biến môi trưởng
)
AS 
Begin
		DECLARE @sSQL01 NVARCHAR (MAX),
				@sSQL02 NVARCHAR (MAX),
				@sWhere NVARCHAR(MAX),
				@sWhereDate NVARCHAR(MAX)
		
		SET @sWhere = ''
		SET @sWhereDate = ''
		
		IF Isnull(@DivisionID, '')!=''
			SET @sWhere = @sWhere + ' and M.DivisionID = '''+ @DivisionID+''''
		
		IF Isnull(@ShopID, '')!=''
			SET @sWhere = @sWhere + ' and M.ShopID = '''+ @ShopID+''''

		IF Isnull(@ManagerDate, '') != ''
			SET @sWhereDate = @sWhere + ' AND '''+CONVERT(VARCHAR, @ManagerDate,112)+'''  BETWEEN CONVERT(VARCHAR, M.FromDate,112) AND CONVERT(VARCHAR, M.ToDate,112)'

		IF Isnull(@ManagerEmployeeID, '') != ''
			SET @sWhereDate = @sWhereDate + ' and M.EmployeeID = '''+ @ManagerEmployeeID+''''

		--IF Isnull(@ConditionSOrderID, '') != ''
		--SET @sWhere = @sWhere + ' AND ISNULL(OT2001.EmployeeID, OT2001.CreateUserID) in ('''+@ConditionSOrderID+''')'
		
		SET @sSQL01 = '
					with CommissionTree as
						(
							select T.DivisionID, T.MemberID, T.MemberName, T.IntroduceUserID,
							convert(varchar(100), convert(varchar(100), T.MemberID) ) as PathName
							from (				
									Select M.DivisionID, M.MemberID, M.MemberName, M.IntroduceUserID
									From POST0011 M
									Where M.IsGetCommission = 1 and M.IntroduceUserID is not null ' +@sWhere+'
									Union all
									Select M.DivisionID, M.EmployeeID, M.EmployeeName, NULL
									From POST00101 M
									Where M.IsUsed = 1 '+@sWhereDate+'
								  ) T
							where T.IntroduceUserID is null '
		SET @sSQL02 = '		union all
							select T.DivisionID, T.MemberID, T.MemberName, T.IntroduceUserID,
							convert(varchar(100), convert(varchar(100),CT.PathName) + ''.'' + convert(varchar(100), convert(varchar(100),T.MemberID)) ) as PathName
							from CommissionTree CT inner join 
								  (
									Select M.DivisionID, M.MemberID, M.MemberName, M.IntroduceUserID
									From POST0011 M
									Where M.IsGetCommission =1 and M.IntroduceUserID is not null '+@sWhere+'
									Union all
									Select M.DivisionID, M.EmployeeID, M.EmployeeName, NULL
									From POST00101 M
									Where M.IsUsed = 1 '+@sWhereDate+'
								  ) T on CT.MemberID = T.IntroduceUserID
						)
						Select ROW_NUMBER() over( order by PathName) as OrderNode
							, MemberID as NodeID
							, MemberName as NodeName
							, IntroduceUserID as NodeParentID
							, PathName 
						From CommissionTree 
						Order by PathName
					'
			EXEC (@sSQL01 + @sSQL02)
		
End
