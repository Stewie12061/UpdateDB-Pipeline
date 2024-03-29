--Created by: MaiVu, Date: 14/06/2014
--Lưu thông tin báo cáo
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[POST8888]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[POST8888]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR (50) NULL,
      [ReportID] VARCHAR (50) NOT NULL,
      [ReportName] NVARCHAR (250) NULL,
      [ReportNameE] NVARCHAR (250) NULL,
      [Title] NVARCHAR (250) NULL,
      [TitleE] NVARCHAR (250) NULL,
      [GroupID] VARCHAR (50) NOT NULL,
      [Type] VARCHAR (50) NOT NULL,
      [SQLstring] NVARCHAR (1000) NULL,
      [Orderby] NVARCHAR (1000) NULL,
      [Description] NVARCHAR (1000) NULL,
      [DescriptionE] NVARCHAR (1000) NULL,
      [Disabled] TINYINT DEFAULT (0) NOT NULL,
      [IsCommon] TINYINT DEFAULT (0) NOT NULL,
      [IsDelete] TINYINT DEFAULT (0) NOT NULL
    CONSTRAINT [PK_POST8888] PRIMARY KEY CLUSTERED
      (
      [ReportID]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END