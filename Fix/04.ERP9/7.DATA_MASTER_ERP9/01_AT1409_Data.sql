------------------------------------Modul ASOFTEDM--------------------------------------------------------------
DECLARE @Cur CURSOR, 
		@DivisionID VARCHAR(50),
		@ModuleID VARCHAR(50),
		@Description NVARCHAR(250),
		@DescriptionE NVARCHAR(250)

SET @ModuleID = 'ASOFTEDM'
SET @Description = N'Quản lý học viên'
SET @DescriptionE = 'Manager Traning'
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT DivisionID FROM AT1101
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DivisionID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM AT1409 WHERE DivisionID=@DivisionID  and ModuleID = @ModuleID)
	BEGIN
		INSERT INTO AT1409 (DivisionID, ModuleID, [Description], DescriptionE)
		VALUES (@DivisionID, @ModuleID, @Description, @DescriptionE)
		DELETE AT1409 WHERE DivisionID=@DivisionID AND ModuleID ='ASOFTMT'
	END
	ELSE
	BEGIN
		UPDATE AT1409 SET [Description] = @Description, DescriptionE = @DescriptionE WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID
	END
	
	FETCH NEXT FROM @Cur INTO @DivisionID
END
CLOSE @Cur
GO

------------------------------------Modul ASOFTPOS--------------------------------------------------------------
DECLARE @Cur CURSOR, 
		@DivisionID VARCHAR(50),
		@ModuleID VARCHAR(50),
		@Description NVARCHAR(250),
		@DescriptionE NVARCHAR(250)

SET @ModuleID = 'ASOFTPOS'
SET @Description = N'Quản lý chuỗi bán lẻ'
SET @DescriptionE = 'Retail chain management'
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT DivisionID FROM AT1101
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DivisionID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM AT1409 WHERE ModuleID = 'ASOFTPOS' and DivisionID=@DivisionID)
	INSERT INTO AT1409 (DivisionID, ModuleID, [Description], DescriptionE)
	VALUES (@DivisionID, @ModuleID, @Description, @DescriptionE)
	ELSE
	BEGIN
		UPDATE AT1409 SET [Description] = @Description, DescriptionE = @DescriptionE WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID
	END
	
	FETCH NEXT FROM @Cur INTO @DivisionID
END
CLOSE @Cur
GO

------------------------------------Modul ASOFTOO--------------------------------------------------------------
DECLARE @Cur CURSOR, 
		@DivisionID VARCHAR(50),
		@ModuleID VARCHAR(50),
		@Description NVARCHAR(250),
		@DescriptionE NVARCHAR(250)

SET @ModuleID = 'ASOFTHRM'
SET @Description = N'Quản lý Nhân sự - Tiền lương'
SET @DescriptionE = 'Human resources management and Payroll '
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT DivisionID FROM AT1101
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DivisionID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM AT1409 WHERE ModuleID = 'ASOFTHRM' and DivisionID=@DivisionID)
	INSERT INTO AT1409 (DivisionID, ModuleID, [Description], DescriptionE)
	VALUES (@DivisionID, @ModuleID, @Description, @DescriptionE)
	ELSE
	BEGIN
		UPDATE AT1409 SET [Description] = @Description, DescriptionE = @DescriptionE WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID
	END
	
	FETCH NEXT FROM @Cur INTO @DivisionID
END
CLOSE @Cur
GO
------------------------------------Modul ASOFTCRM--------------------------------------------------------------
DECLARE @Cur CURSOR, 
		@DivisionID VARCHAR(50),
		@ModuleID VARCHAR(50),
		@Description NVARCHAR(250),
		@DescriptionE NVARCHAR(250)

SET @ModuleID = 'ASOFTCRM'
SET @Description = N'Quản lý quan hệ khách hàng'
SET @DescriptionE = 'Customer relationship management'
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT DivisionID FROM AT1101
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DivisionID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM AT1409 WHERE ModuleID = 'ASOFTCRM' and DivisionID=@DivisionID)
	INSERT INTO AT1409 (DivisionID, ModuleID, [Description], DescriptionE)
	VALUES (@DivisionID, @ModuleID, @Description, @DescriptionE)
	ELSE
	BEGIN
		UPDATE AT1409 SET [Description] = @Description, DescriptionE = @DescriptionE WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID
	END
	
	FETCH NEXT FROM @Cur INTO @DivisionID
END
CLOSE @Cur
GO
------------------------------------Modul ASOFTBI--------------------------------------------------------------
DECLARE @Cur CURSOR, 
		@DivisionID VARCHAR(50),
		@ModuleID VARCHAR(50),
		@Description NVARCHAR(250),
		@DescriptionE NVARCHAR(250)

