IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SP10501]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[SP10501]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
--- Load form SF1050 - Danh mục vai trò
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Phan thanh hoàng Vũ on 17/03/2017
-- <Example>
/*
	--Lưu ý chưa bổ sung phân quyền xem dữ liệu người khác

    EXEC SP10501 'AS', '' ,'', 'NV01', 1, 10 
*/

CREATE PROCEDURE SP10501 
(  @DivisionID VARCHAR(50), 
   @RoleID nvarchar(50),
   @RoleName nvarchar(50),
   @UserID  VARCHAR(50),
   @PageNumber INT,
   @PageSize INT
)
AS
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
		@OrderBy NVARCHAR(500)
		
	SET @sWhere = ' 1 = 1 '
	SET @OrderBy = ' M.LevelRoleID, M.RoleID, M.RoleName '

	--Check Para DivisionIDList null then get DivisionID 
	IF isnull(@RoleID, '') != ''
		SET @sWhere = @sWhere + ' AND M.RoleID LIKE N''%'+@RoleID+'%''  '
	
	IF isnull(@RoleName, '') != ''
		SET @sWhere = @sWhere + ' AND M.RoleName LIKE N''%'+@RoleName+'%'' '

SET @sSQL =	  ' SELECT M.APK, M.RoleID, M.RoleName, M.ParentRoleID, M.LevelRoleID, M.Notes
					, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate					   
					into #TempST10501
				FROM ST10501 M With (NOLOCK)
				WHERE '+@sWhere+'

				DECLARE @count int
				Select @count = Count(RoleID) From #TempST10501

				SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @count AS TotalRow
					, M.APK, M.RoleID, M.RoleName, M.ParentRoleID, M.LevelRoleID, M.Notes
					, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
				FROM #TempST10501 M
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
