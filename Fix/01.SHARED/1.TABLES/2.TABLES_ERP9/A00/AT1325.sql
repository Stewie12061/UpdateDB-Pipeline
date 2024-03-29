-- <Summary> Định mức bộ kít (Bảng Master bộ kit bảng AT1325 và vật tư bảng 1324, dùng bảng AT1326 làm bảng Detail, lưu lại bảng gốc bên ERP8)
-- <History>
---- Create on 12/05/2016 by Phan thanh hoàng Vũ
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT1325]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[AT1325]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NOT NULL,
      [KITID] VARCHAR(50) NOT NULL,
      [KITName] NVARCHAR(250) NOT NULL,
      [Disabled] TINYINT DEFAULT 0 NOT NULL,
      [EmployeeID] VARCHAR(50) NULL,
      [IsCommon] TINYINT DEFAULT 0 NOT NULL,
      [CreateUserID] VARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] VARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_AT1325] PRIMARY KEY CLUSTERED
      (
      [KITID]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END