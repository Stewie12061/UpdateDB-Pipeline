-- <Summary>
---- Phiếu kết quả thử nghiệm sản phẩm - Detail
-- <History>
---- Create on 17/09/2014 by Lê Thị Hạnh 
---- Modified on ... by 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[MT0112]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[MT0112]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [VoucherID] NVARCHAR(50) NOT NULL,
      [TransactionID] NVARCHAR(50) NOT NULL,
      [TestID] NVARCHAR(50) NULL,
      [ResultID] TINYINT NOT NULL, -- 0: Fail (Không đạt), 1: Pass (Đạt)
      [Notes] NVARCHAR(250) NULL
    CONSTRAINT [PK_MT0112] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [TransactionID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
