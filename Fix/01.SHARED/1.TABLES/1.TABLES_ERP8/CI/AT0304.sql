-- <Summary>
---- Danh mục loại hàng hoá chịu thuế bảo vệ môi trường - Hỗ trợ 17/3/15
-- <History>
---- Create on 19/03/2015 by Lê Thị Hạnh 
---- Modified on ... by 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT0304]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[AT0304]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [VoucherID] NVARCHAR(50) NOT NULL,
      [ReportCode] NVARCHAR(50) NOT NULL,
      [ReportName] NVARCHAR(250) NULL,
      [ReportTitle] NVARCHAR(250) NULL,
      [ReportID] NVARCHAR(50) NULL,
      [ETaxVoucherID] NVARCHAR(50) NULL,
      [Disabled] TINYINT NULL,
      [IsDefault] TINYINT DEFAULT (0) NULL,
      [CreateUserID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] NVARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL      
    CONSTRAINT [PK_AT0304] PRIMARY KEY CLUSTERED
      (
      [DivisionID] ASC,
      [VoucherID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
