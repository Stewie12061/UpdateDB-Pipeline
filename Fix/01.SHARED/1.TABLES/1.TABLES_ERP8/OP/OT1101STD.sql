-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT1101STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OT1101STD](
	[OrderStatus] [tinyint] NOT NULL,
	[Description] [nvarchar](250) NOT NULL,
	[EDescription] [nvarchar](250) NOT NULL,
	[TypeID] [nvarchar](50) NOT NULL
) ON [PRIMARY]
END
---- Add Columns
-- Thêm field bảng OT1101STD
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'OT1101STD' AND xtype = 'U') 
BEGIN
    IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
    ON col.id = tab.id WHERE tab.name = 'OT1101STD' AND col.name = 'LanguageID')
    ALTER TABLE OT1101STD ADD LanguageID VARCHAR(100) NULL
END
