﻿-- <Summary>
---- Bảng lưu riêng cho mã tăng tự động cho Hóa đơn bán hàng.
-- <History>
---- CREATE on 06/08/2010 by Mỹ Tuyền
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT4444_MP01]') AND type in (N'U'))
CREATE TABLE [AT4444_MP01](
	[APK] UNIQUEIDENTIFIER DEFAULT NEWID(),
	[DivisionID] NVARCHAR(3) NOT NULL,
	[TABLENAME] NVARCHAR(50) NULL,
	[KEYSTRING] NVARCHAR(50) NULL,
	[LASTKEY] INT NULL,
	CONSTRAINT [PK_AT4444_MP01] PRIMARY KEY NONCLUSTERED 
(
	[APK] ASC
    )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

) ON [PRIMARY]