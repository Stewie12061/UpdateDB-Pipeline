﻿-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT344401]') AND type in (N'U'))
CREATE TABLE [dbo].[HT344401](
	[APK] [uniqueidentifier] NOT NULL Default (newid()),
	[DivisionID] [nvarchar](50) NOT NULL,
	[TranMonth] [int] NULL,
	[TranYear] [int] NULL,
	[EmployeeID] [nvarchar](50) NULL,
	[DepartmentID] [nvarchar](50) NULL,
	[TeamID] [nvarchar](50) NULL,
	[ProjectID] [nvarchar](50) NULL,
	[GeneralCo] [decimal](28, 8) NULL,
	[AbsentAmount] [decimal](28, 8) NULL,
	[BaseSalary] [decimal](28, 8) NULL,
 CONSTRAINT [PK_HT344401] PRIMARY KEY CLUSTERED 
(
	[APK] ASC,
	[DivisionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
