--- Created on 27/03/2014 by Phan Quốc Việt
--- Editted on 27/03/2014 by Phan thanh hoàng vũ
--- Thiết lập cách tính điểm
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0005]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POST0005](
	[APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[ShopID] [varchar](50) NULL,
	[Point1] [decimal](28, 6) NOT NULL,
	[Money1] [decimal](28, 6) NOT NULL,
	[Ratio1] [decimal](28, 6) NOT NULL,
	[Point2] [decimal](28, 6) NOT NULL,
	[Money2] [decimal](28, 6) NOT NULL,
	[Ratio2] [decimal](28, 6) NOT NULL,
	[CurencyID] [varchar](50) NOT NULL,
	[AutoUpgradeCard] [tinyint] NOT NULL DEFAULT 1,
	[AutoDecreaseCard] [tinyint] NOT NULL DEFAULT 1,
	[Disabled] [tinyint] NOT NULL DEFAULT 0,
	[CreateUserID] [varchar](50) NULL,
	[CreateDate] [datetime] NULL ,
	[LastModifyUserID] [varchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
 CONSTRAINT [PK_POST0005] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END

