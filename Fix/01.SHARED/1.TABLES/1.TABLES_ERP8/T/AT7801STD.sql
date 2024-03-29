-- <Summary>
---- 
-- <History>
---- Create on 11/10/2010 by Thanh Trẫm
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT7801STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT7801STD](
	[AllocationID] [nvarchar](50) NOT NULL,
	[AllocationDesc] [nvarchar](250) NOT NULL,
	[EmployeeID] [nvarchar](50) NULL,
	[Disabled] [tinyint] NOT NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL
) ON [PRIMARY]
END
