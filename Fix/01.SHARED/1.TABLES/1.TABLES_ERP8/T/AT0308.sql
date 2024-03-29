-- <Summary>
---- bảng lưu dữ liệu tờ khai thuế GTGT
-- <History>
---- Create on 19/08/2015 by Mai Trí Thiện
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[AT0308]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[AT0308]
     (
     	[TaxReturnID] NVARCHAR(50) NOT NULL,
     	[OrderNo] INT NOT NULL DEFAULT(0),
		[OrderText] NVARCHAR(10) NULL,
		[TargetName] NVARCHAR(500) NULL, 
		[IsPicking] BIT NOT NULL DEFAULT (0), -- Có phát sinh trong kỳ hay không
		[NetTargetID] NVARCHAR(50) NULL, -- Mã chỉ tiêu Giá trị HHDV
		[TaxTargetID] NVARCHAR(50) NULL, -- Mã chỉ tiêu Thuế GTGT
		[SignNetAmount] DECIMAL(28, 8) NULL, -- Số tiền giá trị HHDV
		[SignTaxAmount] DECIMAL(28, 8) NULL, -- Số tiền thuế GTGT
		[NetReadOnly] BIT NOT NULL DEFAULT(0), -- Không cho sửa giá tị HHDV
		[TaxReadOnly] BIT NOT NULL DEFAULT(0), -- Không cho sửa thuế GTGT
		[Bold] BIT NOT NULL DEFAULT(0),	-- In đậm dòng
		[LineStyled] BIT NOT NULL DEFAULT(0), -- Hiển thị màu nổi bật
		[NetFormulaString] NVARCHAR(50) NULL, -- Công thức tính giá trị HHDV
		[TaxFormulaString] NVARCHAR(50) NULL, -- Công thức tính thuế GTGT
		[NetSuppressZeroIf] NVARCHAR(50) NULL -- Hiển thị giá trị HHDV nếu thỏa điều kiện, 0 nếu không thỏa điều kiện
	CONSTRAINT [PK_AT0308] PRIMARY KEY CLUSTERED
      (
      	[TaxReturnID],
      	[OrderNo]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	)
	ON [PRIMARY]
END