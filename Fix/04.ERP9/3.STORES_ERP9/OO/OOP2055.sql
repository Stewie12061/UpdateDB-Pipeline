IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[OOP2055]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[OOP2055]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load Form OOP2055: Gửi mail hàng loat
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---- Created by: Trần Quốc Tuấn, Date: 07/12/2015
---- Modified by Bảo Thy on 23/05/2017: Sửa danh mục dùng chung
---- Modified by Kiều Nga on 04/08/2023: [2023/06/IS/0267] Fix lỗi gửi trùng Email
---- Modified by Kiều Nga on 29/08/2023: [2023/08/IS/0308] Fix lỗi spam email cho người duyệt tiếp theo 
-- <Example>
---- 
/*
   OOP2055 @DivisionID='MK',@UserID='000460',@TranMonth=11,@TranYear=2016,@PageNumber=1,@PageSize=25,@IsSearch=0,
	@ID=NULL,@CreateUserID=NULL,@DepartmentID=NULL,@SectionID=NULL,
	@SubsectionID=NULL,@ProcessID=NULL,@Status=NULL,@Type=NULL,@NextApprovePersonID=NULL,
	@IsCheckALL=0,@APKList='76E13BA0-7C4B-4BF8-BCDF-02E1D0CC2161',@APKMasterList=NULL
*/
CREATE PROCEDURE OOP2055
( 
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@TranMonth INT,
	@TranYear INT,
	@PageNumber INT,
	@PageSize INT,
	@IsSearch TINYINT,
	@ID VARCHAR(50),
	@CreateUserID VARCHAR(50),
	@DepartmentID VARCHAR(50),
	@SectionID VARCHAR(50),
	@SubsectionID VARCHAR(50),
	@ProcessID VARCHAR(50),
	@Status NVARCHAR(50),
	@Type VARCHAR(50),
	@NextApprovePersonID VARCHAR(50),
	@IsCheckALL TINYINT=0,
	@APKList VARCHAR(MAX),
	@APKMasterList VARCHAR(MAX)=NULL -- List danh sách không cập nhật được loại bỏ
)
AS 
DECLARE @sSQL NVARCHAR (MAX) = '',
		@sSQL1 NVARCHAR (MAX) = '',
        @sWhere NVARCHAR(MAX) = '',
        @sWhere1 NVARCHAR(2000) = '',
        @sWhere2 NVARCHAR(2000) = '',
		@LanguageID VARCHAR(50),
		@sSQLLanguage1 VARCHAR(100)='',
		@sSQLLanguage2 VARCHAR(100)=''

SELECT TOP 1 @LanguageID=LanguageID FROM AT14051 WHERE UserID=@UserID
IF @LanguageID='vi-VN' 
BEGIN
	SET @sSQLLanguage1='OOT99.Description'
	SET @sSQLLanguage2 ='OOT991.Description'
END
ELSE 
BEGIN
	SET @sSQLLanguage1='OOT99.DescriptionE'
	SET @sSQLLanguage2 ='OOT991.DescriptionE'
END		
        
IF ISNULL(@APKMasterList,'')='' SET @APKMasterList=NULL


