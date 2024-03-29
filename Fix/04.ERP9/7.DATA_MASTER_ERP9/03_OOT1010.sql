-- CREATE BY Trần Quốc Tuấn ON 20/01/2015
-- Thêm dữ liệu Xử lý bất thường
-- Modified on 16/06/2016 by Bảo Thy: Sửa phương thức xử lý của Sai ca làm việc từ DXBSQT sang DXDC
-- Modified on 02/10/2019 by Học Huy: Sửa lỗi khi chạy script, APK hiện tại của bảng OOT1010 bị xoá nên không khớp với APKMaster đã lưu ở bảng OOT1011

DECLARE @InheritAPK VARCHAR(50)

--Quên quẹt thẻ
DELETE [OOT1010]
WHERE UnusualTypeID='BT0001'
	AND DivisionID NOT IN 
	(
		SELECT TOP 1 T0.DivisionID 
		FROM OOT1010 T0 INNER JOIN OOT1011 T1 ON T0.DivisionID = T1.DivisionID 
		WHERE UnusualTypeID='BT0001'
	)
INSERT [dbo].[OOT1010] ( [DivisionID], [UnusualTypeID], [Description], [DescriptionE], [HandleMethodID], [Note], [Disabled],IsDefault, [CreateUserID], [CreateDate], [LastModifyUserID], [LastModifyDate])
SELECT DivisionID, N'BT0001', N'Quên quẹt thẻ', N'Quên quẹt thẻ', N'DXBSQT', N'', 0,1, N'ASOFTADMIN',GETDATE(),N'ASOFTADMIN',GETDATE()
FROM AT1101
WHERE DivisionID NOT IN (SELECT DivisionID FROM OOT1010 WHERE UnusualTypeID='BT0001')

--Vào muộn ra sớm
DELETE [OOT1010]
WHERE UnusualTypeID='BT0002'
	AND DivisionID NOT IN 
	(
		SELECT T0.DivisionID 
		FROM OOT1010 T0 INNER JOIN OOT1011 T1 ON T0.DivisionID = T1.DivisionID 
		WHERE UnusualTypeID='BT0002'
	)
INSERT [dbo].[OOT1010] ( [DivisionID], [UnusualTypeID], [Description], [DescriptionE], [HandleMethodID], [Note], [Disabled],IsDefault, [CreateUserID], [CreateDate], [LastModifyUserID], [LastModifyDate])
SELECT DivisionID, N'BT0002', N'Vào muộn , ra sớm.', N'Vào muộn , ra sớm.', N'DXP', N'', 0,1, N'ASOFTADMIN',GETDATE(),N'ASOFTADMIN',GETDATE()
FROM AT1101
WHERE DivisionID NOT IN (SELECT DivisionID FROM OOT1010 WHERE UnusualTypeID='BT0002')

--Bỏ làm
DELETE [OOT1010]
WHERE UnusualTypeID='BT0003'
	AND DivisionID NOT IN  
	(
		SELECT T0.DivisionID 
		FROM OOT1010 T0 INNER JOIN OOT1011 T1 ON T0.DivisionID = T1.DivisionID 
		WHERE UnusualTypeID='BT0003'
	)
DELETE [OOT1010] WHERE [UnusualTypeID] = 'BT0003'
INSERT [dbo].[OOT1010] ( [DivisionID], [UnusualTypeID], [Description], [DescriptionE], [HandleMethodID], [Note], [Disabled],IsDefault, [CreateUserID], [CreateDate], [LastModifyUserID], [LastModifyDate])
SELECT DivisionID, N'BT0003', N'Bỏ làm', N'Bỏ làm', N'DXP', N'', 0,1, N'ASOFTADMIN',GETDATE(),N'ASOFTADMIN',GETDATE()
FROM AT1101
WHERE DivisionID NOT IN (SELECT DivisionID FROM OOT1010 WHERE UnusualTypeID='BT0003')

--Bỏ làm OT
DELETE [OOT1010]
WHERE UnusualTypeID='BT0004'
	AND DivisionID NOT IN 
	(
		SELECT T0.DivisionID 
		FROM OOT1010 T0 INNER JOIN OOT1011 T1 ON T0.DivisionID = T1.DivisionID 
		WHERE UnusualTypeID='BT0004'
	)
DELETE [OOT1010] WHERE [UnusualTypeID] = 'BT0004'
INSERT [dbo].[OOT1010] ( [DivisionID], [UnusualTypeID], [Description], [DescriptionE], [HandleMethodID], [Note], [Disabled],IsDefault, [CreateUserID], [CreateDate], [LastModifyUserID], [LastModifyDate])
SELECT DivisionID, N'BT0004', N'Bỏ làm OT', N'Bỏ làm OT', N'DXBSQT', N'', 0,1, N'ASOFTADMIN',GETDATE(),N'ASOFTADMIN',GETDATE()
FROM AT1101
WHERE DivisionID NOT IN (SELECT DivisionID FROM OOT1010 WHERE UnusualTypeID='BT0004')

--Sai ca làm việc
DELETE [OOT1010]
WHERE UnusualTypeID='BT0005'
	AND DivisionID NOT IN 
	(
		SELECT T0.DivisionID 
		FROM OOT1010 T0 INNER JOIN OOT1011 T1 ON T0.DivisionID = T1.DivisionID 
		WHERE UnusualTypeID='BT0005'
	)
DELETE [OOT1010] WHERE [UnusualTypeID] = 'BT0005'
INSERT [dbo].[OOT1010] ( [DivisionID], [UnusualTypeID], [Description], [DescriptionE], [HandleMethodID], [Note], [Disabled],IsDefault, [CreateUserID], [CreateDate], [LastModifyUserID], [LastModifyDate])
SELECT DivisionID, N'BT0005', N'Sai ca làm việc', N'Sai ca làm việc', N'DXDC', N'', 0,1, N'ASOFTADMIN',GETDATE(),N'ASOFTADMIN',GETDATE()
FROM AT1101
WHERE DivisionID NOT IN (SELECT DivisionID FROM OOT1010 WHERE UnusualTypeID='BT0005')

--Khác
DELETE [OOT1010]
WHERE UnusualTypeID='BT0006'
	AND DivisionID NOT IN  
	(
		SELECT T0.DivisionID 
		FROM OOT1010 T0 INNER JOIN OOT1011 T1 ON T0.DivisionID = T1.DivisionID 
		WHERE UnusualTypeID='BT0006'
	)
DELETE [OOT1010] WHERE [UnusualTypeID] = 'BT0006'
INSERT [dbo].[OOT1010] ( [DivisionID], [UnusualTypeID], [Description], [DescriptionE], [HandleMethodID], [Note], [Disabled],IsDefault, [CreateUserID], [CreateDate], [LastModifyUserID], [LastModifyDate])
SELECT DivisionID, N'BT0006', N'Khác', N'Khác', N'', N'', 0,1, N'ASOFTADMIN',GETDATE(),N'ASOFTADMIN',GETDATE()
FROM AT1101
WHERE DivisionID NOT IN (SELECT DivisionID FROM OOT1010 WHERE UnusualTypeID='BT0006')