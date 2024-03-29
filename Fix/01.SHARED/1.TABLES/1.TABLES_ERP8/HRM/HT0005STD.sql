-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT0005STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HT0005STD](
	[SubID] [nvarchar](50) NOT NULL,
	[FieldName] [nvarchar](250) NULL,
	[SubName] [nvarchar](250) NULL,
	[Caption] [nvarchar](100) NULL,
	[IsTranfer] [tinyint] NULL,
	[IsUsed] [tinyint] NOT NULL,
	[SourceFieldName] [nvarchar](250) NULL,
	[SourceTableName] [nvarchar](250) NULL,
	[IsTax] [tinyint] NULL,
	[CaptionE] [nvarchar](250) NULL
) ON [PRIMARY]
END
---- Add Columns
If Exists (Select * From sysobjects Where name = 'HT0005STD' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'HT0005STD'  and col.name = 'IsCalculateNetIncome')
           Alter Table  HT0005STD Add IsCalculateNetIncome tinyint NULL
END
-- Thêm cột SubNameE vào bảng HT0005
IF(ISNULL(COL_LENGTH('HT0005STD', 'SubNameE'), 0) <= 0)
ALTER TABLE HT0005STD ADD SubNameE NVARCHAR(50) NULL