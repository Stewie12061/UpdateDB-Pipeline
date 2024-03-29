---- Kết quả thực hiện KPI (Chi tiết theo ngày/tuần/tháng/quý/năm)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[KPIT20005]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[KPIT20005]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [APKMaster] UNIQUEIDENTIFIER NOT NULL,
  [APKDetail] UNIQUEIDENTIFIER NOT NULL,
  [DivisionID] VARCHAR(50) NULL,
  [DateName1] VARCHAR(50) NULL,
  [Perform1] DECIMAL(28,8) NULL,
  [PerformPoint1] DECIMAL(28,8) NULL,
  [DateName2] VARCHAR(50) NULL,  
  [Perform2] DECIMAL(28,8) NULL,
  [PerformPoint2] DECIMAL(28,8) NULL,
  [DateName3] VARCHAR(50) NULL,
  [Perform3] DECIMAL(28,8) NULL,
  [PerformPoint3] DECIMAL(28,8) NULL,
  [DateName4] VARCHAR(50) NULL,
  [Perform4] DECIMAL(28,8) NULL,
  [PerformPoint4] DECIMAL(28,8) NULL,
  [DateName5] VARCHAR(50) NULL,
  [Perform5] DECIMAL(28,8) NULL,
  [PerformPoint5] DECIMAL(28,8) NULL,
  [DateName6] VARCHAR(50) NULL,
  [Perform6] DECIMAL(28,8) NULL,
  [PerformPoint6] DECIMAL(28,8) NULL,
  [DateName7] VARCHAR(50) NULL,
  [Perform7] DECIMAL(28,8) NULL,
  [PerformPoint7] DECIMAL(28,8) NULL,
  [DateName8] VARCHAR(50) NULL,
  [Perform8] DECIMAL(28,8) NULL,
  [PerformPoint8] DECIMAL(28,8) NULL,
  [DateName9] VARCHAR(50) NULL,
  [Perform9] DECIMAL(28,8) NULL,
  [PerformPoint9] DECIMAL(28,8) NULL,
  [DateName10] VARCHAR(50) NULL,
  [Perform10] DECIMAL(28,8) NULL,
  [PerformPoint10] DECIMAL(28,8) NULL,
  [DateName11] VARCHAR(50) NULL,
  [Perform11] DECIMAL(28,8) NULL,
  [PerformPoint11] DECIMAL(28,8) NULL,
  [DateName12] VARCHAR(50) NULL,
  [Perform12] DECIMAL(28,8) NULL,
  [PerformPoint12] DECIMAL(28,8) NULL,
  [DateName13] VARCHAR(50) NULL,
  [Perform13] DECIMAL(28,8) NULL,
  [PerformPoint13] DECIMAL(28,8) NULL,
  [DateName14] VARCHAR(50) NULL,
  [Perform14] DECIMAL(28,8) NULL,
  [PerformPoint14] DECIMAL(28,8) NULL,
  [DateName15] VARCHAR(50) NULL,
  [Perform15] DECIMAL(28,8) NULL,
  [PerformPoint15] DECIMAL(28,8) NULL
  
CONSTRAINT [PK_KPIT20005] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END