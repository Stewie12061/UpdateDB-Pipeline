IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP1024]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP1024]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- <Summary>
---- Xuất excel danh mục định nghĩa tiêu chuẩn
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by Lê Hoàng on 19/02/2021
----Modified by ... on ...
-- <Example>

/*
*/

CREATE PROCEDURE QCP1024 ( 
        @DivisionID VARCHAR(50), 
		@DivisionList VARCHAR(MAX), 
		@InventoryID VARCHAR(MAX),
		@InventoryName NVARCHAR(MAX),
		@Notes NVARCHAR(MAX),
		@Notes01 NVARCHAR(MAX),
		@Notes02 NVARCHAR(MAX),
		@Notes03 NVARCHAR(MAX),
		@Disabled TINYINT,
		@IsCommon TINYINT,
		@UserID  VARCHAR(50)
) 
AS 
BEGIN
	DECLARE @sSQL NVARCHAR(MAX),
			@sWhere NVARCHAR(MAX) = N'',
			@OrderBy NVARCHAR(500) = N'', 
			@TotalRow NVARCHAR(50) = N''

		SET @OrderBy = ' InventoryID, Orders'
		SET @sWhere = ' 1 = 1 '
		
		IF ISNULL(@DivisionList, '') != ''
			SET @sWhere = @sWhere + N' AND T1.DivisionID IN ('''+@DivisionList+''')'
		ELSE 
			SET @sWhere = @sWhere + N' AND T1.DivisionID = '''+@DivisionID+''''

		IF ISNULL(@InventoryID, '') != '' 
			SET @sWhere = @sWhere + N' AND T1.InventoryID LIKE N''%'+@InventoryID+'%'''

		IF ISNULL(@InventoryName, '') != '' 
			SET @sWhere = @sWhere + N' AND T2.InventoryName LIKE N''%'+@InventoryName+'%'''

		IF ISNULL(@Notes, '') != '' 
			SET @sWhere = @sWhere + N' AND T1.Notes LIKE N''%'+@Notes+'%'''

		IF ISNULL(@Notes01, '') != '' 
			SET @sWhere = @sWhere + N' AND T1.Notes01 LIKE N''%'+@Notes01+'%'''

		IF ISNULL(@Notes02, '') != '' 
			SET @sWhere = @sWhere + N' AND T1.Notes02 LIKE N''%'+@Notes01+'%'''

		IF ISNULL(@Notes03, '') != '' 
			SET @sWhere = @sWhere + N' AND T1.Notes03 LIKE N''%'+@Notes01+'%'''

		IF ISNULL(@Disabled, '') != '' 
			SET @sWhere = @sWhere + N' AND T1.Disabled = N''%'+@Disabled+'%'''

		IF ISNULL(@IsCommon, '') != '' 
			SET @sWhere = @sWhere + N' AND T1.IsCommon = N''%'+@IsCommon+'%'''

		SET @sSQL = N'
				SELECT T1.APK, T1.DivisionID, T1.InventoryID, T2.InventoryName, T1.Notes, T1.Notes01, T1.Notes02
						, T1.Notes03, T1.Disabled, T1.IsCommon, T1.CreateDate, T1.CreateUserID
						, T1.LastModifyDate, T1.LastModifyUserID
						, T3.StandardID, T4.StandardName, T4.StandardNameE, T5.UnitName, QCT0099.Description AS TypeName
						, (CASE WHEN T141.StandardName IS NULL THEN T3.SRange01 ELSE T141.StandardName END) AS SRange01
						, (CASE WHEN T142.StandardName IS NULL THEN T3.SRange02 ELSE T142.StandardName END) AS SRange02
						, (CASE WHEN T143.StandardName IS NULL THEN T3.SRange03 ELSE T143.StandardName END) AS SRange03
						, (CASE WHEN T144.StandardName IS NULL THEN T3.SRange04 ELSE T144.StandardName END) AS SRange04
						, (CASE WHEN T145.StandardName IS NULL THEN T3.SRange05 ELSE T145.StandardName END) AS SRange05
						, T3.Disabled StandardDisabled, T3.Orders
				INTO #QCP1024
				FROM QCT1020 T1 WITH (NOLOCK)
				LEFT JOIN AT1302 T2 WITH (NOLOCK) ON T1.InventoryID = T2.InventoryID AND T2.DivisionID IN (T1.DivisionID,''@@@'')
				LEFT JOIN QCT1021 T3 WITH(NOLOCK) ON T1.DivisionID IN (T3.DivisionID,''@@@'') AND T1.APK = T3.APKMaster
				LEFT JOIN QCT1000 T4 WITH(NOLOCK) ON T1.DivisionID IN (T3.DivisionID,''@@@'') AND T3.StandardID = T4.StandardID
				LEFT JOIN QCT0099 WITH (NOLOCK) ON QCT0099.ID = T4.TypeID AND QCT0099.CodeMaster = ''Standard''
				LEFT JOIN AT1304 T5 WITH(NOLOCK) ON T5.DivisionID IN (T4.DivisionID,''@@@'') AND T5.UnitID = T4.UnitID
				LEFT JOIN QCT1000 T141 WITH(NOLOCK) ON T141.DivisionID IN (T3.DivisionID,''@@@'') AND T3.SRange01 = T141.StandardID
				LEFT JOIN QCT1000 T142 WITH(NOLOCK) ON T142.DivisionID IN (T3.DivisionID,''@@@'') AND T3.SRange02 = T142.StandardID
				LEFT JOIN QCT1000 T143 WITH(NOLOCK) ON T143.DivisionID IN (T3.DivisionID,''@@@'') AND T3.SRange03 = T143.StandardID
				LEFT JOIN QCT1000 T144 WITH(NOLOCK) ON T144.DivisionID IN (T3.DivisionID,''@@@'') AND T3.SRange04 = T144.StandardID
				LEFT JOIN QCT1000 T145 WITH(NOLOCK) ON T145.DivisionID IN (T3.DivisionID,''@@@'') AND T3.SRange05 = T145.StandardID
				WHERE '+@sWhere+'

				SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum
						, APK, DivisionID, InventoryID, InventoryName, Notes, Notes01, Notes02
						, Notes03, Disabled, IsCommon, CreateDate, CreateUserID
						, LastModifyDate, LastModifyUserID
						, StandardID, StandardName, StandardNameE, UnitName, TypeName
						, SRange01, SRange02, SRange03, SRange04, SRange05, StandardDisabled
						, Orders
				FROM #QCP1024
				ORDER BY '+@OrderBy

		EXEC (@sSQL)
		PRINT (@sSQL)
END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO