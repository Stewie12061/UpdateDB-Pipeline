-- <Summary>
---- Công thức pha trộn
-- <History>
---- Create on 12/09/2014 by Lê Thị Hạnh 
---- Modified on 05/11/2014 by Lê Thị Hạnh: Bổ sung trường Notes01 cho bảng Công thức pha trộn[Customize Index: 36 - Sài Gòn Petro]
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[MT0105]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[MT0105]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [FormulaID] NVARCHAR(50) NOT NULL,
      [MaterialID] NVARCHAR(50) NOT NULL,
      [ProductTypeID] NVARCHAR(50) NULL,
      [ProductID] NVARCHAR(50) NULL,
      [MaterialTypeID] NVARCHAR(50) NULL,
      [TypeID] TINYINT NOT NULL, -- 1: BaseOil - dầu gốc , 2: Additive: phụ gia 
      [Notes01] NVARCHAR(250) NULL,
      [Rate01] DECIMAL(28,8) DEFAULT (0) NULL,
      [Rate02] DECIMAL(28,8) DEFAULT (0) NULL,
      [Description] NVARCHAR(250) NULL,
      [Disabled] TINYINT DEFAULT (0) NULL,
      [CreateUserID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] NVARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_MT0105] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [FormulaID] ASC,
      [MaterialID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
---- Add Columns
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='MT0105' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MT0105' AND col.name='Notes01')
		ALTER TABLE MT0105 ADD Notes01 NVARCHAR(250) NULL
	END