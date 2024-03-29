IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[GETHISTORY]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[GETHISTORY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load Tab Lịch sử
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Trần Quốc Tuấn, Date: 14/09/2015
---- Edit by:
-- <Example>
---- 
/*
	GetHistory 'XR','ASOFTADMIN','','','HISTORYXR',1,50
*/
CREATE PROCEDURE dbo.GetHistory
(
	@DivisonID VARCHAR(50),
	@UserID VARCHAR(50),
	@TableID VARCHAR(50),
	@KeyAPK VARCHAR(50),
	@DataHistory VARCHAR(50),
	@PageNumber INT,
	@PageSize INT
)
AS
DECLARE @sSQL NVARCHAR(MAX),
		@OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50) = ''

SET @OrderBy = 'CreateDate DESC'
IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'

IF (EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE ('[' + name + ']' = @DataHistory OR name = @DataHistory)))
BEGIN
	 SET @sSQL='SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow,* 
	            FROM (SELECT H.APK,H.ActionType, H.CreateDate, H.CreateUserID UserID , A45.UserName,
					  S99.Description ActionTypeName
	            FROM '+@DataHistory+'.dbo.Histories H
	            INNER JOIN AT1405 A45 ON A45.UserID=H.CreateUserID AND A45.DivisionID='''+@DivisonID+'''
	            LEFT JOIN ST0099 S99 ON S99.ID=H.ActionType AND S99.CodeMaster=''ActionType''
				WHERE H.ReAPK='''+@KeyAPK+''')A
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY'
	--PRINT @sSQL
	EXEC (@sSQL)
	           
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
