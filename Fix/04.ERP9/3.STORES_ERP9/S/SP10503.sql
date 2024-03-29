IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SP10503]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[SP10503]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





-- <Summary>
--- Load form SF1052 - Gán quyền nhóm người dùng/người dùng
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Phan thanh hoàng Vũ on 03/05/2017
----Modify by Tấn Thành on 25/08/2020: Thay đổi điều kiện Search Người dùng và Nhóm người dùng thành Search OR 
----Modified By Tấn Thành on 22/09/2020: Thêm điều kiện không load User đã bị khóa
----Modified By Văn Tài   on 16/01/2022: Thêm điều kiện load User dùng chung.
-- <Example>
/*
    EXEC SP10503 N'AS', 'AS'',''GS'',''GSC', N'' ,N'', 0, N'NV01'
	EXEC SP10503 N'AS', '', N'' ,N'', 1, N'NV01'
*/

CREATE PROCEDURE SP10503 
(  @DivisionID NVARCHAR(50), --Biến môi trường
   @DivisionIDList NVARCHAR(Max),
   @SearchGroup NVARCHAR(MAX) = NULL, -- Tìm kiếm Nhóm người dùng
   @SearchUser NVARCHAR(MAX) = NULL, -- Tìm kiếm Người dùng
   --@ID nvarchar(50),
   --@Name nvarchar(250),
   @IsUserOrGroup int,		--0: Nhóm người dùng, 1: Người dùng
   @UserID  VARCHAR(50)		--Biến môi trường
)
AS
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
		@OrderBy NVARCHAR(500)
		
	
	IF @IsUserOrGroup = 0 --Gán quyền cho nhóm người dùng
	Begin
		SET @sWhere = ' '
		SET @OrderBy = ' M.DivisionID, M.GroupID, M.GroupName '
		
		--Check Para DivisionIDList null then get DivisionID 
		IF Isnull(@DivisionIDList, '') != ''
			SET @sWhere = @sWhere + ' D.DivisionID IN ('''+@DivisionIDList+''')'
		Else 
			SET @sWhere = @sWhere + ' D.DivisionID = N'''+ @DivisionID+''''		
		/*
		IF isnull(@ID, '') != ''
			SET @sWhere = @sWhere + ' AND D.GroupID LIKE N''%'+@ID+'%'' '
	
		IF isnull(@Name, '') != ''
			SET @sWhere = @sWhere + ' AND D.GroupName LIKE N''%'+@Name+'%'''
		*/

		IF ISNULL(@SearchGroup,'') != ''
			SET @sWhere = @sWhere + 'AND (D.GroupName LIKE N''%' + @SearchGroup + '%'' OR D.GroupID LIKE N''%' + @SearchGroup + '%'')'

		SET @sSQL =	  ' SELECT M.APK, M.DivisionID, M.GroupID, D.GroupName, M.RoleID, T.RoleName
								, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
								Into #TempST10503
						FROM ST10503 M WITH (NOLOCK) INNER JOIN AT1401 D WITH (NOLOCK) ON M.DivisionID = D.DivisionID AND M.GroupID = D.GroupID AND ISNULL(D.Disabled, 0) = 0
													 INNER JOIN ST10501 T WITH (NOLOCK) ON M.RoleID = T.RoleID
						WHERE '+@sWhere+' AND ISNULL(M.IsUserOrGroup, 0) = 0 
						UNION ALL
						SELECT D.APK, D.DivisionID, D.GroupID, D.GroupName, D.RoleID, T.RoleName
						, D.CreateUserID, D.CreateDate, D.LastModifyUserID, D.LastModifyDate
						FROM AT1401 D WITH (NOLOCK) LEFT JOIN ST10501 T WITH (NOLOCK) ON D.RoleID = T.RoleID
						WHERE '+@sWhere+' AND ISNULL(D.Disabled, 0) = 0
							  AND D.GroupID NOT IN (SELECT M.GroupID
													FROM ST10503 M WITH (NOLOCK) INNER JOIN AT1401 D WITH (NOLOCK) ON M.DivisionID = D.DivisionID AND M.GroupID = D.GroupID AND ISNULL(D.Disabled, 0) = 0
													WHERE '+@sWhere+' AND M.IsUserOrGroup = 0 
													)
					
						SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum
							, M.APK, M.DivisionID, M.GroupID, M.GroupName, M.RoleID, M.RoleName
								, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
						FROM #TempST10503 M
						ORDER BY '+@OrderBy
		EXEC (@sSQL)	
	End

	IF @IsUserOrGroup = 1 --Gán quyền cho người dùng
	Begin
		SET @sWhere = ' '
		SET @OrderBy = ' M.DivisionID, M.UserID, M.UserName '
		
		--Check Para DivisionIDList null then get DivisionID 
		IF Isnull(@DivisionIDList, '') != ''
			SET @sWhere = @sWhere + ' M.DivisionID IN ('''+@DivisionIDList+''')'
		Else 
			SET @sWhere = @sWhere + ' M.DivisionID = N'''+ @DivisionID+''''		
		/*
		IF isnull(@ID, '') != ''
			SET @sWhere = @sWhere + ' AND M.UserID LIKE N''%'+@ID+'%''  '
	
		IF isnull(@Name, '') != ''
			SET @sWhere = @sWhere + ' AND D.FullName LIKE N''%'+@Name+'%'' '
		*/
		
		IF ISNULL(@SearchGroup,'') != ''
			SET @sWhere = @sWhere + 'AND (A1.GroupName LIKE N''%' + @SearchGroup + '%'' OR M.GroupID LIKE N''%' + @SearchGroup + '%'')'

		IF ISNULL(@SearchUser,'') != ''
			SET @sWhere = @sWhere + 'AND (M.UserID LIKE N''%' + @SearchUser + '%'' OR D.FullName LIKE N''%' + @SearchUser + '%'')'

		SET @sSQL =	  ' SELECT M.APK, M.DivisionID, M.UserID, D.FullName as UserName, M.GroupID, M.RoleID, T.RoleName
								, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
								INTO #TempST10503
						FROM ST10503 M WITH (NOLOCK) INNER JOIN AT1103 D WITH (NOLOCK) ON M.UserID = D.EmployeeID AND ISNULL(D.Disabled, 0) = 0
													 INNER JOIN ST10501 T WITH (NOLOCK) ON M.RoleID = T.RoleID
													 INNER JOIN AT1401 A1 WITH (NOLOCK) ON A1.DivisionID = M.DivisionID AND A1.GroupID = M.GroupID AND ISNULL(A1.Disabled, 0) = 0
						WHERE '+@sWhere+' AND ISNULL(M.IsUserOrGroup, 0) = 1 AND M.GroupID IN (SELECT GroupID FROM AT1402 X WHERE X.DivisionID IN (''@@@'', M.DivisionID) AND M.UserID = X.UserID)
						UNION ALL
						SELECT M.APK, M.DivisionID, M.UserID, D.FullName as UserName , M.GroupID, M.UserJoinRoleID as RoleID, T.RoleName
						, NULL AS CreateUserID, NULL AS CreateDate, NULL AS LastModifyUserID, NULL AS LastModifyDate
						FROM AT1402 M WITH (NOLOCK) LEFT JOIN ST10503 S WITH (NOLOCK) ON M.DivisionID = S.DivisionID AND M.GroupID = S.GroupID AND M.UserID = S.UserID
													INNER JOIN AT1103 D WITH (NOLOCK) ON M.UserID = D.EmployeeID AND ISNULL(D.Disabled, 0) = 0 AND D.DivisionID IN (M.DivisionID, ''@@@'')
													LEFT JOIN ST10501 T WITH (NOLOCK) ON M.UserJoinRoleID = T.RoleID
													INNER JOIN AT1401 A1 WITH (NOLOCK) ON A1.DivisionID = M.DivisionID AND A1.GroupID = M.GroupID AND ISNULL(A1.Disabled, 0) = 0
													INNER JOIN AT1405 A2 WITH (NOLOCK) ON M.UserID = A2.UserID AND ISNULL(A2.Disabled,0) = 0 AND A2.DivisionID IN (M.DivisionID, ''@@@'')
						WHERE '+@sWhere+' 
						AND (CASE WHEN M.DivisionID = S.DivisionID AND M.GroupID = S.GroupID AND M.UserID = S.UserID THEN 0 ELSE 1 END) = 1
						AND ISNULL(A2.IsLock,0) = 0 

						SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum
							, M.APK, M.DivisionID, M.UserID, M.UserName, M.GroupID, M.RoleID, M.RoleName
								, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
						FROM #TempST10503 M
						ORDER BY '+@OrderBy
		EXEC (@sSQL)
		
	End 

	Print  (@sSQL)



GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
