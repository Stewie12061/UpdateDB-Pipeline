-- <Summary>
---- Thiết lập mã phân tích
-- <History>
---- Create on 10/12/2010 by Thanh Trẫm
---- Modified on 30/01/2011 by Việt Khánh: Thêm cột SystemNameE, Nhập dữ liệu cho SystemNameE và UserNameE
---- Modified on ... by 
-- <Example>
IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT0005STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT0005STD](
	[TypeID] [nvarchar](50) NOT NULL,
	[SystemName] [nvarchar](250) NULL,
	[UserName] [nvarchar](250) NULL,
	[IsUsed] [tinyint] NOT NULL,
	[UserNameE] [nvarchar](250) NULL,
	[Status] [tinyint] NOT NULL
) ON [PRIMARY]
END
---- Add Columns
IF(ISNULL(COL_LENGTH('AT0005STD', 'SystemNameE'), 0) <= 0)
ALTER TABLE AT0005STD ADD SystemNameE NVARCHAR(50) NULL
IF(ISNULL(COL_LENGTH('AT0005', 'SystemNameE'), 0) <= 0)
ALTER TABLE AT0005 ADD SystemNameE NVARCHAR(50) NULL