IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[HRMP3035]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[HRMP3035]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




-- <Summary>
--- Load dữ liệu báo cáo chi tiết hồ sơ nhân viên.
-- <History>
----Created by: Sinh viên
-- <Example>
-- exec HRMP3035 @DivisionID=N'BBA-SI,BBA-SO',@FromDate='2023-11-09 00:00:00',@ToDate='2023-11-09 00:00:00',@DepartmentList=N'',@TeamList=N'',@StatusList=N'',@PeriodList=N'11/2023,10/2023,06/2023,05/2023,04/2023,03/2023,02/2023,01/2023',@AssignedToUserID=N''
CREATE PROCEDURE [dbo].[HRMP3035] (
    @DivisionID      NVARCHAR(50), 
    @FromDate        DATETIME, 
    @ToDate          DATETIME,
    @DepartmentList  VARCHAR(MAX),
    @TeamList        VARCHAR(MAX),
    @StatusList      VARCHAR(MAX),
    @PeriodList    NVARCHAR(MAX),
	@AssignedToUserID NVARCHAR(MAX),	
	@IsDate          TINYINT
)
AS 
BEGIN
    DECLARE @sSQL NVARCHAR(MAX)='',        
            @sWhere NVARCHAR(MAX)='',
			@FromDateText NVARCHAR(20),
			@ToDateText NVARCHAR(20),
			@OrderBy NVARCHAR(500)=N''

	SET @FromDateText = CONVERT(NVARCHAR(20), @FromDate, 111)
	SET @ToDateText = CONVERT(NVARCHAR(10), @ToDate, 111) + ' 23:59:59'
	--SET @sWhere = '(HRMT2040.Startdate BETWEEN ''' + @FromDateText + ''' AND ''' + @ToDateText + ''''') '
	IF @IsDate = 1
	--Theo ngày
	BEGIN
		IF(ISNULL(@FromDate,'') != '' AND ISNULL(@ToDate,'') = '' )
			BEGIN
				SET @sWhere = @sWhere + ' (HT14.CreateDate >= ''' + @FromDateText + '''
												OR HT14.CreateDate >= ''' + @FromDateText + ''')'
			END
		ELSE IF(ISNULL(@FromDate,'') = '' AND ISNULL(@ToDate,'') != '')
			BEGIN
				SET @sWhere = @sWhere + '  (HT14.CreateDate <= ''' + @ToDateText + ''' 
												OR HT14.CreateDate <= ''' + @ToDateText + ''')'
			END
		ELSE IF(ISNULL(@FromDate, '') != '' AND ISNULL(@ToDate, '') != '')
			BEGIN
				SET @sWhere = @sWhere + '  (HT14.CreateDate BETWEEN ''' + @FromDateText + ''' AND ''' + @ToDateText + ''') '
			END
	END
	ELSE
	--Theo kỳ
	BEGIN
		SET @sWhere = @sWhere + '  (SELECT FORMAT(HT14.CreateDate, ''MM/yyyy'')) IN ( ''' + @PeriodList + ''') '
	END
	IF ISNULL(@DivisionID, '') <> ''
		SET @sWhere = @sWhere + ' AND HV14.DivisionID IN (''' + REPLACE(@DivisionID, ',', ''',''') + ''') '

	IF ISNULL(@TeamList, '') <> ''
		SET @sWhere = @sWhere + ' AND ISNULL(HV14.TeamID,'''') IN (''' + @TeamList + ''') '

	IF ISNULL(@DepartmentList, '') <> ''
		SET @sWhere = @sWhere + ' AND ISNULL(HV14.DepartmentID,'''') IN (''' + @DepartmentList + ''') '

	IF ISNULL(@StatusList, '') <> ''
	
		SET @sWhere = @sWhere + ' AND ISNULL(HV14.StatusID,'''') IN (''' +@StatusList + ''')   '
		 
		--(Convert(nvarchar,HV14.StatusID),'''')
		--REPLACE(@StatusList, ',', ''',''')
	IF ISNULL(@AssignedToUserID, '') <> ''
		SET @sWhere = @sWhere + ' AND HT14.EmployeeID IN (''' + REPLACE(@AssignedToUserID, ',', ''',''') + ''') '


    SET @sSQL ='SELECT HT14.EmployeeID,
	ISNULL(HT14.LastName,'''')+ '' '' + 
	ISNULL(HT14.MiddleName,'''') + '' '' + 
	ISNULL(HT14.FirstName,'''') fullName , 
	HT14.ShortName,
	HT14.Birthday, 
	HT14.NativeCountry,
	HV14.CountryName,
	HV14.EthnicName,
	HV14.ReligionName,
	HT14.HealthStatus,
	HT14.Alias,
	HT14.BornPlace,
	HV14.IsMaleName,
	HV14.IsSingleName,
	HT14.PermanentAddress,
	HT14.TemporaryAddress,
	HT14.HomePhone,
	HT14.HomeFax,
	HT14.MobiPhone,
	HT14.PassportNo,
	HT14.PassportDate,
	HT14.PassportEnd,
	HT14.Notes,
	HT14.IdentifyCardNo,
	HT14.IdentifyDate,
	HT14.IdentifyPlace,
	HT14.IdentifyEnd,
	HT14.IdentifyCityID,
	HV14.STATUS,
	HV14.CompanyDate,
	HV14.BeginProbationDate,
	HV14.EndProbationDate,
	HV14.SpouseName,
	HV14.TitleName,
	HT111.TaxObjectName,
	HT24.TimeCoefficient,
	HT24.DutyCoefficient,
	HT24.SalaryCoefficient,
	HT24.BaseSalary,
	HT24.InsuranceSalary,
	HT24.Salary01,
	HT24.Salary02,
	HT24.Salary03,
	HV14.SalaryLevel,
	HV14.SalaryLevelDate,
	HV14.QuitJobName,
	HV14.HFromDate,
	HV14.HToDate,
	HV14.DepartmentName,
	HV14.TeamName,
	HV14.DutyName,
	AT111.DivisionName,
	HT143.SuggestSalary,
	HT143.Experience,
	HT143.RecruitDate,
	HT143.RecruitPlace,
	AT113.FullName MidEmployeeName,
	HV14.LoaCondName
	FROM dbo.HT1400 HT14
	INNER JOIN dbo.HV1400 HV14 ON HT14.EmployeeID = HV14.EmployeeID
	LEFT JOIN dbo.HT1011 HT111 ON HT111.TaxObjectID =  HV14.TaxObjectID
	LEFT JOIN dbo.HT1403 HT143 ON HT143.EmployeeID = HT14.EmployeeID
	LEFT JOIN dbo.AT1101 AT111 ON AT111.DivisionID = HT14.DivisionID
	LEFT JOIN dbo.AT1103 AT113 ON AT113.EmployeeID = HT143.MidEmployeeID
	LEFT JOIN (SELECT T1.EmployeeID, T1.TimeCoefficient, T1.DutyCoefficient,T1.SalaryCoefficient, T1.BaseSalary,T1.InsuranceSalary,T1.Salary01, T1.Salary02, T1.Salary03  FROM dbo.HT2400
 T1 INNER JOIN (SELECT EmployeeID, MAX(TranYear) AS MaxTranYear, MAX(TranMonth) AS MaxTranMonth FROM dbo.HT2400 GROUP BY EmployeeID) T2 ON T1.EmployeeID = T2.EmployeeID AND T1.TranMonth = T2.MaxTranMonth AND T1.TranYear = T2.MaxTranYear ) HT24 ON HT24.EmployeeID = HT14.EmployeeID where ' + @sWhere
    PRINT @sSQL
    EXEC sp_executesql @sSQL
END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO