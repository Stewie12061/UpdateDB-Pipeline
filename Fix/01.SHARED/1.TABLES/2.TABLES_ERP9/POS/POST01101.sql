---- Create by Phan thanh hoàng vũ on 8/7/2017 9:08:42 AM
---- Danh sách đơn hàng-Master (trên APP-Mobile)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST01101]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[POST01101]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NULL,
  [ShopID] VARCHAR(50) NULL,
  [VoucherNo] INT Identity(1,1) NOT NULL,
  [VoucherDate] DATETIME NULL,
  [TranMonth] INT NULL,
  [TranYear] INT NULL,
  [SaleManID] VARCHAR(50) NULL,
  [MemberID] VARCHAR(50) NULL,
  [CurrencyID] VARCHAR(50) NULL,
  [ExchangeRate] DECIMAL(28,8) NULL,
  [TotalAmount] DECIMAL(28,8) NULL,
  [TotalAmountConverted] DECIMAL(28,8) NULL,
  [PromoteChangeAmount] DECIMAL(28,8) NULL,
  [PromoteChangeAmountConverted] DECIMAL(28,8) NULL,
  [DeleteFlg] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_POST01101] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END


--Quan lý việc có sự dụng phiếu quà tặng cho hóa đơn này hay không nếu có thì tính tổng tiền qua tặng(Làm trước cho Khách hàng NHÂN NGỌC)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'POST01101' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'POST01101' AND col.name = 'TotalGiftVoucherAmount') 
   ALTER TABLE POST01101 ADD TotalGiftVoucherAmount DECIMAL(28,8) NULL 
END
/*===============================================END TotalGiftVoucherAmount===============================================*/ 