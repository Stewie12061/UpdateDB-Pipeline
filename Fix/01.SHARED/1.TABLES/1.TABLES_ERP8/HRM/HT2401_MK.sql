-- <Summary>
---- 
-- <History>
---- Create on 21/12/2015 by Bảo Anh: Tạo bảng trung gian lưu chấm công từ Approve Online
---- Modified on ... by ...
---- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT2401_MK]') AND type in (N'U'))
CREATE TABLE [dbo].[HT2401_MK](
	[APK] [uniqueidentifier] DEFAULT NEWID(),
	[DivisionID] nvarchar(3) NOT NULL,
	[AbsentDate] [datetime] NOT NULL,
	[EmployeeID] [nvarchar](50) NOT NULL,
	[TranMonth] [int] NOT NULL,
	[TranYear] [int] NOT NULL,
	[DepartmentID] [nvarchar](50) NOT NULL,
	[TeamID] [nvarchar](50) NULL,
	[AbsentTypeID] [nvarchar](50) NOT NULL,
	[AbsentAmount] [decimal](28, 8) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	CONSTRAINT [PK_HT2401_MK] PRIMARY KEY NONCLUSTERED 
(
	[APK] ASC
    )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

--Thêm cột APKMaster để link với bảng đơn xin phép khi bỏ duyệt thì tự động xóa
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='HT2401_MK' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col
				   INNER JOIN sysobjects obj ON obj.id = col.id 
	               WHERE col.name='APKMaster' AND obj.name='HT2401_MK')
	               ALTER TABLE HT2401_MK  ADD APKMaster VARCHAR(50) NULL 
END

---Modified by Bảo Thy on 26/05/2017: Bổ sung lưu thời gian xin phép để xử lý trường hợp xin phép 2 lần trong cùng một ngày
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE NAME='HT2401_MK' AND xtype='U')
BEGIN

	IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects obj ON obj.id = col.id WHERE col.name='FromDate' AND obj.name='HT2401_MK')
	ALTER TABLE HT2401_MK ADD FromDate DATETIME NULL 

	IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects obj ON obj.id = col.id WHERE col.name='ToDate' AND obj.name='HT2401_MK')
	ALTER TABLE HT2401_MK ADD ToDate DATETIME NULL 

END
