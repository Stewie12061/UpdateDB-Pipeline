IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[HP2706]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[HP2706]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
--- Import ngày nghỉ phép ban đầu
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
---- Created by: Hải Long on 01/12/2015
---- Modified on 05/01/2019 by Bảo Anh: Bổ sung import Số phép bù ban đầu
---- Modified on 21/09/2022 by Văn Tài: Điều chỉnh giá trị default nếu import dưới ERP 8.
-- <Example>
/*
    EXEC HP2706,0, 1
*/

 CREATE PROCEDURE HP2706
(
     @DivisionID VARCHAR(50),
     @UserID VARCHAR(50),
     @TranMonth INT,
     @TranYear INT,        
	 @Mode TINYINT = 1, --0 chưa hết dữ liệu, 1: hết dữ liệu
     @ImportTransTypeID NVARCHAR(250),
     @TransactionKey NVARCHAR(50) = NULL,
     @XML XML
)
AS
DECLARE @Cur CURSOR,
		@Row INT,
		@EmployeeID VARCHAR(50),
		@FullName NVARCHAR(250),
		@FirstLoaDays DECIMAL(28,2),
		@FirstOTLeaveDays DECIMAL(28,2),
		@TransactionID UNIQUEIDENTIFIER,
		@ErrorFlag TINYINT = 0,
		@ErrorColumn NVARCHAR(MAX)='',
		@ErrorMessage NVARCHAR(MAX)=''
			
SET @TransactionID = NEWID()		

IF @TransactionKey IS NULL SET @TransactionKey = NEWID();

---------INSERT dữ liệu từ file excel vào bảng tạm---------------------------------------

IF EXISTS (SELECT TOP 1 1 FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[HT2706]') AND TYPE IN (N'U'))
	DELETE HT2706  WHERE DATEDIFF(DAY, CreateDate, GETDATE()) >= 1 -- xóa dữ liệu import thừa
	
INSERT INTO HT2706([Row], DivisionID, TranMonth, TranYear, EmployeeID, FullName, FirstLoaDays, FirstOTLeaveDays, TransactionKey, TransactionID, CreateDate, ErrorColumn, ErrorMessage)												
SELECT	X.Data.query('OrderNo').value('.','INT') AS [Row],
		X.Data.query('DivisionID').value('.','NVARCHAR(50)') AS DivisionID,
		CONVERT(INT,LEFT(X.Data.query('Period').value('.','VARCHAR(10)'),2)) AS TranMonth,
		CONVERT(INT,RIGHT(X.Data.query('Period').value('.','VARCHAR(10)'),4)) AS TranYear,
		X.Data.query('EmployeeID').value('.','VARCHAR(50)') AS EmployeeID,
		X.Data.query('FullName').value('.', 'NVARCHAR(250)') AS FullName,
		X.Data.query('FirstLoaDays').value('.', 'DECIMAL(28,8)') AS FirstLoaDays,
		X.Data.query('FirstOTLeaveDays').value('.', 'DECIMAL(28,8)') AS FirstOTLeaveDays,
		@TransactionKey AS TransactionKey, @TransactionID, GETDATE(),'',''
FROM @XML.nodes('//Data') AS X (Data)

--------------Test dữ liệu import---------------------------------------------------
IF (SELECT TOP 1 DivisionID FROM HT2706 WHERE TransactionKey = @TransactionKey) <> @DivisionID    -- Kiểm tra đơn vị hiện tại
BEGIN
	UPDATE HT2706 SET ErrorMessage = (SELECT TOP 1 DataCol + '-OOFML000001' FROM A00065 WHERE ImportTransTypeID = @ImportTransTypeID AND ColID = 'DivisionID'),
					   ErrorColumn = 'DivisionID'
	GOTO EndMessage
END

IF (SELECT TOP 1 (TranMonth + TranYear * 100) FROM HT2706 WHERE TransactionKey = @TransactionKey) <> (@TranMonth + @TranYear * 100)    -- Kiểm tra kỳ kế toán hiện tại
BEGIN
	UPDATE HT2706 SET ErrorMessage = (SELECT TOP 1 DataCol + '-OOFML000002' FROM A00065 WHERE ImportTransTypeID = @ImportTransTypeID AND ColID = 'Period'),
					   ErrorColumn = 'Period'
	GOTO EndMessage
END


SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT [Row], EmployeeID, FullName, FirstLoaDays, FirstOTLeaveDays
	FROM HT2706 
	WHERE TransactionID = @TransactionID
		
OPEN @Cur
FETCH NEXT FROM @Cur INTO @Row, @EmployeeID, @FullName, @FirstLoaDays, @FirstOTLeaveDays
WHILE @@FETCH_STATUS = 0
BEGIN
	SET @ErrorColumn = ''
	SET @ErrorMessage = ''
---- Kiểm tra NV trong file import bị trùng
	IF EXISTS (SELECT TOP 1 1 FROM HT2706 WHERE EmployeeID = @EmployeeID AND TransactionKey = @TransactionKey HAVING COUNT(1) > 1)		
	BEGIN
		SET @ErrorMessage = @ErrorMessage + (SELECT TOP 1 DataCol FROM A00065 
											WHERE ImportTransTypeID = @ImportTransTypeID AND ColID = 'EmployeeID'
											) + CONVERT(VARCHAR,@Row) + '-OOFML000038,'									
		SET @ErrorColumn = @ErrorColumn + 'EmployeeID,'				
		SET @ErrorFlag = 1
	END

---- Kiểm tra tồn tại mã mã nhân viên và tên nhân viên
	IF NOT EXISTS (SELECT TOP 1 1 FROM HT1400 WHERE DivisionID = @DivisionID AND EmployeeID = @EmployeeID AND EmployeeStatus NOT IN (4,9))		
	BEGIN
		SET @ErrorMessage = @ErrorMessage + (SELECT TOP 1 DataCol FROM A00065 
											WHERE ImportTransTypeID = @ImportTransTypeID AND ColID = 'EmployeeID'
											) + CONVERT(VARCHAR,@Row) + '-OOFML000008,'
		SET @ErrorColumn = @ErrorColumn + 'EmployeeID,'				
		SET @ErrorFlag = 1
	END
	ELSE IF NOT EXISTS (SELECT TOP 1 1 FROM HT2803 WHERE DivisionID = @DivisionID AND EmployeeID = @EmployeeID AND TranMonth = @TranMonth AND TranYear = @TranYear)	
	BEGIN
		SET @ErrorMessage = @ErrorMessage + (SELECT TOP 1 DataCol FROM A00065 
											WHERE ImportTransTypeID = @ImportTransTypeID AND ColID = 'EmployeeID'
											) + CONVERT(VARCHAR,@Row) + '-OOFML000039,'
		SET @ErrorColumn = @ErrorColumn + 'EmployeeID,'				
		SET @ErrorFlag = 1
	END
	ELSE IF EXISTS (SELECT TOP 1 1 FROM HT1420 WHERE DivisionID = @DivisionID AND EmployeeID = @EmployeeID AND TranMonth = @TranMonth AND TranYear = @TranYear)	
	BEGIN
		SET @ErrorMessage = @ErrorMessage + (SELECT TOP 1 DataCol FROM A00065 
											WHERE ImportTransTypeID = @ImportTransTypeID AND ColID = 'EmployeeID'
											) + CONVERT(VARCHAR,@Row) + '-OOFML000040,'
		SET @ErrorColumn = @ErrorColumn + 'EmployeeID,'				
		SET @ErrorFlag = 1
	END
	--ELSE IF @FullName <> '' AND NOT EXISTS (SELECT TOP 1 1 FROM HV1400 WHERE EmployeeID = @EmployeeID  AND FullName = @FullName)
	--BEGIN
	--	SET @ErrorMessage = @ErrorMessage + (SELECT TOP 1 DataCol FROM A00065 
	--										WHERE ImportTransTypeID = @ImportTransTypeID AND ColID = 'FullName'
	--										) + CONVERT(VARCHAR,@Row) + '-OOFML000009,'
	--	SET @ErrorColumn = @ErrorColumn + 'FullName,'				
	--	SET @ErrorFlag = 1
	--END
		
---- Kiểm tra số ngày phép ban đầu phải lớn hơn 0
	--IF ISNULL(@FirstLoaDays, 0) <= 0	
	--BEGIN
	--	SET @ErrorMessage = @ErrorMessage + (SELECT TOP 1 DataCol FROM A00065 
	--										WHERE ImportTransTypeID = @ImportTransTypeID AND ColID = 'FirstLoaDays'
	--										) + CONVERT(VARCHAR,@Row) + '-OOFML000041,'
	--	SET @ErrorColumn = @ErrorColumn + 'FirstLoaDays,'				
	--	SET @ErrorFlag = 1
	--END
	
	IF @ErrorColumn <> ''
	BEGIN
		UPDATE HT2706 SET ErrorMessage = LEFT(@ErrorMessage, LEN(@ErrorMessage) -1),
						   ErrorColumn = LEFT(@ErrorColumn, LEN(@ErrorColumn) -1)
		WHERE [Row] = @Row
	END	
	
	FETCH NEXT FROM @Cur INTO @Row, @EmployeeID, @FullName, @FirstLoaDays, @FirstOTLeaveDays
END
CLOSE @Cur


IF @Mode = 1 -- nếu dữ liệu truyền xuống đã hết
BEGIN
	
	
	IF NOT EXISTS (SELECT TOP 1 1 FROM HT2706 WHERE TransactionKey = @TransactionKey AND ErrorColumn <> '') --- nếu không có lỗi
	BEGIN
		--- insert vào bảng số ngày phép ban đầu
		INSERT INTO HT1420 (DivisionID, TranMonth, TranYear, EmployeeID, FirstLoaDays, FirstOTLeaveDays, 
						   CreateUserID, CreateDate, LastModifyUserID, LastModifyDate)
		SELECT  HT2706.DivisionID, HT2706.TranMonth, HT2706.TranYear, EmployeeID,
				ROUND(FirstLoaDays, ISNULL(HT0000.HolidayDecimals, 0)) AS FirstLoaDays, ROUND(FirstOTLeaveDays, ISNULL(HT0000.HolidayDecimals, 0)) AS FirstOTLeaveDays,
				@UserID,GETDATE(),@UserID,GETDATE()
		FROM HT2706
		LEFT JOIN HT0000 WITH (NOLOCK) ON HT0000.DivisionID = HT2706.DivisionID
		WHERE TransactionKey = @TransactionKey
	END
	
END

EndMessage:;
SELECT [Row], ErrorColumn, ErrorMessage, ErrorMessage AS ImportMessage FROM HT2706 
WHERE TransactionKey = @TransactionKey AND TransactionID = @TransactionID AND ErrorColumn <> ''
ORDER BY [Row]

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO