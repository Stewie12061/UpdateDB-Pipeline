-- <Summary>
---- 
-- <History>
---- Create on 13/12/2010 by Thanh Trẫm
---- Modified on 10/07/2019	by Kim Thư: Sửa khóa chính bản 837 không chia dữ liệu dùng chung theo DivisionID. Bổ sung cột IsCommon (Dùng Chung)
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT1402]') AND type in (N'U'))
CREATE TABLE [dbo].[AT1402](
	[APK] [uniqueidentifier] DEFAULT NEWID(),
	[DivisionID] [nvarchar](50) NOT NULL,
	[GroupID] [nvarchar](50) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_AT1402] PRIMARY KEY NONCLUSTERED 
(
	[GroupID] ASC,
	[UserID] ASC,
	[DivisionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

--Dùng để quản lý phân quyền xem dữ liệu (Khi thêm người dùng vào nhóm người dùng thì kiểm tra có check quyền mặc định bên Role (Bảng ST10501), thì add giá trị mặc định
--Ngược lại thì add giá trị NULL)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'AT1402' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'AT1402' AND col.name = 'UserJoinRoleID') 
   ALTER TABLE AT1402 ADD UserJoinRoleID VARCHAR(50) NULL 
END

-- thêm cột IsCommon
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'AT1402' AND xtype = 'U')
BEGIN
    IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
    ON col.id = tab.id WHERE tab.name = 'AT1402' AND col.name = 'IsCommon')
    ALTER TABLE AT1402 ADD IsCommon TINYINT DEFAULT 0
END

----Alter Pimary key 
--IF EXISTS (SELECT TOP 1 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_TYPE = 'PRIMARY KEY' AND TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AT1402')
--Begin
--	--Thay đối khóa chính từ 3 khóa sang 2 khóa (bỏ DivisionID)
--	ALTER TABLE AT1402 DROP CONSTRAINT [PK_AT1402]
--	ALTER TABLE AT1402 ADD CONSTRAINT [PK_AT1402] PRIMARY KEY (GroupID, UserID)
--End

