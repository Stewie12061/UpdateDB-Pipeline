-- <Summary>
---- Bảng chứa các nhân viên cần xét tách đơn hàng (Sinolife)
-- <History>
---- Create on 18/08/2014 by Bảo Anh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT0143]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[OT0143](
		[APK] [uniqueidentifier] DEFAULT NEWID(),
		[DivisionID] [nvarchar](3) NOT NULL,
		[SalesmanID] [nvarchar](50) NOT NULL,
		[LevelNo] [int] NULL,
		[Orders] [int] NULL,
		[SalesAmount] [int] NULL,
		[SameAmount] [int] NULL,
		[ExtendAmount] [int] NULL,
		[IsReview] [tinyint] NULL
) ON [PRIMARY]
END