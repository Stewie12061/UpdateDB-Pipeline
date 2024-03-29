IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP1000_DEL]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP1000_DEL]
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
	EXEC QCP1000_DEL @DivisionID='VNP', @APK='EE9D8EF0-313D-4814-9F9A-8BDC69306641', @APKList='', @Mode='1', @IsDisable='0', @UserID='ASOFTADMIN'
----*/

CREATE PROCEDURE QCP1000_DEL
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

SET @FormID = N'QCF1000'

SET @sSQL = N''

	IF @Mode = 1 
	BEGIN 
		SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Cur CURSOR,
						@DelDivisionID VARCHAR(50),
						@DelAPK VARCHAR(50),
						@DelStandardID NVARCHAR(250)
				DECLARE @QCT1000Temp TABLE (
						Status TINYINT,
						MessageID VARCHAR(100),
						Params NVARCHAR(4000))
				SET @Status = 0
				SET @Message = ''''
				INSERT INTO @QCT1000Temp (	Status, MessageID, Params)
											SELECT 2 AS Status, ''QCFML000006'' AS MessageID, NULL AS Params
											UNION ALL
											SELECT 2 AS Status, ''QCFML000007'' AS MessageID, NULL AS Params
				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT APK, DivisionID, StandardID FROM QCT1000 WITH (NOLOCK) WHERE CAST(APK AS VARCHAR(50)) IN (''' + @APKList + ''')
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelStandardID
				WHILE @@FETCH_STATUS = 0
				BEGIN
					EXEC QCP9000 @DelDivisionID, NULL, ''' + @TableID + ''', @DelAPK, @Status OUTPUT
					
					IF (@DelDivisionID NOT IN (''@@@'', ''' + @DivisionID + '''))
							UPDATE @QCT1000Temp SET Params = ISNULL(Params, '''') + @DelStandardID + '', '' WHERE MessageID = ''QCFML000006''
					ELSE IF (SELECT @Status) = 1
							UPDATE @QCT1000Temp SET Params = ISNULL(Params, '''') + @DelStandardID + '', '' WHERE MessageID = ''QCFML000007''
					ELSE
						BEGIN
							-- danh mục tiêu chuẩn
							DELETE FROM QCT1000 WHERE CAST(APK AS VARCHAR(50)) = @DelAPK
						END
					FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelStandardID
					SET @Status = 0
				END
				CLOSE @Cur
				SELECT Status, MessageID, LEFT(Params, LEN(Params) - 1) AS Params FROM @QCT1000Temp WHERE Params IS NOT NULL'

	END
	
EXEC (@sSQL)


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO