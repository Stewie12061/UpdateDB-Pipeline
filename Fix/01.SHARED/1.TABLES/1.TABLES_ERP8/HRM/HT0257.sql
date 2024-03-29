-- <Summary>
---- 
-- <History>
---- Create on 19/11/2012 by Bảo Anh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT0257]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[HT0257](
		[APK] [uniqueidentifier] DEFAULT NEWID(),
		[DivisionID] [nvarchar](3) NOT NULL,
		[WorkingDate] [datetime] NOT NULL,
		[EmployeeID] [nvarchar](50) NOT NULL,
		[TeamID] [nvarchar](50) NOT NULL,		
		[WorkingHours] decimal(28,8) NOT NULL,
		[Notes] [nvarchar](250) NULL,
		[TranMonth] [int] NOT NULL,
		[TranYear] [int] NOT NULL,
		[CreateUserID] [nvarchar](50) NULL,
		[CreateDate] [datetime] NULL,
		[LastModifyUserID] [nvarchar](50) NULL,
		[LastModifyDate] [datetime] NULL
	) ON [PRIMARY]
END