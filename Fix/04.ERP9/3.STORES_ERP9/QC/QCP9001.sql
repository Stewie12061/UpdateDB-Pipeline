IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP9001]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP9001]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


----<Summary>
----Load dữ liệu màn hình chọn tiêu chuẩn
----<Param>
---- 
----<Return>
---- 
----<Reference>
----
----<History>
----<Created by>: Lê Hoàng, Date: 06/01/2021
----<Modify by>: 
----<Example>
/*
	Declare @Status TINYINT

	SELECT @Status
*/
CREATE PROCEDURE QCP9001 (
	 @DivisionID NVARCHAR(2000),
     @TxtSearch NVARCHAR(250),
	 @UserID VARCHAR(50),
     @PageNumber INT,
     @PageSize INT,
	 @DataTypeID VARCHAR(MAX) = '', -- Lấy danh sách loại tiêu chuẩn được chọn
	 @InventoryID VARCHAR(MAX) = '' -- Lấy danh sách mặt hàng được chọn
)
AS
DECLARE @sSQL NVARCHAR(MAX) = N'',
		@sJoin VARCHAR(MAX) = '',
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500) = N'',
        @TotalRow NVARCHAR(50) = N''
	
	SET @OrderBy = ' TypeID, StandardID'
	SET @sWhere = ' 1 = 1 '
	IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'COUNT(*) OVER ()'
	
	IF Isnull(@DataTypeID,'') != ''  
	BEGIN
		SET @DataTypeID = REPLACE(@DataTypeID,',',''',''')
		SET @sWhere = @sWhere +'
		AND QCT1000.TypeID IN ('''+@DataTypeID+''') '
	END

	IF Isnull(@InventoryID,'') != ''  
	BEGIN
		SET @InventoryID = REPLACE(@InventoryID,',',''',''')
		SET @sJoin = @sJoin + 'JOIN QCT1021 A1 WITH(NOLOCK) ON A1.DivisionID = QCT1000.DivisionID AND A1.StandardID = QCT1000.StandardID
							   JOIN QCT1020 A0 WITH(NOLOCK) ON A0.DivisionID = A1.DivisionID AND A0.APK = A1.APKMaster'
		SET @sWhere = @sWhere +'
		AND A0.InventoryID IN ('''+@InventoryID+''') '
	END

	IF Isnull(@TxtSearch,'') != ''  
	BEGIN
		SET @sWhere = @sWhere +'
		AND (QCT1000.StandardID LIKE N''%'+@TxtSearch+'%'' 
		OR QCT1000.StandardName LIKE N''%'+@TxtSearch+'%'' 
		OR QCT1000.UnitID LIKE N''%'+@TxtSearch+'%'' 
		OR QCT1000.Description LIKE N''%'+@TxtSearch+'%'') '
	END

	SET @sSQL = N'
				SELECT DISTINCT QCT1000.APK,QCT1000.DivisionID, QCT1000.StandardID, QCT1000.StandardName, QCT1000.StandardNameE, 
				QCT1000.UnitID, QCT1000.Description, QCT1000.TypeID, QCT0099.Description AS TypeName, 
				STUFF((SELECT '','' + A1.StandardName
						FROM QCT1000 C1 WITH (NOLOCK)
						LEFT JOIN QCT1000 A1 WITH (NOLOCK) ON CONCAT('','',C1.ParentID,'','') LIKE CONCAT(''%,'',A1.StandardID,'',%'')
						WHERE C1.StandardID = QCT1000.StandardID
						FOR XML PATH('''')), 1, 1, '''') AS ParentID,
				QCT1000.IsCommon, QCT1000.Disabled, QCT1000.IsDefault, QCT1000.IsVisible, R0.Description CalculateType, T4.Description As DataType,
				QCT1000.CreateDate, QCT1000.CreateUserID, QCT1000.LastModifyDate, QCT1000.LastModifyUserID
				INTO #QCT1000
				FROM QCT1000 QCT1000 WITH (NOLOCK)
				LEFT JOIN QCT0099 WITH (NOLOCK) ON QCT0099.ID = QCT1000.TypeID AND QCT0099.CodeMaster = ''Standard''
				LEFT JOIN QCT0099 R0 WITH (NOLOCK) ON R0.ID = QCT1000.CalculateType AND R0.CodeMaster = ''CalculateType''
				LEFT JOIN (SELECT * FROM QCT0099 WITH(NOLOCK) WHERE CodeMaster = ''DataType'') T4 ON QCT1000.DataType = T4.ID
				' + @sJoin + '
				WHERE ' + @sWhere + '
				
				SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow
						, APK, DivisionID, StandardID, StandardName, StandardNameE, UnitID, Description
						, TypeID, TypeName, ParentID
						, IsCommon, Disabled, IsDefault, IsVisible, CalculateType, DataType
						, CreateDate, CreateUserID, LastModifyDate, LastModifyUserID
				FROM #QCT1000
				ORDER BY '+@OrderBy+' 
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY
				'
	EXEC (@sSQL)
	PRINT (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
