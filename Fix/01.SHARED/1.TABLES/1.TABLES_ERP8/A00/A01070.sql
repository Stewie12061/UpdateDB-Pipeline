-- <Summary>
---- 
-- <History>
---- Create on 21/01/2010 by Bình Minh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[A01070]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[A01070](
	[ReportID] [nvarchar](50) NOT NULL,
	[ModuleID] [nvarchar](50) NOT NULL,
	[ReportName] [nvarchar](250) NULL,
	[ReportNameE] [nvarchar](250) NULL,
	[ReportFile] [nvarchar](250) NULL,
	[ExportExcelFile] [nvarchar](250) NULL,
	[StartRow] [int] NOT NULL,
	[StartCol] [int] NOT NULL,
	[ExportType] [tinyint] NOT NULL,
	[UseDivision] [bit] NOT NULL,
	[UsePeriod] [bit] NOT NULL,
	[UseDate] [bit] NOT NULL,
	[UseParameter] [bit] NOT NULL,
	[UseSubReport] [bit] NOT NULL,
	[NoOfSubreport] [tinyint] NOT NULL,
	[ReportSQL] [nvarchar](max) NULL,
	[ExcelSQL] [nvarchar](max) NULL,
	[Disabled] [tinyint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUserID] [nvarchar](50) NOT NULL,
	[LastModifyDate] [datetime] NOT NULL,
	[LastModifyUserID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_A01070] PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
---- Add giá trị default
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_A01070_StartRow]') AND parent_object_id = OBJECT_ID(N'[dbo].[A01070]'))
BEGIN
ALTER TABLE [dbo].[A01070] ADD  CONSTRAINT [DF_A01070_StartRow]  DEFAULT ((0)) FOR [StartRow]
END
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_A01070_StartCol]') AND parent_object_id = OBJECT_ID(N'[dbo].[A01070]'))
BEGIN
ALTER TABLE [dbo].[A01070] ADD  CONSTRAINT [DF_A01070_StartCol]  DEFAULT ((0)) FOR [StartCol]
END
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_A01070_ExportType]') AND parent_object_id = OBJECT_ID(N'[dbo].[A01070]'))
BEGIN
ALTER TABLE [dbo].[A01070] ADD  CONSTRAINT [DF_A01070_ExportType]  DEFAULT ((1)) FOR [ExportType]
END
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_A01070_UseDivision]') AND parent_object_id = OBJECT_ID(N'[dbo].[A01070]'))
BEGIN
ALTER TABLE [dbo].[A01070] ADD  CONSTRAINT [DF_A01070_UseDivision]  DEFAULT ((1)) FOR [UseDivision]
END
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_A01070_UsePeriod]') AND parent_object_id = OBJECT_ID(N'[dbo].[A01070]'))
BEGIN
ALTER TABLE [dbo].[A01070] ADD  CONSTRAINT [DF_A01070_UsePeriod]  DEFAULT ((0)) FOR [UsePeriod]
END
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_A01070_UseDate]') AND parent_object_id = OBJECT_ID(N'[dbo].[A01070]'))
BEGIN
ALTER TABLE [dbo].[A01070] ADD  CONSTRAINT [DF_A01070_UseDate]  DEFAULT ((0)) FOR [UseDate]
END
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_A01070_UseParameter]') AND parent_object_id = OBJECT_ID(N'[dbo].[A01070]'))
BEGIN
ALTER TABLE [dbo].[A01070] ADD  CONSTRAINT [DF_A01070_UseParameter]  DEFAULT ((1)) FOR [UseParameter]
END
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_A01070_UseSubReport]') AND parent_object_id = OBJECT_ID(N'[dbo].[A01070]'))
BEGIN
ALTER TABLE [dbo].[A01070] ADD  CONSTRAINT [DF_A01070_UseSubReport]  DEFAULT ((0)) FOR [UseSubReport]
END
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_A01070_NoOfSubreport]') AND parent_object_id = OBJECT_ID(N'[dbo].[A01070]'))
BEGIN
ALTER TABLE [dbo].[A01070] ADD  CONSTRAINT [DF_A01070_NoOfSubreport]  DEFAULT ((0)) FOR [NoOfSubreport]
END
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF_A01070_Disabled]') AND parent_object_id = OBJECT_ID(N'[dbo].[A01070]'))
BEGIN
ALTER TABLE [dbo].[A01070] ADD  CONSTRAINT [DF_A01070_Disabled]  DEFAULT ((0)) FOR [Disabled]
END
---- Add Columns
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'A01070' AND xtype ='U') 
BEGIN
    IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
    ON col.id = tab.id WHERE tab.name = 'A01070' AND col.name = 'ControlSourceDivisionID')
    ALTER TABLE A01070 ADD ControlSourceDivisionID NVARCHAR(50) NULL
END 