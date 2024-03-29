-- <Summary>
---- Lưu tờ khai thuế GTGT
-- <History>
---- Create on
---- Modified on
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT0307]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[AT0307]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [VoucherID] NVARCHAR(50) NOT NULL,
      [IsPeriod] TINYINT NOT NULL DEFAULT(0),
	  [Quarter]	VARCHAR(50) NULL,
      [TranMonth] INT NULL, -- Tháng kê khai
      [TranYear] INT NULL, -- Năm kê khai
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
      [InputReportID] NVARCHAR(50) NULL, -- Mã báo cáo bảng kê HHDV mua vào
      [OutputReportID] NVARCHAR(50) NULL, -- Mã báo cáo bảng kê HHDV bán ra
      [AmendedReturnDate] DATETIME NULL, -- Ngày lập KHBS
      [MainReturnTax] XML NULL, --TK chính [AT030701]
      [InputReturnTax] XML NULL, -- PL Mua vào [AT7411]
      [OutputReturnTax] XML NULL, -- PL Bán ra [AT7411]
      [AmendedReturnTax] XML NULL,-- KHBS []
      [PrintDate] DATETIME NULL, -- Ngày in
      [CreateUserID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] NVARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_AT0307] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [VoucherID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
