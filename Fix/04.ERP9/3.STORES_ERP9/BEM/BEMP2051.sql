﻿IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[BEMP2051]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[BEMP2051]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Store xóa BEMT2050
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Tấn Thành, Date 16/06/2020

CREATE PROCEDURE [dbo].[BEMP2051] (
	@DivisionID VARCHAR(50), 	-- Tr??ng h?p @DivisionID ?úng v?i DivisionID ??ng nh?p thì cho xóa
	@APK VARCHAR(50), 			-- Tr??ng h?p s?a
	@APKList NVARCHAR(MAX), 	-- Tr??ng h?p xóa ho?c x? lí enable/disable
	@TableID NVARCHAR(50), 		-- "BEMT2050"	
	@Mode TINYINT, 				-- 0: S?a, 1: Xóa; 2: S?a (Disable/Enable)
	@IsDisable TINYINT, 		-- 1: Disable; 0: Enable
	@UserID VARCHAR(50)
	) 
AS 
BEGIN
	DECLARE @sSQL NVARCHAR(MAX)
	IF @Mode = 1 -- Kiêm tra và sửa
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT, 
						@Message NVARCHAR(1000), 
						@Cur CURSOR, 
						@DelDivisionID VARCHAR(50), 
						@DelAPK VARCHAR(50),
						@DelVoucherNo VARCHAR(MAX),
						@APKMaster_9000 VARCHAR(50), 
						@DelApkMaster  VARCHAR(50)

				DECLARE @BEMT2050Temp TABLE (
						Status TINYINT, 
						MessageID VARCHAR(100), 
						Params NVARCHAR(4000))
				SET @Status = 0
				SET @Message = ''''
				INSERT INTO @BEMT2050Temp (	Status, MessageID, Params) 
											SELECT 2 AS Status, ''00ML000117'' AS MessageID, NULL AS Params
				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT B1.APK, B1.DivisionID, B1.VoucherNo, B1.APKMaster_9000, O1.APK FROM BEMT2050 B1 WITH (NOLOCK) 
					LEFT JOIN OOT9000 O1 WITH (NOLOCK) ON O1.APK = B1.APKMaster_9000 
					LEFT JOIN (
						SELECT OO1.APKMaster, OO1.DivisionID, MIN(OO1.Status) AS Status
						FROM OOT9001 OO1 WITH (NOLOCK)
						WHERE ISNULL(OO1.DeleteFlag, 0) = 0
						GROUP BY OO1.APKMaster, OO1.DivisionID
						HAVING MIN(OO1.Status) > 0
					) AS O2 ON O2.APKMaster = O1.APK AND O2.DivisionID = B1.DivisionID
					--LEFT JOIN OOT9001 O2 WITH (NOLOCK) ON O2.APKMaster = O1.APK 
				WHERE CAST(B1.APK AS VARCHAR(50)) IN (''' + @APKList + ''')				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelVoucherNo, @APKMaster_9000, @DelAPKMaster
				WHILE @@FETCH_STATUS = 0
				BEGIN
					EXEC BEMP9000 ''' + @DivisionID + ''', NULL, ''' + @TableID + ''', @DelAPK, @DelVoucherNo, NULL, NULL, @Status OUTPUT
					IF @Status = 1
						UPDATE @BEMT2050Temp SET Params = ISNULL(Params, '''') + @DelVoucherNo + '', '' WHERE MessageID = ''00ML000117''
					ELSE 
					BEGIN
						UPDATE BEMT2050 SET DeleteFlg = 1 WHERE CAST(APK AS VARCHAR(50)) = @DelAPK
						UPDATE OOT9000 SET DeleteFlag = 1 WHERE CAST(APK AS VARCHAR(50)) = @APKMaster_9000
						UPDATE OOT9001 SET DeleteFlag = 1 WHERE CAST(APKMaster AS VARCHAR(50)) = @DelApkMaster
					END					
					FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelVoucherNo, @APKMaster_9000, @DelAPKMaster
					SET @Status = 0
				END
				CLOSE @Cur
				SELECT Status, MessageID, LEFT(Params, LEN(Params) - 1) AS Params FROM @BEMT2050Temp WHERE Params IS NOT NULL'
			EXEC (@sSQL)
			PRINT (@sSQL)
	END

	IF @Mode = 0
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT, 
						@Message NVARCHAR(1000), 
						@Cur CURSOR, 
						@DelDivisionID VARCHAR(50), 
						@DelAPK VARCHAR(50),
						@DelVoucherNo VARCHAR(MAX)

				DECLARE @BEMT2050Temp TABLE (
						Status TINYINT, 
						MessageID VARCHAR(100), 
						Params NVARCHAR(4000))
				SET @Status = 0
				SET @Message = ''''
				INSERT INTO @BEMT2050Temp (	Status, MessageID, Params) 
											SELECT 2 AS Status, ''00ML000117'' AS MessageID, NULL AS Params
				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT B1.APK, B1.DivisionID, B1.VoucherNo FROM BEMT2050 B1 WITH (NOLOCK) 
				WHERE CAST(B1.APK AS VARCHAR(50)) IN (''' + @APKList + ''')
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelVoucherNo
				WHILE @@FETCH_STATUS = 0
				BEGIN
					EXEC BEMP9000 ''' + @DivisionID + ''', NULL, ''' + @TableID + ''', @DelAPK, @DelVoucherNo, NULL, NULL, @Status OUTPUT
					IF @Status = 1
						UPDATE @BEMT2050Temp SET Params = ISNULL(Params, '''') + @DelVoucherNo + '', '' WHERE MessageID = ''00ML000117''				
					FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelVoucherNo
					SET @Status = 0
				END
				CLOSE @Cur
				SELECT Status, MessageID, LEFT(Params, LEN(Params) - 1) AS Params FROM @BEMT2050Temp WHERE Params IS NOT NULL'
			EXEC (@sSQL)
			PRINT (@sSQL)
	END
END


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
