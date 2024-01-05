-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT1005STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OT1005STD](
	[AnaTypeID] [nvarchar](50) NOT NULL,
	[SystemName] [nvarchar](250) NOT NULL,
	[UserName] [nvarchar](250) NOT NULL,
	[IsUsed] [tinyint] NOT NULL,
	[SystemNameE] [nvarchar](250) NULL,
	[UserNameE] [nvarchar](250) NULL
) ON [PRIMARY]
END

