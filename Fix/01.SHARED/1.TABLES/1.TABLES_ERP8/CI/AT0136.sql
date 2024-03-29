-- <Summary>
---- Danh mục biểu thuế tiêu thụ đặc biệt
-- <History>
---- Create on 21/05/2015 by Lê Thị Hạnh 
---- Modified on ... by 
-- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT0136]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[AT0136]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [SETID] NVARCHAR(50) NOT NULL,
      [SETName] NVARCHAR(250) NULL,
      [UnitID] NVARCHAR(50) NULL,
      [TaxRate] DECIMAL(28,8) NULL,
      [SETClassifyID] NVARCHAR(50) NULL,
      [Description] NVARCHAR(250) NULL,
      [ChildRoot] TINYINT NULL,
      [Disabled] TINYINT DEFAULT (0) NULL,
      [CreateUserID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] NVARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_AT0136] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [SETID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END