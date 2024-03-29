-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT7434STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT7434STD](
	[LineID] [nvarchar](50) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[ReportCodeID] [nvarchar](50) NULL,
	[OrderNo] [nvarchar](50) NULL,
	[Orders] [int] NULL,
	[IsNotPrint] [tinyint] NOT NULL,
	[LineDescription] [nvarchar](250) NULL,
	[IsBold] [tinyint] NOT NULL,
	[IsGray] [tinyint] NOT NULL,
	[IsAmount] [tinyint] NOT NULL,
	[Method] [int] NULL,
	[AmountCode] [nvarchar](50) NULL,
	[CalculatorID] [nvarchar](50) NULL,
	[VATGroup] [nvarchar](50) NULL,
	[VATTypeID1] [nvarchar](50) NULL,
	[VATTypeID2] [nvarchar](50) NULL,
	[VATTypeID3] [nvarchar](50) NULL,
	[AccumulatorID] [nvarchar](50) NULL,
	[FromAccountID1] [nvarchar](50) NULL,
	[ToAccountID1] [nvarchar](50) NULL,
	[FromCorAccountID1] [nvarchar](50) NULL,
	[ToCorAccountID1] [nvarchar](50) NULL,
	[FromAccountID2] [nvarchar](50) NULL,
	[ToAccountID2] [nvarchar](50) NULL,
	[FromCorAccountID2] [nvarchar](50) NULL,
	[ToCorAccountID2] [nvarchar](50) NULL,
	[FromAccountID3] [nvarchar](50) NULL,
	[ToAccountID3] [nvarchar](50) NULL,
	[FromCorAccountID3] [nvarchar](50) NULL,
	[ToCorAccountID3] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[Sign] [nvarchar](5) NULL
) ON [PRIMARY]
END