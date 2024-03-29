IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[DRT2012]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[DRT2012]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [TranMonth] INT NOT NULL,
      [TranYear] INT NOT NULL,
      [ContractNo] VARCHAR(50) NULL,
      [UnPaidAmount] DECIMAL(28,8) NULL,
      [TeamID] VARCHAR(50) NULL,
      [ContractTypeID] VARCHAR(50) NULL,
      [UnPaidElse] DECIMAL(28,8) NULL,
      [PunishFee] DECIMAL(28,8) NULL,
      [OverDueProfit] DECIMAL(28,8) NULL
    CONSTRAINT [PK_DRT2012] PRIMARY KEY CLUSTERED
      (
      [APK]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
