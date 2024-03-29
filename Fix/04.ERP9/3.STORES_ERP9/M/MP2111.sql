IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MP2111]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[MP2111]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----<Summary>
----Kiểm tra xóa cấu trúc sản phẩm
----<Param>
---- 
----<Return>
---- 
----<Reference>
----
----<History>
----<Created by>: Kiều Nga, Date: 09/11/2020
----<Modified by>: Lê Hoàng, Date: 02/06/2021 : Kiểm tra nếu Cấu trúc sản phẩm đã được kế thừa sang Bộ định mức thì không cho xóa
---- <Example>
---	exec MP2111 @DivisionID=N'MT',@APK=N'',@APKList=N'29cad19c-4b4f-468d-9371-cb38607ccf06',@Mode=1 

CREATE PROCEDURE MP2111
		( @DivisionID varchar(50),--Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
		  @APKList NVARCHAR(MAX) = '', 
		  @APK VARCHAR(50) = '',
		  @Mode tinyint                 --1: Xóa
		) 
AS 

DECLARE @sSQL NVARCHAR(MAX)	

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
	FROM MT2110 WITH (NOLOCK)
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
	
	CREATE TABLE #MP2111_Errors (APK Varchar(50), NodeID Varchar(50), MessageID Varchar(50))	
	DECLARE @MP2111_Messages TABLE (Status INT, MessageID Varchar(50), Params Varchar(MAX))		

	SELECT APK,DivisionID,NodeID
	INTO #MP2111_MT2110
	FROM MT2110 WITH (NOLOCK) WHERE APK IN ('''+@APKList+''')
	
	IF EXISTS (SELECT TOP 1 1 FROM #MP2111_MT2110 WHERE DivisionID <> '''+@DivisionID+''')
	BEGIN 
		INSERT INTO #MP2111_Errors (APK,NodeID,MessageID)
		SELECT 	APK,NodeID,''00ML000050''
		FROM #MP2111_MT2110
		WHERE DivisionID <> '''+@DivisionID+'''
	END

	IF NOT EXISTS (SELECT TOP 1 1 FROM #MP2111_Errors)
	BEGIN
		IF (EXISTS (SELECT TOP 1 1 FROM MT2120 WITH(NOLOCK) WHERE RefAPK IN ('''+@APKList+'''))) OR
		   (EXISTS (SELECT TOP 1 1 FROM MT2122 WITH(NOLOCK) WHERE RefAPK IN ('''+@APKList+''')))
		BEGIN
			--Nếu đã kế thừa sang cho Bộ định mức thì không cho xóa
			SELECT MT2110.APK, MT2110.NodeID INTO #TempUsedMT2110 FROM MT2110 WITH(NOLOCK)
			INNER JOIN MT2120 ON MT2110.DivisionID = MT2120.DivisionID AND MT2110.APK = MT2120.RefAPK 
			WHERE MT2110.DivisionID = '''+@DivisionID+''' AND MT2110.NodeTypeID = 0 AND MT2110.APK IN ('''+@APKList+''')

			INSERT INTO @MP2111_Messages(Status, MessageID, Params)
			SELECT 2 AS Status, ''00ML000052'' AS MessageID, T1.NodeID + '','' AS Params FROM #TempUsedMT2110 T1
		END
		ELSE
		BEGIN
			DELETE T1 FROM MT2110 T1 INNER JOIN #MP2111_MT2110 T2 ON T1.APKMaster = T2.APK	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2111_Errors T3 WITH (NOLOCK) WHERE T1.APKMaster = T3.APK)

			DELETE T1  FROM MT8899 T1 INNER JOIN #MP2111_MT2110 T2 ON T1.VoucherID = CONVERT(NVARCHAR(50),T2.APK)	
			WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2111_Errors T3 WITH(NOLOCK) WHERE T1.VoucherID = CONVERT(NVARCHAR(50),T3.APK))
		END
	END
	ELSE
	BEGIN				
			INSERT INTO @MP2111_Messages(Status, MessageID, Params)	
			SELECT 	DISTINCT 2 AS Status, MessageID, STUFF ((	
						SELECT '', '' + NodeID 
						FROM #MP2111_Errors T2 WITH(NOLOCK) 
						WHERE  T1.APK = T2.APK
						FOR XML PATH ('''')), 1, 1, ''''
						) AS Params
			FROM #MP2111_Errors T1
	END

	SELECT Status, MessageID, LEFT(Params, LEN(Params) - 1) AS Params FROM @MP2111_Messages WHERE Params IS NOT NULL
	'
END

PRINT @sSQL
EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO


