---- Create by Phan thanh hoàng vũ on 4/11/2017 3:54:57 PM
---- Chi tiết codemaster mã tăng tự động (bổ sung CRM)

--IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'ACT01')
--INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
--VALUES (N'CRMT00000002', N'16', N'ACT', N'ACT01', N'Phân loại 01', N'CRMT10801', 1)

--IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'ACT02')
--INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
--VALUES (N'CRMT00000002', N'16', N'ACT', N'ACT02', N'Phân loại 02', N'CRMT10801', 2)

--IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'ACT03')
--INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
--VALUES (N'CRMT00000002', N'16', N'ACT', N'ACT03', N'Phân loại 03', N'CRMT10801', 3)

IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'CAM01')
INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
VALUES (N'CRMT00000002', N'6', N'CAM', N'CAM01', N'Phân loại 01', N'CRMT20401', 1)

IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'CAM02')
INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
VALUES (N'CRMT00000002', N'6', N'CAM', N'CAM02', N'Phân loại 02', N'CRMT20401', 2)

IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'CAM03')
INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
VALUES (N'CRMT00000002', N'6', N'CAM', N'CAM03', N'Phân loại 03', N'CRMT20401', 3)

--IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'CAU01')
--INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
--VALUES (N'CRMT00000002', N'14', N'CAU', N'CAU01', N'Phân loại 01', N'CRMT10501', 1)

--IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'CAU02')
--INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
--VALUES (N'CRMT00000002', N'14', N'CAU', N'CAU02', N'Phân loại 02', N'CRMT10501', 2)

--IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'CAU03')
--INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
--VALUES (N'CRMT00000002', N'14', N'CAU', N'CAU03', N'Phân loại 03', N'CRMT10501', 3)

IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'CON01')
INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
VALUES (N'CRMT00000002', N'2', N'CON', N'CON01', N'Phân loại 01', N'CRMT10001', 1)

IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'CON02')
INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
VALUES (N'CRMT00000002', N'2', N'CON', N'CON02', N'Phân loại 02', N'CRMT10001', 2)

IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'CON03')
INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
VALUES (N'CRMT00000002', N'2', N'CON', N'CON03', N'Phân loại 03', N'CRMT10001', 3)

--IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'ETE01')
--INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
--VALUES (N'CRMT00000002', N'12', N'ETE', N'ETE01', N'Phân loại 01', N'AT0129', 1)

--IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'ETE02')
--INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
--VALUES (N'CRMT00000002', N'12', N'ETE', N'ETE02', N'Phân loại 02', N'AT0129', 2)

--IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'ETE03')
--INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
--VALUES (N'CRMT00000002', N'12', N'ETE', N'ETE03', N'Phân loại 03', N'AT0129', 3)

--IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'GRE01')
--INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
--VALUES (N'CRMT00000002', N'11', N'GRE', N'GRE01', N'Phân loại 01', N'CRMT10301', 1)

--IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'GRE02')
--INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
--VALUES (N'CRMT00000002', N'11', N'GRE', N'GRE02', N'Phân loại 02', N'CRMT10301', 2)

--IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'GRE03')
--INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
--VALUES (N'CRMT00000002', N'11', N'GRE', N'GRE03', N'Phân loại 03', N'CRMT10301', 3)

IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'LEA01')
INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
VALUES (N'CRMT00000002', N'1', N'LEA', N'LEA01', N'Phân loại 01', N'CRMT20301', 1)

IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'LEA02')
INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
VALUES (N'CRMT00000002', N'1', N'LEA', N'LEA02', N'Phân loại 02', N'CRMT20301', 2)

IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'LEA03')
INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
VALUES (N'CRMT00000002', N'1', N'LEA', N'LEA03', N'Phân loại 03', N'CRMT20301', 3)

--IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'LET01')
--INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
--VALUES (N'CRMT00000002', N'21', N'LET', N'LET01', N'Phân loại 01', N'CRMT10201', 1)

--IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'LET02')
--INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
--VALUES (N'CRMT00000002', N'21', N'LET', N'LET02', N'Phân loại 02', N'CRMT10201', 2)

--IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'LET03')
--INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
--VALUES (N'CRMT00000002', N'21', N'LET', N'LET03', N'Phân loại 03', N'CRMT10201', 3)

IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'O01')
INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
VALUES (N'CRMT00000002', N'3', N'O', N'O01', N'Phân loại 01', N'AT1202', 1)

IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'O02')
INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
VALUES (N'CRMT00000002', N'3', N'O', N'O02', N'Phân loại 02', N'AT1202', 2)

IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'O03')
INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
VALUES (N'CRMT00000002', N'3', N'O', N'O03', N'Phân loại 03', N'AT1202', 3)

IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'OPP01')
INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
VALUES (N'CRMT00000002', N'4', N'OPP', N'OPP01', N'Phân loại 01', N'CRMT20501', 1)

IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'OPP02')
INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
VALUES (N'CRMT00000002', N'4', N'OPP', N'OPP02', N'Phân loại 02', N'CRMT20501', 2)

IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'OPP03')
INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
VALUES (N'CRMT00000002', N'4', N'OPP', N'OPP03', N'Phân loại 03', N'CRMT20501', 3)

--IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'SAL01')
--INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
--VALUES (N'CRMT00000002', N'15', N'SAL', N'SAL01', N'Phân loại 01', N'CRMT10601', 1)

--IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'SAL02')
--INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
--VALUES (N'CRMT00000002', N'15', N'SAL', N'SAL02', N'Phân loại 02', N'CRMT10601', 2)

--IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'SAL03')
--INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
--VALUES (N'CRMT00000002', N'15', N'SAL', N'SAL03', N'Phân loại 03', N'CRMT10601', 3)

--IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'STA01')
--INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
--VALUES (N'CRMT00000002', N'13', N'STA', N'STA01', N'Phân loại 01', N'CRMT10401', 1)

--IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'STA02')
--INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
--VALUES (N'CRMT00000002', N'13', N'STA', N'STA02', N'Phân loại 02', N'CRMT10401', 2)

--IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'STA03')
--INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
--VALUES (N'CRMT00000002', N'13', N'STA', N'STA03', N'Phân loại 03', N'CRMT10401', 3)


---------Đình Hoà [22/07/2020] - Bổ sung dữ liệu ngầm các phân loại Mặt hàng 
IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'INV01')
INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
VALUES (N'CRMT00000002', N'59', N'INV', N'INV01', N'Phân loại 01', N'AT1302', 1)

IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'INV02')
INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
VALUES (N'CRMT00000002', N'59', N'INV', N'INV02', N'Phân loại 02', N'AT1302', 2)

IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'INV03')
INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
VALUES (N'CRMT00000002', N'59', N'INV', N'INV03', N'Phân loại 03', N'AT1302', 3)


---------Văn Tài [09/12/2021] - Bổ sung dữ liệu ngầm phân loại Khách hàng Sale out
IF NOT EXISTS(SELECT TOP 1 1 FROM CRMT0097 WHERE StypeID = N'KCH01')
INSERT [dbo].[CRMT0097] ([CodeMaster], [ID], [TypeID], [StypeID], [StypeName], [TableID], [OrderNo]) 
VALUES (N'CRMT00000002', N'62', N'KCH', N'KCH01', N'Khách hàng Sale out', N'AT12021', 1)
