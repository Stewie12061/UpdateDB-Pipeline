---- Create by Phan Thanh Hoàng Vũ on 17/12/2015 10:07:04 AM: Bảng thiết lập hệ thống
---- Modified by Thị Phượng on 29/11/2016 bổ sung trường WareHouseBorrowID Kho cho mượn Customize Hoàng Trần
---- Modified by Hoàng Vũ on 27/09/2018: CustomizeIndex = 87 (OKIA), BỔ sung Vouchertype06, thiết lập phiếu bảo hành bên Module CRM

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CRMT00000]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[CRMT00000]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NOT NULL,
      [TranYear] INT NOT NULL,
      [TranMonth] INT NOT NULL,
      [VoucherType01] [varchar](50) NULL, --Phiếu đơn hàng bán
	  [VoucherType02] [varchar](50) NULL, -- Phiếu điều phối
	  [VoucherType03] [varchar](50) NULL, --Phiếu nhập kho
	  [VoucherType04] [varchar](50) NULL,  --Phiếu xuất kho
	  [WareHouseID] [varchar](50) NULL,  --Kho chính
	  [WareHouseTempID] [varchar](50) NULL,  --Kho trung gian
      [ApportionID] VARCHAR(50) NULL, --Thiết lập bộ kít
      [ExportAccountID] VARCHAR(50) NULL,--tài khoản xuất kho
      [ImportAccountID] VARCHAR(50) NULL, --tài khoản nhập kho
	  [CreateDate] DATETIME NULL,
	  [CreateUserID] [varchar](50) NULL,
	  [LastModifyDate] DATETIME NULL,
	  [LastModifyUserID] [varchar](50) NULL
    CONSTRAINT [PK_CRMT00000] PRIMARY KEY CLUSTERED
      (
      [DivisionID]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT00000' AND xtype = 'U')
    BEGIN
        IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
        ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'CreateDate')
        ALTER TABLE CRMT00000 ADD CreateDate DATETIME NULL
    END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT00000' AND xtype = 'U')
    BEGIN
        IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
        ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'CreateUserID')
        ALTER TABLE CRMT00000 ADD CreateUserID VARCHAR(50) NULL
    END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT00000' AND xtype = 'U')
    BEGIN
        IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
        ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'LastModifyDate')
        ALTER TABLE CRMT00000 ADD LastModifyDate DATETIME NULL
    END
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT00000' AND xtype = 'U')
    BEGIN
        IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
        ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'LastModifyUserID')
        ALTER TABLE CRMT00000 ADD LastModifyUserID VARCHAR(50) NULL
    END

--Modifiled by Thị Phượng
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT00000' AND xtype = 'U')
    BEGIN
        IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
        ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'WareHouseBorrowID')
        ALTER TABLE CRMT00000 ADD WareHouseBorrowID VARCHAR(50) NULL
    END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT00000' AND xtype = 'U')
    BEGIN
        IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
        ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'VoucherType05')
        ALTER TABLE CRMT00000 ADD VoucherType05 VARCHAR(50) NULL
    END

--Modifiled by Tấn Đạt
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT00000' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'ProjectID') 
   ALTER TABLE CRMT00000 ADD ProjectID VARCHAR(50) NULL 
END

/*===============================================END ProjectID===============================================*/ 

--CustomizeInde = 87 (OKIA): Phiếu bảo hành, bên CRM
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT00000' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'VoucherType06') 
   ALTER TABLE CRMT00000 ADD VoucherType06 VARCHAR(50) NULL 
END
/*===============================================END VoucherType06===============================================*/

/*[Học Huy] Update [28/11/2019]: Custom MAITHU (117) */
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT00000' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'ClassifyID') 
   ALTER TABLE CRMT00000 ADD ClassifyID NVARCHAR(MAX) NULL 
END

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT00000' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'ZensuppoID') 
   ALTER TABLE CRMT00000 ADD ZensuppoID NVARCHAR(50) NULL 
