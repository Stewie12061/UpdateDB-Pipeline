IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[PAP90011]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[PAP90011]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load màn hình chọn từ điển năng lực - PAF9001
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by Hoàng vũ, on 28/08/2017: Tạo mới tài liệu
--- Modify by:
-- <Example>
/*
	exec PAP90011 @DivisionID=N'AS',@TxtSearch=N'AA',@UserID=N'',@PageNumber=N'1',@PageSize=N'10'

*/

 CREATE PROCEDURE PAP90011 (
     @DivisionID NVARCHAR(2000),
	 @TxtSearch NVARCHAR(250),
	 @UserID VARCHAR(50),
	 @PageNumber INT,
     @PageSize INT
)
AS
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500)
    
	SET @sWhere = ' '
	
	SET @OrderBy = ' M.AppraisalDictionaryID, M.AppraisalDictionaryName '
	
	IF Isnull(@TxtSearch,'') != ''  SET @sWhere = @sWhere +'
								AND (M.AppraisalDictionaryID LIKE N''%'+@TxtSearch+'%'' 
								OR M.AppraisalDictionaryName LIKE N''%'+@TxtSearch+'%'' 
								OR M.AppraisalGroupID LIKE N''%'+@TxtSearch+'%'' 
								OR K1.TargetsGroupName LIKE N''%'+@TxtSearch+'%'' 
								OR M.Note LIKE N''%'+@TxtSearch+'%'')'
	SET @sSQL = '
					SELECT M.APK, M.DivisionID
					, M.AppraisalDictionaryID, M.AppraisalDictionaryName
					, M.AppraisalGroupID, K1.TargetsGroupName as AppraisalGroupName
					, M.Note
					, M.LevelCritical, M.LevelStandardNo, M.IsCommon, M.Disabled
					, M.CreateUserID, M.LastModifyUserID, M.CreateDate, M.LastModifyDate
					 into #TempPAT10001
					FROM PAT10001 M With (NOLOCK) Left join KPIT10101 K1 With (NoLock) on M.AppraisalGroupID = K1.TargetsGroupID
										  
					WHERE M.Disabled = 0 and M.DivisionID in ('''+@DivisionID+''', ''@@@'')'+@sWhere+'

					DECLARE @count int
					Select @count = Count(AppraisalDictionaryID) From #TempPAT10001

					SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @count AS TotalRow
							, M.APK, Case when isnull(M.IsCommon,0) =1 then '''' else M.DivisionID end As DivisionID 
							, M.AppraisalDictionaryID, M.AppraisalDictionaryName
							, M.AppraisalGroupID, M.AppraisalGroupName
							, M.Note
							, M.LevelCritical, M.LevelStandardNo
							, M.IsCommon
							, M.Disabled
							, M.CreateUserID, M.LastModifyUserID, M.CreateDate, M.LastModifyDate
					FROM #TempPAT10001 M 
					ORDER BY '+@OrderBy+'
					OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
					FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
	
	EXEC (@sSQL)
	

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
