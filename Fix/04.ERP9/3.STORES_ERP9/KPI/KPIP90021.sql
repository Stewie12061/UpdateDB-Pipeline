IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[KPIP90021]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[KPIP90021]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load màn hình chọn chỉ tiêu
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by Hoàng vũ, on 11/08/2017: Tạo mới tài liệu
--- Modify by:
-- <Example>
/*

	exec KPIP90021 @DivisionID=N'AS', @Mode = 1, @TxtSearch=N'AA',@UserID=N'',@PageNumber=N'1',@PageSize=N'10'
	

*/

 CREATE PROCEDURE KPIP90021 (
     @DivisionID NVARCHAR(2000),
	 @Mode int,		--0: Tất cả; 1: công ty; 2: Phòng ban
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
	
	SET @OrderBy = ' M.TargetsID, M.TargetsName '

	IF @Mode = 0 --Lấy ra tất cả chỉ tiêu
	Begin
		IF Isnull(@TxtSearch,'') != ''  SET @sWhere = @sWhere +'
								AND (M.TargetsID LIKE N''%'+@TxtSearch+'%'' 
								OR M.TargetsName LIKE N''%'+@TxtSearch+'%'' 
								OR M.TargetsGroupID LIKE N''%'+@TxtSearch+'%'' 
								OR K1.TargetsGroupName LIKE N''%'+@TxtSearch+'%'' 
								OR M.ClassificationID LIKE N''%'+@TxtSearch + '%'' 
								OR A993.Description LIKE N''%'+@TxtSearch+'%'')'
		SET @sSQL = '
					SELECT M.APK, M.DivisionID, M.MainTargetID, Isnull(M.MainTargetName, K5.TargetsName) as MainTargetName
							, M.ClassificationID, A993.Description as ClassificationName, M.TargetsID, M.TargetsName
							, M.TargetsGroupID, K1.TargetsGroupName
							, M.UnitKpiID, M.FormulaName
							, M.FrequencyID, A992.Description as FrequencyName
							, M.SourceID, K3.SourceName, M.Note
							, M.Categorize, A991.Description as CategorizeName, M.Percentage, M.Revenue, M.GoalLimit, M.Benchmark
							, M.IsAddTargetsDictionaryID, M.IsCommon, M.Disabled
							, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
							into #TempKPIT10501
					FROM KPIT10501 M With (NOLOCK) Left join AT0099 A991 With (NoLock) on M.Categorize = A991.ID and A991.CodeMaster =''AT00000041''
										  Left join AT0099 A992 With (NoLock) on M.FrequencyID = A992.ID and A992.CodeMaster =''AT00000042''
										  Left join AT0099 A993 With (NoLock) on M.ClassificationID = A993.ID and A993.CodeMaster =''AT00000043''
										  Left join KPIT10101 K1 With (NoLock) on M.TargetsGroupID = K1.TargetsGroupID
										  Left join KPIT10301 K3 With (NoLock) on M.SourceID = K3.SourceID 
										  Left join KPIT10501 K5 With (NoLock) on M.MainTargetID = K5.TargetsID 
					WHERE 1 = 1 '+@sWhere+'

					DECLARE @count int
					Select @count = Count(TargetsID) From #TempKPIT10501

					SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @count AS TotalRow
							, M.APK, Case when isnull(M.IsCommon,0) =1 then '''' else M.DivisionID end As DivisionID 
							, M.ClassificationID, M.ClassificationName, M.TargetsID, M.TargetsName
							, M.TargetsGroupID, M.TargetsGroupName, M.MainTargetID, M.MainTargetName
							, M.UnitKpiID, M.FormulaName
							, M.FrequencyID, M.FrequencyName
							, M.SourceID, M.SourceName, M.Note
							, M.Categorize, M.CategorizeName, M.Percentage, M.Revenue, M.GoalLimit
							, M.Benchmark, M.IsAddTargetsDictionaryID, M.IsCommon, M.Disabled
							, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
					FROM #TempKPIT10501 M 
					ORDER BY '+@OrderBy+'
					OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
					FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
	End	

	IF @Mode = 1 --Chỉ lấy ra những chỉ tiêu Công ty
	Begin
		IF Isnull(@TxtSearch,'') != ''  SET @sWhere = @sWhere +'
								AND (M.TargetsID LIKE N''%'+@TxtSearch+'%'' 
								OR M.TargetsName LIKE N''%'+@TxtSearch+'%'' 
								OR M.TargetsGroupID LIKE N''%'+@TxtSearch+'%'' 
								OR K1.TargetsGroupName LIKE N''%'+@TxtSearch+'%'' 
								OR M.ClassificationID LIKE N''%'+@TxtSearch + '%'' 
								OR A993.Description LIKE N''%'+@TxtSearch+'%'')'
		SET @sSQL = '
					SELECT  M.APK, M.DivisionID, M.MainTargetID, Isnull(M.MainTargetName, K5.TargetsName) as MainTargetName
							, M.ClassificationID, A993.Description as ClassificationName, M.TargetsID, M.TargetsName
							, M.TargetsGroupID, K1.TargetsGroupName
							, M.UnitKpiID, M.FormulaName
							, M.FrequencyID, A992.Description as FrequencyName
							, M.SourceID, K3.SourceName, M.Note
							, M.Categorize, A991.Description as CategorizeName, M.Percentage, M.Revenue, M.GoalLimit, M.Benchmark
							, M.IsAddTargetsDictionaryID, M.IsCommon, M.Disabled
							, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
							into #TempKPIT10501
					FROM KPIT10501 M With (NOLOCK) Left join AT0099 A991 With (NoLock) on M.Categorize = A991.ID and A991.CodeMaster =''AT00000041''
										  Left join AT0099 A992 With (NoLock) on M.FrequencyID = A992.ID and A992.CodeMaster =''AT00000042''
										  Left join AT0099 A993 With (NoLock) on M.ClassificationID = A993.ID and A993.CodeMaster =''AT00000043''
										  Left join KPIT10101 K1 With (NoLock) on M.TargetsGroupID = K1.TargetsGroupID
										  Left join KPIT10301 K3 With (NoLock) on M.SourceID = K3.SourceID 
										  Left join KPIT10501 K5 With (NoLock) on M.MainTargetID = K5.TargetsID 
					WHERE M.ClassificationID = 1 '+@sWhere+' 

					DECLARE @count int
					Select @count = Count(TargetsID) From #TempKPIT10501

				SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @count AS TotalRow
							, M.APK, Case when isnull(M.IsCommon,0) =1 then '''' else M.DivisionID end As DivisionID 
							, M.ClassificationID, M.ClassificationName, M.TargetsID, M.TargetsName
							, M.TargetsGroupID, M.TargetsGroupName, M.MainTargetID, M.MainTargetName
							, M.UnitKpiID, M.FormulaName
							, M.FrequencyID, M.FrequencyName
							, M.SourceID, M.SourceName, M.Note
							, M.Categorize, M.CategorizeName, M.Percentage, M.Revenue, M.GoalLimit
							, M.Benchmark, M.IsAddTargetsDictionaryID, M.IsCommon, M.Disabled
							, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
					FROM #TempKPIT10501 M 
					ORDER BY '+@OrderBy+'
					OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
					FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
	End

	IF @Mode = 2 --Chỉ lấy ra những Chỉ tiêu phòng ban
	Begin
		IF Isnull(@TxtSearch,'') != ''  SET @sWhere = @sWhere +'
								AND (M.TargetsID LIKE N''%'+@TxtSearch+'%'' 
								OR M.TargetsName LIKE N''%'+@TxtSearch+'%'' 
								OR M.TargetsGroupID LIKE N''%'+@TxtSearch+'%'' 
								OR K1.TargetsGroupName LIKE N''%'+@TxtSearch+'%'' 
								OR M.ClassificationID LIKE N''%'+@TxtSearch + '%'' 
								OR A993.Description LIKE N''%'+@TxtSearch+'%'')'
		SET @sSQL = '
					SELECT  M.APK, M.DivisionID, M.MainTargetID, Isnull(M.MainTargetName, K5.TargetsName) as MainTargetName
							, M.ClassificationID, A993.Description as ClassificationName, M.TargetsID, M.TargetsName
							, M.TargetsGroupID, K1.TargetsGroupName
							, M.UnitKpiID, M.FormulaName
							, M.FrequencyID, A992.Description as FrequencyName
							, M.SourceID, K3.SourceName, M.Note
							, M.Categorize, A991.Description as CategorizeName, M.Percentage, M.Revenue, M.GoalLimit, M.Benchmark
							, M.IsAddTargetsDictionaryID, M.IsCommon, M.Disabled
							, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
							into #TempKPIT10501
					FROM KPIT10501 M With (NOLOCK) Left join AT0099 A991 With (NoLock) on M.Categorize = A991.ID and A991.CodeMaster =''AT00000041''
										  Left join AT0099 A992 With (NoLock) on M.FrequencyID = A992.ID and A992.CodeMaster =''AT00000042''
										  Left join AT0099 A993 With (NoLock) on M.ClassificationID = A993.ID and A993.CodeMaster =''AT00000043''
										  Left join KPIT10101 K1 With (NoLock) on M.TargetsGroupID = K1.TargetsGroupID
										  Left join KPIT10301 K3 With (NoLock) on M.SourceID = K3.SourceID 
										  Left join KPIT10501 K5 With (NoLock) on M.MainTargetID = K5.TargetsID 
					WHERE M.ClassificationID = 2 '+@sWhere+' 

					DECLARE @count int
					Select @count = Count(TargetsID) From #TempKPIT10501

				SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @count AS TotalRow
							, M.APK, Case when isnull(M.IsCommon,0) =1 then '''' else M.DivisionID end As DivisionID 
							, M.ClassificationID, M.ClassificationName, M.TargetsID, M.TargetsName
							, M.TargetsGroupID, M.TargetsGroupName, M.MainTargetID, M.MainTargetName
							, M.UnitKpiID, M.FormulaName
							, M.FrequencyID, M.FrequencyName
							, M.SourceID, M.SourceName, M.Note
							, M.Categorize, M.CategorizeName, M.Percentage, M.Revenue, M.GoalLimit
							, M.Benchmark, M.IsAddTargetsDictionaryID, M.IsCommon, M.Disabled
							, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
					FROM #TempKPIT10501 M 
					ORDER BY '+@OrderBy+'
					OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
					FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
	End
EXEC (@sSQL)
--PRINT (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
