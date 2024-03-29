-- <Summary>
---- 
-- <History>
---- Create on 16/10/2013 by Lưu Khánh Vân
---- Modified on 11/03/2014 by Bảo Anh: Bổ sung các cột Từ tháng/năm, Đến tháng/năm phát sinh thay đổi BHXH, BHYT
---- Modify on 18/06/2014 by Bảo Anh: Thay đổi độ dài của StatusName
---- <Example>
IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT0321]') AND type in (N'U'))
CREATE TABLE [dbo].[HT0321](
	[APK] [uniqueidentifier] NULL,
	[DivisionID] [nvarchar](50) NOT NULL,
	[EmployeeID] [nvarchar](50) NOT NULL,
	[TranMonth] [int] NOT NULL,
	[TranYear] [int] NOT NULL,
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
	[StatusName] [nvarchar](50) NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL
 CONSTRAINT [PK_HT0321] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC,
	[EmployeeID] ASC,
	[TranYear] ASC,
	[TranMonth] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
---- Add giá trị default
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_HT0321_APK]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HT0321] ADD  CONSTRAINT [DF_HT0321_APK]  DEFAULT (newid()) FOR [APK]
END
---- Add Columns
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='HT0321' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='HT0321' AND col.name='MonthYearFrom')
	ALTER TABLE HT0321 ADD MonthYearFrom nvarchar(10)	
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='HT0321' AND col.name='MonthYearTo')
	ALTER TABLE HT0321 ADD MonthYearTo nvarchar(10)
END
---- Alter Columns
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='HT0321' AND xtype='U')
	BEGIN
		IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='HT0321' AND col.name='StatusName')
		ALTER TABLE HT0321 ALTER COLUMN StatusName NVARCHAR(250) NULL 
	END
