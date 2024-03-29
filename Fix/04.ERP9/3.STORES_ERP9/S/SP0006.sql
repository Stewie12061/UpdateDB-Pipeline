IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SP0006]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[SP0006]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load combo báo cáo theo từng module - màn hình phân quyền báo cáo
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
---- Created by: Thanh Sơn on: 20/01/2015
---- Updated by: Trí Thiện on: 23/01/2015 - Thay đổi nội dung load dữ liệu báo cáo theo module và group
---- Modified on 
-- <Example>
/*
	 SP0006 'XR', '', 'ASOFTDRM', 'ADMIN', 2
*/

 CREATE PROCEDURE SP0006
(
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@ModuleID VARCHAR(50),
	@GroupID VARCHAR(50) = '',
	@Mode TINYINT
)
AS
DECLARE @sSQL NVARCHAR(1000),
		@TableID VARCHAR(50) = ''
		
IF @ModuleID = 'ASOFTDRM' SET @TableID = 'DRT8888'
IF @ModuleID = 'ASOFTWM' SET @TableID = 'WT8888'
IF @ModuleID = 'ASOFTHRM' SET @TableID = 'TT8888'
IF @ModuleID = 'ASOFTCI' SET @TableID = ''
IF @ModuleID = 'ASOFTS' SET @TableID = ''

IF @TableID <> ''
BEGIN
	IF @Mode = 1 SET @sSQL = '
	SELECT ReportID, ReportName FROM ' + @TableID + '
	WHERE (DivisionID = '''+@DivisionID+''')
	AND Disabled = 0
	AND ReportID NOT IN (
		SELECT DISTINCT S06.ReportID
		FROM ST0006 S06
		LEFT JOIN '+@TableID+' RT ON RT.DivisionID = S06.DivisionID AND RT.ReportID = S06.ReportID
		WHERE S06.DivisionID = '''+@DivisionID+'''
		AND S06.ModuleID = '''+@ModuleID+'''
		AND S06.UserGroupID = '''+@GroupID+'''
	)
	ORDER BY ReportID
	'

	IF @Mode = 2 SET @sSQL = '
	SELECT S06.ReportID, RT.ReportName
	FROM ST0006 S06
	LEFT JOIN '+@TableID+' RT ON RT.DivisionID = S06.DivisionID AND RT.ReportID = S06.ReportID
	WHERE S06.DivisionID = '''+@DivisionID+'''
	AND S06.ModuleID = '''+@ModuleID+'''
	AND S06.UserGroupID = '''+@GroupID+''' 
	ORDER BY ReportID
	'
END

PRINT (@sSQL)
EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
