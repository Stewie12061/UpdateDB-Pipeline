---- Create by Phan thanh hoàng vũ on 24/07/2016 4:59:56 AM
---- Customize Secoin
---- Bảng kết quả kinh doanh lưu tam

Declare @CustomerName INT
CREATE Table #CustomerName (CustomerName INT, ImportExcel int)
INSERT #CustomerName EXEC AP4444
SET @CustomerName = (SELECT TOP 1 CustomerName FROM #CustomerName)

IF @CustomerName IN (43, 161) --Secoin, INNOTEK
Begin
		IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT7604_SC]') AND TYPE IN (N'U'))
		BEGIN
			CREATE TABLE [dbo].[AT7604_SC](
				[APK] [uniqueidentifier]  DEFAULT NEWID() NOT NULL,
				[DivisionID] [nvarchar](50) NOT NULL,
				[LineCode] [nvarchar](50) NOT NULL,
				[IsDate] [int] NOT NULL,
				[PeriodID] [varchar](50) NOT NULL,
				[LineDescription] [nvarchar](250) NULL,
				[PrintCode] [nvarchar](50) NULL,
				[Amount1] [decimal](28, 8) NULL,
				[Amount2] [decimal](28, 8) NULL,
				[Amount3] [decimal](28, 8) NULL,
				[AccuSign] [nvarchar](5) NULL,
				[Accumulator] [nvarchar](100) NULL,
				[Level1] [tinyint] NULL,
				[PrintStatus] [tinyint] NULL,
				[LineDescriptionE] [nvarchar](250) NULL,
				[Notes] [nvarchar](250) NULL,
				[DisplayedMark] [tinyint] NULL,
			 CONSTRAINT [PK_AT7604_SC] PRIMARY KEY CLUSTERED 
			(
				[DivisionID] ASC,
				[LineCode] ASC,
				[IsDate] ASC,
				[PeriodID] ASC
			)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
			) ON [PRIMARY]

		END
End
Drop table #CustomerName