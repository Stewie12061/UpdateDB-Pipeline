-- <Summary>
---- 
-- <History>
---- Create on 15/11/2012 by Bảo Anh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT0256]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[HT0256](
		[APK] [uniqueidentifier] DEFAULT NEWID(),
		[DivisionID] [nvarchar](3) NOT NULL,
		[EmployeeID] [nvarchar](50) NOT NULL,
		[DepartmentID] [nvarchar](50) NULL,
		[TeamID] [nvarchar](50) NULL,
		[FromDate] [datetime] NULL,
		[ToDate] [datetime] NULL,
		[TranMonth] [int] NOT NULL,
		[TranYear] [int] NOT NULL,
		[DayCoefficient] decimal(28,8) NOT NULL,
		[Notes] [nvarchar](250) NULL,
		[CreateUserID] [nvarchar](50) NULL,
		[CreateDate] [datetime] NULL,
		[LastModifyUserID] [nvarchar](50) NULL,
		[LastModifyDate] [datetime] NULL
	) ON [PRIMARY]
END