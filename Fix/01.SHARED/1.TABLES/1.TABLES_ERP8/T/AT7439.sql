-- <Summary>
---- Lưu tờ khai thuế TNDN
-- <History>
---- Create on 16/04/2017 by Hải Long
---- Modified on
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT7439]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[AT7439]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [VoucherID] NVARCHAR(50) NOT NULL,
      [IsPeriod] TINYINT NOT NULL DEFAULT(0),
	  [Quarter]	VARCHAR(50) NULL,
      [TranMonth] INT NULL, -- Tháng kê khai
      [TranYear] INT NULL, -- Năm kê khai
      [FromDate] DATETIME NULL, 
      [ToDate] DATETIME NULL,   
	  [TranYearTax] INT,      
	  [TaxReturnFileID]	NVARCHAR(250),                                       
	  [TaxReturnID] NVARCHAR(250) NULL, -- Mẫu tờ khai
	  [TaxReturnName] NVARCHAR(250) NULL, -- Tên tờ khai
      [ReturnTime] INT NULL, -- Lần kê khai thứ
      [IsExtended] TINYINT NOT NULL DEFAULT (0), -- Gia hạn (0: không, 1: có)
      [ReasonExtensionID] NVARCHAR(50) NULL, -- Mã lý do gia hạn
      [ReasonExtensionName] NVARCHAR(250) NULL, -- Tên lý do gia hạn
      [TaxAgentPerson] NVARCHAR(250) NULL, -- Nhân viên ĐL Thuế
      [TaxAgentCertificate] NVARCHAR(250) NULL, -- Chứng chỉ hành nghề
      [TaxReturnPerson] NVARCHAR(250) NULL, -- Người ký
      [TaxSignDate] DATETIME NULL, -- Ngày ký
      [ReportID] NVARCHAR(50) NULL, -- Mã báo cáo tờ khai thuế GTGT
      [SubReportID] NVARCHAR(50) NULL, -- Mã báo cáo bảng kê HHDV mua vào
      [AmendedReturnDate] DATETIME NULL, -- Ngày lập KHBS
      [MainReturnTax] XML NULL, --TK chính 
      [SubReturnTax] XML NULL, -- PL 
      [AmendedReturnTax] XML NULL,-- KHBS []
      [PrintDate] DATETIME NULL, -- Ngày in
      [BusinessLineID] NVARCHAR(50) NULL,
      [BusinessLineName] NVARCHAR(500) NULL,
      [BusinessType1] TINYINT NULL,  
      [BusinessType2] TINYINT NULL,      
      [BusinessType3] TINYINT NULL,                      
      [CreateUserID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] NVARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_AT7439] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [VoucherID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END

--- Bổ sung trường cho ANGEL
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'AT7439' AND xtype = 'U')
    BEGIN
        IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
        ON col.id = tab.id WHERE tab.name = 'AT7439' AND col.name = 'PercentageRate')
        ALTER TABLE AT7439 ADD PercentageRate DECIMAL(28,8) NULL
    END