--IF @IsSearch = 1
--BEGIN
	IF @ID IS NOT NULL SET @sWhere = @sWhere + '
	AND ISNULL(OOT90.ID,'''') LIKE ''%'+@ID+'%'' '
	IF @CreateUserID IS NOT NULL SET @sWhere = @sWhere + '
	AND OOT90.CreateUserID LIKE ''%'+@CreateUserID+'%'' '
	IF @DepartmentID IS NOT NULL SET @sWhere = @sWhere + '
	AND ISNULL(OOT90.DepartmentID,'''') LIKE ''%'+@DepartmentID+'%'' '
	IF @SectionID IS NOT NULL SET @sWhere = @sWhere + '
	AND ISNULL(OOT90.SectionID,'''') LIKE ''%'+@SectionID+'%'' '
	IF @SubsectionID IS NOT NULL SET @sWhere = @sWhere + '
	AND ISNULL(OOT90.SubsectionID,'''') LIKE ''%'+@SubsectionID+'%'' '
	IF @ProcessID IS NOT NULL SET @sWhere = @sWhere + '
	AND ISNULL(OOT90.ProcessID,'''') LIKE ''%'+@ProcessID+'%'' '
	IF @Status IS NOT NULL SET @sWhere = @sWhere + '
	AND ISNULL(LTRIM(OOT91.Status),'''') LIKE ''%'+@Status+'%'' '
	IF @NextApprovePersonID IS NOT NULL SET @sWhere = @sWhere + '
	AND ISNULL(OOT911.ApprovePersonID,'''') LIKE ''%'+@NextApprovePersonID+'%'' '
	IF @Type IS NOT NULL SET @sWhere = @sWhere + '
	AND ISNULL(OOT90.Type,'''') LIKE ''%'+@Type+'%'' '
--END
IF @IsCheckALL=0 SET @sWhere1='AND OOT90.APK IN ('''+@APKList+''')'
IF @APKMasterList IS NOT NULL SET @sWhere2='AND OOT90.APK NOT IN ('''+@APKMasterList+''')'  


SELECT OOT52.APKMaster, CASE WHEN OOT90.[Type] = 'DXP' THEN CONVERT(VARCHAR(150),OT21.LeaveFromDate,120) +N' đến '+ CONVERT(VARCHAR(150),OT21.LeaveToDate,120)
							 WHEN OOT90.[Type] = 'DXRN' THEN CONVERT(VARCHAR(150),OT22.GoFromDate,120) +N' đến '+ CONVERT(VARCHAR(150),OT22.GoToDate,120)
							 WHEN OOT90.[Type] = 'DXLTG' THEN CONVERT(VARCHAR(150),OT23.WorkFromDate,120) +N' đến '+ CONVERT(VARCHAR(150),OT23.WorkToDate,120)
							 WHEN OOT90.[Type] = 'DXBSQT' THEN CONVERT(VARCHAR(150),OT24.[Date],120)
							 WHEN OOT90.[Type] = 'DXDC' THEN CONVERT(VARCHAR(150),OT27.ChangeFromDate,120) +N' đến '+ CONVERT(VARCHAR(150),OT27.ChangeToDate,120) END AS ApproveTime,
CASE WHEN OOT90.[Type] = 'DXP' THEN OT21.Reason
	 WHEN OOT90.[Type] = 'DXRN' THEN OT22.Reason
	 WHEN OOT90.[Type] = 'DXLTG' THEN  OT23.Reason
	 WHEN OOT90.[Type] = 'DXBSQT' THEN  OT24.Reason END AS Reason
INTO #ApproveTime
FROM OOT2052 OOT52  WITH (NOLOCK)
LEFT JOIN OOT9000 OOT90  WITH (NOLOCK) ON OOT90.DivisionID = OOT52.DivisionID AND OOT90.APK = OOT52.APKMaster
LEFT JOIN OOT2010 OT21 WITH (NOLOCK) ON OT21.APKMaster = OOT52.APKMaster
LEFT JOIN OOT2020 OT22 WITH (NOLOCK) ON OT22.APKMaster = OOT52.APKMaster
LEFT JOIN OOT2030 OT23 WITH (NOLOCK) ON OT23.APKMaster = OOT52.APKMaster
LEFT JOIN OOT2040 OT24 WITH (NOLOCK) ON OT24.APKMaster = OOT52.APKMaster
LEFT JOIN OOT2070 OT27 WITH (NOLOCK) ON OT27.APKMaster = OOT52.APKMaster
LEFT JOIN OOT1000 OT10 WITH (NOLOCK) ON OT10.AbsentTypeID = OT21.AbsentTypeID

        
SET @sSQL ='
	SELECT DISTINCT OOT911.APKMaster NextAPK,
	OOT90.ID,OOT90.Description,OOT90.Type,OOT90.APK APKMaster,AT13.EmployeeID CreateUserID,AT13.FullName CreateUserName,MAX(OOT91.Level) Level,
'+@sSQLLanguage1+' TypeName,AT13.Email CreateEmail,AT131.EmployeeID ApprovePersonID,AT131.FullName ApprovePersonName,AT131.Email ApproveEmail,
OOT02.EmailApprove,OOT02.EmailSuggest,AT1311.Email NextApproveEmail,AT1311.EmployeeID NextApprovePersonID,AT1311.FullName NextApprovePersonName,OOT91.Note,
'+@sSQLLanguage2+' Status,AT29.EmailTitle SubjectSuggest,AT29.EmailBody ContentSuggest,AT291.EmailTitle SubjectApprove,AT291.EmailBody ContentApprove,
MAX(#ApproveTime.ApproveTime) AS ApproveTime, MAX(#ApproveTime.Reason) AS Reason
FROM OOT9000 OOT90 WITH (NOLOCK)
LEFT JOIN AT1103 AT13  WITH (NOLOCK) ON AT13.EmployeeID = OOT90.CreateUserID
LEFT JOIN (SELECT * FROM (
				SELECT ROW_NUMBER() OVER (PARTITION BY OOT91.APKMaster,OOT91.ApprovePersonID ORDER BY [Level] DESC) AS rn, OOT91.APK,OOT91.DivisionID,OOT91.APKMaster,OOT91.ApprovePersonID, OOT91.Note,OOT91.[Status],OOT91.[Level] 
				FROM OOT9001 OOT91 WITH (NOLOCK)
				LEFT JOIN OOT9000 OOT90 WITH (NOLOCK) ON OOT91.DivisionID = OOT90.DivisionID AND OOT91.APKMaster = OOT90.APK
				WHERE OOT90.APK IN ('''+@APKList+''')
				AND OOT91.ApprovePersonID  = '''+@UserID+''') A WHERE rn = 1) OOT91 ON OOT91.DivisionID = OOT90.DivisionID AND OOT91.APKMaster = OOT90.APK --AND OOT91.Level=OOT90.ApprovingLevel
LEFT JOIN AT1103 AT131 WITH (NOLOCK) ON AT131.EmployeeID = OOT91.ApprovePersonID
LEFT JOIN OOT0099 OOT99 WITH (NOLOCK) ON OOT99.ID=OOT90.Type AND OOT99.CodeMaster=''Applying''
LEFT JOIN OOT0099 OOT991 WITH (NOLOCK) ON OOT991.ID1=OOT91.Status AND OOT991.CodeMaster=''Status''
LEFT JOIN OOT0020 OOT02 WITH (NOLOCK) ON OOT02.DivisionID = OOT90.DivisionID AND OOT02.TranMonth='+STR(@TranMonth)+' AND OOT02.TranYear='+STR(@TranYear)+'
LEFT JOIN OOT9001 OOT911 WITH (NOLOCK) ON OOT911.DivisionID = OOT90.DivisionID AND OOT911.APKMaster = OOT90.APK AND OOT911.Level = OOT91.Level+1
LEFT JOIN AT1103 AT1311 WITH (NOLOCK) ON AT1311.EmployeeID = OOT911.ApprovePersonID
LEFT JOIN AT0129 AT29 WITH (NOLOCK) ON AT29.TemplateID=OOT02.EmailSuggest
LEFT JOIN AT0129 AT291 WITH (NOLOCK) ON AT291.TemplateID=OOT02.EmailApprove
LEFT JOIN #ApproveTime ON OOT90.APK = #ApproveTime.APKMaster
WHERE OOT91.DivisionID ='''+@DivisionID+'''
		AND ISNULL(OOT90.DeleteFlag,0)=0
		AND OOT91.ApprovePersonID = '''+@UserID+'''
		'+@sWhere2+'
		'+@sWhere+'
		'+@sWhere1+' 
		AND EXISTS (SELECT TOP 1 1 FROM OOT2052 WITH (NOLOCK) WHERE OOT2052.APKMaster = OOT90.APK)
GROUP BY OOT911.APKMaster,OOT90.ID,OOT90.Description,OOT90.Type,OOT90.APK,OOT911.APK,AT13.FullName,
'+@sSQLLanguage1+',AT13.Email,AT131.FullName ,AT131.Email,
OOT02.EmailApprove,OOT02.EmailSuggest,AT1311.Email ,AT1311.FullName,OOT91.Note,
'+@sSQLLanguage2+',AT29.EmailTitle ,AT29.EmailBody,AT291.EmailTitle,AT291.EmailBody, AT13.EmployeeID, AT131.EmployeeID,AT1311.EmployeeID--,#ApproveTime.ApproveTime

DELETE OOT2052
'

EXEC (@sSQL+@sSQL1)

DROP TABLE #ApproveTime
--PRINT (@sSQL)
--PRINT (@sSQL1)
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
