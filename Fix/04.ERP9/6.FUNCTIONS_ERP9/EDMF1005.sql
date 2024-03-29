IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[EDMF1005]') AND XTYPE IN (N'FN', N'IF', N'TF'))
	DROP FUNCTION [EDMF1005]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


--
-- <Summary>
--		Danh sách hoàn trả tiền ăn Theo ngày
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---- Created on 17/01/2020 by Lương Mỹ
---- 

-- <Example>
---- SELECT * FROM dbo.RefundEat('2019-12-20')


CREATE FUNCTION [dbo].[EDMF1005]
( 
     @FromDate DATETIME
) 
RETURNS TABLE 
AS 
	RETURN(
	SELECT COUNT(1) AS Temp, Temp1.DivisionID,
       Max(Temp1.EatLunch) AS EatLunch,
       Max(Temp1.EatDay) AS EatDay,
       Max(Temp2.Amount) AS MoneyLunch,
       Max(Temp3.Amount) AS MoneyDay
FROM
(
	--- Tiền ăn trưa
    SELECT Final1.DivisionID, NULL AS [EatDay],
			COUNT(1)  AS [EatLunch] FROM ( 
			SELECT DISTINCT APT0008.APK,APT0008.DivisionID
	 FROM APT0008 WITH (NOLOCK)
		LEFT JOIN
        (
        SELECT EDMT2040.*,
               ROW_NUMBER() OVER (PARTITION BY EDMT2040.DivisionID,EDMT2040.SchoolYearID,EDMT2040.GradeID,EDMT2040.ClassID,EDMT2040.AttendanceDate ORDER BY EDMT2040.CreateDate DESC) AS rn
        FROM EDMT2040 WITH (NOLOCK)

        WHERE EDMT2040.DeleteFlg = 0 AND EDMT2040.AttendanceDate = @FromDate
        ) T2040 ON T2040.rn=1 and T2040.ClassID = APT0008.ClassID AND T2040.GradeID = APT0008.GradeID AND T2040.SchoolYearID =APT0008.SchoolYearID
	LEFT JOIN EDMT2041 WITH (NOLOCK) ON EDMT2041.APKMaster = T2040.APK  AND EDMT2041.StudentID = APT0008.StudentID AND ISNULL(EDMT2041.DeleteFlg,0) = 0
	INNER JOIN EDMT2020 WITH (NOLOCK) ON APT0008.ArrangeClassID = EDMT2020.ArrangeClassID
	INNER JOIN EDMT2021 WITH (NOLOCK) ON EDMT2020.APK = EDMT2021.APKMaster AND EDMT2021.StudentID = APT0008.StudentID
    WHERE @FromDate BETWEEN APT0008.FromDate AND APT0008.ToDate
			AND @FromDate = CONVERT(DATE, DATEADD(DAY, 1, APT0008.CreateDate))
			AND EDMT2041.AvailableStatusID =  'CP' 
			AND APT0008.DeleteFlg = 0  
			--AND EDMT2021.IsTransfer IN ('0','2') AND EDMT2021.DeleteFlg=0 
			-- Ngày lễ
			AND NOT EXISTS(SELECT TOP 1 1 FROM OOT0030 O1 WITH(NOLOCK)
						INNER JOIN  OOT0031 O2 WITH(NOLOCK) ON O1.APK = O2.APKMaster
						WHERE O1.DivisionID = APT0008.DivisionID 
						AND @FromDate BETWEEN O2.StartDayOff AND	O2.EndDayOff
								)
			-- Ngày làm việc
			AND EXISTS(SELECT TOP 1 1 FROM OOT0030 O1 WITH(NOLOCK)
						INNER JOIN  OOT0032 O2 WITH(NOLOCK) ON O1.APK = O2.APKMaster
						WHERE O1.DivisionID = APT0008.DivisionID
						AND	CASE 
							WHEN DATEPART(WEEKDAY,@FromDate) = 2 THEN O2.IsWorkMon
							WHEN DATEPART(WEEKDAY,@FromDate) = 3 THEN O2.IsWorkTues
							WHEN DATEPART(WEEKDAY,@FromDate) = 4 THEN O2.IsWorkWed
							WHEN DATEPART(WEEKDAY,@FromDate) = 5 THEN O2.IsWorkThurs
							WHEN DATEPART(WEEKDAY,@FromDate) = 6 THEN O2.IsWorkFri
							WHEN DATEPART(WEEKDAY,@FromDate) = 7 THEN O2.IsWorkSat
							WHEN DATEPART(WEEKDAY,@FromDate) = 1 THEN O2.IsWorkSun END <> 0
						)
		  ) Final1
    GROUP BY   Final1.DivisionID
    UNION ALL
	--- Tiền ăn ngày
    SELECT Final2.DivisionID,          
		   COUNT(1)  AS EatDay, NULL AS [EatLunch] FROM ( 
		   SELECT DISTINCT APT0008.APK,APT0008.DivisionID
	 FROM APT0008 WITH (NOLOCK)
		LEFT JOIN
        (
        SELECT EDMT2040.*,
               ROW_NUMBER() OVER (PARTITION BY EDMT2040.DivisionID,EDMT2040.SchoolYearID,EDMT2040.GradeID,EDMT2040.ClassID,EDMT2040.AttendanceDate ORDER BY EDMT2040.CreateDate DESC) AS rn
        FROM EDMT2040 WITH (NOLOCK)

        WHERE EDMT2040.DeleteFlg = 0 AND EDMT2040.AttendanceDate = @FromDate
        ) T2040 ON T2040.rn=1 and T2040.ClassID = APT0008.ClassID AND T2040.GradeID = APT0008.GradeID AND T2040.SchoolYearID =APT0008.SchoolYearID
	LEFT JOIN EDMT2041 WITH (NOLOCK) ON EDMT2041.APKMaster = T2040.APK  AND EDMT2041.StudentID = APT0008.StudentID AND ISNULL(EDMT2041.DeleteFlg,0) = 0
	INNER JOIN EDMT2020 WITH (NOLOCK) ON APT0008.ArrangeClassID = EDMT2020.ArrangeClassID
	INNER JOIN EDMT2021 WITH (NOLOCK) ON EDMT2020.APK = EDMT2021.APKMaster AND EDMT2021.StudentID = APT0008.StudentID
    WHERE @FromDate BETWEEN APT0008.FromDate AND APT0008.ToDate
          AND @FromDate >= CONVERT(DATE, DATEADD(DAY, 2, APT0008.CreateDate))
			--AND ISNULL(EDMT2041.AvailableStatusID,'') IN ('','CP') 
			AND EDMT2041.AvailableStatusID =  'CP' 

		  AND APT0008.DeleteFlg = 0
			--AND EDMT2021.IsTransfer IN ('0','2') AND EDMT2021.DeleteFlg=0 
						-- Ngày lễ
			AND NOT EXISTS(SELECT TOP 1 1 FROM OOT0030 O1 WITH(NOLOCK)
						INNER JOIN  OOT0031 O2 WITH(NOLOCK) ON O1.APK = O2.APKMaster
						WHERE O1.DivisionID = APT0008.DivisionID 
						AND @FromDate BETWEEN O2.StartDayOff AND	O2.EndDayOff
								)
			-- Ngày làm việc
			AND EXISTS(SELECT TOP 1 1 FROM OOT0030 O1 WITH(NOLOCK)
						INNER JOIN  OOT0032 O2 WITH(NOLOCK) ON O1.APK = O2.APKMaster
						WHERE O1.DivisionID = APT0008.DivisionID
						AND	CASE 
							WHEN DATEPART(WEEKDAY,@FromDate) = 2 THEN O2.IsWorkMon
							WHEN DATEPART(WEEKDAY,@FromDate) = 3 THEN O2.IsWorkTues
							WHEN DATEPART(WEEKDAY,@FromDate) = 4 THEN O2.IsWorkWed
							WHEN DATEPART(WEEKDAY,@FromDate) = 5 THEN O2.IsWorkThurs
							WHEN DATEPART(WEEKDAY,@FromDate) = 6 THEN O2.IsWorkFri
							WHEN DATEPART(WEEKDAY,@FromDate) = 7 THEN O2.IsWorkSat
							WHEN DATEPART(WEEKDAY,@FromDate) = 1 THEN O2.IsWorkSun END <> 0
						)
		  ) Final2 
    GROUP BY   Final2.DivisionID
) Temp1
    INNER JOIN
    (
        SELECT DISTINCT EDMT1090.DivisionID,
               dbo.EDMT1091.Amount,
               ROW_NUMBER() OVER (PARTITION BY EDMT1090.DivisionID ORDER BY EDMT1090.DivisionID DESC) AS rn
        FROM EDMT1090 WITH (NOLOCK)
            JOIN dbo.EDMT1091 WITH (NOLOCK)
                ON EDMT1091.APKMaster = EDMT1090.APK
            JOIN dbo.EDMT1050 WITH (NOLOCK)
                ON EDMT1091.ReceiptTypeID = EDMT1050.ReceiptTypeID
        WHERE dbo.EDMT1050.IsMoney = 3
    ) Temp2
        ON Temp1.DivisionID = Temp2.DivisionID AND Temp2.rn = 1
    INNER JOIN
    (
        SELECT DISTINCT EDMT1090.DivisionID,
               dbo.EDMT1091.Amount,
               ROW_NUMBER() OVER (PARTITION BY EDMT1090.DivisionID ORDER BY EDMT1090.DivisionID DESC) AS rn
        FROM EDMT1090 WITH (NOLOCK)
            JOIN dbo.EDMT1091 WITH (NOLOCK)
                ON EDMT1091.APKMaster = EDMT1090.APK
            JOIN dbo.EDMT1050 WITH (NOLOCK)
                ON EDMT1091.ReceiptTypeID = EDMT1050.ReceiptTypeID
        WHERE dbo.EDMT1050.IsMoney = 2
    ) Temp3
        ON Temp1.DivisionID = Temp3.DivisionID AND Temp3.rn = 1

		GROUP BY Temp1.DivisionID



		)