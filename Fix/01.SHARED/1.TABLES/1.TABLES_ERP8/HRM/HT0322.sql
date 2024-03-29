-- <Summary>
---- 
-- <History>
---- Create on 01/11/2013 by Lưu Khánh Vân
---- Modified on ... by ...
---- <Example>
IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT0322]') AND type in (N'U'))
CREATE TABLE [dbo].[HT0322](
	[APK] [uniqueidentifier] NULL,
	[DivisionID] [nvarchar](50) NOT NULL,
	[VoucherID] [nvarchar](50) NOT NULL,
	[VoucherNo] [nvarchar](50) NOT NULL,
	[VoucherDate] [datetime] NOT NULL,
	[TranMonth] [int] NOT NULL,
	[TranYear] [int] NOT NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL
 CONSTRAINT [PK_HT0322] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC,
	[VoucherID] ASC
	
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
---- Add giá trị default
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_HT0322_APK]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HT0322] ADD  CONSTRAINT [DF_HT0322_APK]  DEFAULT (newid()) FOR [APK]
END