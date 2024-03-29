-- <Summary>
---- 
-- <History>
---- Create on 20/03/2012 by Huỳnh Tấn Phú
---- Modified on ... by ...
---- <Example>
IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT2486]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HT2486](
	[APK] [uniqueidentifier] NOT NULL DEFAULT NEWID(),
	[DivisionID] [nvarchar](3) NOT NULL,
	[TranMonth] [int] NOT NULL,
	[TranYear] [int] NOT NULL,
	[EmployeeID] [nvarchar](50) NULL,
	[HealthInsuranceNo] [nvarchar](50) NULL,
	[HealthInsurancePlace] [nvarchar](250) NULL,
	[LimitDate] [datetime] NULL,
	[Reason] [nvarchar](250) NULL,
	[Note] [nvarchar](250) NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
 CONSTRAINT [PK_HT2486_1] PRIMARY KEY CLUSTERED 
(
	[APK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END