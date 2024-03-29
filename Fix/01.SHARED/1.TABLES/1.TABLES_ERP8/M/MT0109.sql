-- <Summary>
---- Chỉ tiêu kiểm định sản phẩm
-- <History>
---- Create on 17/09/2014 by Lê Thị Hạnh 
---- Modified on ... by 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[MT0109]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[MT0109]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [TestID] NVARCHAR(50) NOT NULL,
      [TestName] NVARCHAR(100) NULL,
      [TestMethod] NVARCHAR(100) NULL,
      [UnitID] NVARCHAR(50) NULL,
      [Disabled] TINYINT NULL,
      [CreateUserID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] NVARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_MT0109] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [TestID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END