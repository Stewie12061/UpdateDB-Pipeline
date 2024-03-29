---- Create by Tra Giang on 16/08/2018 
---- Danh muc mon an

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[NMT1051]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[NMT1051]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [APKMaster] UNIQUEIDENTIFIER  NOT NULL,

  [MaterialsID] VARCHAR(50)NOT NULL,
  [UnitID] VARCHAR(50) NOT NULL,
  [Mass] DECIMAL(28,8) NOT NULL,
  [ConvertedMass] DECIMAL(28,8) NULL,

  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_NMT1051] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END



  