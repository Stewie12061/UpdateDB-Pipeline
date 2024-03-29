IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP10431]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[CIP10431]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




-- <Summary>
---- Load Grid Form CIF1043: Chọn email Template
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng Vũ, Date: 07/04/2017
----Modified by : Thị Phượng, Date 03/05/2017: Bổ sung lấy thêm 1 cột EmailBody
----Modified by : Tấn Lộc, Date 29/10/2020 : Bổ sung lấy thêm cột ScreenID và TableID
-- <Example>
---- 
/*
   	exec sp_executesql N'CIP10431 @DivisionID=N''AS'',@TxtSearch=N'''',
	@UserID=N''CALL002'',@PageNumber=N''1'',@PageSize=N''100''',N'@CreateUserID nvarchar(7),
	@LastModifyUserID nvarchar(7),@DivisionID nvarchar(2)',@CreateUserID=N'CALL002',@LastModifyUserID=N'CALL002',@DivisionID=N'AS'

*/

CREATE PROCEDURE CIP10431 ( 
	 @DivisionID NVARCHAR(2000),
     @TxtSearch NVARCHAR(250),
	 @UserID VARCHAR(50),
     @PageNumber INT,
     @PageSize INT
)
AS 
BEGIN
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
		SET @OrderBy = ' M.TemplateID, M.TemplateName'

		IF @TxtSearch IS NOT NULL SET @sWhere = @sWhere +'
								AND (M.TemplateID LIKE N''%'+@TxtSearch+'%'' 
								OR M.TemplateName LIKE N''%'+@TxtSearch+'%'' 
								OR M.EmailTitle LIKE N''%'+@TxtSearch+'%'' 
								OR D.EmailGroupName LIKE N''%'+@TxtSearch+'%'' 
								OR x.[Description] LIKE N''%'+@TxtSearch+'%'' 
								)'

		SET @sSQL = 'Declare @TemplateID Table (
						  [APK] UNIQUEIDENTIFIER NOT NULL, 
						  [DivisionID] VARCHAR(50) NOT NULL,
						  [TemplateID] VARCHAR(50) NOT NULL,
						  [TemplateName] NVARCHAR(250) NULL,
						  [EmailTitle] NVARCHAR(250)  NULL,
						  [EmailGroupID] NVARCHAR(250) NULL,
						  [EmailGroupName] NVARCHAR(250) NULL,
						  [EmailBody] NVARCHAR(Max) NULL,
						  [IsCommon] TINYINT NULL,
						  [IsCommonName] NVARCHAR(250) NULL,
						  [TableID] NVARCHAR(250) NULL,
						  [ScreenID] NVARCHAR(250) NULL
						  )
		Insert into @TemplateID (APK, DivisionID, TemplateID, TemplateName, EmailTitle, EmailGroupID, EmailGroupName, EmailBody, IsCommon, IsCommonName, TableID, ScreenID)
		SELECT M.APK, M.DivisionID, M.TemplateID, M.TemplateName, M.EmailTitle, M.EmailGroupID, D.EmailGroupName, M.EmailBody, M.IsCommon, x.Description as IsCommonName, D.TableID, D.ScreenID
		FROM AT0129 M WITH (NOLOCK)  
		LEFT JOIN (SELECT ID, [Description] as EmailGroupName, DescriptionE as EmailGroupNameE, NULL AS TableID, NULL AS ScreenID
					FROM DRT0099 WITH (NOLOCK)
					WHERE CodeMaster = ''EmailGroup'' AND [Disabled] = 0
						Union all
					SELECT M.ID, M.Description as EmailGroupName, M.DescriptionE as EmailGroupNameE, D.TableID, D.ScreenID
					FROM CRMT0099 M WITH (NOLOCK) 
						INNER JOIN CRMT0098 D  WITH (NOLOCK) on M.CodeMaster = D.CodeMaster and M.ID = D.ID
					WHERE M.CodeMaster = ''CRMT00000002'' AND M.Disabled = 0)  D ON D.ID = M.EmailGroupID 
		 LEFT JOIN AT0099 x on M.IsCommon = x.ID and x.CodeMaster = ''AT00000004''
		WHERE (M.DivisionID = '''+@DivisionID+''' OR M.IsCommon = 1) '+@sWhere+'
	  
		DECLARE @count int
		Select @count = Count(TemplateID) From @TemplateID

		SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @count AS TotalRow
			, M.APK, M.DivisionID, M.TemplateID, M.TemplateName, M.EmailTitle, M.EmailGroupID, M.EmailGroupName, M.EmailBody, M.IsCommon, M.IsCommonName, M.TableID, M.ScreenID
		FROM @TemplateID M
		ORDER BY '+@OrderBy+'
		OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
		FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '

	EXEC (@sSQL)
	print (@sSQL)
END	


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
