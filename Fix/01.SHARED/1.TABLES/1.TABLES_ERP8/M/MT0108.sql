-- <Summary>
---- Phiếu pha trộn - Detail
-- <History>
---- Create on 16/09/2014 by Lê Thị Hạnh 
---- Modified on 05/11/2014 by Lê Thị Hạnh: Bổ sung trường Notes01 cho bảng Detail cho phiếu pha trộn [Customize Index: 36 - Sài Gòn Petro]
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[MT0108]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[MT0108]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [VoucherID] NVARCHAR(50) NOT NULL,
      [TransactionID] NVARCHAR(50) NOT NULL,
      [MaterialID] NVARCHAR(50) NULL,
      [TypeID] TINYINT NOT NULL, -- 1: BaseOil - dầu gốc , 2: Additive: phụ gia 
      [Notes01] NVARCHAR(250) NULL,
      [Rate01] DECIMAL(28,8) NULL,
      [Rate02] DECIMAL(28,8) NULL,
      [Rate03] DECIMAL(28,8) NULL,
      [Rate04] DECIMAL(28,8) NULL,
      [Rate05] DECIMAL(28,8) NULL,
      [VolumeTotal] DECIMAL(28,8) NULL,
      [WeightTotal] DECIMAL(28,8) NULL
    CONSTRAINT [PK_MT0108] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [TransactionID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
---- Add Columns
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='MT0108' AND xtype='U')
	BEGIN
		IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
		ON col.id=tab.id WHERE tab.name='MT0108' AND col.name='Notes01')
		ALTER TABLE MT0108 ADD Notes01 NVARCHAR(250) NULL
	END
