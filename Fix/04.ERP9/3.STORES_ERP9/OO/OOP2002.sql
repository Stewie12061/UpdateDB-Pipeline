IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[OOP2002]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[OOP2002]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load Form OOP2002: Xem bảng phân ca
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Trần Quốc Tuấn, Date: 07/12/2015
---- Modified by Bảo Thy on 06/09/2016: Lấy Khối, Phòng từ danh mục phòng ban, tổ nhóm
---- Modified by Phương Thảo on 22/05/2017: Sửa danh mục dùng chung
---- Modified by Bảo Anh on 04/01/2019: lấy trạng thái duyệt từ OOT2000 theo cải tiến mới
---- Modified by Trọng Kiên on 09/04/2020: Bổ sung câu load cột ApprovePerSon động để load người duyệt khi edit
-- <Example>
---- 
/*
   Exec OOP2002 @DivisionID='MK',@UserID='ASOFTADMIN',@APKMaster='C5AE14B1-7CB6-403F-B65F-03571F0091A1',
   @TranMonth=8,@TranYear=2016
*/
CREATE PROCEDURE OOP2002
( 
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@APKMaster VARCHAR(50),
	@TranMonth INT,
	@TranYear INT
)
AS
DECLARE @sSQL NVARCHAR (MAX) = '',
		@sSQL1 NVARCHAR (MAX) = '',
		@Level INT,
		@sSQLSL NVARCHAR (MAX) = '',
		@sSQLJon NVARCHAR (MAX) = '',
		@s VARCHAR(2),
		@LanguageID VARCHAR(50),
		@sSQLLanguage VARCHAR(100)=''

SELECT TOP 1 @LanguageID=LanguageID FROM AT14051 WITH (NOLOCK) WHERE UserID=@UserID
IF @LanguageID='vi-VN'
	SET @sSQLLanguage='O99.Description'
ELSE
	SET @sSQLLanguage='O99.DescriptionE'
	
SET @Level=ISNULL((SELECT MAX(LEVEL) FROM OOT0010 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND AbsentType ='BPC' AND TranYear = @TranYear AND TranMonth = @TranMonth),0)

DECLARE @i INT = 1
	WHILE @i <= @Level
	BEGIN
		IF @i < 10 SET @s = '0' + CONVERT(VARCHAR, @i)
		ELSE SET @s = CONVERT(VARCHAR, @i)
		SET @sSQLSL=@sSQLSL+', ApprovePerson'+@s+'ID, ApprovePerson'+@s+'ID AS ApprovePerson'+@s+', ApprovePerson'+@s+'Name, ApprovePerson'+@s+'Status, ApprovePerson'+@s+'StatusName, ApprovePerson'+@s+'Note'
		SET @sSQLJon =@sSQLJon+ '
						LEFT JOIN (SELECT ApprovePersonID ApprovePerson'+@s+'ID,OOT1.APKMaster,OOT1.DivisionID,OOT1.Status,
						Ltrim(RTrim(isnull(HT14.LastName,'''')))+ '' '' + LTrim(RTrim(isnull(HT14.MiddleName,''''))) 
						+ '' '' + LTrim(RTrim(Isnull(HT14.FirstName,''''))) As ApprovePerson'+@s+'Name,
						OOT1.Status ApprovePerson'+@s+'Status, O99.Description ApprovePerson'+@s+'StatusName,
						OOT1.Note ApprovePerson'+@s+'Note
						FROM OOT9001 OOT1 WITH (NOLOCK)
						INNER JOIN HT1400 HT14 WITH (NOLOCK) ON HT14.DivisionID=OOT1.DivisionID AND HT14.EmployeeID=OOT1.ApprovePersonID
						LEFT JOIN OOT0099 O99 WITH (NOLOCK) ON O99.ID1=ISNULL(OOT1.Status,0) AND O99.CodeMaster=''Status''
						WHERE OOT1.Level='+STR(@i)+'
						)APP'+@s+' ON APP'+@s+'.DivisionID= OOT90.DivisionID  AND APP'+@s+'.APKMaster=OOT90.APK'
		SET @i = @i + 1		
	END	
	
IF @i < 10 SET @s = '0' + CONVERT(VARCHAR, @Level)
		ELSE SET @s = CONVERT(VARCHAR, @Level)
SET @sSQL ='
		SELECT OOT90.APK, OOT90.TranMonth,OOT90.TranYear, OOT90.ID,AT1405.UserName CreateUserName,
		       OOT90.[Description], OOT90.DepartmentID, OOT90.SectionID,
		       OOT90.SubsectionID, OOT90.ProcessID, ISNULL(OOT2000.ApproveLevel,0) AS ApproveLevel,
		       ISNULL(OOT2000.ApprovingLevel,0) AS ApprovingLevel, OOT2000.Status, OOT90.CreateDate, OOT90.LastModifyDate,A11.DepartmentName,
		       OOT90.CreateUserID +'' - ''+ (SELECT TOP 1 UserName FROM AT1405 WITH (NOLOCK) WHERE UserID = OOT90.CreateUserID) CreateUserID,
			   OOT90.LastModifyUserID +'' - ''+ (SELECT TOP 1 UserName FROM AT1405 WITH (NOLOCK) WHERE UserID = OOT90.LastModifyUserID) LastModifyUserID,
		       NULL SectionName,NULL SubsectionName,NULL ProcessName,'+@sSQLLanguage+' StatusName,'+STR(@Level) + ' Level
		       '+@sSQLSL+'
		FROM OOT9000 OOT90 WITH (NOLOCK)
		LEFT JOIN AT1405 WITH (NOLOCK) ON AT1405.DivisionID = OOT90.DivisionID AND AT1405.UserID=OOT90.CreateUserID
		LEFT JOIN AT1102 A11 WITH (NOLOCK) ON A11.DepartmentID=OOT90.DepartmentID 
		--LEFT JOIN HT1101 A12 WITH (NOLOCK) ON A12.DivisionID = OOT90.DivisionID AND A12.TeamID=OOT90.SectionID AND OOT90.DepartmentID = A12.DepartmentID
		--LEFT JOIN AT1011 A13 WITH (NOLOCK) ON A13.AnaID=OOT90.SubsectionID AND A13.AnaTypeID=''A04''
		--LEFT JOIN AT1011 A14 WITH (NOLOCK) ON A14.AnaID=OOT90.ProcessID AND A14.AnaTypeID=''A05''
		LEFT JOIN (	SELECT DivisionID, APKMaster, MIN(Status) AS Status, MIN(ApproveLevel) AS ApproveLevel, MIN(ApprovingLevel) AS ApprovingLevel
					FROM OOT2000 WITH (NOLOCK) GROUP BY DivisionID, APKMaster
				) OOT2000
			ON OOT2000.DivisionID = OOT90.DivisionID AND OOT90.APK = OOT2000.APKMaster
		LEFT JOIN OOT0099 O99 WITH (NOLOCK) ON O99.ID1=OOT2000.Status AND O99.CodeMaster=''Status'' '
SET @sSQL1=''+@sSQLJon+'
		WHERE OOT90.Type=''BPC''
		AND OOT90.DivisionID ='''+@DivisionID+'''
		AND OOT90.TranMonth ='+STR(@TranMonth)+' AND OOT90.TranYear ='+STR(@TranYear)+'
		AND OOT90.APK ='''+@APKMaster+''' '
		

EXEC (@sSQL+@sSQL1)
PRINT @sSQLSL
PRINT @sSQLJon
PRINT (@sSQL)
PRINT (@sSQL1)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
