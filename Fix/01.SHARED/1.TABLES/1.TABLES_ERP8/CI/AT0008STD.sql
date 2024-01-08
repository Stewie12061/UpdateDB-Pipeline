-- <Summary>
---- 
-- <History>
---- Create on 03/10/2014 by Trần Quốc Tuấn
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT0008STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT0008STD](
	[TypeID] [nvarchar](20) NOT NULL,
	[SystemName] [nvarchar](100) NULL,
	[UserName] [nvarchar](100) NULL,
	[IsUsed] [tinyint] NOT NULL,
	[UserNameE] [nvarchar](100) NULL,
) ON [PRIMARY]
END