SET @ModuleID = 'ASOFTBI'
SET @Description = N'Thông tin điều hành'
SET @DescriptionE = 'Business intelligence'
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT DivisionID FROM AT1101
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DivisionID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM AT1409 WHERE ModuleID = 'ASOFTBI' and DivisionID=@DivisionID)
	INSERT INTO AT1409 (DivisionID, ModuleID, [Description], DescriptionE)
	VALUES (@DivisionID, @ModuleID, @Description, @DescriptionE)
	ELSE
	BEGIN
		UPDATE AT1409 SET [Description] = @Description, DescriptionE = @DescriptionE WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID
	END
	
	FETCH NEXT FROM @Cur INTO @DivisionID
END
CLOSE @Cur
GO
------------------------------------Modul ASOFTSO--------------------------------------------------------------
DECLARE @Cur CURSOR, 
		@DivisionID VARCHAR(50),
		@ModuleID VARCHAR(50),
		@Description NVARCHAR(250),
		@DescriptionE NVARCHAR(250)

SET @ModuleID = 'ASOFTSO'
SET @Description = N'Quản lý bán hàng'
SET @DescriptionE = 'Sale management'
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT DivisionID FROM AT1101
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DivisionID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM AT1409 WHERE ModuleID = 'ASOFTSO' and DivisionID=@DivisionID)
	INSERT INTO AT1409 (DivisionID, ModuleID, [Description], DescriptionE)
	VALUES (@DivisionID, @ModuleID, @Description, @DescriptionE)
	ELSE
	BEGIN
		UPDATE AT1409 SET [Description] = @Description, DescriptionE = @DescriptionE WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID
	END
	
	FETCH NEXT FROM @Cur INTO @DivisionID
END
CLOSE @Cur
GO

------------------------------------Modul ASOFTKPI--------------------------------------------------------------
DECLARE @Cur CURSOR, 
		@DivisionID VARCHAR(50),
		@ModuleID VARCHAR(50),
		@Description NVARCHAR(250),
		@DescriptionE NVARCHAR(250)

SET @ModuleID = 'ASOFTKPI'
SET @Description = N'Đánh giá KPI'
SET @DescriptionE = 'KPI'
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT DivisionID FROM AT1101
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DivisionID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM AT1409 WHERE ModuleID = 'ASOFTKPI' and DivisionID=@DivisionID)
	INSERT INTO AT1409 (DivisionID, ModuleID, [Description], DescriptionE)
	VALUES (@DivisionID, @ModuleID, @Description, @DescriptionE)
	ELSE
	BEGIN
		UPDATE AT1409 SET [Description] = @Description, DescriptionE = @DescriptionE WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID
	END
	
	FETCH NEXT FROM @Cur INTO @DivisionID
END
CLOSE @Cur
GO

------------------------------------Modul ASOFTPA--------------------------------------------------------------
DECLARE @Cur CURSOR, 
		@DivisionID VARCHAR(50),
		@ModuleID VARCHAR(50),
		@Description NVARCHAR(250),
		@DescriptionE NVARCHAR(250)

SET @ModuleID = 'ASOFTPA'
SET @Description = N'Đánh giá năng lực'
SET @DescriptionE = 'PA'
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT DivisionID FROM AT1101
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DivisionID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM AT1409 WHERE ModuleID = 'ASOFTPA' and DivisionID=@DivisionID)
	INSERT INTO AT1409 (DivisionID, ModuleID, [Description], DescriptionE)
	VALUES (@DivisionID, @ModuleID, @Description, @DescriptionE)
	ELSE
	BEGIN
		UPDATE AT1409 SET [Description] = @Description, DescriptionE = @DescriptionE WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID
	END
	
	FETCH NEXT FROM @Cur INTO @DivisionID
END
CLOSE @Cur
GO

------------------------------------Modul ASOFTOO--------------------------------------------------------------
DECLARE @Cur CURSOR, 
		@DivisionID VARCHAR(50),
		@ModuleID VARCHAR(50),
		@Description NVARCHAR(250),
		@DescriptionE NVARCHAR(250)

SET @ModuleID = 'ASOFTOO'
SET @Description = N'Văn phòng điện tử'
SET @DescriptionE = 'Online Office'
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT DivisionID FROM AT1101
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DivisionID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM AT1409 WHERE ModuleID = @ModuleID AND DivisionID=@DivisionID)
		INSERT INTO AT1409 (DivisionID, ModuleID, [Description], DescriptionE)
		VALUES (@DivisionID, @ModuleID, @Description, @DescriptionE)
	ELSE
	BEGIN
		UPDATE AT1409 SET [Description] = @Description, DescriptionE = @DescriptionE WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID
	END
	
	FETCH NEXT FROM @Cur INTO @DivisionID
