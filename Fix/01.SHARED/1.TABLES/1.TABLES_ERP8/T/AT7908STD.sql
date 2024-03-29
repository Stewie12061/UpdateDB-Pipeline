-- <Summary>
---- 
-- <History>
---- Create on 06/08/2010 by Việt Khánh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT7908STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT7908STD](
	[ReportCode] [nvarchar](50) NOT NULL,
	[TitleID] [nvarchar](50) NOT NULL,
	[ColID] [nvarchar](50) NOT NULL,
	[FromAccountID] [nvarchar](50) NULL,
	[ToAccountID] [nvarchar](50) NULL,
	[FromCorAccountID] [nvarchar](50) NULL,
	[ToCorAccountID] [nvarchar](50) NULL,
	[GroupID] [nvarchar](50) NULL
) ON [PRIMARY]
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0802', N'1', N'2111', N'2111z', NULL, NULL, N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0802', N'2', N'2112', N'2112z', NULL, NULL, N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0802', N'3', N'2113', N'2113z', NULL, NULL, N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0802', N'4', N'2118', N'2118z', NULL, NULL, N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0803', N'1', N'2111', N'2111z', N'331', N'331Z', N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0803', N'2', N'2112', N'2112z', N'331', N'331Z', N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0803', N'3', N'2113', N'2113z', N'331', N'331Z', N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0803', N'4', N'2118', N'2118z', N'331', N'331Z', N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0804', N'1', N'2111', N'2111z', N'241', N'241z', N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0804', N'2', N'2112', N'2112z', N'241', N'241z', N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0804', N'3', N'2113', N'2113Z', N'241', N'241z', N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0804', N'4', N'2118', N'2118z', N'241', N'241z', N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0805', N'1', N'2111', N'2111z', N'711', N'711z', N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0805', N'2', N'2112', N'2112z', N'711', N'711z', N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0805', N'3', N'2113', N'2113z', N'711', N'711z', N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0805', N'4', N'2118', N'2118z', N'711', N'711z', N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0806', N'1', N'2111', N'2111Z', N'217', N'217Z', N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0806', N'2', N'2112', N'2112z', N'217', N'217Z', N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0806', N'3', N'2113', N'2113z', N'217', N'217Z', N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0806', N'4', N'2118', N'2118Z', N'217', N'217Z', N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0807', N'1', N'2111', N'2111Z', N'811', N'811Z', N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0807', N'2', N'2112', N'2112z', N'811', N'811Z', N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0807', N'3', N'2113', N'2113Z', N'811', N'811Z', N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0807', N'4', N'2118', N'2118Z', N'811', N'811Z', N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0808', N'1', N'2111', N'2111Z', NULL, NULL, N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0808', N'2', N'2112', N'2112Z', NULL, NULL, N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0808', N'3', N'2113', N'2113Z', NULL, NULL, N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0808', N'4', N'2118', N'2118Z', NULL, NULL, N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0809', N'1', N'2111', N'2111Z', NULL, NULL, NULL)
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0809', N'2', N'2112', N'2112z', NULL, NULL, NULL)
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0809', N'3', N'2113', N'2113z', NULL, NULL, NULL)
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0809', N'4', N'2118', N'2118Z', NULL, NULL, NULL)
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0810', N'1', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0801', N'1', N'2111', N'2111Z', NULL, NULL, N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0801', N'2', N'2112', N'2112Z', NULL, NULL, N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0801', N'3', N'2113', N'2113Z', NULL, NULL, N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0801', N'4', N'2118', N'2118Z', NULL, NULL, N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0814', N'1', N'2111', N'2111', NULL, NULL, N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0814', N'2', NULL, NULL, NULL, NULL, N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0814', N'3', NULL, NULL, NULL, NULL, N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0814', N'4', NULL, NULL, NULL, NULL, N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0819', N'1', N'21411', N'21411', NULL, NULL, N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0819', N'2', N'21412', N'21412', NULL, NULL, N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0819', N'3', NULL, NULL, NULL, NULL, N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'BC01_TMTC', N'0819', N'4', NULL, NULL, NULL, NULL, N'08')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'O_BCTMTC', N'dong 1', N'1', N'2111', N'2111', N'1111', N'1111', N'nhom 1')
INSERT [dbo].[AT7908STD] ([ReportCode], [TitleID], [ColID], [FromAccountID], [ToAccountID], [FromCorAccountID], [ToCorAccountID], [GroupID]) VALUES (N'O_BCTMTC', N'dong 1', N'2', N'2112', N'2112', N'1111', N'1111', N'nhom 1')
END
---- Alter Columns
IF EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT7908]') AND TYPE IN (N'U'))
BEGIN
	IF EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS TB
			WHERE TB.CONSTRAINT_NAME ='PK_AT7908')
	BEGIN
		ALTER TABLE AT7908
		DROP  CONSTRAINT PK_AT7908
	END
	ALTER TABLE AT7908
	ALTER COLUMN APK  UNIQUEIDENTIFIER NOT NULL
	ALTER TABLE AT7908
	ADD CONSTRAINT PK_AT7908 PRIMARY KEY (APK)
END