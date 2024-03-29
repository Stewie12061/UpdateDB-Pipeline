-- <Summary>
---- Bang tam insert du lieu - Báo cáo thuế: Không tạo trong store in dữ liệu mà đưa ra ngoài riêng
-- <History>
---- Create on 16/08/2013 by Le Thi Thu Hien
---- Modified on ... by ...
---- <Example>
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'[dbo].[AT7412]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE AT7412
CREATE TABLE [dbo].[AT7412] (
[APK] [uniqueidentifier] DEFAULT NEWID(),
[DivisionID] [nvarchar] (50) NOT NULL,
[ReportCode] [nvarchar] (50) NULL ,	
[VATTypeID] [nvarchar] (50) NULL ,
[VATGroupID] [nvarchar] (50) NULL ,
[IsVATIn] [tinyint] NULL ,
[IsVATType] [tinyint] NULL ,
[IsVATGroup][tinyint] NULL,
CONSTRAINT [PK_AT7412] PRIMARY KEY NONCLUSTERED 
(
	[APK] ASC,
	[DivisionID] ASC
    )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]		
) ON [PRIMARY]
