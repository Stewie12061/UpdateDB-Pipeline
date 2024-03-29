--Dữ liệu master data (dữ liệu load chết trong combo)
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0001]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POST0001](
	[APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[ShopTypeID] [varchar](50) NOT NULL,
	[ShopTypeName] [nvarchar](250) NULL,
	[PageSize] [int] NULL,
	[Disabled] [tinyint] NULL,
	[CreateUserID] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [varchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
 CONSTRAINT [PK_POST0001] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC,
	[ShopTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END