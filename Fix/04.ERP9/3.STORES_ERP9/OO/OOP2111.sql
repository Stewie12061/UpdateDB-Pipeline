IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[OOP2111]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[OOP2111]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




-- <Summary>
-- Kiểm tra trước khi xóa/sửa danh sách công việc
-- Nếu mã loại hình chưa được sử dụng thì cho phép xóa (Xóa ngầm) ngược lại thì báo message ID đã sử dụng không được phép xóa
-- <Param>
-- <Return>
-- <Reference>
-- <History>
-- Created by: Phan thanh hoàng vũ, Date: 19/10/2017
-- <Example> EXEC OOP2111 'KY', '', '', 'OOT2110', 0, NULL

CREATE PROCEDURE [dbo].[OOP2111] (
	@DivisionID VARCHAR(50), -- Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
	@APK NVARCHAR(MAX),
	@APKList NVARCHAR(MAX),
	@TableID NVARCHAR(MAX), -- OOT2110
	@Mode TINYINT, 			-- 0: Sửa, 1: Xóa
	@UserID VARCHAR(50),
	@IsDisable TINYINT)
AS 
BEGIN
	DECLARE @sSQL NVARCHAR(MAX)
	IF @Mode = 1 -- Kiểm tra và xóa
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Cur CURSOR,
						@DelDivisionID VARCHAR(50),
						@DelAPK VARCHAR(50),
						@DelTaskID NVARCHAR(250),
						@DelStatusID VARCHAR(50),
						@DelTypeRel VARCHAR(50),
						@DelAPKRel VARCHAR(50),
						@APKViolated VARCHAR(50)
				DECLARE @OOT2110temp TABLE (
						Status TINYINT,
						MessageID VARCHAR(100),
						Params NVARCHAR(4000))
				SET @Status = 0
				SET @Message = ''''
				INSERT INTO @OOT2110temp (	Status, MessageID, Params) 
											SELECT 2 AS Status, ''00ML000050'' AS MessageID, NULL AS Params
											UNION ALL
											SELECT 2 AS Status, ''00ML000052'' AS MessageID, NULL AS Params
											UNION ALL
											-- {0} đã Hoàn thành/Đóng, bạn không thể tiếp tục thao tác!
											SELECT 2 AS Status, ''OOFML000142'' AS MessageID, NULL AS Params
											UNION ALL
											-- {0} là công việc được tạo do nhân viên khác cố tình vi phạm, bạn không thể xóa!
											SELECT 2 AS Status, ''OOFML000171'' AS MessageID, NULL AS Params
				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT APK, DivisionID, TaskID, StatusID, TypeRel, APKRel, APKViolated FROM OOT2110 WITH (NOLOCK) WHERE CAST(APK AS VARCHAR(50)) IN (''' + @APKList + ''') 
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelTaskID, @DelStatusID, @DelTypeRel, @DelAPKRel, @APKViolated
				WHILE @@FETCH_STATUS = 0
				BEGIN
					EXEC OOP9000 @DelDivisionID, NULL, ''' + @TableID + ''', @DelAPK, @DelTaskID, NULL, NULL, @Status OUTPUT
					IF (@DelDivisionID != ''' + @DivisionID + ''')
						UPDATE @OOT2110temp SET Params = ISNULL(Params, '''') + @DelTaskID + '', '' WHERE MessageID = ''00ML000050''
					ELSE IF (SELECT @Status) = 1
						UPDATE @OOT2110temp SET Params = ISNULL(Params, '''') + @DelTaskID + '', '' WHERE MessageID = ''00ML000052''
					-- TTCV0003: Hoàn thành; TTCV0004: Đóng
					ELSE IF (@DelStatusID IN (''TTCV0003'', ''TTCV0004''))
						UPDATE @OOT2110temp SET Params = ISNULL(Params, '''') + @DelTaskID + '', '' WHERE MessageID = ''OOFML000142''
					-- Công việc được tạo từ chức năng Cố tình vi phạm thì không được phép xóa
					ELSE IF (@APKViolated IS NOT NULL)
						UPDATE @OOT2110temp SET Params = ISNULL(Params, '''') + @DelTaskID + '', '' WHERE MessageID = ''OOFML000171''
					ELSE
						BEGIN
							-- Xóa thông báo công việc trong bảng OOT9002 và OOT9003
							EXEC OOP9002 @APK = @DelAPK
							-- Xóa công việc
							UPDATE OOT2110 SET DeleteFlg = 1 WHERE CAST(APK AS VARCHAR(50)) = @DelAPK
							-- Xóa checklist công việc
							UPDATE OOT2111 SET DeleteFlg = 1 WHERE CAST(APKMaster AS VARCHAR(50)) = @DelAPK
							-- Xóa đánh giá công việc
							DELETE OOT2130 WHERE CAST(APKMaster AS VARCHAR(50)) = @DelAPK
						END
					FETCH NEXT FROM @Cur INTO @DelAPK, @DelDivisionID, @DelTaskID, @DelStatusID, @DelTypeRel, @DelAPKRel, @APKViolated
					SET @Status = 0
				END
				CLOSE @Cur
				SELECT Status, MessageID, LEFT(Params, LEN(Params) - 1) AS Params FROM @OOT2110temp WHERE Params IS NOT NULL'
		EXEC (@sSQL)
		--PRINT (@sSQL)
	END
	ELSE IF @Mode = 0 --Kiểm tra trước khi sửa
	BEGIN
		SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Params VARCHAR(100),
						@DelDivisionID VARCHAR(50), 
						@DelTaskID NVARCHAR(250)
				DECLARE @OOT2110temp TABLE (
								Status TINYINT,
								MessageID VARCHAR(100),
								Params VARCHAR(4000))
				SELECT @DelDivisionID = DivisionID, @DelTaskID = TaskID
				FROM OOT2110 WITH (NOLOCK) WHERE CAST(APK AS VARCHAR(50)) = N''' + @APK + '''			
				IF (@DelDivisionID != ''' + @DivisionID + ''') -- Kiểm tra khac DivisionID và không dùng chung
							BEGIN
								SET @Message = ''00ML000050'' 
								SET	@Status = 2
								SET @Params = @DelTaskID
							END 
				INSERT INTO @OOT2110temp (Status, MessageID, Params) SELECT @Status AS Status, @Message AS MessageID, @Params AS Params 			
				SELECT Status, MessageID, Params FROM @OOT2110temp WHERE Params IS NOT NULL'
		EXEC (@sSQL)
	END
END




GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
