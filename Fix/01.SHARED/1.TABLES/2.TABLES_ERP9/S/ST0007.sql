---- Create by tuan on 16/09/2015 10:43:31 AM
---- Danh mục nghiệp vụ

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[ST0007]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[ST0007]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
      [TableID] VARCHAR(50) NOT NULL,
      [TableName] NVARCHAR(500) NOT NULL,
      [ColumnPK] VARCHAR(500) NULL,
      [ChildTable] VARCHAR(250) NULL,
      [CustomerIndex] INT NULL
    CONSTRAINT [PK_ST0007] PRIMARY KEY CLUSTERED
      (
      [TableID]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
