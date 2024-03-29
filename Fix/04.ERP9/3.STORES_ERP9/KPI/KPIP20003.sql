IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'KPIP20003') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE KPIP20003
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Grid report KPIR20001 Danh sách cá nhân tự đánh giá
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: hoàng vũ, Date: 23/08/2017
-- <Example> EXEC KPIP20003 'AS', '', '', '', '', '', '', '', '', '', '', ''

CREATE PROCEDURE KPIP20003 ( 
  @DivisionID VARCHAR(50),  
  @DivisionIDList NVARCHAR(2000), 
  @EmployeeID nvarchar(50),
  @EmployeeName nvarchar(250),
  @DepartmentID nvarchar(50),
  @DutyID nvarchar(50),
  @TitleID nvarchar(50),
  @EvaluationPhaseID nvarchar(50),
  @EvaluationSetID nvarchar(50),
  @ConfirmUserID nvarchar(50),
  @ConditionEvaluationSelfID nvarchar(max), --Cá nhân tự đánh giá
  @UserID  VARCHAR(50)
  )
AS 
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
		@OrderBy NVARCHAR(500)
		
	SET @sWhere = ''
	SET @OrderBy = ' M.CreateUserID DESC, M.EmployeeID '

		--Check Para DivisionIDList null then get DivisionID 
	IF Isnull(@DivisionIDList, '') != ''
		SET @sWhere = @sWhere + ' M.DivisionID IN ('''+@DivisionIDList+''') and M.DeleteFlg = 0 '
	Else 
		SET @sWhere = @sWhere + ' M.DivisionID = N'''+@DivisionID+''' and M.DeleteFlg = 0 '
	
	IF Isnull(@EmployeeID, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.EmployeeID, '''') LIKE N''%'+@EmployeeID+'%'' '
	
	IF Isnull(@EmployeeName, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(D.FullName, '''') LIKE N''%'+@EmployeeName+'%'' '

	IF Isnull(@DepartmentID, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.DepartmentID, '''') LIKE N''%'+@DepartmentID+'%'' '

	IF Isnull(@DutyID, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.DutyID, '''') LIKE N''%'+@DutyID+'%'' '

	IF Isnull(@TitleID, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.TitleID, '''') LIKE N''%'+@TitleID+'%'' '

	IF Isnull(@EvaluationPhaseID, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.EvaluationPhaseID, '''') LIKE N''%'+@EvaluationPhaseID+'%'' '
		
	IF Isnull(@EvaluationSetID, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.EvaluationSetID, '''') LIKE N''%'+@EvaluationSetID+'%'' '
	
	IF Isnull(@ConditionEvaluationSelfID, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.ConfirmUserID,M.CreateUserID) in (N'''+@ConditionEvaluationSelfID+''' )'

	

SET @sSQL = ' 
			SELECT M.APK, M.DivisionID, D6.DivisionName, M.EmployeeID
				, LTRIM(RTRIM(REPLACE(LTRIM(RTRIM(ISNULL(D.LastName,'''')))+ '' '' + LTRIM(RTRIM(ISNULL(D.MiddleName,''''))) + '' '' + LTRIM(RTRIM(ISNULL(D.FirstName,''''))),'' '','' ''))) AS EmployeeName
				, M.EvaluationPhaseID, D4.EvaluationPhaseName, M.FromDate
				, M.ToDate, M.EvaluationSetID, M.EvaluationSetName, M.Note
				, M.DepartmentID, D1.DepartmentName
				, M.DutyID, D2.DutyName
				, M.TitleID, D3.TitleName
				, M.StrengthPoint, M.WeakPoint, M.EmployeeComments
				, M.EmployeeProposes, M.ConfirmUserID
				, LTRIM(RTRIM(REPLACE(LTRIM(RTRIM(ISNULL(D5.LastName,'''')))+ '' '' + LTRIM(RTRIM(ISNULL(D5.MiddleName,''''))) + '' '' + LTRIM(RTRIM(ISNULL(D5.FirstName,''''))),'' '','' ''))) AS ConfirmUserName
				, M.ConfirmDepartmentID, M.ConfirmDutyID
				, M.ConfirmTitleID, M.ConfirmComments, M.TotalPerformPoint, M.TotalReevaluatedPoint
				, M.TotalUnifiedPoint, M.ClassificationPerformPoint, M.ClassificationReevaluatedPoint
				, M.ClassificationUnifiedPoint, M.DeleteFlg
				, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
			FROM KPIT20001 M With (NOLOCK) Inner join HT1400 D With (NOLOCK) ON M.EmployeeID = D.EmployeeID
										   Left join AT1102 D1 With (NOLOCK) on M.DepartmentID = D1.DepartmentID
										   Left join HT1102 D2 With (NOLOCK) on M.DutyID = D2.DutyID
										   Left join HT1106 D3 With (NOLOCK) on M.TitleID = D3.TitleID
										   Left join KPIT10601 D4 With (NOLOCK) on M.EvaluationPhaseID = D4.EvaluationPhaseID
										   Left join HT1400 D5 With (NOLOCK) on M.ConfirmUserID = D5.EmployeeID
										   Left join AT1101 D6 With (NOLOCK) on M.DivisionID = D6.DivisionID
			WHERE '+@sWhere+'
			ORDER BY '+@OrderBy+'
			'
EXEC (@sSQL)



