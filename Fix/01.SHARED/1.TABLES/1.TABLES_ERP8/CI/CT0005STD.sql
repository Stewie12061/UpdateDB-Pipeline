-- <Summary>
---- 
-- <History>
---- Create on 06/08/2010 by Việt Khánh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CT0005STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CT0005STD](
	[TypeID] [nvarchar](50) NOT NULL,
	[SystemName] [nvarchar](250) NULL,
	[UserName] [nvarchar](250) NULL,
	[IsUsed] [tinyint] NOT NULL,
	[UserNameE] [nvarchar](250) NULL
) ON [PRIMARY]
END
---- Add giá trị default
-- Thêm cột SystemNameE vào bảng CT0005STD
IF(ISNULL(COL_LENGTH('CT0005STD', 'SystemNameE'), 0) <= 0)
ALTER TABLE CT0005STD ADD SystemNameE NVARCHAR(50) NULL