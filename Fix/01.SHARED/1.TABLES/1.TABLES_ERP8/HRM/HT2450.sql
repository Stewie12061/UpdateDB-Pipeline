-- <Summary>
---- 
-- <History>
---- Create on 20/03/2012 by Huỳnh Tấn Phú
---- Modified on ... by ...
---- <Example>
IF  NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HT2450]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HT2450](
	[APK] [uniqueidentifier] NOT NULL DEFAULT NEWID(),
	[ProduceDate] [datetime] NOT NULL,
	[ObjectID] [nvarchar](50) NOT NULL,
	[InventoryID] [nvarchar](50) NOT NULL,
	[Machine] [nvarchar](50) NOT NULL DEFAULT ('M1'),
	[FileType] [int] NULL,
	[DivisionID] [nvarchar](50) NULL,
	[PeriodID] [nvarchar](50) NULL,
	[TranMonth] [int] NULL,
	[CutNumber] [int] NULL,
	[SheetNumber] [int] NULL,
	[TranYear] [int] NULL,
	[Color] [tinyint] NULL,
	[SideNumber] [tinyint] NULL,
	[ProductNumber] [int] NULL,
	[SPR_RQuantity] [decimal](28, 8) NULL,
	[SPR_CQuantity] [decimal](28, 8) NULL,
	[SPR_LossRate] [decimal](28, 8) NULL,
	[SPR_AQuantity] [decimal](28, 8) NULL,
	[SPR_UnitPrice] [decimal](28, 8) NULL,
	[SPR_Amount] [decimal](28, 8) NULL,
	[SZN_RQuantity] [decimal](28, 8) NULL,
	[SZN_CQuantity] [decimal](28, 8) NULL,
	[SZN_LossRate] [decimal](28, 8) NULL,
	[SZN_AQuantity] [decimal](28, 8) NULL,
	[SZN_UnitPrice] [decimal](28, 8) NULL,
	[SZN_Amount] [decimal](28, 8) NULL,
	[SFA_RQuantity] [decimal](28, 8) NULL,
	[SFA_CQuantity] [decimal](28, 8) NULL,
	[SFA_LossRate] [decimal](28, 8) NULL,
	[SFA_AQuantity] [decimal](28, 8) NULL,
	[SFA_UnitPrice] [decimal](28, 8) NULL,
	[SFA_Amount] [decimal](28, 8) NULL,
	[SPL_RQuantity] [decimal](28, 8) NULL,
	[SPL_CQuantity] [decimal](28, 8) NULL,
	[SPL_LossRate] [decimal](28, 8) NULL,
	[SPL_AQuantity] [decimal](28, 8) NULL,
	[SPL_UnitPrice] [decimal](28, 8) NULL,
	[SPL_Amount] [decimal](28, 8) NULL,
	[SSH_RQuantity] [decimal](28, 8) NULL,
	[SSH_CQuantity] [decimal](28, 8) NULL,
	[SSH_LossRate] [decimal](28, 8) NULL,
	[SSH_AQuantity] [decimal](28, 8) NULL,
	[SSH_UnitPrice] [decimal](28, 8) NULL,
	[SSH_Amount] [decimal](28, 8) NULL,
	[SPA_RQuantity] [decimal](28, 8) NULL,
	[SPA_CQuantity] [decimal](28, 8) NULL,
	[SPA_LossRate] [decimal](28, 8) NULL,
	[SPA_AQuantity] [decimal](28, 8) NULL,
	[SPA_UnitPrice] [decimal](28, 8) NULL,
	[SPA_Amount] [decimal](28, 8) NULL,
	[CreateDate] [datetime] NULL,
	[LastModifyDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastmodifyUserID] [nvarchar](50) NULL,
 CONSTRAINT [PK_HT2450] PRIMARY KEY CLUSTERED 
(
	[ProduceDate] ASC,
	[ObjectID] ASC,
	[InventoryID] ASC,
	[Machine] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END