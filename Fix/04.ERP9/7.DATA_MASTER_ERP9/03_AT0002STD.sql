---- Create by Phan thanh hoàng vũ on 4/11/2017 3:54:57 PM
---- Chi tiết mã tăng tự động (bổ sung TypeID va du lieu cac bang CRM)
IF NOT EXISTS(SELECT TOP 1 1 FROM AT0002STD WHERE TableID = N'AT1202')
INSERT [dbo].[AT0002STD] ([TableID], [IsAutomatic], [IsS1], [IsS2], [IsS3], [S1], [S2], [S3], [Length], [OutputOrder], [IsSeparator], [Separator], [TypeID]) 
VALUES (N'AT1202', 1, 0, 0, 0, N'', N'', N'', 25, 3, 0, N'', N'O')

IF NOT EXISTS(SELECT TOP 1 1 FROM AT0002STD WHERE TableID = N'AT1302')
INSERT [dbo].[AT0002STD] ([TableID], [IsAutomatic], [IsS1], [IsS2], [IsS3], [S1], [S2], [S3], [Length], [OutputOrder], [IsSeparator], [Separator], [TypeID]) 
VALUES (N'AT1302', 1, 0, 0, 0, N'', N'', N'', 25, 3, 0, N'', N'')

IF NOT EXISTS(SELECT TOP 1 1 FROM AT0002STD WHERE TableID = N'HT1400')
INSERT [dbo].[AT0002STD] ([TableID], [IsAutomatic], [IsS1], [IsS2], [IsS3], [S1], [S2], [S3], [Length], [OutputOrder], [IsSeparator], [Separator], [TypeID]) 
VALUES (N'HT1400', 1, 0, 0, 0, N'', N'', N'', 25, 3, 0, N'', N'')

IF NOT EXISTS(SELECT TOP 1 1 FROM AT0002STD WHERE TableID = N'AT1503')
INSERT [dbo].[AT0002STD] ([TableID], [IsAutomatic], [IsS1], [IsS2], [IsS3], [S1], [S2], [S3], [Length], [OutputOrder], [IsSeparator], [Separator], [TypeID]) 
VALUES (N'AT1503', 1, 0, 0, 0, N'', N'', N'', 25, 3, 0, N'', N'')

IF NOT EXISTS(SELECT TOP 1 1 FROM AT0002STD WHERE TableID = N'CT4000')
INSERT [dbo].[AT0002STD] ([TableID], [IsAutomatic], [IsS1], [IsS2], [IsS3], [S1], [S2], [S3], [Length], [OutputOrder], [IsSeparator], [Separator], [TypeID]) 
VALUES (N'CT4000', 1, 0, 0, 0, N'', N'', N'', 25, 3, 0, N'', N'')

IF NOT EXISTS(SELECT TOP 1 1 FROM AT0002STD WHERE TableID = N'CRMT20301')
INSERT [dbo].[AT0002STD] ([TableID], [IsAutomatic], [IsS1], [IsS2], [IsS3], [S1], [S2], [S3], [Length], [OutputOrder], [IsSeparator], [Separator], [TypeID]) 
VALUES (N'CRMT20301', 1, 0, 0, 0, N'', N'', N'', 25, 3, 0, N'', N'LEA')

IF NOT EXISTS(SELECT TOP 1 1 FROM AT0002STD WHERE TableID = N'CRMT10001')
INSERT [dbo].[AT0002STD] ([TableID], [IsAutomatic], [IsS1], [IsS2], [IsS3], [S1], [S2], [S3], [Length], [OutputOrder], [IsSeparator], [Separator], [TypeID]) 
VALUES (N'CRMT10001', 1, 0, 0, 0, N'', N'', N'', 25, 3, 0, N'', N'CON')

IF NOT EXISTS(SELECT TOP 1 1 FROM AT0002STD WHERE TableID = N'CRMT20501')
INSERT [dbo].[AT0002STD] ([TableID], [IsAutomatic], [IsS1], [IsS2], [IsS3], [S1], [S2], [S3], [Length], [OutputOrder], [IsSeparator], [Separator], [TypeID]) 
VALUES (N'CRMT20501', 1, 0, 0, 0, N'', N'', N'', 25, 3, 0, N'', N'OPP')

