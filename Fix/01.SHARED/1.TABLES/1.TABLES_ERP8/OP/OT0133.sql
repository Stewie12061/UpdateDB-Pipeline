-- <Summary>
---- Bảng chứa các nhân viên cần xét lên cấp (Sinolife)
-- <History>
---- Create on 29/12/2013 by Bảo Anh
---- Modified on ... by ...
---- <Example>/
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OT0133]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[OT0133](
		[APK] [uniqueidentifier] DEFAULT NEWID(),
		[DivisionID] [nvarchar](3) NOT NULL,
		[SalesmanID] [nvarchar](50) NOT NULL,
		[LevelNo] [int] NULL,
		[Orders] [int] NULL,
		[AccAmount] decimal(28,8) NULL,
		[OrderNo] [int] NULL	--- số thứ tự tách đơn hàng
) ON [PRIMARY]
END
---- Drop Columns
If Exists (Select * From sysobjects Where name = 'OT0133' and xtype ='U') 
Begin
        If exists (select * from syscolumns col inner join sysobjects tab 
        On col.id = tab.id where tab.name =   'OT0133'  and col.name = 'OrderNo')
			Alter table OT0133 drop column OrderNo
End