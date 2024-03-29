﻿---- Create by Tra Giang on 16/08/2018 
---- Nghiệp Vụ: Điều tra dinh dưỡng ( detail: dịch vụ)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[NMT2033]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[NMT2033]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [APKMaster] UNIQUEIDENTIFIER NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
   
  [ServiceID] VARCHAR(50) NOT NULL, 
  [PeopleUnitPrice] DECIMAL(28,8)  NULL,
   
  [DeleteFlg] TINYINT Default 0 NOT NULL ,
  [TranMonth] INT NOT NULL,
  [TranYear] INT NOT NULL,
  [InheritAPK] UNIQUEIDENTIFIER NULL,
  [InheritAPKMaster] UNIQUEIDENTIFIER NULL,
  [InheritTableID] VARCHAR(25)
CONSTRAINT [PK_NMT2033] PRIMARY KEY CLUSTERED
(
  [APK] ASC
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

 