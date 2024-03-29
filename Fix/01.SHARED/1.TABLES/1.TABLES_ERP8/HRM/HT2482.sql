-- <Summary>
---- 
-- <History>
---- Create on 20/03/2012 by Huỳnh Tấn Phú
---- Modified on ... by ...
---- <Example>
IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT2482]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HT2482](
	[APK] [uniqueidentifier] NULL DEFAULT NEWID(),
	[VoucherID] [nvarchar](50) NOT NULL,
	[DivisionID] [nvarchar](3) NOT NULL,
	[TranMonth] [int] NULL,
	[TranYear] [int] NULL,
	[EmployeeCount] [int] NULL,
	[FemaleCount] [int] NULL,
	[TotalOfSalary] [money] NULL,
	[Descriptions] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL
	CONSTRAINT [PK_HT2482] PRIMARY KEY CLUSTERED 
(
	[VoucherID] ASC,
	[DivisionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END