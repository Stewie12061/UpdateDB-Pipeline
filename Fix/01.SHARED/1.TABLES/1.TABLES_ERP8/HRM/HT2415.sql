-- <Summary>
---- Bảng tạm lưu tính tiền sản phẩm theo ca cho từng nhân viên
-- <History>
---- Create on 090/09/2013 by Le Thi Thu Hien 
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT2415]') AND type in (N'U')) 	
BEGIN	
CREATE TABLE [dbo].[HT2415](
	[APK] [uniqueidentifier] DEFAULT NEWID(),
	[DivisionID] [nvarchar](50) NOT NULL,
	[TranMonth] [int] NOT NULL,
	[TranYear] [int] NOT NULL,
	[PayrollMethodID] [nvarchar](50) NOT NULL,
	[DepartmentID] [nvarchar](50) NULL,
	[Team] [nvarchar](50) NULL,
	[TeamID] [nvarchar](50) NULL,
	[EmployeeID] [nvarchar](50) NOT NULL,
	[AbsentDate] [datetime] NULL,
	[ShiftID][nvarchar](50) NULL,
	[AbsentHour] [decimal](28, 8) NULL,
	[AbsentDay] [decimal](28, 8) NULL,
	[Coefficient] [decimal](28, 8) NULL,
	[PersonAmount] [decimal](28, 8) NULL,
	[TeamQuantity] [decimal](28, 8) NULL,
	[UnitPrice] [decimal](28, 8) NULL,
	[TeamAmount] [decimal](28, 8) NULL,
 CONSTRAINT [PK_HT2415] PRIMARY KEY CLUSTERED 
(
	[DivisionID] ASC ,
	[TranMonth] ASC,
	[TranYear] ASC,
	[APK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END