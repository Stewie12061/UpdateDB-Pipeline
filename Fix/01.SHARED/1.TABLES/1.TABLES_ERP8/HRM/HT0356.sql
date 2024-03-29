-- <Summary>
---- 
-- <History>
---- Create on 03/12/2015 by Bảo Anh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT0356]') AND type in (N'U'))
CREATE TABLE [dbo].[HT0356](
	[APK] [uniqueidentifier] DEFAULT NEWID(),
	[DivisionID] nvarchar(3) NOT NULL,
	[EmployeeID] [nvarchar](50) NOT NULL,
	[AbsentCardNo] [nvarchar](50) NOT NULL,
	[DepartmentID] [nvarchar](50) NULL,
	[TeamID] [nvarchar](50) NULL,
	[TranMonth] [int] NOT NULL,
	[TranYear] [int] NOT NULL,
	[AbsentDate] [datetime] NULL,
	[ShiftID] [nvarchar](50) NULL,
	[FromTime] [datetime] NULL,
	[ToTime] [datetime] NULL,
	[InLateMinutes] [int] NULL,
	[OutEarlyMinutes] [int] NULL,
	[IsConfirm] [tinyint] NULL,
	[DescriptionConfirm] [nvarchar](250) NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifydate] [datetime] NULL,
 CONSTRAINT [PK_HT0356] PRIMARY KEY NONCLUSTERED 
(
	[APK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
