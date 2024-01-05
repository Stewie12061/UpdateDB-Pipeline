﻿---- Create by Nguyễn Thành Sang on 25/04/2022 11:01:51 AM

IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[HT2503]') AND TYPE IN (N'U'))
BEGIN
CREATE TABLE [dbo].[HT2503](
	[APK] [uniqueidentifier] NOT NULL,
	[DivisionID] [varchar](50) NOT NULL,
	[TranDay] [int] NULL,
	[TranMonth] [int] NULL,
	[TranYear] [int] NULL,
	[Date] [datetime] NULL,
	[FarmID] [varchar](50) NOT NULL,
	[TotalQuantity] [int]NOT NULL,
	[TotalConvertedAmount] [decimal](28, 5)NOT NULL,
	[TotalWeight] [decimal](28, 5)NOT NULL,
	[TotalProductionQuantity] [decimal](28, 5)NOT NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
 CONSTRAINT [PK_HT2503] PRIMARY KEY NONCLUSTERED 
(
	[APK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END