END
/*[Học Huy] Update [28/11/2019]: Custom MAITHU (117) */

-------------------- 23/12/2019 - Tấn Lộc: Bổ sung cột VoucherRequestCustomer --------------------
IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'VoucherRequestCustomer ')
BEGIN
	ALTER TABLE CRMT00000 ADD VoucherRequestCustomer  VARCHAR(50) NULL
END

-------------------- 01/07/2020 - Kiều Nga: Hợp đồng --------------------
IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'VoucherContract')
BEGIN
	ALTER TABLE CRMT00000 ADD VoucherContract  VARCHAR(50) NULL
END

-------------------- 21/07/2020 - Tấn Lộc: Bổ sung cột VoucherRequestLicense --------------------
IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'VoucherRequestLicense ')
BEGIN
	ALTER TABLE CRMT00000 ADD VoucherRequestLicense  VARCHAR(50) NULL
END

-------------------- 11/04/2020 - Đình Hòa: Bổ sung cột VoucherCampaign --------------------
IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'VoucherCampaign')
BEGIN
	ALTER TABLE CRMT00000 ADD VoucherCampaign  VARCHAR(50) NULL
END

-------------------- 16/11/2020 - Tấn Lộc: Bổ sung cột VoucherCampaignEmail --------------------
IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'VoucherCampaignEmail ')
BEGIN
	ALTER TABLE CRMT00000 ADD VoucherCampaignEmail  VARCHAR(50) NULL
END

-------------------- 24/12/2020 - Đình Ly: Bổ sung cột công đoạn In --------------------
IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'PrintPhaseID')
BEGIN
	ALTER TABLE CRMT00000 ADD PrintPhaseID  VARCHAR(50) NULL
END

-------------------- 24/12/2020 - Đình Ly: Bổ sung cột công đoạn Cắt --------------------
IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'CutPhaseID')
BEGIN
	ALTER TABLE CRMT00000 ADD CutPhaseID  VARCHAR(50) NULL
END

-------------------- 24/12/2020 - Đình Ly: Bổ sung cột công đoạn Sóng --------------------
IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'WavePhaseID')
BEGIN
	ALTER TABLE CRMT00000 ADD WavePhaseID  VARCHAR(50) NULL
END

-------------------- 18/03/2021 - Tấn Thành: Bổ sung cột Yêu cầu hỗ trợ--------------------
IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'VoucherSupportRequired')
BEGIN
	ALTER TABLE CRMT00000 ADD VoucherSupportRequired  VARCHAR(50) NULL
END

-------------------- 04/05/2021 - Tấn Lộc: Bổ sung cột VoucherRequestService --------------------
IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'VoucherRequestService ')
BEGIN
	ALTER TABLE CRMT00000 ADD VoucherRequestService  VARCHAR(50) NULL
END

-------------------- 27/04/2021 - Lê Hoàng: Bổ sung cột xác định Chủng loại Kẽm In --------------------
IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'ZincID')
BEGIN
	ALTER TABLE CRMT00000 ADD ZincID VARCHAR(50) NULL
END

-------------------- 28/04/2021 - Lê Hoàng: Bổ sung cột công đoạn Bế/Chạp --------------------
IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'DieCuttingPhase')
BEGIN
	ALTER TABLE CRMT00000 ADD DieCuttingPhase VARCHAR(50) NULL
END

-------------------- 27/05/2021 - Tấn Lộc: Bổ sung cột VoucherCampaignSMS --------------------
IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'VoucherCampaignSMS')
BEGIN
	ALTER TABLE CRMT00000 ADD VoucherCampaignSMS  VARCHAR(50) NULL
END

-------------------- 23/11/2021 - Tấn Lộc: Bổ sung cột VoucherSourceDataOnline --------------------
IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT00000' AND col.name = 'VoucherSourceDataOnline')
BEGIN
	ALTER TABLE CRMT00000 ADD VoucherSourceDataOnline  VARCHAR(50) NULL
END