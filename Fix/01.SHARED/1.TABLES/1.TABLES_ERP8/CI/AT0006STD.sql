-- <Summary>
----
-- <History>
---- Create on 13/12/2010 by Thanh Trẫm
---- Modified on ... by 
-- <Example>
IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT0006STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT0006STD](
	[AccountID] [nvarchar](50) NOT NULL,
	[D_C] [nvarchar](100) NULL
) ON [PRIMARY]
END