-- <Summary>
---- Bảng giá nguyên vật liệu và bao bì - Master
-- <History>
---- Create on 12/01/2015 by Lê Thị Hạnh 
---- Modified on ... by 
-- <Example>

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[MT0117]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[MT0117]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] NVARCHAR(50) NOT NULL,
      [ID] NVARCHAR(50) NOT NULL,
      [Description] NVARCHAR(250) NULL,
      [CurrencyID] NVARCHAR(50) NULL,
      [FromDate] DATETIME NULL,
      [ToDate] DATETIME NULL,
      [BInventoryTypeID] NVARCHAR(50) NULL,
      [AInventoryTypeID] NVARCHAR(50) NULL,
      [PInventoryTypeID] NVARCHAR(50) NULL,
      [IsVND] TINYINT NULL, -- Chỉ dùng cho bao bì, =1: Tính giá VNĐ, =2: Tính giá theo loại tiền
      [Disabled] TINYINT NULL,
      [CreateUserID] NVARCHAR(50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] NVARCHAR(50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_MT0117] PRIMARY KEY CLUSTERED
      ( 
      [DivisionID] ASC,
      [ID] ASC
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END