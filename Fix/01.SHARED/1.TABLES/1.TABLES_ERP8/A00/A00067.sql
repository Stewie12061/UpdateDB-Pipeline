-- <Summary>
---- Loại thông tin - Dữ liệu ngầm
-- <History>
---- Create on 15/07/2015 by Lê Thị Hạnh 
---- Modified on ... by ...:
-- <Example>

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[A00067]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[A00067]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [ImportTransTypeID] NVARCHAR(50) NOT NULL,
      [SType] INT NULL,
      [STypeName] NVARCHAR(250) NULL,
      [STypeNameE] NVARCHAR(250) NULL,
      [Description] NVARCHAR(250) NULL,
      [Disabled] TINYINT DEFAULT (0) NULL,
      [CreateUserID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] NVARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_A00067] PRIMARY KEY CLUSTERED
      (
      [APK] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END