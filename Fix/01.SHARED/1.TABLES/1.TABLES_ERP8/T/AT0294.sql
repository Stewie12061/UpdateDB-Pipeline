-- <Summary>
---- Danh mục văn bản về thuế bảo vệ môi trường - CF0129 - Master
-- <History>
---- Create on 19/03/2015 by Lê Thị Hạnh
---- Modified on ... by 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT0294]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[AT0294]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [VoucherID] NVARCHAR(50) NOT NULL,
      [LegalDocumentID] NVARCHAR(50) NULL,
      [LegalDocumentName] NVARCHAR(250) NULL,
      [Description] NVARCHAR(4000) NULL,
      [DecisionDate] DATETIME NULL,
      [EffectDate] DATETIME NULL,
      [IsExperied] TINYINT NULL,
      [ExperiedDate] DATETIME NULL,
      [Promulgator] NVARCHAR(250) NULL,
      [TypeOfDocument] NVARCHAR(250) NULL,
      [IsDefault] TINYINT DEFAULT 0 NULL,
      [CreateUserID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] NVARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_AT0294] PRIMARY KEY CLUSTERED
      (
      [VoucherID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
