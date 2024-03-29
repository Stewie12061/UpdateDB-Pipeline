---- Create by Phan thanh hoàng vũ on 2/19/2019 2:57:08 PM
---- Danh sách nghỉ phép (Master) => BLUESKY

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[APT0008]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[APT0008]
(
  [APK] UNIQUEIDENTIFIER DEFAULT newid() NOT NULL,
  [DivisionID] VARCHAR(50) NULL,
  [SchoolYearID] VARCHAR(50) NULL,
  [ArrangeClassID] VARCHAR(50) NULL,
  [GradeID] VARCHAR(50) NULL,
  [ClassID] VARCHAR(50) NULL,
  [StudentID] VARCHAR(50) NULL,
  [VoucherDate] DATETIME NULL,
  [FromDate] DATETIME NULL,
  [ToDate] DATETIME NULL,
  [ReasonNotes] NVARCHAR(250) NULL,
  [DeleteFlg] TINYINT DEFAULT (0) NULL,
  [CreateUserID] VARCHAR(50) NULL,
  [CreateDate] DATETIME NULL,
  [LastModifyUserID] VARCHAR(50) NULL,
  [LastModifyDate] DATETIME NULL
CONSTRAINT [PK_APT0008] PRIMARY KEY CLUSTERED
(
  [APK]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

------Modified by Thành Luân on 28/09/2019: Bổ sung cột mã học sinh, xưng hô, phân loại cho đối tượng và học sinh để sinh tự đông 
IF EXISTS (SELECT TOP 1 1 FROM sysobjects WHERE [name] = 'APT0008' AND xtype = 'U')
BEGIN 
   IF NOT EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects tab
   ON col.id = tab.id WHERE tab.name = 'APT0008' AND col.name = 'Notes') 
   ALTER TABLE [dbo].[APT0008] ADD Notes NVARCHAR(MAX) NULL
END


------ Created by Thành Luân on 30/11/2019. Kiểm tra và drop constraint
IF EXISTS(SELECT * FROM INFORMATION_SCHEMA.CHECK_CONSTRAINTS WHERE CONSTRAINT_NAME='CHK_APT0008_STUDENT_DATE_RANGE')
BEGIN
	ALTER TABLE [dbo].[APT0008] DROP CONSTRAINT CHK_APT0008_STUDENT_DATE_RANGE
END;

-- Function sử dụng riêng cho check constraint kiểm tra insert trùng FromDate, ToDate trong bảng cho học sinh
IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[dbo].[APT0008_FUNCTION_CHECK_STUDENT_DATE_RANGE]') AND XTYPE IN (N'FN', N'IF', N'TF'))
DROP FUNCTION [DBO].[APT0008_FUNCTION_CHECK_STUDENT_DATE_RANGE]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[APT0008_FUNCTION_CHECK_STUDENT_DATE_RANGE]
(
	@APK UNIQUEIDENTIFIER,
	@StudentID VARCHAR(50),
	@FromDate DATETIME,
	@ToDate DATETIME
)
RETURNS BIT
AS
BEGIN
	RETURN (SELECT CAST(CASE
							WHEN EXISTS(SELECT * FROM [dbo].[APT0008] AS A08 WITH(NOLOCK)
										WHERE A08.APK <> @APK
											AND A08.StudentID = @StudentID
											AND (A08.FromDate <= @ToDate AND A08.ToDate >= @FromDate)
											AND (A08.DeleteFlg = 0 OR A08.DeleteFlg IS NULL)) THEN 1
							ELSE 0
						END AS BIT))
END
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

-- Check constraint kiểm tra insert trùng FromDate, ToDate trong bảng cho học sinh
ALTER TABLE [dbo].[APT0008] WITH NOCHECK ADD CONSTRAINT CHK_APT0008_STUDENT_DATE_RANGE
							CHECK([dbo].[APT0008_FUNCTION_CHECK_STUDENT_DATE_RANGE](APK, StudentID, FromDate, ToDate) = 0)

-- Index cho column StudentID
IF(EXISTS(
	SELECT *
	FROM sys.indexes
	WHERE name='IDX_APT0008_StudentID' AND object_id = OBJECT_ID('[dbo].[APT0008]')
))
BEGIN
	DROP INDEX [IDX_APT0008_StudentID] ON dbo.[APT0008];
END

CREATE NONCLUSTERED INDEX [IDX_APT0008_StudentID] ON [dbo].[APT0008]([StudentID])

------ End