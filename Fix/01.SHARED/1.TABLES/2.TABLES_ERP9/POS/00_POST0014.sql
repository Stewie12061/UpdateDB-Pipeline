--- Created on 28/02/2014 by Phan thanh hoàng vũ
--- Danh muc kho (POS)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0014]') AND TYPE IN (N'U'))
BEGIN

CREATE TABLE [dbo].[POST0014](
	[APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[DivisionID] [nvarchar](50) NOT NULL,
	[WareHouseID] [nvarchar](50) NOT NULL,
	[WareHouseName] [nvarchar](250) NOT NULL,
	[Address] [nvarchar](250) NULL,
	[Disabled] [tinyint] NOT NULL default 0,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
 CONSTRAINT [PK_POST0014] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC,
	[WareHouseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
End
