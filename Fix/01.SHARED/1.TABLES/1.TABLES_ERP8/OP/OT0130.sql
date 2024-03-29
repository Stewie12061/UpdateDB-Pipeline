-- <Summary>
---- Cam kết chiết khấu - Master [Sài Gòn Petro - Customize Index: 36)
-- <History>
---- Create on 30/09/2014 by Lê Thị Hạnh 
---- Modified on ... by 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[OT0130]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[OT0130]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [ID] NVARCHAR(50) NOT NULL,
      [Description] NVARCHAR(250) NULL,
      [OID] NVARCHAR(50) NULL, -- Mã phân tích khu vực
      [CurrencyID] NVARCHAR(50) NULL,
      [FromDate] DATETIME NULL,
      [ToDate] DATETIME NULL,
      [Disabled] TINYINT NULL,
      [CreateUserID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] NVARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_OT0130] PRIMARY KEY CLUSTERED
      ( 
      [DivisionID] ASC,
      [ID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END