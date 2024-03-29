-- <Summary>
---- Phan quyen du lieu (Xem du lieu cua nguoi dung khac)
-- <History>
---- Create on 27/02/2014 by Le Thi Thu Hien
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT0010]') AND TYPE IN (N'U'))
BEGIN
-- DROP TABLE AT0010
CREATE TABLE [dbo].[AT0010](
	[APK] [uniqueidentifier] DEFAULT NEWID(),
	[AdminUserID] [varchar](50) NOT NULL,
	[UserID] [varchar](50) NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[Notes] [nvarchar](250) NULL,
 CONSTRAINT [PK_AT0010] PRIMARY KEY CLUSTERED 
(
	[AdminUserID],
	[UserID],
	[DivisionID]
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END


