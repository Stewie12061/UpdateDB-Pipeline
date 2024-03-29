-- <Summary>
---- Quy cách - Kiểm tra - Phụ liệu đóng gói sản phẩm (customize Angel)
-- <History>
---- Create on 30/12/2015 by Bảo Anh

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT1302_AG]') AND type in (N'U'))
CREATE TABLE [dbo].[AT1302_AG](
	[APK] [uniqueidentifier] DEFAULT NEWID(),
	[DivisionID] [nvarchar](3) NOT NULL,
	[InventoryID] [nvarchar](50) NOT NULL,
	[Notes01] [nvarchar](250) NULL,
	[Notes02] [nvarchar](250) NULL,
	[Notes03] [nvarchar](250) NULL,
	[TypeID] [nvarchar](2) NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	
 CONSTRAINT [PK_AT1302_AG] PRIMARY KEY NONCLUSTERED 
(
	[APK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]