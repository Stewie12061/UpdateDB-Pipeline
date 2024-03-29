-- <Summary> Danh mục hàng khuyến mãi (Bổ sung thêm bảng AT1329 làm bảng master, dùng bảng gốc AT1328 làm bảng Detail)
-- <History>
---- Create on 02/06/2016 by Phan thanh hoàng Vũ
---- Modified on ... by ...
---- <Example>

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT1329]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[AT1329]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NOT NULL,
      [PromoteID] VARCHAR(50) NOT NULL,
      [FromDate] DATETIME NOT NULL,
      [ToDate] DATETIME NOT NULL,
      [OID] VARCHAR(50) NULL,
      [InventoryTypeID] VARCHAR(50) NULL,
      [Description] NVARCHAR(250) NULL,
      [Disabled] TINYINT DEFAULT (0) NOT NULL,
      [IsCommon] TINYINT DEFAULT (0) NOT NULL,
      [CreateDate] DATETIME NULL,
      [CreateUserID] VARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL,
      [LastModifyUserID] VARCHAR(50) NULL
    CONSTRAINT [PK_AT1329] PRIMARY KEY CLUSTERED
      (
      [PromoteID]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END

------Modified by [Hoài Bảo] on [06/05/2022]: Bổ sung cột ObjectID
IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id = tab.id WHERE tab.name = 'AT1329' AND col.name = 'ObjectID')
BEGIN 
   ALTER TABLE AT1329 ADD ObjectID NVARCHAR(MAX) NULL
END

------Modified by [Hoài Bảo] on [10/05/2022]: Bổ sung cột ObjectTypeID
IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id = tab.id WHERE tab.name = 'AT1329' AND col.name = 'ObjectTypeID')
BEGIN 
   ALTER TABLE AT1329 ADD ObjectTypeID NVARCHAR(50) NULL
END

------Modified by [Hoài Bảo] on [21/06/2022]: Bổ sung cột PromoteName
IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id = tab.id WHERE tab.name = 'AT1329' AND col.name = 'PromoteName')
BEGIN 
   ALTER TABLE AT1329 ADD PromoteName NVARCHAR(250) NULL
END