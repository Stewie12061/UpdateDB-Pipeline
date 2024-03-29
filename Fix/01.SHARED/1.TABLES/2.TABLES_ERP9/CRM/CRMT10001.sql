---- Create by Phan Thanh Hoàng Vũ on 09/11/2015 3:00:26 PM
---- Danh mục liên hệ

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CRMT10001]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[CRMT10001]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR(50) NOT NULL,
      [ContactID] VARCHAR(50) NOT NULL,
      [Prefix] NVARCHAR(100) NULL,
      [LastName] NVARCHAR(100) NULL,
      [FirstName] NVARCHAR(100) NULL,
      [ContactName] NVARCHAR(250) NOT NULL,
      [Address] NVARCHAR(250) NULL,
      [HomeAddress] NVARCHAR(250) NULL,
      [HomeMobile] NVARCHAR(100) NULL,
      [HomeEmail] NVARCHAR(100) NULL,
      [HomeTel] NVARCHAR(100) NULL,
      [Messenger] NVARCHAR(100) NULL,
      [IsAccountID] BIT DEFAULT 0 NOT NULL,
      [BusinessEmail] NVARCHAR(100) NULL,
      [BusinessTel] NVARCHAR(100) NULL,
      [BusinessFax] NVARCHAR(100) NULL,
      [Title] NVARCHAR(250) NULL,
      [DepartmentName] NVARCHAR(250) NULL,
      [Description] NVARCHAR(250) NULL,
      [IsCommon] BIT DEFAULT 0 NOT NULL,
      [Disabled] TINYINT DEFAULT 0 NOT NULL,
      [HomeWardID] NVARCHAR(50) NULL,
      [HomeDistrictID] NVARCHAR(50) NULL,
      [HomeCityID] NVARCHAR(50) NULL,
      [HomePostalCodeID] NVARCHAR(50) NULL,
      [HomeCountryID] NVARCHAR(50) NULL,
      [BusinessMobile] NVARCHAR(100) NULL,
      [BusinessAddress] NVARCHAR(250) NULL,
      [BusinessWardID] NVARCHAR(50) NULL,
      [BusinessDistrictID] NVARCHAR(50) NULL,
      [BusinessCityID] NVARCHAR(50) NULL,
      [BusinessPostalCodeID] NVARCHAR(50) NULL,
      [BusinessCountryID] NVARCHAR(50) NULL,
      [BirthDate] DATETIME NULL,
      [PlaceOfBirth] NVARCHAR(250) NULL,
      [BankAccountNo] NVARCHAR(250) NULL,
      [BankName] NVARCHAR(250) NULL,
      [BankAddress] NVARCHAR(250) NULL,
      [CreateUserID] VARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] VARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL,
      [ContactCategoryID] VARCHAR(50) NULL,
      [LeadSourceID] VARCHAR(50) NULL,
      [HomeFax] NVARCHAR(100) NULL,
      [OwnerID] VARCHAR(50) NULL,
      [ConvertedDate] DATETIME NULL,
      [ConvertedFromLead] BIT DEFAULT 0 NULL,
      [OtherMobile] NVARCHAR(100) NULL,
      [OtherTel] NVARCHAR(100) NULL,
      [OtherEmail] NVARCHAR(100) NULL
    CONSTRAINT [PK_CRMT10001] PRIMARY KEY CLUSTERED
      (
      [ContactID]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END

--- Mã loại liên hệ mặt đinh
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10001' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10001' AND col.name = 'RelatedToTypeID') 
   ALTER TABLE CRMT10001 ADD RelatedToTypeID INT DEFAULT 2 NULL
END

--------------------------- Modified by Trọng Kiên on 12/08/2020: Xóa Constraints cột IsCommon -------------------------------------

DECLARE @defaultconstraint sysname
DECLARE @DropStmt NVARCHAR(500)
DECLARE @TableCur CURSOR

SET @TableCur = CURSOR SCROLL KEYSET FOR
SELECT NAME 
FROM sys.default_constraints 
WHERE parent_object_id = object_ID('CRMT10001') 
AND ( NAME Like '%DF__CRMT10001__IsCom%')

OPEN @TableCur
FETCH NEXT FROM @TableCur INTO @defaultconstraint
WHILE @@FETCH_STATUS = 0
BEGIN	
	SET @DropStmt = 'ALTER TABLE CRMT10001 DROP CONSTRAINT ' + @defaultconstraint
	EXEC (@DropStmt)
	FETCH NEXT FROM @TableCur INTO @defaultconstraint
END	
CLOSE @TableCur

--- Modified by Trọng Kiên on 10/08/2020: Thay đổi kiểu dữ liệu cột IsCommon
IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT10001' AND col.name = 'IsCommon')
BEGIN
	ALTER TABLE CRMT10001 ALTER COLUMN IsCommon TINYINT NULL
END

--- 05/03/2021 - Tấn Thành: Thay đổi tên cột Title => TitleContact
IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	   ON col.id = tab.id WHERE tab.name = 'CRMT10001' AND col.name = 'Title')
BEGIN
	EXEC sp_RENAME 'CRMT10001.Title', 'TitleContact', 'COLUMN'
END

---Modify on 31/12/2021 by Anh Tuấn: Bổ sung cột DeleteFlg
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT10001' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT10001' AND col.name = 'DeleteFlg') 
   ALTER TABLE CRMT10001 ADD DeleteFlg TINYINT DEFAULT (0) NULL 
END