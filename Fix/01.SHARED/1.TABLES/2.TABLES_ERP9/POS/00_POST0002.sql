--- Created on 09/01/2014 by Phan thanh hoàng vũ
--- Thiết lập mã tăng tự động
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0002]') AND TYPE IN (N'U'))
BEGIN

CREATE TABLE [dbo].[POST0002](
	[APK] [uniqueidentifier] Default NEWID() NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[ShopID] [varchar](50) NOT NULL,
	[TableID] [varchar](50) NOT NULL,
	[IsAutomatic] [tinyint]  NOT NULL default 0,
	[IsS1] [tinyint] NOT NULL default 1,
	[IsS2] [tinyint] NOT NULL default 0,
	[IsS3] [tinyint] NOT NULL default 0,
	[S1] [nvarchar](50) NULL,
	[S2] [nvarchar](50) NULL,
	[S3] [nvarchar](50) NULL,
	[Length] [tinyint] NULL,
	[OutputOrder] [tinyint] NULL,
	[IsSeparator] [tinyint] NULL,
	[Separator] [nvarchar](5) NULL,
	[CreateUserID] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [varchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
 CONSTRAINT [PK_POST0002] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC,
	[ShopID] ASC,
	[TableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
END
