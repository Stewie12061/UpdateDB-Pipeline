IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CCMT0003]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[CCMT0003]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NULL,
      [InventoryID] VARCHAR(50) NOT NULL,
      [OrderID] VARCHAR(50) NULL,
      [Ratting] INT NOT NULL DEFAULT (1),
      [Description] NVARCHAR(MAX) NULL,
	  [Image01] NVARCHAR(MAX) NULL,
	  [Image02] NVARCHAR(MAX) NULL,
	  [Image03] NVARCHAR(MAX) NULL,
	  [Image04] NVARCHAR(MAX) NULL,
	  [Image05] NVARCHAR(MAX) NULL,
	  [Image06] NVARCHAR(MAX) NULL,
	  [Image07] NVARCHAR(MAX) NULL,
	  [Image08] NVARCHAR(MAX) NULL,
	  [DeleteFlg] TINYINT NULL,
      [CreateUserID] VARCHAR(50) NOT NULL,
      [CreateDate] DATETIME NULL
    CONSTRAINT [PK_CCMT0003] PRIMARY KEY CLUSTERED
      (
      [APK]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END