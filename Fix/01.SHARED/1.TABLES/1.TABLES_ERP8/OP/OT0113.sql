-- <Summary>
---- Bảng lưu tạm thông tin những người được giới thiệu bởi 1 nhân viên (Sinolife)
-- <History>
---- Create on 27/08/2014 by Bảo Anh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT0113]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[OT0113](
		[APK] [uniqueidentifier] DEFAULT NEWID(),
		[DivisionID] [nvarchar](3) NOT NULL,
		[ObjectID] [nvarchar](50) NULL,
		[LevelNo] int NULL
) ON [PRIMARY]
END