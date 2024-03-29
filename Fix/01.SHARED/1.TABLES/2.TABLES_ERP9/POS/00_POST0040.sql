-- <Summary>
---- Lưu thông tin kết ca theo cửa hàng, nhân viên (Customize Index 32 - PHUCLONG)
-- <History>
---- Create on 31/07/2014 by Lê Thị Hạnh 
---- Modified by ... 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'POST0040') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE POST0040 
     (
		APK uniqueidentifier default NEWID() NOT NULL,
		[DivisionID]  varchar (50) NOT NULL,
		[ShopID]  varchar (50) NOT NULL,
		[TranMonth] INT NOT NULL,
        [TranYear] INT NOT NULL,
		[CurEmployeeID]  varchar (50) NOT NULL,
		[NextEmployeeID]  varchar (50) NOT NULL,
		[CurEndShift] DATETIME NOT NULL,
		[Description] NVARCHAR(250),
		[DeleteFlag] TINYINT DEFAULT (0) NOT NULL,
		[CreateUserID] VARCHAR(50) NULL,
		[CreateDate] DATETIME NULL,
		[LastModifyUserID] VARCHAR(50) NULL,
		[LastModifyDate] DATETIME NULL,
	    CONSTRAINT  PK_POST0040  PRIMARY KEY CLUSTERED 
		 (
			APK ASC
		 )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
	) ON [PRIMARY]
END