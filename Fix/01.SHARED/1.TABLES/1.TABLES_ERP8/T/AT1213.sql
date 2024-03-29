-- <Summary>
---- Bảng ghi nhận lịch sử quan hệ giám đốc - chủ nhiệm (Sinolife)
-- <History>
---- Create on 06/08/2014 by Bảo Anh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT1213]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[AT1213](
		[APK] [uniqueidentifier] DEFAULT NEWID(),
		[DivisionID] [nvarchar](3) NOT NULL,
		[ObjectID] [nvarchar](50) NULL,
		[ManagerID] [nvarchar](50) NULL
) ON [PRIMARY]
END