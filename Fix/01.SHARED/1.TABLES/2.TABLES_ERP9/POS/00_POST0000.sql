--- Created on 01/04/2014 by Phan thanh hoàng vũ
--- Lưu thiết lập hệ thống
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST0000]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[POST0000]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NOT NULL,
      [TranMonth] INT NOT NULL,
      [TranYear] INT NOT NULL
   CONSTRAINT [PK_POST0000] PRIMARY KEY CLUSTERED
      (
      [DivisionID]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
