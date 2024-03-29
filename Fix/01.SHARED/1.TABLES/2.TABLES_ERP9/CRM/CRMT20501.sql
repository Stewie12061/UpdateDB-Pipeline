---- Create by Phan thanh hoàng vũ on 3/1/2017 3:43:18 PM
---- Danh mục cơ hội

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CRMT20501]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[CRMT20501]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [OpportunityID] VARCHAR(50) NOT NULL,
  [OpportunityName] NVARCHAR(250) NOT NULL,
  [StageID] VARCHAR(50) NULL,
  [CampaignID] VARCHAR(50) NULL,
  [AccountID] VARCHAR(50) NULL,
  [ExpectAmount] DECIMAL(28,8) NULL,
  [PriorityID] INT DEFAULT 1 NULL,
  [CauseID] VARCHAR(50) NULL,
  [Notes] NVARCHAR(250) NULL,
  [AssignedToUserID] VARCHAR(50) NULL,
  [SourceID] VARCHAR(50) NULL,
  [StartDate] DATETIME NULL,
  [ExpectedCloseDate] DATETIME NULL,
  [Rate] DECIMAL(28,8) NULL,
  [NextActionID] VARCHAR(50) NULL,
  [NextActionDate] DATETIME NULL,
  [IsAddCalendar] TINYINT DEFAULT (0) NULL,
  [EventSubject] NVARCHAR(250) NULL,
  [Disabled] TINYINT DEFAULT (0) NULL,
  [IsCommon] TINYINT DEFAULT (0) NULL,
  [RelatedToTypeID] INT DEFAULT 4 NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL,
  [BusinessLinesID] VARCHAR(50) NULL
CONSTRAINT [PK_CRMT20501] PRIMARY KEY CLUSTERED
(
  [OpportunityID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END
--
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT20501' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT20501' AND col.name = 'O01ID') 
   ALTER TABLE CRMT20501 ADD O01ID NVARCHAR(50) NULL 
END

/*===============================================END O01ID===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT20501' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT20501' AND col.name = 'O02ID') 
   ALTER TABLE CRMT20501 ADD O02ID NVARCHAR(50) NULL 
END

/*===============================================END O02ID===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT20501' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT20501' AND col.name = 'O03ID') 
   ALTER TABLE CRMT20501 ADD O03ID NVARCHAR(50) NULL 
END

/*===============================================END O03ID===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT20501' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT20501' AND col.name = 'O04ID') 
   ALTER TABLE CRMT20501 ADD O04ID NVARCHAR(50) NULL 
END

/*===============================================END O04ID===============================================*/ 

IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT20501' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT20501' AND col.name = 'O05ID') 
   ALTER TABLE CRMT20501 ADD O05ID NVARCHAR(50) NULL 
END

/*===============================================END O05ID===============================================*/ 

---Modified by Hoàng Vũ, 25/05/2017 check xem cơ hội có đưa lên lịch không (trong cơ hội add lên lịch)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT20501' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT20501' AND col.name = 'IsAddCalendar') 
   ALTER TABLE CRMT20501 ADD IsAddCalendar TINYINT NULL 
END
---Modified by Hoàng Vũ, 25/05/2017 check xem nếu nội dung thay đổi sẽ add vào lịch (trong cơ hội add lên lịch)
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT20501' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT20501' AND col.name = 'EventSubject') 
   ALTER TABLE CRMT20501 ADD EventSubject NVARCHAR(250) NULL 
END
---Modified by Hoàng Vũ, 23/06/2017 Load combo vùng/khu vực
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT20501' AND xtype = 'U')
BEGIN
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
   ON col.id = tab.id WHERE tab.name = 'CRMT20501' AND col.name = 'AreaID')
   ALTER TABLE CRMT20501 ADD AreaID NVARCHAR(50) NULL
END
---Modify by Thị Phượng: Date 26/06/2017 -- Lĩnh vực kinh doanh
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT20501' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT20501' AND col.name = 'BusinessLinesID') 
   ALTER TABLE CRMT20501 ADD BusinessLinesID VARCHAR(50) NULL 
