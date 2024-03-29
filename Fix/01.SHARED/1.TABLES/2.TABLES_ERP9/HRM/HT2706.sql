---- Create by Hải Long on 03/12/2015 10:31:01 AM
---- Import số ngày phép ban đầu
---- Import Số phép đầu kỳ phụ nữ

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[HT2706]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[HT2706]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
      [DivisionID] VARCHAR(50) NULL,
      [TranMonth] INT NULL,
      [TranYear] INT NULL,
      [EmployeeID] VARCHAR(50) NOT NULL,
      [FullName] NVARCHAR(500) NULL,
      [FirstLoaDays] INT NULL,
      [TransactionKey] VARCHAR(50) NULL,
      [TransactionID] VARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [ErrorColumn] NVARCHAR(4000) NULL,
      [ErrorMessage] NVARCHAR(4000) NULL,
      [Row] INT NULL
    CONSTRAINT [PK_HT2706] PRIMARY KEY CLUSTERED
      (
      [APK]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END

-- Sửa đổi dữ liệu của cột FirstLoaDays thành kiểu decimal
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='HT2706' AND xtype='U')
	BEGIN
		IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='HT2706' AND col.name='FirstLoaDays')
		ALTER TABLE HT2706 ALTER COLUMN FirstLoaDays DECIMAL(28,8) NULL 
	END

--- Modified on 05/01/2019 by Bảo Anh: Bổ sung số dư phép bù đầu kỳ (dùng cho QL phép nghỉ bù của NEWTOYO)
If Exists (Select * From sysobjects Where name = 'HT2706' and xtype ='U') 
Begin      
       If not exists (select * from syscolumns col inner join sysobjects tab 
       On col.id = tab.id where tab.name =   'HT2706'  and col.name = 'FirstOTLeaveDays')
       Alter Table HT2706 Add FirstOTLeaveDays DECIMAL(28,8) NULL
END

--- Modified on 31/07/2023 by Trọng Phúc: Bổ sung số dư phép bù đầu kỳ (dùng cho QL phép nghỉ bù của NEWTOYO)
If Exists (Select * From sysobjects Where name = 'HT2706' and xtype ='U') 
Begin      
       If not exists (select * from syscolumns col inner join sysobjects tab 
       On col.id = tab.id where tab.name =   'HT2706'  and col.name = 'FirstLoaDaysWoman')
       Alter Table HT2706 Add FirstLoaDaysWoman DECIMAL(28,8) NULL
END