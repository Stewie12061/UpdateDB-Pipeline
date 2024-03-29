IF NOT  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'HT2406_TH') AND type = 'U')
BEGIN
CREATE TABLE [dbo].[HT2406_TH](
	[APK] [uniqueidentifier] DEFAULT NEWID(),
	[DivisionID] nvarchar(50) NOT NULL,
	[TranMonth] [int] NULL,
	[Tranyear] [int] NULL,
	[AbsentCardNo] [nvarchar](50) NOT NULL,
	[AbsentDate] [datetime] NULL,
	[AbsentTime] [nvarchar](100) NULL,
	[MachineCode] [nvarchar](50) NULL,
	[ShiftCode] [nvarchar](50) NULL,
	[IOCode] [tinyint] NULL,
	[InputMethod] [tinyint] NOT NULL,
	[EmployeeID] [nvarchar](50) NULL,
	[Notes] [nvarchar](250) NULL,
	CONSTRAINT [PK_HT2406_TH] PRIMARY KEY NONCLUSTERED 
(
	[APK] ASC
    )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

END

