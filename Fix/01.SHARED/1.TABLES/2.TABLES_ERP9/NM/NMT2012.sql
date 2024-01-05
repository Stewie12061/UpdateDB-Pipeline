﻿---- Create by Tra Giang on 16/08/2018 
---- Nghiệp Vụ: Thực đơn ngày( detail: thành phần dinh dưỡng)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[NMT2012]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[NMT2012]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [APKMaster] UNIQUEIDENTIFIER NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,

  [SystemID] VARCHAR(50) NOT NULL,
  [Ingredient] DECIMAL(28,8) NOT NULL,
  [QuotaStandard] DECIMAL(28,8) NOT NULL,
  [Ratio] DECIMAL(28,8) NOT NULL,
  [DeleteFlg] TINYINT Default 0 NOT NULL ,
  [TranMonth] INT NOT NULL,
  [TranYear] INT NOT NULL,

  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_NMT2012] PRIMARY KEY CLUSTERED
(
  [APK] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END





  