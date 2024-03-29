IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP0010]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP0010]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load dữ liệu cho grid màn hình quản lý báo cáo
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Nguyễn Thanh Sơn, date: 12/12/2013
-- <Example>
---- 
/*
EXEC MTP0010 'SAS','',1,NULL,null,null,null
*/

CREATE PROCEDURE MTP0010
( 
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@IsCommon TINYINT,
	@GroupID VARCHAR(50),
	@Type VARCHAR(50),
	@ReportID VARCHAR(50),
	@ReportName NVARCHAR(250)
) 

AS 
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR (MAX)
SET @sWhere = ''
IF @IsCommon = 1 SET @sWhere = N'
AND IsCommon = 1'
IF (@IsCommon = 0 AND @DivisionID IS NOT NULL) SET @sWhere = N'
AND DivisionID = '''+@DivisionID+''' '

SET @sSQL = N'
SELECT ReportID, ReportName, ReportNameE, GroupID, [Type], [Disabled], IsCommon
FROM MTT8888
WHERE ReportID LIKE ''%'+ISNULL(@ReportID,'')+'%'' 
AND ReportName LIKE N''%'+ISNULL(@ReportName,'')+'%'' 
AND GroupID LIKE '''+ISNULL(@GroupID,'%')+'''
AND [Type] LIKE '''+ISNULL(@Type,'%')+''' '



EXEC (@sSQL+ @sWhere)
PRINT (@sSQL + @sWhere)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