END
CLOSE @Cur
GO

------------------------------------Modul ASOFTPO--------------------------------------------------------------
DECLARE @Cur CURSOR, 
		@DivisionID VARCHAR(50),
		@ModuleID VARCHAR(50),
		@Description NVARCHAR(250),
		@DescriptionE NVARCHAR(250)

SET @ModuleID = 'ASOFTPO'
SET @Description = N'Quản lý mua hàng'
SET @DescriptionE = 'Purchase management'
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT DivisionID FROM AT1101
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DivisionID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM AT1409 WHERE ModuleID = @ModuleID AND DivisionID=@DivisionID)
		INSERT INTO AT1409 (DivisionID, ModuleID, [Description], DescriptionE)
		VALUES (@DivisionID, @ModuleID, @Description, @DescriptionE)
	ELSE
	BEGIN
		UPDATE AT1409 SET [Description] = @Description, DescriptionE = @DescriptionE WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID
	END
	
	FETCH NEXT FROM @Cur INTO @DivisionID
END
CLOSE @Cur
GO

------------------------------------Modul ASOFTADM--------------------------------------------------------------
DECLARE @customerIndex INT = -1
SELECT @customerIndex = CustomerName FROM CustomerIndex

DECLARE @Cur CURSOR, 
		@DivisionID VARCHAR(50),
		@ModuleID VARCHAR(50),
		@Description NVARCHAR(250),
		@DescriptionE NVARCHAR(250)

SET @ModuleID = 'ASOFTADM'
SET @Description = N'Admin Utilities'
SET @DescriptionE = 'Admin Utilities'
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT DivisionID FROM AT1101
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DivisionID
-- Chỉ insert module ADM cho ASOFT
WHILE @@FETCH_STATUS = 0 AND @customerIndex = 92
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM AT1409 WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID)
		INSERT INTO AT1409 (DivisionID, ModuleID, [Description], DescriptionE)
		VALUES (@DivisionID, @ModuleID, @Description, @DescriptionE)
	ELSE
	BEGIN
		UPDATE AT1409 SET [Description] = @Description, DescriptionE = @DescriptionE WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID
	END
	
	FETCH NEXT FROM @Cur INTO @DivisionID
END
CLOSE @Cur
GO

------------------------------------Modul ASOFTBEM--------------------------------------------------------------
DECLARE @customerIndex INT = -1
SELECT @customerIndex = CustomerName FROM CustomerIndex

DECLARE @Cur CURSOR, 
		@DivisionID VARCHAR(50),
		@ModuleID VARCHAR(50),
		@Description NVARCHAR(250),
		@DescriptionE NVARCHAR(250)

SET @ModuleID = 'ASOFTBEM'
SET @Description = N'Quản lý chi phí kinh doanh'
SET @DescriptionE = 'Business Expense Management'
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT DivisionID FROM AT1101
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DivisionID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM AT1409 WHERE ModuleID = @ModuleID AND DivisionID=@DivisionID)
		INSERT INTO AT1409 (DivisionID, ModuleID, [Description], DescriptionE)
		VALUES (@DivisionID, @ModuleID, @Description, @DescriptionE)
	ELSE
	BEGIN
		UPDATE AT1409 SET [Description] = @Description, DescriptionE = @DescriptionE WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID
	END
	
	FETCH NEXT FROM @Cur INTO @DivisionID
END
CLOSE @Cur
GO

------------------------------------Modul ASOFT-QC--------------------------------------------------------------
DECLARE @Cur CURSOR, 
		@DivisionID VARCHAR(50),
		@ModuleID VARCHAR(50),
		@Description NVARCHAR(250),
		@DescriptionE NVARCHAR(250)

SET @ModuleID = 'ASOFTQC'
SET @Description = N'Quản lý chất lượng'
SET @DescriptionE = 'Quality control'
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT DivisionID FROM AT1101
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DivisionID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM AT1409 WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID)
		INSERT INTO AT1409 (DivisionID, ModuleID, [Description], DescriptionE)
		VALUES (@DivisionID, @ModuleID, @Description, @DescriptionE)
	ELSE
	BEGIN
		UPDATE AT1409 SET [Description] = @Description, DescriptionE = @DescriptionE WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID
	END
	
	FETCH NEXT FROM @Cur INTO @DivisionID
END
CLOSE @Cur
GO

------------------------------------Modul ASOFT-SHM--------------------------------------------------------------
DECLARE @Cur CURSOR, 
		@DivisionID VARCHAR(50),
		@ModuleID VARCHAR(50),
		@Description NVARCHAR(250),
		@DescriptionE NVARCHAR(250)

