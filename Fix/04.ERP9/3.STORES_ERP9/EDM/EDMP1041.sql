﻿IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[EDMP1041]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[EDMP1041]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load thông tin chi tiết năm học EDMF1042
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Minh Hòa, Date: 17/09/2018
--- Modify by ...: Bổ sung ...
-- <Example>

/*-- <Example>
	EDMP1041 @DivisionID='VS',@UserID='ASOFTADMIN', @APK ='E80FA704-6CBD-4168-A7D3-2580ABDA2D64'

	exec EDMP1041 'MK','NV04','E80FA704-6CBD-4168-A7D3-2580ABDA2D64'
----*/

CREATE PROCEDURE EDMP1041
( 
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@APK VARCHAR(50),
	@LanguageID VARCHAR(50)
)
AS 
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX)

SET @sSQL = '
	SELECT EDMT1040.DivisionID, EDMT1040.APK, EDMT1040.SchoolYearID, EDMT1040.DateFrom, EDMT1040.DateTo , EDMT1040.IsCommon,  EDMT1040.Disabled,
	EDMT1040.CreateUserID, EDMT1040.CreateDate, EDMT1040.LastModifyUserID, EDMT1040.LastModifyDate
	FROM EDMT1040 WITH (NOLOCK) 
   	WHERE EDMT1040.APK ='''+ @APK +'''
'

EXEC (@sSQL)
--PRINT(@sSQL)


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

