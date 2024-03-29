﻿---- Create by Nguyễn Thị Minh Hòa on 21/10/2018 2:29:31 PM
---- Nghiệp vụ xếp lớp
---- Select * from EDMT2020


IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[EDMT2020]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE  [dbo].[EDMT2020]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NOT NULL,
  [ArrangeClassID] VARCHAR(50) NOT NULL,
  [SchoolYearID] VARCHAR(50) NOT NULL,
  [GradeID] VARCHAR(50) NOT NULL,
  [ClassID] VARCHAR(50) NOT NULL,
  [ApproverID1] VARCHAR(50)  NULL,
  [ApproverID2] VARCHAR(50)  NULL,
  [ApproverID3] VARCHAR(50)  NULL,
  [ApproverID4] VARCHAR(50)  NULL,
  [ApproverID5] VARCHAR(50)  NULL,
  [DeleteFlg] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_EDMT2020] PRIMARY KEY CLUSTERED
(
  [APK],
  [DivisionID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END



