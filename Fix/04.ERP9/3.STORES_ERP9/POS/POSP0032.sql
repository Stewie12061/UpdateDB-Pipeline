IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0032]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP0032]
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
----Created by: by MaiVu on 16/06/2014 
-- <Example>
/*
    EXEC POSP0032 'KC','ASOFTADMIN','BIGC',null,null,null,2,1,2014,1,2014,'2014-01-01','2014-01-10',0,1,0,0,2014,
				   '1'',''2', '1'',''2',null, null, 'POSR0003' 
*/
 CREATE PROCEDURE POSP0032
(
	@DivisionID VARCHAR(50),
	@UserID varchar(50),
	@ShopID varchar(50),
	@ObjectID varchar(50),
	@ShopIDSelect varchar(50),
	@ObjectSelect varchar(50),
	@IsDate TINYINT,
	@FromMonth INT,
	@FromYear INT,
	@ToMonth INT,
	@ToYear INT,
	@FromDate DATETIME,
	@ToDate DATETIME,
	@IsMonth tinyint,
	@IsQuarter tinyint,
	@IsHalfYear tinyint,
	@IsYear tinyint,
	@Year int,
	@MonthList nvarchar(100),
	@QuarterList nvarchar(100),
	@HalfYear tinyint,
	@YearList nvarchar(100),
	@ReportID VARCHAR(50)
)
AS
IF @ShopIDSelect IS NULL SET @ShopIDSelect = @ShopID
IF @ReportID = 'POSR0003'EXEC POSP0003 @DivisionID, @UserID, @ShopIDSelect, @ObjectSelect, 
									   @IsDate, @FromDate, @ToDate, @FromMonth, @FromYear, @ToMonth, @ToYear,
									   @IsMonth, @IsQuarter, @IsHalfYear, @IsYear, @Year, @MonthList, @QuarterList, @HalfYear, @YearList