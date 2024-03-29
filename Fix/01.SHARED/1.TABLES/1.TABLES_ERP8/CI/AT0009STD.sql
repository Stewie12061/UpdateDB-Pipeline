-- <Summary>
---- Định nghĩa tham số
-- <History>
---- Create on 10/03/2011 by Phát Danh
---- Modified on 30/01/2011 by Việt Khánh: Thêm cột SystemNameE vào bảng AT0009STD
-- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT0009STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT0009STD](
	[TypeID] [nvarchar](50) NOT NULL,
	[SystemName] [nvarchar](250) NULL,
	[UserName] [nvarchar](250) NULL,
	[IsUsed] [tinyint] NOT NULL,
	[UserNameE] [nvarchar](250) NULL
) ON [PRIMARY]
END
---- Add Columns
IF(ISNULL(COL_LENGTH('AT0009', 'SystemNameE'), 0) <= 0)
ALTER TABLE AT0009 ADD SystemNameE NVARCHAR(50) NULL