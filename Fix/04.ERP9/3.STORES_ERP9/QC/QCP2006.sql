IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP2006]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP2006]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



----<Summary>
----Kiểm tra xóa sửa Quản lý chất lượng đầu ca
----<Param>
---- 
----<Return>
---- 
----<Reference>
----
----<History>
----<Create by>: Thanh Lượng
---- <Example>
---	exec QCP2006 @DivisionID=N'MT',@APK=N'',@APKList=N'29cad19c-4b4f-468d-9371-cb38607ccf06',@Mode=1 

CREATE PROCEDURE [dbo].[QCP2006] (
	@DivisionID VARCHAR(50),
	@TranMonth INT,
	@TranYear INT,
	@APK VARCHAR(50),
	@APKList NVARCHAR(MAX),
	@Mode TINYINT
	)
AS 
BEGIN
	DECLARE @sSQL NVARCHAR(MAX)

	IF @Mode = 0 ---Sửa
	BEGIN
		SET @sSQL = '
		DECLARE @Status TINYINT,
				@MessageID NVARCHAR(1000),
				@DelDivisionID VARCHAR(50),
				@DelVoucherNo VARCHAR(50), 
				@DelTranMonth INT, 
				@DelTranYear INT,
				@DelStatus INT, 
				@Params VARCHAR(MAX) = ''''

		SELECT @DelDivisionID = DivisionID, @DelVoucherNo = VoucherNo, @DelTranMonth = Month(VoucherDate), @DelTranYear = Year(VoucherDate)
		FROM QCT2000 WITH (NOLOCK)
		WHERE Convert(Nvarchar(50),APK) = '''+@APK+'''

		IF @DelDivisionID <> '''+@DivisionID+''' -- Kiểm tra khác đơn vị
		BEGIN
			SET @Params = @DelVoucherNo
			SET @MessageID = ''00ML000050''
			Goto EndMess
		END
		ELSE 
		IF @DelTranMonth+@DelTranYear*100 <> '+STR(@TranMonth+@TranYear*100)+' -- Kiểm tra khác kỳ kế toán
		BEGIN
			SET @Params = @DelVoucherNo
			SET @MessageID = ''00ML000137''
			Goto EndMess
		END
		ELSE IF EXISTS (SELECT TOP 1 1 FROM QCT2000 T1 WITH (NOLOCK) INNER JOIN OOT9000 T2 WITH (NOLOCK) ON T1.APKMaster_9000 = T2.APK WHERE T1.StatusSS = 1 AND Convert(Nvarchar(50),T1.APK) = '''+@APK+''')
		BEGIN 
			SET @Params = @DelVoucherNo
			SET @MessageID = ''WFML000169''
			Goto EndMess
		END

		EndMess:
		SELECT 2 AS Status, @MessageID AS MessageID, LEFT(@Params, LEN(@Params) -1) AS Params
		WHERE ISNULL(@Params, '''') <> ''''
		'
		PRINT (@sSQL)
		EXEC (@sSQL)
	END
	ELSE
	IF @Mode = 1 ---Xóa
	BEGIN
	SET @sSQL = '
	CREATE TABLE #QCP2006_Errors (APK Varchar(50),APKMaster_9000 Varchar(50),VoucherNo Varchar(50), MessageID Varchar(50),Status int)		

	SELECT APK,APKMaster_9000,DivisionID,VoucherNo,Status,TranMonth,TranYear
	INTO #QCP2006_QCT2000
	FROM QCT2000 WITH (NOLOCK) WHERE APK IN ('''+@APKList+''')
	
	IF EXISTS (SELECT TOP 1 1 FROM #QCP2006_QCT2000 WHERE DivisionID <> '''+@DivisionID+''')
	BEGIN 
		INSERT INTO #QCP2006_Errors (APK,VoucherNo,MessageID)
		SELECT 	APK,VoucherNo,''00ML000050''
		FROM #QCP2006_QCT2000
		WHERE DivisionID <> '''+@DivisionID+'''
	END
	ELSE IF EXISTS (SELECT TOP 1 1 FROM #QCP2006_QCT2000 WHERE TranMonth+TranYear*100 <> '+STR(@TranMonth+@TranYear*100)+')
	BEGIN 
		INSERT INTO #QCP2006_Errors (APK,VoucherNo,MessageID,APKMaster_9000)
		SELECT 	APK,VoucherNo,''00ML000137'',APKMaster_9000
		FROM #QCP2006_QCT2000
		WHERE TranMonth+TranYear*100 <> '+STR(@TranMonth+@TranYear*100)+'
	END
	ELSE IF EXISTS (SELECT TOP 1 1 FROM #QCP2006_QCT2000 WHERE Status = 1)
	BEGIN 
		INSERT INTO #QCP2006_Errors (APK,VoucherNo,MessageID)
		SELECT 	APK,VoucherNo,''00ML000117''
		FROM #QCP2006_QCT2000
		WHERE Status = 1
	END

	IF NOT EXISTS (SELECT TOP 1 1 FROM #QCP2006_Errors)
	BEGIN
		UPDATE OOT9001 SET DeleteFlag = 1  FROM OOT9001 T1 INNER JOIN #QCP2006_QCT2000 T2 ON T1.APKMaster = T2.APKMaster_9000	
		WHERE NOT EXISTS (SELECT TOP 1 1 FROM #QCP2006_Errors T3 WITH (NOLOCK) WHERE T2.APK = T3.APK)

	    UPDATE OOT9000 SET DeleteFlag = 1 FROM OOT9000 T1 INNER JOIN #QCP2006_QCT2000 T2 ON T1.APK = T2.APKMaster_9000	
		WHERE NOT EXISTS (SELECT TOP 1 1 FROM #QCP2006_Errors T3 WITH (NOLOCK) WHERE T2.APK = T3.APK)

		UPDATE QCT2000 SET DeleteFlg = 1 FROM QCT2000 T1 INNER JOIN #QCP2006_QCT2000 T2 ON T1.APK = T2.APK	
		WHERE NOT EXISTS (SELECT TOP 1 1 FROM #QCP2006_Errors T3 WITH (NOLOCK) WHERE T1.APK = T3.APK)

		UPDATE QCT2002 SET DeleteFlg = 1 FROM QCT2002 T1 INNER JOIN #QCP2006_QCT2000 T2 ON T1.APKMaster = T2.APK	
		WHERE NOT EXISTS (SELECT TOP 1 1 FROM #QCP2006_Errors T3 WITH (NOLOCK) WHERE T1.APKMaster = T3.APK)
	END
	ELSE
	BEGIN					
			SELECT 	DISTINCT 2 AS Status, MessageID, STUFF ((	
						SELECT '', '' + VoucherNo 
						FROM #QCP2006_Errors T2 WITH(NOLOCK) 
						WHERE  T1.APK = T2.APK
						FOR XML PATH ('''')), 1, 1, ''''
						) AS Params
			FROM #QCP2006_Errors T1
			ORDER BY MessageID
	END
	'
	PRINT (@sSQL)
	EXEC (@sSQL)

	END
END






GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
