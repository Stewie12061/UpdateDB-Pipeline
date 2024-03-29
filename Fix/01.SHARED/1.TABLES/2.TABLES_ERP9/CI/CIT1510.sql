---- Create by Nhật Thanh on 14/04/2023
---- Định nghĩa điều kiện khuyến mãi
---- DROP TABLE CIT1510
IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CIT1510]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[CIT1510]
(
	[APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
	[ToolID] nvarchar(50) NOT NULL,
	[ToolName] nvarchar(250) NOT NULL,
	[ToolTypeID] nvarchar(50) NOT NULL,
	[ToolTypeName] nvarchar(50) NOT NULL,
	[Description] nvarchar(250) NULL
CONSTRAINT [PK_CIT1510] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END