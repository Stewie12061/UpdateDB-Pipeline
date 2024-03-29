--- Created on 09/01/2014 by Phan thanh hoàng vũ
--- Thiết lập mã tăng tự động
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0003]') AND TYPE IN (N'U'))
BEGIN

CREATE TABLE [dbo].[POST0003](
	[APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[ShopID] [varchar](50) NOT NULL,
	[TABLENAME] [nvarchar](50) NULL,
	[KEYSTRING] [nvarchar](50) NULL,
	[LASTKEY] [int] NULL,
 CONSTRAINT [PK_POST0003] PRIMARY KEY CLUSTERED 
(
	[APK] ASC,
	[DivisionID] ASC,
	[ShopID] ASC
	
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END

