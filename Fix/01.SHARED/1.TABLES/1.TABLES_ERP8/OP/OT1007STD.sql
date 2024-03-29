-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT1007STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OT1007STD](
	[Code] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Type] [tinyint] NOT NULL,
	[Orders] [tinyint] NULL,
	[Disabled] [tinyint] NOT NULL )
ON [PRIMARY]
INSERT [dbo].[OT1007STD] ([Code], [Description], [Type], [Orders], [Disabled]) VALUES (N'DV', N'Hàng đang về', 0, 0, 0)
INSERT [dbo].[OT1007STD] ([Code], [Description], [Type], [Orders], [Disabled]) VALUES (N'TT', N'Tồn kho thực tế', 0, 0, 0)
INSERT [dbo].[OT1007STD] ([Code], [Description], [Type], [Orders], [Disabled]) VALUES (N'GC', N'Hàng giữ chỗ', 0, 0, 0)
INSERT [dbo].[OT1007STD] ([Code], [Description], [Type], [Orders], [Disabled]) VALUES (N'MIN', N'Tồn kho tối thiểu', 0, 0, 0)
INSERT [dbo].[OT1007STD] ([Code], [Description], [Type], [Orders], [Disabled]) VALUES (N'MAX', N'Hàng tối đa', 0, 0, 0)
END