-- <Summary>
---- Danh mục loại hàng hoá chịu thuế bảo vệ môi trường - Hỗ trợ 17/3/15
-- <History>
---- Create on 19/03/2015 by Lê Thị Hạnh 
---- Modified on ... by 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT0293]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[AT0293]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [TransactionID] NVARCHAR(50) NOT NULL,
      [ETaxID] NVARCHAR(50) NOT NULL,
      [ETaxName] NVARCHAR(250) NULL,
      [UnitID] NVARCHAR(50) NULL,
      [ETaxAmount] DECIMAL(28,8) NULL,
      [Disabled] TINYINT NULL,
      [IsCommon] TINYINT NULL,
      [CreateUserID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] NVARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL      
    CONSTRAINT [PK_AT0293] PRIMARY KEY CLUSTERED
      (
      [TransactionID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
