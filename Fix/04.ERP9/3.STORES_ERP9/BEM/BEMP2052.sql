IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[BEMP2052]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[BEMP2052]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO









-- <Summary>
--- Load Master cho màn hình Detail - BEMF2052
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
---- Created by: Trọng Kiên	Create on: 12/06/2020


CREATE PROCEDURE [dbo].[BEMP2052]
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


IF ISNULL(@Type, '') = 'DCT' 
BEGIN
SET @sWhere = @sWhere + 'AND CONVERT(VARCHAR(50),B1.APKMaster_9000)= '''+@APKMaster+''''
SELECT  @Level = MAX(Levels) FROM BEMT2050 WITH (NOLOCK) WHERE APKMaster_9000 = @APKMaster AND DivisionID = @DivisionID
END
ELSE
BEGIN
SET @sWhere = @sWhere + 'AND (CONVERT(VARCHAR(50),B1.APK)= '''+@APK+'''OR CONVERT(VARCHAR(50),B1.APKMaster_9000) = ''' + @APK + ''')'
SELECT  @Level = MAX(Levels) FROM BEMT2050 WITH (NOLOCK) WHERE @APK = @APK AND DivisionID = @DivisionID
END

	WHILE @i <= @Level
	BEGIN
		IF @i < 10 SET @s = '0' + CONVERT(VARCHAR, @i)
		ELSE SET @s = CONVERT(VARCHAR, @i)

		SET @sSQLSL=@sSQLSL+' ,ApprovePerson'+@s+'ID, ApprovePerson'+@s+'Name, O2.[Description] AS ApprovePerson'+@s+'Status ' 
		
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
		SELECT B1.APK, B1.DivisionID, B1.APKMaster, B1.VoucherNo, B1.Date, B1.DateCheckIn, B1.DateCheckOut
              , B1.OtherContentCosts, B1.Journeys, B1.Amount, B1.ReleasePlace, B1.OtherContent
              , B2.VoucherNo AS WorkProposal
              , A1.CurrencyName AS CurrencyName
              , A2.FullName AS ApplicantName
              , B3.Description AS ContentCostName
			  , B1.Levels
			  , B1.CurrencyID
			  , B1.ContentCosts
			  , B1.APKMaster_9000
			  , B1.CreateDate, CONCAT(B1.CreateUserID, ''_'', A3.FullName) AS CreateUserID
			  , B1.LastModifyDate, CONCAT(B1.LastModifyUserID, ''_'', A4.FullName) AS LastModifyUserID
			  , B2.CountryID
			  , B2.CityID
			  , B1.Status AS StatusID
			  , B1.Note

	'+@sSQLSL+'
		FROM BEMT2050 B1 WITH (NOLOCK)
			LEFT JOIN OOT9000 OOT90 WITH (NOLOCK) ON B1.APKMaster_9000 = OOT90.APK
			LEFT JOIN BEMT2010 B2 WITH (NOLOCK) ON B2.APK = B1.APKMaster
            LEFT JOIN AT1004 AS A1 WITH (NOLOCK) ON A1.CurrencyID = B1.CurrencyID
            LEFT JOIN AT1103 AS A2 WITH (NOLOCK) ON A2.EmployeeID = B2.Applicant
			LEFT JOIN OOT0099 AS O2 WITH (NOLOCK) ON O2.ID = ISNULL(B1.Status, 0) AND O2.CodeMaster = ''Status''
			LEFT JOIN AT1103 AS A3 WITH (NOLOCK) ON A3.EmployeeID = B1.CreateUserID
			LEFT JOIN AT1103 AS A4 WITH (NOLOCK) ON A4.EmployeeID = B1.LastModifyUserID
			LEFT JOIN BEMT0099 AS B3 WITH (NOLOCK) ON B3.ID = B1.ContentCosts AND B3.CodeMaster = ''ContentCosts''
	'+@sSQLJon+'
	WHERE B1.DivisionID = '''+@DivisionID+''' '+@sWhere+''

EXEC (@sSQL)
PRINT (@sSQL)










GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
