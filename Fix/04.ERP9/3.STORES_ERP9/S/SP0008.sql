IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SP0008]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[SP0008]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Trả ra thông tin cảnh báo ở màn hình chính SF0000 (ERP9)
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Bảo Anh, Date: 21/02/2019
----Modified on 14/03/2019 by Như Hàn: Bổ sung điều kiện đã xem thì không thông báo nữa (AIC: YCMH, KHTC)
-- <Example>
---- 
/*
	EXEC SP0008 'NTY','NTVN0021',1
	EXEC SP0008 'NTY','NTVN0003',1
*/

CREATE PROCEDURE SP0008
	@DivisionID AS VARCHAR(50),
	@UserID AS VARCHAR(50),
	@Mode AS TINYINT	--- 0: hiển thị tổng số cảnh báo/xét duyệt ở biểu tượng chuông trên màn hình chính của ERP9
						--- 1: hiển thị số cảnh báo/xét duyệt theo từng nghiệp vụ khi click vào biểu tượng chuông trên màn hình chính của ERP9

AS 
DECLARE @Cur AS Cursor,
		@GroupID AS VARCHAR(50),
		@WarningID VARCHAR(50),
		@KPIWarningMarks INT,
		@AppraisalWarningMarks INT

SELECT @GroupID = GroupID FROM AT1402 WITH (NOLOCK) WHERE DivisionID = @DivisionID AND UserID = @UserID

SELECT @KPIWarningMarks = ISNULL(KPIWarningMarks,0), @AppraisalWarningMarks = ISNULL(AppraisalWarningMarks,0)
FROM HT0000 WITH (NOLOCK) WHERE DivisionID = @DivisionID

CREATE TABLE #SP0008 (ModeID VARCHAR(50), TypeID VARCHAR(50), TypeName NVARCHAR(500), Quantity INT, FormID VARCHAR(50))

--- Lấy thông tin xét duyệt
INSERT INTO #SP0008
SELECT 'Approve' AS ModeID, TypeID, TypeName, COUNT(ID) AS Quantity, 'OOF2050' AS FormID
FROM
(
SELECT		OOT90.ID, OOT90.[Type] AS TypeID, OOT991.Description AS TypeName
FROM OOT9000 OOT90 WITH (NOLOCK)
INNER JOIN(
	SELECT MIN(Level) Level,DivisionID, ApprovePersonID, APKMaster, APKDetail
	FROM OOT9001 WITH (NOLOCK)
	GROUP BY DivisionID, ApprovePersonID, APKMaster, APKDetail
)OOT9 ON OOT9.DivisionID = OOT90.DivisionID AND OOT9.APKMaster = OOT90.APK
INNER JOIN OOT9001 OOT91 WITH (NOLOCK) ON OOT91.DivisionID = OOT9.DivisionID AND OOT91.APKMaster = OOT9.APKMaster AND ISNULL(OOT91.APKDetail,'00000000-0000-0000-0000-000000000000') = ISNULL(OOT9.APKDetail,'00000000-0000-0000-0000-000000000000') AND OOT91.Level=OOT9.Level
LEFT JOIN OOT9001 OOT912 WITH (NOLOCK) ON OOT912.DivisionID = OOT91.DivisionID AND OOT912.APKMaster = OOT91.APKMaster AND ISNULL(OOT912.APKDetail,'00000000-0000-0000-0000-000000000000') = ISNULL(OOT91.APKDetail,'00000000-0000-0000-0000-000000000000') AND OOT912.[Level] = OOT91.[Level]-1
LEFT JOIN OOT0099 OOT991 WITH (NOLOCK) ON OOT991.ID = OOT90.Type AND OOT991.CodeMaster='Applying'
WHERE OOT91.DivisionID =@DivisionID
AND ISNULL(OOT90.DeleteFlag,0)=0
AND OOT91.ApprovePersonID = @UserID
AND ISNULL(OOT91.Status,0) = 0
AND ISNULL(OOT912.[Status],3) NOT IN (0,2)
AND ISNULL(OOT91.IsWatched,0) = 0
GROUP BY OOT90.ID, OOT90.[Type], OOT991.Description
) A
GROUP BY TypeID, TypeName

--- Lấy thông tin cảnh báo
SET @Cur = CURSOR SCROLL KEYSET FOR
	SELECT WarningID
	FROM AT0011 WITH (NOLOCK)
	WHERE DivisionID = @DivisionID AND GroupID = @GroupID

OPEN @Cur
FETCH NEXT FROM @Cur INTO @WarningID

WHILE @@Fetch_Status = 0 
BEGIN
	--- Cảnh báo chênh lệch điểm đánh giá
	IF @WarningID = 8
	BEGIN
		---- Đánh giá KPI
		IF @KPIWarningMarks > 0
		BEGIN			
			SELECT COUNT(APK) AS Quantity
			INTO #KPI
			FROM
			(SELECT DISTINCT K1.APK
			FROM KPIT20001 K1 WITH (NOLOCK)
			LEFT JOIN KPIT20002 K2 WITH (NOLOCK) ON K1.DivisionID = K2.DivisionID AND K1.APK = K2.APKMaster
			WHERE K1.DivisionID = @DivisionID AND (K1.ConfirmUserID = @UserID OR K1.EmployeeID = @UserID)
			AND ISNULL(K1.ClassificationReevaluatedPoint,'') <> '' AND ISNULL(K1.DeleteFlg,0) = 0
			AND ABS(ISNULL(K2.PerformPoint,0) - ISNULL(K2.ReevaluatedPoint,0)) > @KPIWarningMarks
			) A

			INSERT INTO #SP0008
			SELECT 'Warning' AS ModeID, 'KPI' AS TypeID, N'Chênh lệch điểm đánh giá KPI' AS TypeName, Quantity, 'KPIF2000' AS FormID
			FROM #KPI
			WHERE Quantity > 0
		END
		
		---- Đánh giá năng lực
		IF @AppraisalWarningMarks > 0
		BEGIN			
			SELECT COUNT(APK) AS Quantity
			INTO #NL
			FROM
			(SELECT DISTINCT K1.APK
			FROM PAT20001 K1 WITH (NOLOCK)
			LEFT JOIN PAT20002 K2 WITH (NOLOCK) ON K1.DivisionID = K2.DivisionID AND K1.APK = K2.APKMaster
			WHERE K1.DivisionID = @DivisionID AND (K1.ConfirmUserID = @UserID OR K1.EmployeeID = @UserID)
			AND K2.Reevaluated IS NOT NULL AND ISNULL(K1.DeleteFlg,0) = 0
			AND ABS(ISNULL(K2.PerformPoint,0) - ISNULL(K2.ReevaluatedPoint,0)) > @AppraisalWarningMarks
			) A

			INSERT INTO #SP0008
			SELECT 'Warning' AS ModeID, 'NL' AS TypeID, N'Chênh lệch điểm đánh giá năng lực' AS TypeName, Quantity, 'PAF2000' AS FormID
			FROM #NL
			WHERE Quantity > 0
		END

	END
	FETCH NEXT FROM @Cur INTO @WarningID
END

IF @Mode = 0
	SELECT SUM(Quantity) FROM #SP0008 WHERE Quantity > 0
ELSE
	SELECT * FROM #SP0008 WHERE Quantity > 0

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
