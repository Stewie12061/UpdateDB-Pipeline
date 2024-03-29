IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[OOP2007_NQH]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[OOP2007_NQH]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




-- <Summary>
---- 
---- 
-- <Param>
---- Load nhân viên
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Bảo Thy, Date: 13/01/2016
----Modified by Bảo Thy on 22/06/2017: kiểm tra bảng phân ca khi tạo ĐXLTG
----Modified by Bảo Anh on 18/02/2019: load thêm các thông tin trước khi nghỉ việc cho nv tái tuyển dụng khi OOF2004 gọi từ MH hồ sơ ứng viên
----Modified by Tuấn Anh on 18/05/2020: Bổ sung customize cho MTE : Thực hiện lấy dữ liệu Thời gian Overtime dựa vào loại Công tăng - T
----Modified by Trọng Kiên on 18/09/2020: Fix lỗi load nhân viên OOF2004
----Modified by Hoài Phong on 25/11/2020: Bổ sung thêm điều kiện kiểm tra nhân viên thuộc black list
----Modified by Văn Tài	on 23/12/2020: Tách store cho khách hàng NQH.
----Modified by  Hoài Phong	on 29/12/2020: Bổ sung lấy các cột liên quan
----Modified by  Hoài Phong	on 15/01/2020:  Bổ sung trim để  tránh tình trạng tìm kiếm dính dấu khoản cách
----Modified by Hoài Phong	on 30/03/2021:  Fix lỗi load nhân viên DXP
----Modified by Hoài Phong	on 23/04/2021:  fix lỗi tìm kiếm
/*-- <Example>
 	OOP2007 @DivisionID='MK',@UserID='ASOFTADMIN', @PageNumber=11,@PageSize=25,@DepartmentID='NA', @SectionID='%', 
 	@SubsectionID='%', @ProcessID='%', @TxtSearch='', @EmployeeIDList='',@Type='DXP',@TranMonth=2,@TranYear=2016
 	
 	exec sp_executesql N'OOP2007 @DivisionID=N''MK'',@UserID=N''ASOFTADMIN'',@PageNumber=1,@PageSize=1000,@DepartmentID=N''A000000'',@SectionID=N'''',@SubsectionID=N'''',
 	@ProcessID=N'''',@TxtSearch=N''00026'',@EmployeeIDList=N'''',@TranMonth=N''8'',@TranYear=N''2016'',@Type=N''DXLTG''',N'@CreateUserID nvarchar(10),
 	@LastModifyUserID nvarchar(10),@DivisionID nvarchar(2)',@CreateUserID=N'ASOFTADMIN',@LastModifyUserID=N'ASOFTADMIN',@DivisionID=N'MK'
 ----*/


CREATE PROCEDURE OOP2007_NQH
(
    @DivisionID VARCHAR(50),
    @UserID VARCHAR(50),
    @DepartmentID VARCHAR(50),
    @SectionID VARCHAR(50),
    @SubsectionID VARCHAR(50),
    @ProcessID VARCHAR(50),
    @TxtSearch NVARCHAR(250),
    @PageNumber INT,
    @PageSize INT,
    @EmployeeIDList VARCHAR(MAX),
    @Type VARCHAR(50) = '',
    @TranMonth INT,
    @TranYear INT
)
AS
DECLARE @sSQL NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50) = '',
        @sSQL1 NVARCHAR(MAX),
        @sSQLSelect NVARCHAR(MAX),
        @sSQLWhere NVARCHAR(MAX),
        @sSQLWhere1 NVARCHAR(MAX) = '';

DECLARE @CustomerIndex INT = (
                                 SELECT CustomerName FROM CustomerIndex
                             );

SET @sSQLWhere = '';
SET @sSQLWhere1 = '';
SET @sSQL1 = '';
SET @sSQLSelect = '';

IF ISNULL(@DepartmentID, '') <> ''
    SET @sSQLWhere1 = @sSQLWhere1 + '		AND ISNULL(HV1400.DepartmentID,''%'')  IN (''' + @DepartmentID + ''') ';
IF ISNULL(@SectionID, '') <> ''
    SET @sSQLWhere1 = @sSQLWhere1 + '		AND ISNULL(HV1400.TEAMID,''%'') LIKE ''' + @SectionID + ''' ';
IF ISNULL(@SubsectionID, '') <> ''
    SET @sSQLWhere1 = @sSQLWhere1 + '		AND ISNULL(HV1400.Ana04ID,''%'') LIKE ''' + @SubsectionID + ''' ';
IF ISNULL(@ProcessID, '') <> ''
    SET @sSQLWhere1 = @sSQLWhere1 + '		AND ISNULL(HV1400.Ana05ID,''%'') LIKE ''' + @ProcessID + ''' ';

SET @OrderBy = 'EmployeeID';
IF @PageNumber <> 0
    SET @TotalRow = 'COUNT(*) OVER ()';
ELSE
    SET @TotalRow = '';

IF @Type = 'DXP'
BEGIN
    SET @sSQL1
        = '	
LEFT JOIN (SELECT ISNULL(SUM(CASE UnitID WHEN ''H'' THEN AbsentAmount
					WHEN ''D'' THEN (AbsentAmount*8)
		END),0) OffsetTime,EmployeeID,A.DivisionID
	FROM HT2401 A
	LEFT JOIN HT1013 B ON A.DivisionID=B.DivisionID AND A.AbsentTypeID=B.AbsentTypeID
	WHERE TypeID =''NB'' AND ISNULL(B.IsMonth,0)=0
	AND A.AbsentDate <= GETDATE() 
    GROUP BY EmployeeID,A.DivisionID
)C ON C.DivisionID = HV1400.DivisionID AND C.EmployeeID =HV1400.EmployeeID';
    SET @sSQLSelect
        = ',ISNULL(C.OffsetTime,0) AS OffsetTime, 0.0 AS TimeAllowance,0.0 OvertTime,0.0 OvertTimeNN,0.0 OvertTimeCompany';
    SET @sSQLWhere
        = 'AND HV1400.EmployeeID IN (SELECT EmployeeID FROM HT1025 
										  WHERE HT1025.TranMonth=' + STR(@TranMonth) + ' AND HT1025.TranYear='
          + STR(@TranYear) + ') ';

END;
ELSE
--- [Tuấn Anh] Modified [18/05/2020] Bổ sung customize cho MTE : Thực hiện lấy dữ liệu Thời gian Overtime dựa vào loại Công tăng - T
IF @Type = 'DXLTG'
BEGIN
    SET @sSQL1
        = '
		LEFT JOIN (	
			SELECT  ISNULL(SUM(CASE UnitID WHEN ''H'' THEN AbsentAmount
						WHEN ''D'' THEN (AbsentAmount*8) END),0) OvertTime,EmployeeID,A.DivisionID
			FROM HT2401 A
			LEFT JOIN HT1013 B ON A.DivisionID=B.DivisionID AND A.AbsentTypeID=B.AbsentTypeID
			LEFT JOIN OOT0020 OOT20 ON A.DivisionID=OOT20.DivisionID AND A.TranMonth=OOT20.TranMonth AND A.TranYear=OOT20.TranYear
			WHERE TypeID =''OT'' AND ISNULL(B.IsMonth,0)=0 
			AND A.TranMonth=' + STR(@TranMonth) + ' AND A.TranYear=' + STR(@TranYear)
          + '
			GROUP BY EmployeeID,A.DivisionID
		)C ON C.DivisionID = HV1400.DivisionID AND C.EmployeeID = HV1400.EmployeeID
		LEFT JOIN OOT0020 OT20 ON OT20.DivisionID = HV1400.DivisionID AND OT20.TranMonth=' + STR(@TranMonth)
          + ' AND OT20.TranYear=' + STR(@TranYear) + '
		';

    SET @sSQLSelect
        = ',0.0 OffsetTime, 0.0 AS TimeAllowance,ISNULL(C.OvertTime,0) AS OvertTime, 0.0 OvertTimeNN,0.0 OvertTimeCompany';
    SET @sSQLWhere
        = 'AND HV1400.EmployeeID IN (SELECT EmployeeID FROM HT1025 
											  WHERE HT1025.TranMonth=' + STR(@TranMonth) + ' AND HT1025.TranYear='
          + STR(@TranYear) + ')';
END;
ELSE IF @Type = 'DXDC'
BEGIN
    SET @sSQL1 = '';
    SET @sSQLSelect = ',0.0 OffsetTime, 0.0 AS TimeAllowance,0.0 OvertTime,0.0 OvertTimeNN,0.0 OvertTimeCompany';
    SET @sSQLWhere
        = 'AND HV1400.EmployeeID IN (SELECT EmployeeID FROM HT1025 
										  WHERE HT1025.TranMonth=' + STR(@TranMonth) + ' AND HT1025.TranYear='
          + STR(@TranYear) + ') ';
END;
ELSE IF @Type IN ( 'DXRN', 'DXBSQT' )
BEGIN
    SET @sSQL1 = '';
    SET @sSQLSelect = ',0.0 OffsetTime, 0.0 AS TimeAllowance,0.0 OvertTime,0.0 OvertTimeNN,0.0 OvertTimeCompany';
    SET @sSQLWhere
        = 'AND HV1400.EmployeeID IN (SELECT EmployeeID FROM HT1025 
										  WHERE HT1025.TranMonth=' + STR(@TranMonth) + ' AND HT1025.TranYear='
          + STR(@TranYear) + ')';
END;

SET @sSQL
    = '
	SELECT  ROW_NUMBER() OVER (ORDER BY ' + @OrderBy + ') AS RowNum, ' + @TotalRow
      + ' AS TotalRow,D.*
	FROM
		(SELECT DISTINCT';

IF @Type = 'HSUV'
    SET @sSQL = @sSQL + 'HV1400.*';

ELSE
BEGIN


    SET @sSQL
        = @sSQL
          + '	
		HV1400.DivisionID, HV1400.EmployeeID, HV1400.FullName AS EmployeeName, HV1400.DepartmentID,HV1400.DepartmentName, HV1400.DutyID,
		 A.EmployeeID as UserBlackList,A.DescriptionDetail as DetailBlackList,
		 HV1400.AnaID AS SubSectionID, HV1400.AnaName AS SubSectionName,HV1400.TEAMID AS TeamID ,HV1400.TeamName AS TeamName ';

    SET @sSQL
        = @sSQL + @sSQLSelect + '
		FROM HV1400 ' + @sSQL1
          + '   
		LEFT JOIN (
		SELECT EmployeeID,DescriptionDetail FROM  HRMT2151 WITH (NOLOCK) 
		LEFT JOIN HRMT2150 WITH (NOLOCK) ON HRMT2150.APK = HRMT2151.APKMaster
		WHERE HRMT2150.DivisionID = ''' + @DivisionID + ''' and TranMonth = ''' + STR(@TranMonth)
          + ''' AND TranYear = ''' + STR(@TranYear)
          + '''
		) A ON A.EmployeeID = HV1400.EmployeeID
		WHERE HV1400.DivisionID=''' + @DivisionID + '''
		'       + @sSQLWhere1;
END;
IF @Type = 'HSUV'
    SET @sSQL = @sSQL + '
	AND HV1400.EmployeeStatus = 9';
ELSE
    SET @sSQL = @sSQL + '
		AND HV1400.EmployeeStatus NOT IN (3,9)';

SET @sSQL
    = @sSQL + N'
		AND (ISNULL(HV1400.EmployeeID,'''') LIKE N''%' + TRIM(@TxtSearch) + '%'' OR ISNULL(FullName,'''') LIKE N''%'
      + TRIM(@TxtSearch) + '%'') 
		--AND HV1400.EmployeeID NOT IN (''' + @EmployeeIDList + ''')
		'   + @sSQLWhere + '
		 )D
		ORDER BY ' + @OrderBy + '
		OFFSET ' + STR((@PageNumber - 1) * @PageSize) + ' ROWS	
		FETCH NEXT ' + STR(@PageSize) + ' ROWS ONLY	';


EXEC (@sSQL);
--PRINT(@sSQL0)
PRINT (@sSQL);





GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
