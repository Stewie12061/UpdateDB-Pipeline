-- <Summary>
---- Phân bổ chi phí mua hàng - Master [LAVO]
-- <History>
---- Create by Trương Ngọc Phương Thảo on 5/30/2017 1:53:21 PM
---- Bảng thiết lập công nghỉ không hưởng lương (Meiko)
---- Modified on 14/08/2020 by Huỳnh Thử: Merge Code: MEKIO và MTE
---- Modified on ... by 
-- <Example>
IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[HT0019]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[HT0019]
(
  [DivisionID] NVARCHAR(50) NOT NULL,
  [AbsentTypeID] NVARCHAR(50) NOT NULL,
  [Priority] INT NOT NULL
CONSTRAINT [PK_HT0019] PRIMARY KEY CLUSTERED
(
  [DivisionID],
  [AbsentTypeID]
)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY]
END