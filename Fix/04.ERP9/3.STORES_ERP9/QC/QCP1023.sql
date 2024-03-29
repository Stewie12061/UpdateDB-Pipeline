IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP1023]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP1023]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- <Summary>
---- Load Detail Định nghĩa tiêu chuẩn (Xem chi tiết)
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
---- 
-- <History>
----Created by: Thanh Thi on 15/10/2020
----Edit by : Đình Hòa on 07/05/2021 :  Bổ sung load cột MathFormula
----Edit by : Hoàng Long on 03/04/2023 :  Bổ sung load cột Dụng cụ đo, Loại
----Edit by : Hoàng Long on 12/04/2023 :  Bổ sung load cột Số thứ tự bản vẽ
----Edit by : Viết Toàn on 11/09/2023 : Bổ sung cột tần suất đo
-- <Example> EXEC QCP1023 @DivisionID = 'BE', @UserID = '', @APK = '9B8430BF-53C2-4EAB-A524-50BC4F2FCA82',@PageNumber='1',@PageSize='25'
CREATE PROCEDURE QCP1023
( 
	 @DivisionID VARCHAR(50),
	 @UserID VARCHAR(50),
	 @APK VARCHAR(50),
	 @PageNumber INT,
	 @PageSize INT
)

AS 

	DECLARE @sSQL NVARCHAR(MAX) = N'',
			@OrderBy NVARCHAR(MAX) = N'', 
			@TotalRow NVARCHAR(50) = N'',
			@sWhere NVARCHAR(MAX) = N''

	SET @OrderBy = N'T1.Orders, T1.StandardID'
	IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'

	SET @sSQL = N'
				SELECT  T1.APK, T1.APKMaster, T1.DivisionID, T1.StandardID, T2.StandardName, T2.StandardNameE
						, T3.UnitID, T3.UnitName AS StandardUnitID
						, CASE WHEN ISNULL(R01.StandardName,'''') <> '''' THEN R01.StandardName ELSE T1.SRange01 END AS SRange01
						, CASE WHEN ISNULL(R02.StandardName,'''') <> '''' THEN R02.StandardName ELSE T1.SRange02 END AS SRange02
						, CASE WHEN ISNULL(R03.StandardName,'''') <> '''' THEN R03.StandardName ELSE T1.SRange03 END AS SRange03
						, CASE WHEN ISNULL(R04.StandardName,'''') <> '''' THEN R04.StandardName ELSE T1.SRange04 END AS SRange04
						, CASE WHEN ISNULL(R05.StandardName,'''') <> '''' THEN R05.StandardName ELSE T1.SRange05 END AS SRange05
						, CASE WHEN ISNULL(R06.StandardName,'''') <> '''' THEN R06.StandardName ELSE T1.SRange06 END AS SRange06
						, CASE WHEN ISNULL(R07.StandardName,'''') <> '''' THEN R07.StandardName ELSE T1.SRange07 END AS SRange07
						, CASE WHEN ISNULL(R08.StandardName,'''') <> '''' THEN R08.StandardName ELSE T1.SRange08 END AS SRange08
						, CASE WHEN ISNULL(R09.StandardName,'''') <> '''' THEN R09.StandardName ELSE T1.SRange09 END AS SRange09
						, T1.Disabled, T1.CreateDate, T1.CreateUserID, T1.LastModifyDate, T1.LastModifyUserID
						, T4.Description AS StandardTypeID, T1.Orders, T1.MathFormula
				INTO #TempQCT1021
				FROM QCT1021 T1 WITH (NOLOCK) 
				LEFT JOIN QCT1000 T2 WITH (NOLOCK) ON T1.StandardID = T2.StandardID
				LEFT JOIN QCT0099 T4 WITH (NOLOCK) ON T2.TypeID = T4.ID AND T4.CodeMaster = ''Standard''
				LEFT JOIN AT1304 T3 WITH (NOLOCK) ON T2.UnitID = T3.UnitID
				LEFT JOIN QCT1000 R01 WITH(NOLOCK) ON R01.DivisionID = T1.DivisionID AND R01.StandardID = T1.SRange01 AND R01.TypeID = ''APPE''
				LEFT JOIN QCT1000 R02 WITH(NOLOCK) ON R02.DivisionID = T1.DivisionID AND R02.StandardID = T1.SRange02 AND R02.TypeID = ''APPE''
				LEFT JOIN QCT1000 R03 WITH(NOLOCK) ON R03.DivisionID = T1.DivisionID AND R03.StandardID = T1.SRange03 AND R03.TypeID = ''APPE''
				LEFT JOIN QCT1000 R04 WITH(NOLOCK) ON R04.DivisionID = T1.DivisionID AND R04.StandardID = T1.SRange04 AND R04.TypeID = ''APPE''
				LEFT JOIN QCT1000 R05 WITH(NOLOCK) ON R05.DivisionID = T1.DivisionID AND R05.StandardID = T1.SRange05 AND R05.TypeID = ''APPE''
				LEFT JOIN QCT1000 R06 WITH(NOLOCK) ON R06.DivisionID = T1.DivisionID AND R06.StandardID = T1.SRange06 AND R06.TypeID = ''APPE''
				LEFT JOIN QCT1000 R07 WITH(NOLOCK) ON R07.DivisionID = T1.DivisionID AND R07.StandardID = T1.SRange07 AND R07.TypeID = ''APPE''
				LEFT JOIN QCT1000 R08 WITH(NOLOCK) ON R08.DivisionID = T1.DivisionID AND R08.StandardID = T1.SRange08 AND R08.TypeID = ''APPE''
				LEFT JOIN QCT1000 R09 WITH(NOLOCK) ON R09.DivisionID = T1.DivisionID AND R09.StandardID = T1.SRange09 AND R09.TypeID = ''APPE''
				WHERE T1.APKMaster = '''+@APK+''' AND T1.DivisionID = ''' + @DivisionID + '''

				DECLARE @Count INT
				SELECT @Count = COUNT(*) FROM #TempQCT1021
				
				SELECT  CONVERT(INT, ROW_NUMBER() OVER (ORDER BY '+@OrderBy+')) AS RowNum, @Count AS TotalRow
						, APK, APKMaster, DivisionID, StandardID, StandardName, StandardNameE
						, UnitID, StandardUnitID
						, SRange01
						, SRange02
						, SRange03
						, SRange04
						, SRange05
						, SRange06
						, SRange07
						, SRange08
						, SRange09
						, Disabled, CreateDate, CreateUserID, LastModifyDate, LastModifyUserID
						, StandardTypeID, Orders, MathFormula
				FROM #TempQCT1021 T1 WITH (NOLOCK) 
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY'

 	 EXEC (@sSQL)
 

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO