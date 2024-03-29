-- <Summary>
---- Insert dữ liệu vào bảng thiết lập của module đào tạo
-- <History>
---- Create on 15/09/2017 by Hải Long
---- Modified on ... by ...
---- <Example>
DECLARE @DivisionID NVarchar(50)
DECLARE cur_AllDivision CURSOR FOR
SELECT AT1101.DivisionID FROM AT1101

OPEN cur_AllDivision
FETCH NEXT FROM cur_AllDivision INTO @DivisionID

WHILE @@fetch_status = 0
BEGIN	
	IF NOT EXISTS ( SELECT TOP 1 1 FROM HRMT0001 WHERE DivisionID = @DivisionID)
	INSERT INTO HRMT0001 (APK, DivisionID) 
	VALUES (NEWID(), @DivisionID)
	FETCH NEXT FROM cur_AllDivision INTO @DivisionID
END  
CLOSE cur_AllDivision
DEALLOCATE cur_AllDivision