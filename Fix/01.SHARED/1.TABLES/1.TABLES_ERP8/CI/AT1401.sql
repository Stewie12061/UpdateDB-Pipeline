-- <Summary>
---- 
-- <History>
---- Create on 13/12/2010 by Thanh Trẫm
---- Modified on 10/07/2019	by Kim Thư: Sửa khóa chính bản 837 không chia dữ liệu dùng chung theo DivisionID. Bổ sung cột IsCommon (Dùng Chung)
---- Modified on 20/08/2020 by Tấn Thành: Bổ sung cột RoleDefaultID
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT1401]') AND type in (N'U'))
CREATE TABLE [dbo].[AT1401](
	[APK] [uniqueidentifier] DEFAULT NEWID(),
	[DivisionID] [nvarchar](50) NOT NULL,
	[GroupID] [nvarchar](50) NOT NULL,
	[GroupName] [nvarchar](250) NULL,
	[Disabled] [tinyint] NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
 CONSTRAINT [PK_AT1401] PRIMARY KEY NONCLUSTERED 
(
	[GroupID] ASC,
	[DivisionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
---- Add giá trị default
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_AT1401_Disabled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AT1401] ADD  CONSTRAINT [DF_AT1401_Disabled]  DEFAULT ((0)) FOR [Disabled]
END

--Dùng để quản lý phân quyền xem dữ liệu (Khi thêm nhóm người dùng thì kiểm tra có check quyền mặc định bên Role (Bảng ST10501), thì add giá trị mặc định
--Ngược lại thì add giá trị NULL)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'AT1401' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'AT1401' AND col.name = 'RoleID') 
   ALTER TABLE AT1401 ADD RoleID VARCHAR(50) NULL 
END

-- thêm cột IsCommon
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'AT1401' AND xtype = 'U')
BEGIN
    IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
    ON col.id = tab.id WHERE tab.name = 'AT1401' AND col.name = 'IsCommon')
    ALTER TABLE AT1401 ADD IsCommon TINYINT DEFAULT 0
END

----Alter Pimary key 
--IF EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_TYPE = 'PRIMARY KEY' AND TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AT1401')
--Begin
--	--Thay đối khóa chính từ 2 khóa sang 1 khóa (bỏ DivisionID)
--	ALTER TABLE AT1401 DROP CONSTRAINT [PK_AT1401]
--	ALTER TABLE AT1401 ADD CONSTRAINT [PK_AT1401] PRIMARY KEY (GroupID)
--End

-- 20/08/2020 - Modified by Tấn Thành - Bổ sung cột RoleDefaultID
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'AT1401' AND xtype = 'U')
BEGIN
    IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
    ON col.id = tab.id WHERE tab.name = 'AT1401' AND col.name = 'RoleDefaultID')
    ALTER TABLE AT1401 ADD RoleDefaultID VARCHAR(50)
END