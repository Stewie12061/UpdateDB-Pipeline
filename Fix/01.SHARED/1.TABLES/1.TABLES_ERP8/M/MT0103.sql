-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MT0103]') AND type in (N'U'))
BEGIN
	CREATE TABLE [dbo].[MT0103](
		[APK] [uniqueidentifier] DEFAULT NEWID(),
		[DivisionID] [nvarchar](3) NOT NULL,
		[TranMonth] [int] NULL,
		[TranYear] [int] NULL,
		[PeriodID] [nvarchar](50) NOT NULL,
		[WasteID] [nvarchar](50) NOT NULL,
		[UnitID] [nvarchar](50) NOT NULL,
		[Quantity] decimal(28,8) NULL	
	) ON [PRIMARY]
END