-- <Summary>
---- 
-- <History>
---- Create on 06/08/2010 by Hoang Phuoc
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT5402]') AND type in (N'U'))
CREATE TABLE [dbo].[HT5402](
	[APK] [uniqueidentifier] NOT NULL DEFAULT NEWID(),
	[DivisionID] [nvarchar](3) NOT NULL,
	[DepartmentID] [nvarchar](50) NULL,
	[TeamID] [nvarchar](50) NOT NULL,
	[EmployeeID] [nvarchar](50) NOT NULL,
	[InsuranceSalary] [decimal](28, 8) NULL,
	[Caption] [nvarchar](250) NOT NULL,
	[Notes] [nvarchar](250) NOT NULL,
	[IncomeID] [nvarchar](50) NOT NULL,
	[Signs] [int] NOT NULL,
	[SalaryAmount] [decimal](28, 8) NULL,
	[Orders] [int] NOT NULL,
 CONSTRAINT [PK_HT5402] PRIMARY KEY CLUSTERED 
(
	[APK] ASC,
	[DivisionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]