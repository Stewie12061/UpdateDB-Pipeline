-- <Summary>
---- 
-- <History>
---- Create on 20/03/2012 by Huỳnh Tấn Phú
---- Modified on ... by ...
---- <Example>
IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT2488]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HT2488](
	[APK] [uniqueidentifier] NULL DEFAULT NEWID(),
	[TransactionID] [nvarchar](50) NOT NULL,
	[VoucherID] [nvarchar](50) NOT NULL,
	[DivisionID] [nvarchar](3) NOT NULL,
	[Orders] [int] NULL,
	[EmployeeID] [nvarchar](50) NULL,
	[EditFor] [nvarchar](250) NULL,
	[OldContent] [nvarchar](250) NULL,
	[NewContent] [nvarchar](250) NULL,
	[Reason] [nvarchar](250) NULL,
	[Notes] [nvarchar](250) NULL
	CONSTRAINT [PK_HT2488] PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC,
	[VoucherID] ASC,
	[DivisionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END