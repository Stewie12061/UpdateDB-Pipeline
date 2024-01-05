-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MT0700STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MT0700STD](
	[AccountID] [nvarchar](50) NOT NULL,
	[ExpenseID] [nvarchar](50) NULL,
	[MaterialTypeID] [nvarchar](50) NULL,
	[IsCheck] [tinyint] NOT NULL
) ON [PRIMARY]
END