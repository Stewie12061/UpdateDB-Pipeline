IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTP3000]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[MTP3000]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Gọi Store in báo cáo
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: by Thanh Sơn on 19/02/2014 
-- <Example>
/*
    EXEC MTP3000 'EIS', '',1,2013,5,2014,0, '2014-03-18 00:00:00.000', '2014-03-19 00:00:00.000', 'MTR3022','%' 
*/
 CREATE PROCEDURE MTP3000
(
	@DivisionID VARCHAR(50),
	@UserID VARCHAR(50),
	@FromMonth INT,
	@FromYear INT,
	@ToMonth INT,
	@ToYear INT,
	@IsDate TINYINT,
	@FromDate DATETIME,
	@ToDate DATETIME,
	@ReportID VARCHAR(50),
	@BranchID VARCHAR(50)
)
AS
-- Nhóm Báo cáo học viên
IF @ReportID = 'MTR3010' EXEC MTP3010 @DivisionID, @UserID, @FromMonth, @FromYear, @ToMonth, @ToYear, @IsDate, @FromDate, @ToDate, @BranchID
IF @ReportID = 'MTR3011' EXEC MTP3011 @DivisionID, @UserID, @FromMonth, @FromYear, @ToMonth, @ToYear, @IsDate, @FromDate, @ToDate, @BranchID
IF @ReportID = 'MTR3012' EXEC MTP3012 @DivisionID, @UserID, @FromMonth, @FromYear, @ToMonth, @ToYear, @IsDate, @FromDate, @ToDate, @BranchID
IF @ReportID = 'MTR3013' EXEC MTP3013 @DivisionID, @UserID, @FromMonth, @FromYear, @ToMonth, @ToYear, @IsDate, @FromDate, @ToDate, @BranchID
IF @ReportID = 'MTR3014' EXEC MTP3014 @DivisionID, @UserID, @FromMonth, @FromYear, @ToMonth, @ToYear, @IsDate, @FromDate, @ToDate, @BranchID
IF @ReportID = 'MTR3015' EXEC MTP3015 @DivisionID, @UserID, @FromMonth, @FromYear, @ToMonth, @ToYear, @IsDate, @FromDate, @ToDate, @BranchID
IF @ReportID = 'MTR3016' EXEC MTP3016 @DivisionID, @UserID, @FromMonth, @FromYear, @ToMonth, @ToYear, @IsDate, @FromDate, @ToDate, @BranchID
IF @ReportID = 'MTR3017' EXEC MTP3017 @DivisionID, @UserID, @FromMonth, @FromYear, @ToMonth, @ToYear, @IsDate, @FromDate, @ToDate, @BranchID
IF @ReportID = 'MTR3018' EXEC MTP3018 @DivisionID, @UserID, @FromMonth, @FromYear, @ToMonth, @ToYear, @IsDate, @FromDate, @ToDate, @BranchID
IF @ReportID = 'MTR3019' EXEC MTP3019 @DivisionID, @UserID, @FromMonth, @FromYear, @ToMonth, @ToYear, @IsDate, @FromDate, @ToDate, @BranchID
IF @ReportID = 'MTR3020' EXEC MTP3020 @DivisionID, @UserID, @FromMonth, @FromYear, @ToMonth, @ToYear, @IsDate, @FromDate, @ToDate, @BranchID
IF @ReportID = 'MTR3021' EXEC MTP3021 @DivisionID, @UserID, @FromMonth, @FromYear, @ToMonth, @ToYear, @IsDate, @FromDate, @ToDate, @BranchID
IF @ReportID = 'MTR3022' EXEC MTP3022 @DivisionID, @UserID, @FromMonth, @FromYear, @ToMonth, @ToYear, @IsDate, @FromDate, @ToDate, @BranchID

-- Nhóm báo cáo doanh thu, chi phí
IF @ReportID = 'MTR3100' EXEC MTP3100 @DivisionID, @UserID, @FromMonth, @FromYear, @ToMonth, @ToYear, @IsDate, @FromDate, @ToDate, @BranchID
IF @ReportID = 'MTR3101' EXEC MTP3101 @DivisionID, @UserID, @FromMonth, @FromYear, @ToMonth, @ToYear, @IsDate, @FromDate, @ToDate, @BranchID



GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

