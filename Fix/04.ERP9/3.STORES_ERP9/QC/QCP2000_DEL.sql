IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP2000_DEL]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP2000_DEL]
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
----Modified on 30/03/2021 by Le Hoang : custom cho Vinapaper xóa dữ liệu apk được chọn trong bảng tạm
-- <Example>
---- 
/*-- <Example>
	EXEC QCP2000_DEL @DivisionID='VNP', @APK='EE9D8EF0-313D-4814-9F9A-8BDC69306641', @APKList='', @Mode='1', @IsDisable='0', @UserID='ASOFTADMIN'
----*/

CREATE PROCEDURE QCP2000_DEL
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
DECLARE @sSQL1 NVARCHAR(MAX)
DECLARE @FormID NVARCHAR(MAX)

SET @FormID = N'QCF2000'

SET @sSQL = N''
SET @sSQL1 = N''

	IF @Mode = 1 
	BEGIN 
		
		SET @sSQL = @sSQL + N'
		DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Cur CURSOR,
						@DelDivisionID VARCHAR(50),
						@DelAPK VARCHAR(50),
						@DelVoucherNo NVARCHAR(250)
				DECLARE @ResultTemp TABLE (
						Status TINYINT,
						MessageID VARCHAR(100),
						Params NVARCHAR(4000))
				SET @Status = 0
				SET @Message = ''''

				INSERT INTO @ResultTemp (Status, MessageID, Params)
				SELECT 2 AS Status, ''00ML000050'' AS MessageID, NULL AS Params
				UNION ALL
				SELECT 2 AS Status, ''QCFML000001'' AS MessageID, NULL AS Params
				UNION ALL
				SELECT 2 AS Status, ''QCFML000002'' AS MessageID, NULL AS Params
				UNION ALL
				SELECT 2 AS Status, ''QCFML000003'' AS MessageID, NULL AS Params
				UNION ALL
				SELECT 2 AS Status, ''QCFML000004'' AS MessageID, NULL AS Params
				UNION ALL
				SELECT 2 AS Status, ''QCFML000005'' AS MessageID, NULL AS Params

				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT APK, DivisionID, VoucherNo FROM QCT2000 WITH (NOLOCK) WHERE CAST(APK AS VARCHAR(50)) IN (''' + @APKList + ''')
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelVoucherNo
				WHILE @@FETCH_STATUS = 0
				BEGIN

		IF EXISTS (SELECT TOP 1 1 FROM QCT2010 WHERE DeleteFlg = 0 AND APKMaster = @DelAPK) OR 
		   EXISTS (SELECT TOP 1 1 FROM QCT2010 T1 JOIN QCT2011 T2 ON T1.APK = T2.APKMaster 
					WHERE T1.DeleteFlg = 0 AND T2.DeleteFlg = 0 AND RefAPKMaster = @DelAPK)
		BEGIN
			DECLARE @Type INT = NULL
			SELECT TOP 1 @Type = VoucherType FROM QCT2010 WHERE DeleteFlg = 0 AND APKMaster = @DelAPK
			IF ISNULL(@Type,'''') = '''' 
			BEGIN
				SELECT TOP 1 @Type = VoucherType FROM QCT2010 T1 JOIN QCT2011 T2 ON T1.APK = T2.APKMaster 
					WHERE T1.DeleteFlg = 0 AND T2.DeleteFlg = 0 AND RefAPKMaster = @DelAPK
			END
			--không xóa, đẩy voucherno vào param
			UPDATE @ResultTemp SET Params = ISNULL(Params, '''') + @DelVoucherNo + '', '' WHERE MessageID = 
				CASE WHEN @Type = 0 THEN ''QCFML000002''--TSM
					 WHEN @Type = 1 THEN ''QCFML000004''--TSKT
					 WHEN @Type = 2 THEN ''QCFML000003''--TSNVL
					 WHEN @Type = 3 THEN ''QCFML000001'' END--GNSL
		END
		ELSE IF EXISTS (SELECT TOP 1 1 FROM QCT2021 WHERE DeleteFlg = 0 AND RefAPKMaster = @DelAPK)--phiếu xử lý lỗi
		BEGIN
			--không xóa, đẩy voucherno vào param
			UPDATE @ResultTemp SET Params = ISNULL(Params, '''') + @DelVoucherNo + '', '' WHERE MessageID = ''QCFML000005''
		END 
		ELSE
		BEGIN
			--xóa bảng tiêu chuẩn
			UPDATE QCT2002 SET DeleteFlg = 1 WHERE APKMaster 
			IN (SELECT APK FROM QCT2001 WHERE 
				APKMaster IN (SELECT APK FROM QCT2000 WHERE APK = @DelAPK
			AND APK NOT IN (SELECT APKMaster FROM QCT2010 WHERE DeleteFlg = 0 AND APKMaster = @DelAPK) 
			AND APK NOT IN (SELECT T2.RefAPKMaster FROM QCT2010 T1 JOIN QCT2011 T2 ON T1.APK = T2.APKMaster WHERE T1.DeleteFlg = 0 AND T2.DeleteFlg =0 
			AND RefAPKMaster = @DelAPK)))

			--xóa bảng chi tiết mặt hàng
			UPDATE QCT2001 SET DeleteFlg = 1 WHERE APKMaster 
			IN (SELECT APK FROM QCT2000 WHERE APK = @DelAPK
			AND APK NOT IN (SELECT APKMaster FROM QCT2010 WHERE DeleteFlg = 0 AND APKMaster = @DelAPK)
			AND APK NOT IN (SELECT T2.RefAPKMaster FROM QCT2010 T1 JOIN QCT2011 T2 ON T1.APK = T2.APKMaster WHERE T1.DeleteFlg = 0 AND T2.DeleteFlg = 0 AND RefAPKMaster = @DelAPK))

			--xóa bảng master phiếu
			UPDATE QCT2000 SET DeleteFlg = 1 WHERE APK = @DelAPK
			AND APK NOT IN (SELECT APKMaster FROM QCT2010 WHERE DeleteFlg = 0 AND APKMaster = @DelAPK)
			AND APK NOT IN (SELECT T2.RefAPKMaster FROM QCT2010 T1 JOIN QCT2011 T2 ON T1.APK = T2.APKMaster WHERE T1.DeleteFlg = 0 AND T2.DeleteFlg = 0 AND RefAPKMaster = @DelAPK)
		END

		FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelVoucherNo
				END
		CLOSE @Cur

		IF EXISTS (SELECT TOP 1 1 FROM CustomerIndex WHERE CustomerName = 128)
		BEGIN
			IF OBJECT_ID(''tempdb.dbo.#DeleteQCT2001Temp'', ''U'') IS NOT NULL
			BEGIN
			  DROP TABLE #DeleteQCT2001Temp; 
			END
			SELECT APK INTO #DeleteQCT2001Temp FROM QCT2001_TEMP WHERE APKMaster IN (''' + @APKList + ''')

			DELETE QCT2002_TEMP WHERE APKMaster IN (SELECT APK FROM #DeleteQCT2001Temp)
			DELETE QCT2001_TEMP WHERE APKMaster IN (''' + @APKList + ''')
			DELETE QCT2000_TEMP WHERE APK IN (''' + @APKList + ''')
		END

		SELECT Status, MessageID, LEFT(Params, LEN(Params) - 1) AS Params FROM @ResultTemp WHERE Params IS NOT NULL
			'
	END

PRINT(@sSQL)
EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

