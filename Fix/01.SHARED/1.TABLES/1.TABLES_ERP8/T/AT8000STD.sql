-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT8000STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT8000STD](
	[SectionID] [nvarchar](50) NOT NULL,
	[IsShow] [tinyint] NOT NULL,
	[Section] [nvarchar](250) NULL,
	[FontDetail] [nvarchar](250) NULL,
	[FontName] [nvarchar](250) NOT NULL,
	[FontSize] [tinyint] NOT NULL,
	[FontType] [nvarchar](250) NOT NULL,
	[Content] [nvarchar](250) NULL,
	[Alignment] [tinyint] NOT NULL,
	[IsLock] [tinyint] NOT NULL,
	[IsHide] [tinyint] NOT NULL,
	[PrintGridLine] [tinyint] NOT NULL,
	[TopMargin] [float] NOT NULL,
	[BottomMargin] [float] NOT NULL,
	[LeftMargin] [float] NOT NULL,
	[RightMargin] [float] NOT NULL,
	[Path] [nvarchar](250) NULL
) ON [PRIMARY]
END