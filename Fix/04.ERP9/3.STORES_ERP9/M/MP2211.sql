IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MP2211]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[MP2211]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----<Summary>
----Kiểm tra xóa thống kê kết quả sản xuất
----<Param>
---- 
----<Return>
---- 
----<Reference>
----
----<History>
----<Created by>: Kiều Nga, Date: 23/04/2021
---- <Example>
---	exec MP2211 @DivisionID=N'MT',@APK=N'',@APKList=N'29cad19c-4b4f-468d-9371-cb38607ccf06',@Mode=1 

CREATE PROCEDURE MP2211
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
			@DelVoucherNo VARCHAR(50), 
			@DelTranMonth INT, 
			@DelTranYear INT,
			@DelStatus INT, 
			@Params VARCHAR(MAX) = ''''

	SELECT @DelDivisionID = DivisionID, @DelVoucherNo = VoucherNo
	FROM MT2210 WITH (NOLOCK)
	WHERE APK = '''+@APK+'''

	IF @DelDivisionID <> '''+@DivisionID+''' -- Kiểm tra khác đơn vị
	BEGIN
		SET @Params = @DelVoucherNo
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
	
	CREATE TABLE #MP2211_Errors (APK Varchar(50),VoucherNo Varchar(50), MessageID Varchar(50))		

	SELECT APK,DivisionID,VoucherNo
	INTO #MP2211_MT2210
	FROM MT2210 WITH (NOLOCK) WHERE APK IN ('''+@APKList+''')
	
	IF EXISTS (SELECT TOP 1 1 FROM #MP2211_MT2210 WHERE DivisionID <> '''+@DivisionID+''')
	BEGIN 
		INSERT INTO #MP2211_Errors (APK,VoucherNo,MessageID)
		SELECT 	APK,VoucherNo,''00ML000050''
		FROM #MP2211_MT2210
		WHERE DivisionID <> '''+@DivisionID+'''
	END

	IF NOT EXISTS (SELECT TOP 1 1 FROM #MP2211_Errors)
	BEGIN
		DELETE T1 FROM MT2210 T1 INNER JOIN #MP2211_MT2210 T2 ON T1.APK = T2.APK	
		WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2211_Errors T3 WITH (NOLOCK) WHERE T1.APK = T3.APK)

		DELETE T1 FROM MT2211 T1 INNER JOIN #MP2211_MT2210 T2 ON T1.APKMaster = T2.APK	
		WHERE NOT EXISTS (SELECT TOP 1 1 FROM #MP2211_Errors T3 WITH (NOLOCK) WHERE T1.APKMaster = T3.APK)
	END
	ELSE
	BEGIN					
			SELECT 	DISTINCT 2 AS Status, MessageID, STUFF ((	
						SELECT '', '' + VoucherNo 
						FROM #MP2211_Errors T2 WITH(NOLOCK) 
						WHERE  T1.APK = T2.APK
						FOR XML PATH ('''')), 1, 1, ''''
						) AS Params
			FROM #MP2211_Errors T1
			ORDER BY MessageID
	END
	'
END

PRINT @sSQL
EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO


