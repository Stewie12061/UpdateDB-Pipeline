--POST0006: Thiết lập nhóm đối tượng thanh toán
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0006]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE POST0006 (
	[APK] [uniqueidentifier] DEFAULT NEWID() NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[PaymentID01] [varchar](50) NOT NULL,
	[ObjectTypeID01] [varchar](50) NULL,
	[PaymentID02] [varchar](50) NULL,
	[ObjectTypeID02] [varchar](50) NULL,
	[Disabled] [tinyint] NOT NULL,
	[CreateUserID] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [varchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	 CONSTRAINT [PK_POST0006] PRIMARY KEY CLUSTERED 
(	[APK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END 