SET @ModuleID = 'AsoftSHM'
SET @Description = N'Quản lý cổ đông'
SET @DescriptionE = 'Shareholder management'
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT DivisionID FROM AT1101
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DivisionID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM AT1409 WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID)
		INSERT INTO AT1409 (DivisionID, ModuleID, [Description], DescriptionE)
		VALUES (@DivisionID, @ModuleID, @Description, @DescriptionE)
	ELSE
	BEGIN
		UPDATE AT1409 SET [Description] = @Description, DescriptionE = @DescriptionE WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID
	END
	
	FETCH NEXT FROM @Cur INTO @DivisionID
END
CLOSE @Cur
GO

------------------------------------Modul ASOFT-LM--------------------------------------------------------------
DECLARE @Cur CURSOR, 
		@DivisionID VARCHAR(50),
		@ModuleID VARCHAR(50),
		@Description NVARCHAR(250),
		@DescriptionE NVARCHAR(250)

SET @ModuleID = 'AsoftLM'
SET @Description = N'Quản lý vay'
SET @DescriptionE = 'Loan management'
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT DivisionID FROM AT1101
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DivisionID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM AT1409 WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID)
		INSERT INTO AT1409 (DivisionID, ModuleID, [Description], DescriptionE)
		VALUES (@DivisionID, @ModuleID, @Description, @DescriptionE)
	ELSE
	BEGIN
		UPDATE AT1409 SET [Description] = @Description, DescriptionE = @DescriptionE WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID
	END
	
	FETCH NEXT FROM @Cur INTO @DivisionID
END
CLOSE @Cur
GO

------------------------------------Modul ASOFT-CCM--------------------------------------------------------------
DECLARE @Cur CURSOR, 
		@DivisionID VARCHAR(50),
		@ModuleID VARCHAR(50),
		@Description NVARCHAR(250),
		@DescriptionE NVARCHAR(250)

SET @ModuleID = 'AsoftCCM'
SET @Description = N'Quản lý hỗ trợ khách hàng'
SET @DescriptionE = 'Customer care management'
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT DivisionID FROM AT1101
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DivisionID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM AT1409 WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID)
		INSERT INTO AT1409 (DivisionID, ModuleID, [Description], DescriptionE)
		VALUES (@DivisionID, @ModuleID, @Description, @DescriptionE)
	ELSE
	BEGIN
		UPDATE AT1409 SET [Description] = @Description, DescriptionE = @DescriptionE WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID
	END
	
	FETCH NEXT FROM @Cur INTO @DivisionID
END
CLOSE @Cur
GO

------------------------------------Modul ASOFT-WM--------------------------------------------------------------
DECLARE @Cur CURSOR, 
		@DivisionID VARCHAR(50),
		@ModuleID VARCHAR(50),
		@Description NVARCHAR(250),
		@DescriptionE NVARCHAR(250)

SET @ModuleID = 'AsoftWM'
SET @Description = N'Quản lý kho'
SET @DescriptionE = 'Warehouse management'
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT DivisionID FROM AT1101
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DivisionID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM AT1409 WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID)
		INSERT INTO AT1409 (DivisionID, ModuleID, [Description], DescriptionE)
		VALUES (@DivisionID, @ModuleID, @Description, @DescriptionE)
	ELSE
	BEGIN
		UPDATE AT1409 SET [Description] = @Description, DescriptionE = @DescriptionE WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID
	END
	
	FETCH NEXT FROM @Cur INTO @DivisionID
END
CLOSE @Cur
GO

--06/07/2023 - [Hoài Thanh] - Thêm Module ASOFT-IOT
------------------------------------Module ASOFT-IOT--------------------------------------------------------------
DECLARE @Cur CURSOR, 
		@DivisionID VARCHAR(50),
		@ModuleID VARCHAR(50),
		@Description NVARCHAR(250),
		@DescriptionE NVARCHAR(250)

SET @ModuleID = 'ASOFTIOT'
SET @Description = N'Văn phòng thông minh'
SET @DescriptionE = 'Smart office'
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT DivisionID FROM AT1101
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DivisionID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM AT1409 WHERE DivisionID=@DivisionID  and ModuleID = @ModuleID)
	BEGIN
		INSERT INTO AT1409 (DivisionID, ModuleID, [Description], DescriptionE, OrderNo)
		VALUES (@DivisionID, @ModuleID, @Description, @DescriptionE, 18)
	END
	ELSE
	BEGIN
		UPDATE AT1409 SET [Description] = @Description, DescriptionE = @DescriptionE, OrderNo = 18 WHERE ModuleID = @ModuleID AND DivisionID = @DivisionID
	END
	
	FETCH NEXT FROM @Cur INTO @DivisionID
END
CLOSE @Cur
GO