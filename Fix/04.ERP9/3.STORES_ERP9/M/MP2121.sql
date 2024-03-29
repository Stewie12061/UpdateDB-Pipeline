IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MP2121]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[MP2121]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----<Summary>
----Kiểm tra xóa định mức sản phẩm
----<Param>
---- 
----<Return>
---- 
----<Reference>
----
----<History>
---- Created by   Kiều Nga  on Date 12/01/2022
---- Modified by  Đình Định on Date 22/12/2022 : Bổ sung xóa 2 table detail MT2124 & MT2125
---- Modified by  Đức Tuyên on Date 31/03/2023 : Bổ sung check xóa luồng chuẩn (EXV)
---- Modified by  Nhật Quang on Date 01/04/2023 : Bổ sung kiểm tra BOM đã sử dụng không được xóa.
---- Modified by Minh Dũng on 05/10/2023 : Bổ sung xóa bảng detail Bomversion MT23
---- Modified by Minh Dũng on 18/10/2023 : Bổ sung xóa bảng All Bomversion của định mức
---- <Example>
---	exec MP2121 @DivisionID=N'MT',@APK=N'',@APKList=N'29cad19c-4b4f-468d-9371-cb38607ccf06',@Mode=1 

CREATE PROCEDURE MP2121
		( @DivisionID varchar(50),--Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
		  @APKList NVARCHAR(MAX) = '', 
		  @APK VARCHAR(50) = '',
		  @Mode tinyint                 --1: Xóa
		) 
AS 

DECLARE @sSQL NVARCHAR(MAX),
		@CustomerIndex INT = (SELECT CustomerName FROM CustomerIndex)

