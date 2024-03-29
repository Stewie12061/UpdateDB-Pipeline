IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[BEMP2042]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[BEMP2042]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO









-- <Summary>
--- Load Master cho màn hình Detail - BEMF2042
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
---- Created by: Trọng Kiên	Create on: 12/06/2020


CREATE PROCEDURE [dbo].[BEMP2042]
(
	@DivisionID VARCHAR(50),
	@APK VARCHAR(50) = '',
	@APKMaster VARCHAR(50) = '',
	@Type VARCHAR(50) = ''
)
AS

DECLARE @sSQL NVARCHAR(max), 
		@sWhere  NVARCHAR(max) = '',
		@Level INT,
		@sSQLSL NVARCHAR (MAX) = '',
		@i INT = 1, @s VARCHAR(2),
		@sSQLJon NVARCHAR (MAX) = ''


IF ISNULL(@Type, '') = 'BCCT' 
BEGIN
SET @sWhere = @sWhere + 'AND CONVERT(VARCHAR(50),B1.APKMaster_9000)= '''+@APKMaster+''''
SELECT  @Level = MAX(Levels) FROM BEMT2040 WITH (NOLOCK) WHERE APKMaster_9000 = @APKMaster AND DivisionID = @DivisionID
END
ELSE
BEGIN
SET @sWhere = @sWhere + 'AND (CONVERT(VARCHAR(50),B1.APK)= '''+@APK+'''OR CONVERT(VARCHAR(50),B1.APKMaster_9000) = ''' + @APK + ''')'
SELECT  @Level = MAX(Levels) FROM BEMT2040 WITH (NOLOCK) WHERE @APK = @APK AND DivisionID = @DivisionID
END

	WHILE @i <= @Level
	BEGIN
		IF @i < 10 SET @s = '0' + CONVERT(VARCHAR, @i)
		ELSE SET @s = CONVERT(VARCHAR, @i)

		SET @sSQLSL=@sSQLSL+' ,ApprovePerson'+@s+'ID, ApprovePerson'+@s+'Name, O1.[Description] AS ApprovePerson'+@s+'Status ' 
		
		SET @sSQLJon =@sSQLJon+ '
						LEFT JOIN (
						SELECT ApprovePersonID ApprovePerson'+@s+'ID, OOT1.APKMaster, OOT1.DivisionID,
						 A1.FullName As ApprovePerson'+@s+'Name
						FROM OOT9001 OOT1 WITH (NOLOCK)
						INNER JOIN AT1103 A1 WITH (NOLOCK) ON A1.DivisionID=OOT1.DivisionID AND A1.EmployeeID=OOT1.ApprovePersonID
						WHERE OOT1.Level='+STR(@i)+'
						) APP'+@s+' ON APP'+@s+'.DivisionID= OOT90.DivisionID  AND APP'+@s+'.APKMaster=OOT90.APK'
						
		SET @i = @i + 1		
	END

SET @sSQL = '
		SELECT B1.APK, B1.DivisionID, B1.APKMaster, B1.VoucherNo, B1.DateReport
              , B1.WorkDate, B1.Purpose, B1.WorkResults, B1.ContentDetails
              , B2.VoucherNo AS WorkProposal 
              , A1.AnaName AS SubsectionName
              , A2.FullName AS ApplicantName
			  , B1.Levels
			  , B1.APKMaster_9000
			  , 
				CASE
					WHEN (A3.CountryName <> '''' OR A3.CountryName IS NOT NULL) AND (A4.CityName = '''' OR A4.CityName IS NULL)
					THEN A3.CountryName
					WHEN (A3.CountryName = '''' OR A3.CountryName IS NULL) AND (A4.CityName <> '''' OR A4.CityName IS NOT NULL)
					THEN A4.CityName
					WHEN (A3.CountryName <> '''' OR A3.CountryName IS NOT NULL) AND (A4.CityName <> '''' OR A4.CityName IS NOT NULL)
					THEN CONCAT(A3.CountryName, '', '',  A4.CityName)
				END AS WorkPlace
			  , B1.CreateDate, CONCAT(B1.CreateUserID, ''_'', A5.FullName) AS CreateUserID
			  , B1.LastModifyDate, CONCAT(B1.LastModifyUserID, ''_'', A6.FullName) AS LastModifyUserID
			  , B1.Status AS StatusID
			  , B1.Note, B1.SubsectionID
			  , B1.Applicant

	'+@sSQLSL+'
	FROM BEMT2040 AS B1 WITH (NOLOCK)
		LEFT JOIN OOT9000 OOT90 WITH (NOLOCK) ON B1.APKMaster_9000 = OOT90.APK
			LEFT JOIN BEMT2010 B2 WITH (NOLOCK) ON B2.APK = B1.APKMaster
            LEFT JOIN AT1011 AS A1 WITH (NOLOCK) ON A1.AnaID  = B1.SubsectionID
            LEFT JOIN AT1103 AS A2 WITH (NOLOCK) ON A2.EmployeeID = B1.Applicant
			LEFT JOIN AT1001 AS A3 WITH (NOLOCK) ON A3.CountryID  = B2.CountryID
			LEFT JOIN AT1002 AS A4 WITH (NOLOCK) ON A4.CityID  = B2.CityID
			LEFT JOIN AT1103 AS A5 WITH (NOLOCK) ON A5.EmployeeID = B1.CreateUserID
			LEFT JOIN AT1103 AS A6 WITH (NOLOCK) ON A6.EmployeeID = B1.LastModifyUserID
		    LEFT JOIN OOT0099 AS O1 WITH (NOLOCK) ON O1.ID = ISNULL(B1.Status, 0) AND O1.CodeMaster = ''Status''
	'+@sSQLJon+'
	WHERE B1.DivisionID = '''+@DivisionID+''' '+@sWhere+''

EXEC (@sSQL)
PRINT (@sSQL)










GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
