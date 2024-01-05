﻿IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'HRMP21101') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE HRMP21101
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Grid Form HRMF2110 Danh sách nhóm tính cách cá nhân (D.I.S.C)
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: hoàng vũ, Date: 27/09/2017
----Modified on 04/10/2019 by Bảo Toàn: Cập nhật phân quyền
-- <Example> EXEC HRMP21101 '2017-01-01', '2017-12-12', 'NT', '', 'a', 'b', 'c', 'd', 'e', 3, 5, 0, 2, 6,'', 6, '', 6, '', 1, 20

CREATE PROCEDURE HRMP21101 ( 
		  @FromDate Datetime,
		  @ToDate Datetime,
		  @DivisionID VARCHAR(50),  
		  @DivisionIDList NVARCHAR(2110), 
		  @EmployeeID nvarchar(50),
		  @EmployeeName nvarchar(250),
		  @DepartmentID nvarchar(50),
		  @DutyID nvarchar(50),
		  @TitleID nvarchar(50),
		  @CharacterTypeID INT, --1: tự nhiên; 2: thích ứng
		  @FromD INT NULL,
		  @ToD INT NULL,
		  @FromI INT NULL,
		  @ToI INT NULL,
		  @FromS INT NULL,
		  @ToS INT NULL,
		  @FromC INT NULL,
		  @ToC INT NULL,
		  @UserID  VARCHAR(50),
		  @pageNumber INT,
		  @pageSize INT,
		  @ConditionDISCID VARCHAR(MAX) 
		)