-----------Customize khách hàng MaiThu-----------
IF EXISTS(SELECT TOP 1 1 FROM CustomerIndex WHERE CustomerName = 117)
BEGIN
	IF @Mode = 0 ---Sửa
	BEGIN
		SET @sSQL = '
		DECLARE @Status TINYINT,
				@MessageID NVARCHAR(1000),
				@DelDivisionID VARCHAR(50),
				@DelNodeID VARCHAR(50), 
				@DelTranMonth INT, 
				@DelTranYear INT,
				@DelStatus INT, 
				@Params VARCHAR(MAX) = ''''
	
		SELECT @DelDivisionID = DivisionID, @DelNodeID = NodeID
		FROM MT2120 WITH (NOLOCK)
		WHERE APK = '''+@APK+'''
	
		IF @DelDivisionID <> '''+@DivisionID+''' -- Kiểm tra khác đơn vị
		BEGIN
			SET @Params = @DelNodeID
			SET @MessageID = ''00ML000050''
			Goto EndMess
		END
	
		EndMess:
		SELECT 2 AS Status, @MessageID AS MessageID, LEFT(@Params, LEN(@Params) -1) AS Params
		WHERE ISNULL(@Params, '''') <> ''''
		'
	END
	ELSE
	IF @Mode = 1 ---Xóa
	BEGIN
		SET @sSQL = N'
		
		CREATE TABLE #MP2121_Errors (APK Varchar(50),NodeID Varchar(50), MessageID Varchar(50),RefAPK Varchar(50))		
	
		SELECT APK,DivisionID,NodeID,RefAPK
		INTO #MP2121_MT2120
		FROM MT2120 WITH (NOLOCK) WHERE APK IN ('''+@APKList+''')
		
		IF EXISTS (SELECT TOP 1 1 FROM #MP2121_MT2120 WHERE DivisionID <> '''+@DivisionID+''')
		BEGIN 
			INSERT INTO #MP2121_Errors (APK,NodeID,MessageID,RefAPK)
			SELECT 	APK,NodeID,''00ML000050'',RefAPK
			FROM #MP2121_MT2120
			WHERE DivisionID <> '''+@DivisionID+'''
		END
	
		IF NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors)
		BEGIN
			DELETE T1 FROM MT2120 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.APK = T2.APK	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH (NOLOCK) WHERE T1.APK = T3.APK)
	
			DELETE T1 FROM MT2121 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.APK_2120 = T2.APK	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH (NOLOCK) WHERE T1.APK_2120 = T3.APK)
	
			DELETE T1 FROM MT2122 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.APK = T2.APK	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH (NOLOCK) WHERE T1.RefAPK = T3.RefAPK)

			-- Xóa bảng detail BOM Version MT2123
			DELETE T1 FROM MT2123 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.APK_2120 = T2.APK	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH (NOLOCK) WHERE T1.APK_2120 = T3.APK)
	
			DELETE T1  FROM MT8899 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.VoucherID = CONVERT(NVARCHAR(50),T2.APK)	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH(NOLOCK) WHERE T1.VoucherID = CONVERT(NVARCHAR(50),T3.APK))

			--Xóa tất BOM Version 
			DELETE T1 FROM MT2123 T1 WHERE T1.APK_2120 IN (SELECT T11.APK FROM MT2122 T11 
															INNER JOIN #MP2121_MT2120 T22 ON T11.NodeID = T22.NodeID
															WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T33 WITH (NOLOCK) WHERE T11.NodeID = T33.NodeID))
			DELETE T1 FROM MT2122 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.NodeID = T2.NodeID
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH (NOLOCK) WHERE T1.NodeID = T3.NodeID)
		END
		ELSE
		BEGIN					
				SELECT 	DISTINCT 2 AS Status, MessageID, STUFF ((	
							SELECT '', '' + NodeID 
							FROM #MP2121_Errors T2 WITH(NOLOCK) 
							WHERE  T1.APK = T2.APK
							FOR XML PATH ('''')), 1, 1, ''''
							) AS Params
				FROM #MP2121_Errors T1
				ORDER BY MessageID
		END
		'
	END
END
-----------Customize khách hàng HIPC-----------
ELSE IF EXISTS(SELECT TOP 1 1 FROM CustomerIndex WHERE CustomerName = 158)
BEGIN
	IF @Mode = 0 ---Sửa
	BEGIN
		SET @sSQL = '
		DECLARE @Status TINYINT,
				@MessageID NVARCHAR(1000),
				@DelDivisionID VARCHAR(50),
				@DelNodeID VARCHAR(50), 
				@DelTranMonth INT, 
				@DelTranYear INT,
				@DelStatus INT, 
				@Params VARCHAR(MAX) = ''''
	
		SELECT @DelDivisionID = DivisionID, @DelNodeID = NodeID
		FROM MT2120 WITH (NOLOCK)
		WHERE APK = '''+@APK+'''
	
		IF @DelDivisionID <> '''+@DivisionID+''' -- Kiểm tra khác đơn vị
		BEGIN
			SET @Params = @DelNodeID
			SET @MessageID = ''00ML000050''
			Goto EndMess
		END
	
		EndMess:
		SELECT 2 AS Status, @MessageID AS MessageID, LEFT(@Params, LEN(@Params) -1) AS Params
		WHERE ISNULL(@Params, '''') <> ''''
		'
	END
	ELSE
	IF @Mode = 1 ---Xóa
	BEGIN
		SET @sSQL = N'
		CREATE TABLE #MP2121_Errors (APK Varchar(50),NodeID Varchar(50), MessageID Varchar(50),RefAPK Varchar(50))		
	
		SELECT M20.APK, M20.DivisionID, M20.NodeID, M20.RefAPK
		INTO #MP2121_MT2120
		FROM MT2120 M20 WITH (NOLOCK) 
		WHERE APK IN ('''+@APKList+''')
		AND NOT EXISTS ( SELECT TOP 1 1  FROM CRMT2110 C10 WITH (NOLOCK) WHERE C10.InventoryID = M20.NodeID AND C10.DeleteFlg <> 1)
		
		---- Lấy BOM đã sử dụng trong Dự toán
		SELECT M20.APK, M20.DivisionID, M20.NodeID, M20.RefAPK
		INTO #MT2120EXISTS
		FROM MT2120 M20 WITH (NOLOCK) 
		WHERE APK IN ('''+@APKList+''')
		AND EXISTS ( SELECT TOP 1 1  FROM CRMT2110 C10 WITH (NOLOCK) WHERE C10.InventoryID = M20.NodeID AND C10.DeleteFlg <> 1)

		---- Kiểm tra tồn tại BOM trong Dự toán thì lấy ra thông báo.
		IF EXISTS (SELECT NodeID FROM #MT2120EXISTS WHERE DivisionID = '''+@DivisionID+''')
		BEGIN 
			INSERT INTO #MP2121_Errors (APK,NodeID,MessageID,RefAPK)
			SELECT 	APK,NodeID,''MFML000343'',RefAPK
			FROM #MT2120EXISTS
			WHERE DivisionID = '''+@DivisionID+'''
		END

		IF EXISTS (SELECT TOP 1 1 FROM #MP2121_MT2120 WHERE DivisionID <> '''+@DivisionID+''')
		BEGIN 
			INSERT INTO #MP2121_Errors (APK,NodeID,MessageID,RefAPK)
			SELECT 	APK,NodeID,''00ML000050'',RefAPK
			FROM #MP2121_MT2120
			WHERE DivisionID <> '''+@DivisionID+'''
		END
	
		IF NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors)
		BEGIN
			DELETE T1 FROM MT2120 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.APK = T2.APK	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH (NOLOCK) WHERE T1.APK = T3.APK)
		
			DELETE T1 FROM MT2121 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.APK_2120 = T2.APK	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH (NOLOCK) WHERE T1.APK_2120 = T3.APK)
	
			-- Xóa bảng master BOM Version
			DELETE T1 FROM MT2122 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.APK = T2.APK	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH (NOLOCK) WHERE T1.APK = T3.APK)
	
			-- Xóa bảng detail BOM Version MT2123
			DELETE T1 FROM MT2123 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.APK_2120 = T2.APK	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH (NOLOCK) WHERE T1.APK_2120 = T3.APK)
	
			DELETE T1 FROM MT2124 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.APKMaster = T2.APK	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH (NOLOCK) WHERE T1.APKMaster = T3.APK)
	
			-- Xóa bảng detail BOM Version Labour MT2126
			DELETE T1 FROM MT2126 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.APKMaster = T2.APK	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH (NOLOCK) WHERE T1.APKMaster = T3.APK)
	
			DELETE T1 FROM MT2125 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.APKMaster = T2.APK	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH (NOLOCK) WHERE T1.APKMaster = T3.APK)
	
			-- Xóa bảng detail BOM Version Tool MT2127
			DELETE T1 FROM MT2127 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.APKMaster = T2.APK	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH (NOLOCK) WHERE T1.APKMaster = T3.APK)
	
			DELETE T1  FROM MT8899 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.VoucherID = CONVERT(NVARCHAR(50),T2.APK)	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH(NOLOCK) WHERE T1.VoucherID = CONVERT(NVARCHAR(50),T3.APK))
		END
		ELSE
		BEGIN					
				SELECT 	DISTINCT 2 AS Status, MessageID, STUFF ((	
							SELECT '', '' + NodeID 
							FROM #MP2121_Errors T2 WITH(NOLOCK) 
							WHERE  T1.APK = T2.APK
							FOR XML PATH ('''')), 1, 1, ''''
							) AS Params
				FROM #MP2121_Errors T1
				ORDER BY MessageID
		END
		'
	END
END
-----------Xử lý luồng chuẩn-----------
ELSE
BEGIN
IF @Mode = 0 ---Sửa
	BEGIN
		SET @sSQL = '
		DECLARE @Status TINYINT,
				@MessageID NVARCHAR(1000),
				@DelDivisionID VARCHAR(50),
				@DelNodeID VARCHAR(50), 
				@DelTranMonth INT, 
				@DelTranYear INT,
				@DelStatus INT, 
				@Params VARCHAR(MAX) = ''''
	
		SELECT @DelDivisionID = DivisionID, @DelNodeID = NodeID
		FROM MT2120 WITH (NOLOCK)
		WHERE APK = '''+@APK+'''
	
		IF @DelDivisionID <> '''+@DivisionID+''' -- Kiểm tra khác đơn vị
		BEGIN
			SET @Params = @DelNodeID
			SET @MessageID = ''00ML000050''
			Goto EndMess
		END
	
		EndMess:
		SELECT 2 AS Status, @MessageID AS MessageID, LEFT(@Params, LEN(@Params) -1) AS Params
		WHERE ISNULL(@Params, '''') <> ''''
		'
	END
	ELSE
	IF @Mode = 1 ---Xóa
	BEGIN
		SET @sSQL = N'
		
		CREATE TABLE #MP2121_Errors (APK Varchar(50),NodeID Varchar(50), MessageID Varchar(50),RefAPK Varchar(50))		
	
		SELECT APK,DivisionID,NodeID,RefAPK
		INTO #MP2121_MT2120
		FROM MT2120 WITH (NOLOCK) WHERE APK IN ('''+@APKList+''')
		
		IF EXISTS (SELECT TOP 1 1 FROM #MP2121_MT2120 WHERE DivisionID <> '''+@DivisionID+''')
		BEGIN 
			INSERT INTO #MP2121_Errors (APK,NodeID,MessageID,RefAPK)
			SELECT 	APK,NodeID,''00ML000050'',RefAPK
			FROM #MP2121_MT2120
			WHERE DivisionID <> '''+@DivisionID+'''
		END

		-- Kiểm tra BomVersion đã được sử dụng ở Dự trù (OT2203)
		SELECT TOP 1 MT22.APK, MT22.DivisionID, MT22.NodeID, MT22.RefAPK 
			INTO #MP2121_MT2120_2 
		FROM MT2122 MT22 WITH (NOLOCK) 
			LEFT JOIN (SELECT APK_BomVersion FROM OT2202 T02 WITH (NOLOCK) 
							LEFT JOIN dbo.OT2201 T01 WITH (NOLOCK) ON T01.APK = T02.APKMaster
						WHERE T02.DivisionID = '''+@DivisionID+''' 
								AND T01.DeleteFlg <> 1 
								AND T01.Status <> 2
					)  TempAPK ON TempAPK.APK_BomVersion = MT22.APK
		WHERE MT22.NodeID IN (SELECT TOP 1 NodeID FROM MT2120 WHERE APK IN ('''+@APKList+''')) 
			AND TempAPK.APK_BomVersion IS NOT NULL
		
		IF EXISTS (SELECT TOP 1 1 FROM #MP2121_MT2120_2 WHERE DivisionID = '''+@DivisionID+''')
		BEGIN 
			INSERT INTO #MP2121_Errors (APK,NodeID,MessageID,RefAPK)
			SELECT 	APK,NodeID,''MFML0000012'',RefAPK
			FROM #MP2121_MT2120
			WHERE DivisionID = '''+@DivisionID+'''
		END
	
		IF NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors)
		BEGIN
			DELETE T1 FROM MT2120 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.APK = T2.APK	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH (NOLOCK) WHERE T1.APK = T3.APK)
	
			DELETE T1 FROM MT2121 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.APK_2120 = T2.APK	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH (NOLOCK) WHERE T1.APK_2120 = T3.APK)
	
			DELETE T1 FROM MT2122 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.APK = T2.APK	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH (NOLOCK) WHERE T1.APK = T3.APK)

			DELETE T1 FROM MT2123 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.APK_2120 = T2.APK	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH (NOLOCK) WHERE T1.APK_2120 = T3.APK)

			DELETE T1 FROM MT2124 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.APKMaster = T2.APK	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH (NOLOCK) WHERE T1.APKMaster = T3.APK)
	
			DELETE T1  FROM MT8899 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.VoucherID = CONVERT(NVARCHAR(50),T2.APK)	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH(NOLOCK) WHERE T1.VoucherID = CONVERT(NVARCHAR(50),T3.APK))

			--Xóa tất BOM Version 
			DELETE T1 FROM MT2123 T1 WHERE T1.APK_2120 IN (SELECT T11.APK FROM MT2122 T11 
															INNER JOIN #MP2121_MT2120 T22 ON T11.NodeID = T22.NodeID
															WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T33 WITH (NOLOCK) WHERE T11.NodeID = T33.NodeID))
			DELETE T1 FROM MT2122 T1 INNER JOIN #MP2121_MT2120 T2 ON T1.NodeID = T2.NodeID
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2121_Errors T3 WITH (NOLOCK) WHERE T1.NodeID = T3.NodeID)
		END
		ELSE
		BEGIN					
				SELECT 	DISTINCT 2 AS Status, MessageID, STUFF ((	
							SELECT '', '' + NodeID 
							FROM #MP2121_Errors T2 WITH(NOLOCK) 
							WHERE  T1.APK = T2.APK
							FOR XML PATH ('''')), 1, 1, ''''
							) AS Params
				FROM #MP2121_Errors T1
				ORDER BY MessageID
		END
		'
	END
END

PRINT @sSQL
EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO


