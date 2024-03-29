---- Create by Phan thanh hoàng vũ on 4/3/2017 3:06:37 PM
---- Chi tiết dữ liệu code master (tạo Email template)

IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[CRMT0098]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[CRMT0098]
(
  [CodeMaster] VARCHAR(50) NOT NULL,
  [ID] VARCHAR(50) NOT NULL,
  [TableID] VARCHAR(50) NULL,
  [ScreenID] VARCHAR(50) NULL,
  [Note] NVARCHAR(250) NULL
CONSTRAINT [PK_CRMT0098] PRIMARY KEY CLUSTERED
(
  [CodeMaster],
  [ID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END

--> Xem dữ liệu code master đề load lên gửi mail