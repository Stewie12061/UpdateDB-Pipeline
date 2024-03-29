-- <Summary>
---- 
-- <History>
---- Create on 04/04/2012 by Huỳnh Tấn Phú
---- Modified on 14/08/2020 by Huỳnh Thử -- Merge Code: MEKIO và MTE
---- Modified on 18/12/2020 by Huỳnh Thử -- LenghtAbsentNo Đưa vào chuẩn
---- Modified on ... by ...
---- <Example>
IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT0254]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HT0254](
	[APK] [uniqueidentifier] NOT NULL DEFAULT NEWID(),
	[DivisionID] [nvarchar] (50) NOT NULL,
	[TimeRecorderID] [nvarchar] (50) NOT NULL,
	[TimeRecorderName] [nvarchar] (250) NULL,
	[Type] [nvarchar] (250) NOT NULL,
	[IPAddress] [nvarchar] (50) NOT NULL,
	[Port]  [int] NOT NULL,
	[IsMethodSSR] [tinyint] NOT NULL,
	[Disabled] [tinyint] NOT NULL,
	[Notes] [nvarchar](250) NULL,	
	[CreateUserID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
CONSTRAINT [PK_HT0254] PRIMARY KEY NONCLUSTERED 
(
	[DivisionID] ASC,
	[TimeRecorderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
---- Add Columns
If Exists (Select * From sysobjects Where name = 'HT0254' and xtype ='U') 
Begin
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'HT0254'  and col.name = 'MachineNumber')
           Alter Table  HT0254 Add MachineNumber [int] NULL
           If not exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'HT0254'  and col.name = 'PassWord')
           Alter Table  HT0254 Add PassWord [int] NULL

			---Modified by Văn Tài on 23/08/2022
		   If exists (select * from syscolumns col inner join sysobjects tab 
           On col.id = tab.id where tab.name =   'HT0254'  and col.name = 'PassWord')
           ALTER TABLE HT0254 ALTER COLUMN PassWord VARCHAR(50);
End 


---Modified by Bảo Thy on 14/09/2016

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'HT0254' AND xtype = 'U')
    BEGIN
        IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
        ON col.id = tab.id WHERE tab.name = 'HT0254' AND col.name = 'RecordTypeID')
        ALTER TABLE HT0254 ADD RecordTypeID TINYINT NULL
    END

DECLARE @CustomerIndex INT 
SELECT @CustomerIndex = CustomerName FROM dbo.CustomerIndex 
----- Modify by Huỳnh Thử on 14/08/2020: Merge Code: MEKIO và MTE
--IF(@CustomerIndex= 50 OR @CustomerIndex= 115)
	IF EXISTS (select TOP 1 1 FROM sysobjects WHERE [name] = 'HT0254' AND xtype = 'U' )
	BEGIN
			If not exists (select * from syscolumns col inner join sysobjects tab 
			On col.id = tab.id where tab.name =   'HT0254'  and col.name = 'LenghtAbsentNo')
			Alter Table  HT0254 Add LenghtAbsentNo [int] NULL

			-- Mã thiết bị cho máy HANET.
			----- Created by Văn Tài on 17/03/2022: Merge Code: MEKIO và MTE
			If not exists (select * from syscolumns col inner join sysobjects tab 
			On col.id = tab.id where tab.name =   'HT0254'  and col.name = 'DeviceID')
			Alter Table  HT0254 Add DeviceID VARCHAR(50) NULL
			
			-- Mã place của máy HANET.
			----- Created by Văn Tài on 17/03/2022: Merge Code: MEKIO và MTE
			If not exists (select * from syscolumns col inner join sysobjects tab 
			On col.id = tab.id where tab.name =   'HT0254'  and col.name = 'PlaceID')
			Alter Table  HT0254 Add PlaceID VARCHAR(50) NULL

			-- Mã thiết bị cho máy HANET.
			If not exists (select * from syscolumns col inner join sysobjects tab 
			On col.id = tab.id where tab.name =   'HT0254'  and col.name = 'AccessToken')
			Alter Table  HT0254 Add AccessToken VARCHAR(1000) NULL
	END 