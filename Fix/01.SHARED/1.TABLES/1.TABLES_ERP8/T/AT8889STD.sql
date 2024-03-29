-- <Summary>
---- 
-- <History>
---- Create on 06/08/2010 by Việt Khánh
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AT8889STD]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AT8889STD](
	[ModuleID] [nvarchar](50) NOT NULL,
	[FormID] [nvarchar](50) NOT NULL,
	[FormName] [nvarchar](250) NULL,
	[SystemOrderBy] [nvarchar](100) NULL,
	[UserOrderBy] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[CreateUserID] [nvarchar](50) NULL,
	[LastModifyDate] [datetime] NULL,
	[LastModifyUserID] [nvarchar](50) NULL
) ON [PRIMARY]
INSERT [dbo].[AT8889STD] ([ModuleID], [FormID], [FormName], [SystemOrderBy], [UserOrderBy], [CreateDate], [CreateUserID], [LastModifyDate], [LastModifyUserID]) VALUES (N'ASOFT-T', N'AF3077', NULL, N'Order by VoucherDate, VoucherNo, Orders', N'Order by VoucherDate, VoucherNo, Orders', GETDATE(), N'ASOFTDADMIN', GETDATE(), N'ASOFTDADMIN')
INSERT [dbo].[AT8889STD] ([ModuleID], [FormID], [FormName], [SystemOrderBy], [UserOrderBy], [CreateDate], [CreateUserID], [LastModifyDate], [LastModifyUserID]) VALUES (N'ASOFT-T', N'AF3022', NULL, N'Order by VoucherDate, VoucherTypeID,VoucherNo,Orders', N'Order by VoucherDate, VoucherTypeID,VoucherNo,Orders', GETDATE(), N'ASOFTDADMIN', GETDATE(), N'ASOFTDADMIN')
INSERT [dbo].[AT8889STD] ([ModuleID], [FormID], [FormName], [SystemOrderBy], [UserOrderBy], [CreateDate], [CreateUserID], [LastModifyDate], [LastModifyUserID]) VALUES (N'ASOFT-T', N'AF3044', NULL, N'Order by VoucherDate, VoucherTypeID,VoucherNo,Orders', N'Order by VoucherDate, VoucherTypeID,VoucherNo,Orders', GETDATE(), N'ASOFTDADMIN', GETDATE(), N'ASOFTDADMIN')
INSERT [dbo].[AT8889STD] ([ModuleID], [FormID], [FormName], [SystemOrderBy], [UserOrderBy], [CreateDate], [CreateUserID], [LastModifyDate], [LastModifyUserID]) VALUES (N'ASOFT-T', N'AF3033', NULL, N'Order by VoucherDate, VoucherTypeID,VoucherNo', N'Order by AV3033.VoucherDate, AV3033.VoucherTypeID, AV3033.VoucherNo', GETDATE(), N'ASOFTDADMIN', GETDATE(), N'ASOFTDADMIN')
INSERT [dbo].[AT8889STD] ([ModuleID], [FormID], [FormName], [SystemOrderBy], [UserOrderBy], [CreateDate], [CreateUserID], [LastModifyDate], [LastModifyUserID]) VALUES (N'ASOFT-T', N'AF3066', NULL, N'Order by VoucherTypeID,VoucherDate, VoucherNo', N'Order by AV3066.VoucherTypeID, AV3066.VoucherDate, AV3066.VoucherNo', GETDATE(), N'ASOFTDADMIN', GETDATE(), N'ASOFTDADMIN')
INSERT [dbo].[AT8889STD] ([ModuleID], [FormID], [FormName], [SystemOrderBy], [UserOrderBy], [CreateDate], [CreateUserID], [LastModifyDate], [LastModifyUserID]) VALUES (N'ASOFT-T', N'AF6066', NULL, N'Order by VoucherTypeID,VoucherDate, VoucherNo ', N'Order by VoucherTypeID,VoucherDate, VoucherNo ', GETDATE(), N'ASOFTDADMIN', GETDATE(), N'ASOFTDADMIN')
INSERT [dbo].[AT8889STD] ([ModuleID], [FormID], [FormName], [SystemOrderBy], [UserOrderBy], [CreateDate], [CreateUserID], [LastModifyDate], [LastModifyUserID]) VALUES (N'ASOFT-T', N'AF3099', NULL, N'Order by VoucherDate, VoucherTypeID,VoucherNo', N'Order by VoucherDate, VoucherTypeID,VoucherNo', GETDATE(), N'ASOFTDADMIN', GETDATE(), N'ASOFTDADMIN')
INSERT [dbo].[AT8889STD] ([ModuleID], [FormID], [FormName], [SystemOrderBy], [UserOrderBy], [CreateDate], [CreateUserID], [LastModifyDate], [LastModifyUserID]) VALUES (N'ASOFT-T', N'AF0415', NULL, N'Order by  VoucherTypeID,VoucherNo,VoucherDate,CurrencyID,DebitAccountID, CreditAccountID', N'Order by  VoucherTypeID,VoucherNo,VoucherDate,CurrencyID,DebitAccountID, CreditAccountID', GETDATE(), N'ASOFTDADMIN', GETDATE(), N'ASOFTDADMIN')
INSERT [dbo].[AT8889STD] ([ModuleID], [FormID], [FormName], [SystemOrderBy], [UserOrderBy], [CreateDate], [CreateUserID], [LastModifyDate], [LastModifyUserID]) VALUES (N'ASOFT-T', N'AF0414', NULL, N'Order by VoucherDate, VoucherTypeID,VoucherNo', N'Order by VoucherDate, VoucherTypeID,VoucherNo', GETDATE(), N'ASOFTDADMIN', GETDATE(), N'ASOFTDADMIN')
INSERT [dbo].[AT8889STD] ([ModuleID], [FormID], [FormName], [SystemOrderBy], [UserOrderBy], [CreateDate], [CreateUserID], [LastModifyDate], [LastModifyUserID]) VALUES (N'ASOFT-T', N'AF9004', NULL, N'Order by VoucherDate, VoucherTypeID,VoucherNo,TransactionID', N'Order by VoucherDate, VoucherTypeID,VoucherNo,TransactionID', GETDATE(), N'ASOFTDADMIN', GETDATE(), N'ASOFTDADMIN')
INSERT [dbo].[AT8889STD] ([ModuleID], [FormID], [FormName], [SystemOrderBy], [UserOrderBy], [CreateDate], [CreateUserID], [LastModifyDate], [LastModifyUserID]) VALUES (N'ASOFT-T', N'AF3055', NULL, N'Order by VoucherDate, VoucherTypeID,VoucherNo', N'Order by VoucherDate, VoucherTypeID,VoucherNo', GETDATE(), N'ASOFTDADMIN', GETDATE(), N'ASOFTDADMIN')
END