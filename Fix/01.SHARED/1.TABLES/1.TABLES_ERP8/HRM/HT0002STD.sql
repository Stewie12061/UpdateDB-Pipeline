-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT0002STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HT0002STD](
	[IncomeID] [nvarchar](50) NOT NULL,
	[FieldName] [nvarchar](250) NULL,
	[IncomeName] [nvarchar](250) NULL,
	[Caption] [nvarchar](250) NULL,
	[IsUsed] [tinyint] NOT NULL,
	[IsTax] [tinyint] NOT NULL,
	[CaptionE] [nvarchar](250) NULL
) ON [PRIMARY]
END
---- Add Columns
-- Thêm cột IncomeNameE vào bảng HT0002STD
IF(ISNULL(COL_LENGTH('HT0002STD', 'IncomeNameE'), 0) <= 0)
ALTER TABLE HT0002STD ADD IncomeNameE NVARCHAR(50) NULL
If Exists (Select * From sysobjects Where name = 'HT0002STD' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'HT0002STD'  and col.name = 'IsCalculateNetIncome')
           Alter Table  HT0002STD Add IsCalculateNetIncome tinyint NULL
End