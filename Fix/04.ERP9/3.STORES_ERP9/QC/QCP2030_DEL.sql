IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP2030_DEL]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP2030_DEL]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Kiểm tra xóa/sửa 
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Create on 12/10/2020 by Thanh Thi
-- <Example>
---- 
/*-- <Example>
	EXEC QCP2030_DEL @DivisionID='VNP', @APK='EE9D8EF0-313D-4814-9F9A-8BDC69306641', @APKList='', @Mode='1', @IsDisable='0', @UserID='ASOFTADMIN'
----*/

CREATE PROCEDURE QCP2030_DEL
( 
	@DivisionID VARCHAR(50),
	@TableID VARCHAR(50),
	@APK VARCHAR(50), --Trường hợp sửa
	@APKList NVARCHAR(MAX), --Trường hợp xóa hoặc xử lý enable/disable
	@Mode TINYINT, --0: Sửa, 1: Xóa; 2: Sửa (Disable/Enable), 3: Sửa: kiểm tra đã sử dụng để check dùng chung 
	@IsDisable TINYINT, --1: Disable; 0: Enable
	@UserID NVARCHAR(50)  
) 
AS 
DECLARE @sSQL NVARCHAR(MAX)
DECLARE @FormID NVARCHAR(MAX)

SET @FormID = N'QCF2030'

SET @sSQL = N''

	IF @Mode = 1 
	BEGIN 
		
		SET @sSQL = @sSQL + N'
		UPDATE QCT2002 SET DeleteFlg = 1 WHERE APKMaster IN (''' + @APKList + ''')
		UPDATE QCT2010 SET DeleteFlg = 1 WHERE APK IN ('''+@APKList+''')'
	END
EXEC (@sSQL)


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO