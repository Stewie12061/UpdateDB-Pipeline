-- <Summary>
---- bảng lưu dữ liệu phụ lục tờ khai thuế TNDN
-- <History>
---- Create on 14/04/2017 by Hải Long
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT7438]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[AT7438]
     (
     	[TaxReturnID] NVARCHAR(50) NOT NULL,
     	[OrderNo] INT NOT NULL DEFAULT(0),
		[OrderText] NVARCHAR(50) NULL,
		[TargetName] NVARCHAR(500) NULL, 
		[IsPicking] BIT NOT NULL DEFAULT (0), -- Có phát sinh trong kỳ hay không
		[TargetID] NVARCHAR(50) NULL, -- Mã chỉ tiêu thuế TNDN
		[SignAmount] DECIMAL(28, 8) NULL, -- Số tiền giá trị thuế TNDN
		[ReadOnly] BIT NOT NULL DEFAULT(0), -- Không cho sửa giá trị thuế TNDN
		[Bold] BIT NOT NULL DEFAULT(0),	-- In đậm dòng
		[LineStyled] BIT NOT NULL DEFAULT(0), -- Hiển thị màu nổi bật
		[FormulaString] NVARCHAR(50) NULL, -- Công thức tính giá trị thuế TNDN	
		[AccountIDFrom]	NVARCHAR(50) NULL,
		[AccountIDTo] NVARCHAR(50) NULL,
		[CorAccountIDFrom] NVARCHAR(50) NULL,
		[CorAccountIDTo] NVARCHAR(50) NULL,
		[D_C] TINYINT,
		[AmountSign] TINYINT	
	CONSTRAINT [PK_AT7438] PRIMARY KEY CLUSTERED
      (
      	[TaxReturnID],
      	[OrderNo]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	)
	ON [PRIMARY]
END