END

---Modify by Bảo Toàn: Date 16/10/2019 -- Full độ dài Notes
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT20501' AND xtype = 'U')
BEGIN 
   IF EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT20501' AND col.name = 'Notes') 
	BEGIN
		-- Xóa index
		DROP INDEX [DivisionID_AssignedToUserID] ON [dbo].[CRMT20501]

		ALTER TABLE CRMT20501 ALTER COLUMN Notes NVARCHAR(MAX) NULL 
		-- Tạo lại index
		CREATE NONCLUSTERED INDEX [DivisionID_AssignedToUserID] ON [dbo].[CRMT20501]
		(
			[DivisionID] ASC,
			[AssignedToUserID] ASC
		)
		INCLUDE([APK],[OpportunityName],[StageID],[NextActionID],[PriorityID],[Disabled],[IsCommon],[ExpectAmount],[Notes],[Rate],[CreateUserID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	END
		
END

---Modified by Kiều Nga, 11/12/2019 bổ sung trường phân loại 1
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT20501' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT20501' AND col.name = 'S1') 
   ALTER TABLE CRMT20501 ADD S1 NVARCHAR(250) NULL 
END

---Modified by Kiều Nga, 11/12/2019 bổ sung trường phân loại 2
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT20501' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT20501' AND col.name = 'S2') 
   ALTER TABLE CRMT20501 ADD S2 NVARCHAR(250) NULL 
END

---Modified by Kiều Nga, 11/12/2019 bổ sung trường phân loại 3
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT20501' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT20501' AND col.name = 'S3') 
   ALTER TABLE CRMT20501 ADD S3 NVARCHAR(250) NULL 
END

---Modified by Kiều Nga, 03/03/2020 bổ sung trường tình trạng phiếu
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT20501' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT20501' AND col.name = 'OrderStatus') 
   ALTER TABLE CRMT20501 ADD OrderStatus tinyint NOT NULL DEFAULT(0)
END

---- Modified by Kiều Nga on 04/03/2020: Bổ sung trường APKMaster_9000
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'CRMT20501' AND xtype = 'U') 
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
    ON col.id = tab.id WHERE tab.name = 'CRMT20501' AND col.name = 'APKMaster_9000')
    ALTER TABLE CRMT20501 ADD APKMaster_9000 UNIQUEIDENTIFIER NULL
END

---- Modified by Kiều Nga on 04/03/2020: Bổ sung trường Status
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'CRMT20501' AND xtype = 'U') 
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
    ON col.id = tab.id WHERE tab.name = 'CRMT20501' AND col.name = 'Status')
    ALTER TABLE CRMT20501 ADD [Status] tinyint NOT NULL DEFAULT ((0))
END

---- Modified by Kiều Nga on 04/03/2020: Bổ sung trường AppoveLevel
IF EXISTS (SELECT * FROM sysobjects WHERE name = 'CRMT20501' AND xtype = 'U') 
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
    ON col.id = tab.id WHERE tab.name = 'CRMT20501' AND col.name = 'ApproveLevel')
    ALTER TABLE CRMT20501 ADD [ApproveLevel] tinyint NOT NULL DEFAULT ((0))
END

---Modified by Kiều Nga, 26/03/2020 Bổ sung trường TaskID
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT20501' AND xtype = 'U')
BEGIN
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
   ON col.id = tab.id WHERE tab.name = 'CRMT20501' AND col.name = 'TaskID')
   ALTER TABLE CRMT20501 ADD TaskID NVARCHAR(50) NULL
END

---Modify on 31/12/2021 by Anh Tuấn: Bổ sung cột DeleteFlg
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'CRMT20501' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab 
   ON col.id = tab.id WHERE tab.name = 'CRMT20501' AND col.name = 'DeleteFlg') 
   ALTER TABLE CRMT20501 ADD DeleteFlg TINYINT DEFAULT (0) NULL 
END