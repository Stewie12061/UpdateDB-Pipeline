-- Create by VanTinh on 28/08/2018
-- Danh muc dinh muc - EDMF1010 - master

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[EDMT1010]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[EDMT1010]
(
	[APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
	[DivisionID] VARCHAR(50) NOT NULL,
	[QuotaID] VARCHAR(50) NOT NULL,
	[Description] NVARCHAR(250) NULL,
	IsCommon TINYINT DEFAULT (0) NULL,
	[Disabled] TINYINT DEFAULT (0) NULL,
	CreateUserID VARCHAR(50) NULL,
	CreateDate DATETIME NULL,
	LastModifyUserID VARCHAR(50) NULL,
	LastModifyDate DATETIME NULL

CONSTRAINT [PK_EDMT1010] PRIMARY KEY CLUSTERED
(
  [APK]
)
) ON [PRIMARY]

END
GO
