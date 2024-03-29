IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SP100031]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[SP100031]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Khóa tài khoản
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by	: Trần Quốc Tuấn, Date: 11/11/2014
----Modified by	: Nguyễn Văn Tài, Date: 27/03/2023 - [2023/03/IS/0238] Loại bỏ DivisionID khi khóa người dùng.
-- <Example>
---- 
/*
   EXEC SP100031 'XR','ADMIN',1,'DucQuy'',''thanhson'
*/

CREATE PROCEDURE SP100031
(
	@DivisionID NVARCHAR(50),
	@UserID NVARCHAR(50),
	@IsLock TINYINT,
	@lstUserID NVARCHAR(MAX)
)
AS 
DECLARE @sSQL NVARCHAR(MAX)
SET @sSQL ='UPDATE AT1405 SET  IsLock ='+STR(@IsLock)+' ,
            LastModifyUserID = '''+@UserID+''',
            LastModifyDate = GETDATE() 
             WHERE UserID IN ('''+@lstUserID+''')'
EXEC (@sSQL)
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
