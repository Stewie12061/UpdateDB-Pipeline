-- <Summary>
---- 
-- <History>
---- Create on 16/01/2013 by Lê Thị Thu Hiền
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT0260]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[HT0260](
		[APK] [uniqueidentifier] DEFAULT NEWID(),
		[DivisionID] [nvarchar](3) NOT NULL,
		[ProducingProcessID] [nvarchar](50) NOT NULL,
		[StepID] [nvarchar](50) NOT NULL,
		[ShiftID] [nvarchar](50) NOT NULL,
		[WorkingDate] [datetime] NOT NULL,
		[ProductID] [nvarchar](50) NOT NULL,
		[ProductQuantity] decimal(28,8) NULL,
		[PerfectQuantity] decimal(28,8) NULL,
		[UnPerfectQuantity] decimal(28,8) NULL,
		[Tester] nvarchar(50) NULL,
		[ErrorList] nvarchar(4000) NULL,
		[EmployeeList] nvarchar(4000) NULL,
		[Notes] nvarchar(250) NULL,
		[CreateUserID] [nvarchar](50) NULL,
		[CreateDate] [datetime] NULL,
		[LastModifyUserID] [nvarchar](50) NULL,
		[LastModifyDate] [datetime] NULL,
		CONSTRAINT [PK_HT0260] PRIMARY KEY NONCLUSTERED 
		(
			[DivisionID] ASC,
			[ProducingProcessID] ASC,
			[StepID] ASC,
			[ShiftID] ASC,
			[WorkingDate] ASC,
			[ProductID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	) ON [PRIMARY]
END