-- <Summary>
---- 
-- <History>
---- Create on 06/08/2010 by Minh Lâm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT2401]') AND type in (N'U'))
CREATE TABLE [dbo].[HT2401](
	[APK] [uniqueidentifier] DEFAULT NEWID(),
	[DivisionID] nvarchar(3) NOT NULL,
	[AbsentDate] [datetime] NOT NULL,
	[EmployeeID] [nvarchar](50) NOT NULL,
	[TranMonth] [int] NOT NULL,
	[TranYear] [int] NOT NULL,
	[DepartmentID] [nvarchar](50) NOT NULL,
	[TeamID] [nvarchar](50) NULL,
	[AbsentTypeID] [nvarchar](50) NOT NULL,
	[AbsentAmount] [decimal](28, 8) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	CONSTRAINT [PK_HT2401] PRIMARY KEY NONCLUSTERED 
(
	[APK] ASC
    )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

---- Add Columns
If Exists (Select * From sysobjects Where name = 'HT2401' and xtype ='U') 
Begin
    If not exists (select * from syscolumns col inner join sysobjects tab 
    On col.id = tab.id where tab.name =   'HT2401'  and col.name = 'IsFromAO')
		Alter Table  HT2401 Add IsFromAO tinyint Null Default(0)	--- là cột nhận biết kết chuyển từ Approve Online (Meiko)
End