AS 
BEGIN
		DECLARE @sSQL NVARCHAR (MAX),
				@sWhere NVARCHAR(MAX),
				@OrderBy NVARCHAR(500)
		
			SET @sWhere = ''
			SET @OrderBy = ' M.EvaluationDate DESC, M.EmployeeID '

			--Check Para DivisionIDList null then get DivisionID 
			IF Isnull(@DivisionIDList, '') != ''
				SET @sWhere = @sWhere + ' AND M.DivisionID IN ('''+@DivisionIDList+''')'
			Else 
				SET @sWhere = @sWhere + ' AND M.DivisionID = N'''+@DivisionID+''''
	
			IF Isnull(@FromDate, '')!= '' and Isnull(@ToDate, '') = ''
					SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10),M.EvaluationDate,112) > = '+CONVERT(VARCHAR(10),@FromDate,112)
			ELSE IF Isnull(@FromDate, '') = '' and Isnull(@ToDate, '') != ''
						SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10),M.EvaluationDate,112) < = '+CONVERT(VARCHAR(10),@ToDate,112)
			ELSE IF Isnull(@FromDate, '') != '' and Isnull(@ToDate, '') != ''
						SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10),M.EvaluationDate,112) Between '+CONVERT(VARCHAR(10),@FromDate,112)+' AND '+CONVERT(VARCHAR(10),@ToDate,112)

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

			
			IF @CharacterTypeID = 1
			Begin
				IF Isnull(@FromD, '')!= '' and Isnull(@ToD, '') = ''
					SET @sWhere = @sWhere + ' AND M.Nature_D > = ' + Cast(@FromD as varchar)
				ELSE IF Isnull(@FromD, '') = '' and Isnull(@ToD, '') != ''
							SET @sWhere = @sWhere + ' AND M.Nature_D < = ' + Cast(@ToD as varchar)
				ELSE IF Isnull(@FromD, '') != '' and Isnull(@ToD, '') != ''
							SET @sWhere = @sWhere + ' AND M.Nature_D Between ' + Cast(@FromD as varchar) +' AND '+ Cast(@ToD as varchar)
		
				IF Isnull(@FromI, '')!= '' and Isnull(@ToI, '') = ''
					SET @sWhere = @sWhere + ' AND M.Nature_I > = ' + Cast(@FromI as varchar)
				ELSE IF Isnull(@FromI, '') = '' and Isnull(@ToI, '') != ''
							SET @sWhere = @sWhere + ' AND M.Nature_I < = ' + Cast(@ToI as varchar)
				ELSE IF Isnull(@FromI, '') != '' and Isnull(@ToI, '') != ''
							SET @sWhere = @sWhere + ' AND M.Nature_I Between ' + Cast(@FromI as varchar) + ' AND ' + Cast(@ToI as varchar)

				IF Isnull(@FromS, '')!= '' and Isnull(@ToS, '') = ''
					SET @sWhere = @sWhere + ' AND M.Nature_S > = ' + Cast(@FromS as varchar)
				ELSE IF Isnull(@FromS, '') = '' and Isnull(@ToS, '') != ''
							SET @sWhere = @sWhere + ' AND M.Nature_S < = ' + Cast(@ToS as varchar)
				ELSE IF Isnull(@FromS, '') != '' and Isnull(@ToS, '') != ''
							SET @sWhere = @sWhere + ' AND M.Nature_S Between ' + Cast(@FromS as varchar) + ' AND ' + Cast(@ToS as varchar)
		
				IF Isnull(@FromC, '')!= '' and Isnull(@ToC, '') = ''
					SET @sWhere = @sWhere + ' AND M.Nature_C > = ' + Cast(@FromC as varchar)
				ELSE IF Isnull(@FromC, '') = '' and Isnull(@ToC, '') != ''
							SET @sWhere = @sWhere + ' AND M.Nature_C < = ' + Cast(@ToC as varchar)
				ELSE IF Isnull(@FromC, '') != '' and Isnull(@ToC, '') != ''
							SET @sWhere = @sWhere + ' AND M.Nature_C Between ' + Cast(@FromC as varchar) + ' AND ' + Cast(@ToC as varchar)
			End
	
			IF @CharacterTypeID = 2
			Begin
				IF Isnull(@FromD, '')!= '' and Isnull(@ToD, '') = ''
					SET @sWhere = @sWhere + ' AND M.Adaptive_D > = ' + Cast(@FromD as varchar)
				ELSE IF Isnull(@FromD, '') = '' and Isnull(@ToD, '') != ''
							SET @sWhere = @sWhere + ' AND M.Adaptive_D < = ' + Cast(@ToD as varchar)
				ELSE IF Isnull(@FromD, '') != '' and Isnull(@ToD, '') != ''
							SET @sWhere = @sWhere + ' AND M.Adaptive_D Between ' + Cast(@FromD as varchar) +' AND '+ Cast(@ToD as varchar)
		
				IF Isnull(@FromI, '')!= '' and Isnull(@ToI, '') = ''
					SET @sWhere = @sWhere + ' AND M.Adaptive_I > = ' + Cast(@FromI as varchar)
				ELSE IF Isnull(@FromI, '') = '' and Isnull(@ToI, '') != ''
							SET @sWhere = @sWhere + ' AND M.Adaptive_I < = ' + Cast(@ToI as varchar)
				ELSE IF Isnull(@FromI, '') != '' and Isnull(@ToI, '') != ''
							SET @sWhere = @sWhere + ' AND M.Adaptive_I Between ' + Cast(@FromI as varchar) + ' AND ' + Cast(@ToI as varchar)

				IF Isnull(@FromS, '')!= '' and Isnull(@ToS, '') = ''
					SET @sWhere = @sWhere + ' AND M.Adaptive_S > = ' + Cast(@FromS as varchar)
				ELSE IF Isnull(@FromS, '') = '' and Isnull(@ToS, '') != ''
							SET @sWhere = @sWhere + ' AND M.Adaptive_S < = ' + Cast(@ToS as varchar)
				ELSE IF Isnull(@FromS, '') != '' and Isnull(@ToS, '') != ''
							SET @sWhere = @sWhere + ' AND M.Adaptive_S Between ' + Cast(@FromS as varchar) + ' AND ' + Cast(@ToS as varchar)
		
				IF Isnull(@FromC, '')!= '' and Isnull(@ToC, '') = ''
					SET @sWhere = @sWhere + ' AND M.NAdaptive_C > = ' + Cast(@FromC as varchar)
				ELSE IF Isnull(@FromC, '') = '' and Isnull(@ToC, '') != ''
							SET @sWhere = @sWhere + ' AND M.Adaptive_C < = ' + Cast(@ToC as varchar)
				ELSE IF Isnull(@FromC, '') != '' and Isnull(@ToC, '') != ''
							SET @sWhere = @sWhere + ' AND M.Adaptive_C Between ' + Cast(@FromC as varchar) + ' AND ' + Cast(@ToC as varchar)
			End
			
			IF @CharacterTypeID != 1 and @CharacterTypeID != 2
			Begin
				IF Isnull(@FromD, '')!= '' and Isnull(@ToD, '') = ''
					SET @sWhere = @sWhere + ' AND (M.Nature_D > = ' + Cast(@FromD as varchar) + ' OR M.Adaptive_D > = ' + Cast(@FromD as varchar)+')'
				ELSE IF Isnull(@FromD, '') = '' and Isnull(@ToD, '') != ''
							SET @sWhere = @sWhere + ' AND (M.Nature_D < = ' + Cast(@ToD as varchar) + ' OR M.Adaptive_D < = ' + Cast(@ToD as varchar)+')'
				ELSE IF Isnull(@FromD, '') != '' and Isnull(@ToD, '') != ''
							SET @sWhere = @sWhere + ' AND (M.Nature_D Between ' + Cast(@FromD as varchar) +' AND '+ Cast(@ToD as varchar) + ' 
														   OR M.Adaptive_D Between ' + Cast(@FromD as varchar) +' AND '+ Cast(@ToD as varchar) + ')'
		
				IF Isnull(@FromI, '')!= '' and Isnull(@ToI, '') = ''
					SET @sWhere = @sWhere + ' AND (M.Nature_I > = ' + Cast(@FromI as varchar) + ' OR M.Adaptive_I > = ' + Cast(@FromI as varchar)+')'
				ELSE IF Isnull(@FromI, '') = '' and Isnull(@ToI, '') != ''
							SET @sWhere = @sWhere + ' AND (M.Nature_I < = ' + Cast(@ToI as varchar) + ' OR M.Adaptive_I < = ' + Cast(@ToI as varchar)+')'
				ELSE IF Isnull(@FromI, '') != '' and Isnull(@ToI, '') != ''
							SET @sWhere = @sWhere + ' AND (M.Nature_I Between ' + Cast(@FromI as varchar) +' AND '+ Cast(@ToI as varchar) + ' 
														   OR M.Adaptive_I Between ' + Cast(@FromI as varchar) +' AND '+ Cast(@ToI as varchar) + ')'

				IF Isnull(@FromS, '')!= '' and Isnull(@ToS, '') = ''
					SET @sWhere = @sWhere + ' AND (M.Nature_S > = ' + Cast(@FromS as varchar) + ' OR M.Adaptive_S > = ' + Cast(@FromS as varchar)+')'
				ELSE IF Isnull(@FromS, '') = '' and Isnull(@ToS, '') != ''
							SET @sWhere = @sWhere + ' AND (M.Nature_S < = ' + Cast(@ToS as varchar) + ' OR M.Adaptive_S < = ' + Cast(@ToS as varchar)+')'
				ELSE IF Isnull(@FromS, '') != '' and Isnull(@ToS, '') != ''
							SET @sWhere = @sWhere + ' AND (M.Nature_S Between ' + Cast(@FromS as varchar) +' AND '+ Cast(@ToS as varchar) + ' 
														   OR M.Adaptive_S Between ' + Cast(@FromS as varchar) +' AND '+ Cast(@ToS as varchar) + ')'
		
				IF Isnull(@FromC, '')!= '' and Isnull(@ToC, '') = ''
					SET @sWhere = @sWhere + ' AND (M.Nature_C > = ' + Cast(@FromC as varchar) + ' OR M.Adaptive_C > = ' + Cast(@FromC as varchar)+')'
				ELSE IF Isnull(@FromC, '') = '' and Isnull(@ToC, '') != ''
							SET @sWhere = @sWhere + ' AND (M.Nature_C < = ' + Cast(@ToC as varchar) + ' OR M.Adaptive_C < = ' + Cast(@ToC as varchar)+')'
				ELSE IF Isnull(@FromC, '') != '' and Isnull(@ToC, '') != ''
							SET @sWhere = @sWhere + ' AND (M.Nature_C Between ' + Cast(@FromC as varchar) +' AND '+ Cast(@ToC as varchar) + ' 
														   OR M.Adaptive_C Between ' + Cast(@FromC as varchar) +' AND '+ Cast(@ToC as varchar) + ')'
		
			End

			IF Isnull(@ConditionDISCID, '') != ''
				SET @sWhere = @sWhere + ' AND ISNULL(M.CreateUserID,'''') in (N'''+@ConditionDISCID+''' )'


		SET @sSQL = ' 
					SELECT M.APK, M.DivisionID, M.EvaluationDate, M.EmployeeID, D.FullName as EmployeeName, M.DepartmentID, M.TeamID, M.DutyID, M.TitleID
					, M.Nature_D, M.Nature_I, M.Nature_S, M.Nature_C, M.Nature
					, M.Adaptive_D, M.Adaptive_I, M.Adaptive_S, M.Adaptive_C, M.Adaptive
					, M.Descriptions
					, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
							into #TempHRMT21101
					FROM HRMT21101 M With (NOLOCK) Inner join AT1103 D With (NOLOCK) ON M.EmployeeID = D.EmployeeID
					WHERE M.DeleteFlg = 0 '+@sWhere+'

					DECLARE @count int
					Select @count = Count(EmployeeID) From #TempHRMT21101 With (NOLOCK)

					SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @count AS TotalRow
							, M.APK, M.DivisionID, M.EvaluationDate, M.EmployeeID, M.EmployeeName
							, M.DepartmentID, D1.DepartmentName, M.TeamID, M.DutyID, D2.DutyName, M.TitleID, D3.TitleName
							, M.Nature_D, M.Nature_I, M.Nature_S, M.Nature_C, M.Nature
							, M.Adaptive_D, M.Adaptive_I, M.Adaptive_S, M.Adaptive_C, M.Adaptive
							, M.Descriptions
							, M.CreateUserID, M.CreateDate, M.LastModifyUserID, M.LastModifyDate
					FROM #TempHRMT21101 M With (NOLOCK) Left join AT1102 D1 With (NOLOCK) on M.DepartmentID = D1.DepartmentID
										  Left join HT1102 D2 With (NOLOCK) on M.DutyID = D2.DutyID
										  Left join HT1106 D3 With (NOLOCK) on M.TitleID = D3.TitleID
					ORDER BY '+@OrderBy+'
					OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
					FETCH NEXT '+STR(@PageSize)+' ROWS ONLY 
					'
		EXEC (@sSQL)
	
END


