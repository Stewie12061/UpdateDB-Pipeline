-- <Summary>
---- 
-- <History>
---- Create on 09/10/2014 by Lê Thị Thu Hiền
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[HT2416]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[HT2416](
	[APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
	[DivisionID] [nvarchar](50) NOT NULL,
	[TranMonth] [int] NOT NULL,
	[Tranyear] [int] NOT NULL,
	[AbsentCardNo] [nvarchar](50) NOT NULL,
	[EmployeeID] [nvarchar](50) NULL,
	[ProjectID] [nvarchar](50) NOT NULL,
	[AbsentDate] [datetime] NOT NULL,
	[ShiftCode] [nvarchar](50) NOT NULL,
	[AbsentTime] [decimal](28,8) DEFAULT(0) NOT NULL,
	[PeriodID] [nvarchar](50) NULL,
	[Notes] [nvarchar](250) NULL,
	CONSTRAINT [PK_HT2416] PRIMARY KEY NONCLUSTERED 
	(
		[APK] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END