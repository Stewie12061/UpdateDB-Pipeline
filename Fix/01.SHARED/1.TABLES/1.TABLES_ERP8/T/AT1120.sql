-- <Summary>
---- Bảng chứa các nhân viên cần xét lên cấp (Sinolife)
-- <History>
---- Create on 11/12/2013 by Bảo Anh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT1120]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[AT1120](
		[APK] [uniqueidentifier] DEFAULT NEWID(),
		[DivisionID] [nvarchar](3) NOT NULL,
		[ObjectID] [nvarchar](50) NOT NULL,
		[LevelNo] [int] NULL,
		[AccAmount] decimal(28,8) NULL,
		[ManagerID] [nvarchar](50)  NULL,
		[OrderNo] [int] NULL

) ON [PRIMARY]
END

