-- <Summary>
---- 
-- <History>
---- Create on 01/12/2013 by Lưu Khánh Vân
---- Modified on 20/11/2013 by Lưu Khánh Vân
---- Modified on 18/06/2014 by Bảo Anh: Thay đổi độ dài của StatusName
---- Modified on 11/03/2014 by Bảo Anh: Bổ sung các cột Từ tháng/năm, Đến tháng/năm phát sinh thay đổi BHXH, BHYT
---- Modified on 11/05/2015 by Bảo Anh: Bổ sung các trường IsIBIssue, IsHIssue, HFromDate, HToDate
---- Modified on 14/08/2020 by Huỳnh Thử -- Merge Code: MEKIO và MTE
---- Modified on 14/09/2020 by Đức Thông -- Merge Code: MEKIO và MTE
---- <Example>
IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT0323]') AND type in (N'U'))
CREATE TABLE [dbo].[HT0323](
	[APK] [uniqueidentifier] NULL,
	[DivisionID] [nvarchar](50) NOT NULL,
	[VoucherID] [nvarchar](50) NOT NULL,
	[EmployeeID] [nvarchar](50) NOT NULL,
	[OldInsuranceSalary][decimal]  (28,8) NULL,
	[InsuranceSalary][decimal]  (28,8) NULL,
	[Salary01][decimal]  (28,8) NULL,
	[Salary02][decimal]  (28,8) NULL,
	[Salary03][decimal]  (28,8) NULL,
	[OrtherSalary][decimal]  (28,8) NULL,
	[SoInsuranceNo][nvarchar](50) NULL,
	[HeInsuranceNo][nvarchar](50) NULL,
	[Description][nvarchar](250) NULL,
	[Status] [int] NOT NULL,
	[HStatus] [tinyint] Not null, 
	[RemainMonth] [int] null,
	[StatusName] [nvarchar](50) NULL,
 CONSTRAINT [PK_HT0323] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC,
	[VoucherID] ASC,
	[EmployeeID] ASC
	
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
---- Add giá trị deffault
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_HT0323_APK]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HT0323] ADD  CONSTRAINT [DF_HT0323_APK]  DEFAULT (newid()) FOR [APK]
END
---- Add Columns
If Exists (Select * From sysobjects Where name = 'HT0323' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'HT0323'  and col.name = 'IsHStatus')
           Alter Table  HT0323 Add IsHStatus tinyint NULL
          
End
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='HT0323' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='HT0323' AND col.name='MonthYearFrom')
	ALTER TABLE HT0323 ADD MonthYearFrom nvarchar(10) NULL	
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='HT0323' AND col.name='MonthYearTo')
	ALTER TABLE HT0323 ADD MonthYearTo nvarchar(10) NULL
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='HT0323' AND col.name='IsIBIssue')
	ALTER TABLE HT0323 ADD IsIBIssue tinyint NULL
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='HT0323' AND col.name='IsHIssue')
	ALTER TABLE HT0323 ADD IsHIssue tinyint NULL
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='HT0323' AND col.name='HFromDate')
	ALTER TABLE HT0323 ADD HFromDate Datetime NULL	
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='HT0323' AND col.name='HToDate')
	ALTER TABLE HT0323 ADD HToDate Datetime NULL
END
---- Alter Columns
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='HT0323' AND xtype='U')
	BEGIN
		IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='HT0323' AND col.name='StatusName')
		ALTER TABLE HT0323 ALTER COLUMN StatusName NVARCHAR(250) NULL 
	END


DECLARE @CustomerIndex INT 
SELECT @CustomerIndex = CustomerName FROM dbo.CustomerIndex 
----- Modify by Huỳnh Thử on 14/08/2020: Merge Code: MEKIO và MTE
IF(@CustomerIndex= 50 OR @CustomerIndex= 115)
BEGIN
		---- Modified by Bảo Thy on 08/06/2017: Add column Phương án Tăng/Giảm/ĐC BHXH (ProjectID)
	IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'HT0323' AND xtype = 'U')
	BEGIN 
	   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'HT0323' AND col.name = 'ProjectID') 
	   ALTER TABLE HT0323 ADD ProjectID VARCHAR(50) NULL 
	END
END 


---- Modified by Bảo Thy on 08/06/2017: Add column Phương án Tăng/Giảm/ĐC BHXH (ProjectID)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'HT0323' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'HT0323' AND col.name = 'ProjectID') 
   ALTER TABLE HT0323 ADD ProjectID VARCHAR(50) NULL 
END