IF NOT EXISTS(SELECT TOP 1 1 FROM AT0002STD WHERE TableID = N'CRMT20401')
INSERT [dbo].[AT0002STD] ([TableID], [IsAutomatic], [IsS1], [IsS2], [IsS3], [S1], [S2], [S3], [Length], [OutputOrder], [IsSeparator], [Separator], [TypeID]) 
VALUES (N'CRMT20401', 1, 0, 0, 0, N'', N'', N'', 25, 3, 0, N'', N'CAM')

--IF NOT EXISTS(SELECT TOP 1 1 FROM AT0002STD WHERE TableID = N'CRMT10301')
--INSERT [dbo].[AT0002STD] ([TableID], [IsAutomatic], [IsS1], [IsS2], [IsS3], [S1], [S2], [S3], [Length], [OutputOrder], [IsSeparator], [Separator], [TypeID]) 
--VALUES (N'CRMT10301', 1, 0, 0, 0, N'', N'', N'', 25, 3, 0, N'', N'GRE')

--IF NOT EXISTS(SELECT TOP 1 1 FROM AT0002STD WHERE TableID = N'AT0129')
--INSERT [dbo].[AT0002STD] ([TableID], [IsAutomatic], [IsS1], [IsS2], [IsS3], [S1], [S2], [S3], [Length], [OutputOrder], [IsSeparator], [Separator], [TypeID]) 
--VALUES (N'AT0129', 1, 0, 0, 0, N'', N'', N'', 25, 3, 0, N'', N'ETE')

--IF NOT EXISTS(SELECT TOP 1 1 FROM AT0002STD WHERE TableID = N'CRMT10401')
--INSERT [dbo].[AT0002STD] ([TableID], [IsAutomatic], [IsS1], [IsS2], [IsS3], [S1], [S2], [S3], [Length], [OutputOrder], [IsSeparator], [Separator], [TypeID]) 
--VALUES (N'CRMT10401', 1, 0, 0, 0, N'', N'', N'', 25, 3, 0, N'', N'STA')

--IF NOT EXISTS(SELECT TOP 1 1 FROM AT0002STD WHERE TableID = N'CRMT10501')
--INSERT [dbo].[AT0002STD] ([TableID], [IsAutomatic], [IsS1], [IsS2], [IsS3], [S1], [S2], [S3], [Length], [OutputOrder], [IsSeparator], [Separator], [TypeID]) 
--VALUES (N'CRMT10501', 1, 0, 0, 0, N'', N'', N'', 25, 3, 0, N'', N'CAU')

--IF NOT EXISTS(SELECT TOP 1 1 FROM AT0002STD WHERE TableID = N'CRMT10601')
--INSERT [dbo].[AT0002STD] ([TableID], [IsAutomatic], [IsS1], [IsS2], [IsS3], [S1], [S2], [S3], [Length], [OutputOrder], [IsSeparator], [Separator], [TypeID]) 
--VALUES (N'CRMT10601', 1, 0, 0, 0, N'', N'', N'', 25, 3, 0, N'', N'SAL')

--IF NOT EXISTS(SELECT TOP 1 1 FROM AT0002STD WHERE TableID = N'CRMT10801')
--INSERT [dbo].[AT0002STD] ([TableID], [IsAutomatic], [IsS1], [IsS2], [IsS3], [S1], [S2], [S3], [Length], [OutputOrder], [IsSeparator], [Separator], [TypeID]) 
--VALUES (N'CRMT10801', 1, 0, 0, 0, N'', N'', N'', 25, 3, 0, N'', N'ACT')

--IF NOT EXISTS(SELECT TOP 1 1 FROM AT0002STD WHERE TableID = N'CRMT10201')
--INSERT [dbo].[AT0002STD] ([TableID], [IsAutomatic], [IsS1], [IsS2], [IsS3], [S1], [S2], [S3], [Length], [OutputOrder], [IsSeparator], [Separator], [TypeID]) 
--VALUES (N'CRMT10201', 1, 0, 0, 0, N'', N'', N'', 25, 3, 0, N'', N'LET')
