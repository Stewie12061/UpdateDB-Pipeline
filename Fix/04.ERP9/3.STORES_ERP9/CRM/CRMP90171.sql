IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CRMP90171]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CRMP90171]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load màn hình chọn nhóm người nhận
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Hoàng Vũ Date 7/04/2017
----Edited by: Phan thanh hoàng vũ, Date: 05/05/2017: Bổ sung điều kiện search phân quyền xem
-- <Example> EXEC CRMP90171 'AS', '', 'NV01',  N'ASOFTADMIN'', ''DANH'', ''HOANG'', ''HUYEN'', ''LIEN'', ''LUAN'', ''PHUONG'', ''QUI'', ''QUYNH'', ''VU', 1, 10 


 CREATE PROCEDURE CRMP90171 (
     @DivisionID NVARCHAR(2000),
     @TxtSearch NVARCHAR(250),
	 @UserID VARCHAR(50),
	 @ConditionGroupReceiverID nvarchar(max),
     @PageNumber INT,
     @PageSize INT
)
AS
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
    	@OrderBy NVARCHAR(500)
	DECLARE @CustomerName INT
	IF EXISTS (SELECT *	FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb.dbo.#CustomerName')) 
	DROP TABLE #CustomerName
	CREATE Table #CustomerName (CustomerName INT, ImportExcel int)
	INSERT #CustomerName EXEC AP4444
	SET @CustomerName = (SELECT TOP 1 CustomerName FROM #CustomerName) 

	SET @sWhere = ''
	SET @OrderBy = ' M.GroupReceiverID, M.GroupReceiverName'

	IF @TxtSearch IS NOT NULL SET @sWhere = @sWhere +'
							AND (M.GroupReceiverID LIKE N''%'+@TxtSearch+'%'' 
							OR M.GroupReceiverName LIKE N''%'+@TxtSearch+'%'' 
							OR M.Description LIKE N''%'+@TxtSearch+'%'' )'
	IF Isnull(@ConditionGroupReceiverID, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.CreateUserID, '''') in (N'''+@ConditionGroupReceiverID+''' )'

	SET @sSQL = 'Declare @GroupReceiverID Table (
					  [APK] UNIQUEIDENTIFIER NOT NULL,
					  [DivisionID] VARCHAR(50) NOT NULL,
					  [GroupReceiverID] VARCHAR(50) NULL,
					  [GroupReceiverName] NVARCHAR(250)  NULL,
					  [Description] NVARCHAR(250) NULL,
					  [IsCommon] TINYINT NULL,
					  [Disabled] TINYINT NULL
					  ) 
				 Insert into @GroupReceiverID (APK, DivisionID, GroupReceiverID, GroupReceiverName, Description, IsCommon, Disabled)
				 SELECT M.APK, M.DivisionID, M.GroupReceiverID, M.GroupReceiverName, M.Description, M.IsCommon, Disabled
				 FROM CRMT10301 M With (NOLOCK) 
				 Where (M.DivisionID = N'''+ @DivisionID+''' or M.IsCommon = 1) and M.Disabled = 0 '+@sWhere+'
				  
				 DECLARE @count int
				 Select @count = Count(GroupReceiverID) From @GroupReceiverID

				 SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @count AS TotalRow
						, M.APK, Case when M.IsCommon = 1 then '''' else M.DivisionID end DivisionID
						, M.GroupReceiverID, M.GroupReceiverName, M.Description, M.IsCommon, Disabled
				FROM @GroupReceiverID M
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
	EXEC (@sSQL)
	
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON

