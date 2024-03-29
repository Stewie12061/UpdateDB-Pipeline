IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[BEMP2032]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[BEMP2032]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO









-- <Summary>
--- Load Master cho màn hình Detail - BEMF2032
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
---- Created by: Trọng Kiên	Create on: 12/06/2020


CREATE PROCEDURE [dbo].[BEMP2032]
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

IF ISNULL(@Type, '') = 'TGCT' 
BEGIN
SET @sWhere = @sWhere + 'AND CONVERT(VARCHAR(50),B1.APKMaster_9000)= '''+@APKMaster+''''
SELECT  @Level = MAX(Levels) FROM BEMT2030 WITH (NOLOCK) WHERE APKMaster_9000 = @APKMaster AND DivisionID = @DivisionID
END
ELSE
BEGIN
SET @sWhere = @sWhere + 'AND (CONVERT(VARCHAR(50),B1.APK)= '''+@APK+'''OR CONVERT(VARCHAR(50),B1.APKMaster_9000) = ''' + @APK + ''')'
SELECT  @Level = MAX(Levels) FROM BEMT2030 WITH (NOLOCK) WHERE @APK = @APK AND DivisionID = @DivisionID
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
    SELECT B1.APK, B1.DivisionID, B1.APKMaster, B1.VoucherNo, B1.DateDefine, B1.APKMaster_9000
        , B2.VoucherNo AS WorkProposal
        , A1.FullName AS ApplicantName
        , A2.AnaName AS SubsectionName
        , B4.Description AS TypeBSTripName
        , B1.TypeBSTripID, B1.Applicant
        , B1.Levels
        , B1.CreateDate, CONCAT(B1.CreateUserID, ''_'', A3.FullName) AS CreateUserID
        , B1.LastModifyDate, CONCAT(B1.LastModifyUserID, ''_'', A4.FullName) AS LastModifyUserID
        , 
		CASE
			WHEN (A5.CountryName <> '''' OR A5.CountryName IS NOT NULL) AND (A6.CityName = '''' OR A6.CityName IS NULL)
			THEN A5.CountryName
			WHEN (A5.CountryName = '''' OR A5.CountryName IS NULL) AND (A6.CityName <> '''' OR A6.CityName IS NOT NULL)
			THEN A6.CityName
			WHEN (A5.CountryName <> '''' OR A5.CountryName IS NOT NULL) AND (A6.CityName <> '''' OR A6.CityName IS NOT NULL)
			THEN CONCAT(A5.CountryName, '', '',  A6.CityName)
		END AS WorkPlace
        , ISNULL(B1.Status, 0) AS StatusID
        , B1.Note

    '+@sSQLSL+'
    FROM BEMT2030 AS B1 WITH (NOLOCK)
        LEFT JOIN OOT9000 OOT90 WITH (NOLOCK) ON B1.APKMaster_9000 = OOT90.APK
        LEFT JOIN BEMT2010 B2 WITH (NOLOCK) ON B2.APK = B1.APKMaster
        LEFT JOIN AT1103 AS A1 WITH (NOLOCK) ON A1.EmployeeID = B1.Applicant
        LEFT JOIN BEMT0000 AS B3 WITH (NOLOCK) ON B1.DivisionID = B3.DivisionID
        LEFT JOIN AT1011 AS A2 WITH (NOLOCK) ON B3.SubsectionAnaID = A2.AnaTypeID AND A2.AnaID  = B1.SubsectionID
        LEFT JOIN BEMT0099 AS B4 WITH (NOLOCK) ON B4.ID  = B1.TypeBSTripID AND B4.CodeMaster = ''TypeBSTrip''
        LEFT JOIN OOT0099 AS O1 WITH (NOLOCK) ON O1.ID = ISNULL(B1.Status, 0) AND O1.CodeMaster = ''Status''
        LEFT JOIN AT1103 AS A3 WITH (NOLOCK) ON A3.EmployeeID = B1.CreateUserID
        LEFT JOIN AT1103 AS A4 WITH (NOLOCK) ON A4.EmployeeID = B1.LastModifyUserID
        LEFT JOIN AT1001 AS A5 WITH (NOLOCK) ON A5.CountryID  = B2.CountryID
        LEFT JOIN AT1002 AS A6 WITH (NOLOCK) ON A6.CityID  = B2.CityID
    '+@sSQLJon+'
    WHERE B1.DivisionID = '''+@DivisionID+''' '+@sWhere+''

EXEC (@sSQL)
PRINT (@sSQL)










GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
