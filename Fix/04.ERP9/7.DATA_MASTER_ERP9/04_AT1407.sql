-------------Create on 20/12/2013 by khanh Van
-------------Edit 15/05/2012 by Thien Huynh: Bo sung them vao ky ke toan dau tien


DECLARE @Division nvarchar(50),
		@ModuleID NVARCHAR(50)


DECLARE cur_AllDivision CURSOR FOR
SELECT AT1101.DivisionID, ModuleID FROM AT1101
LEFT JOIN AT1409
	ON AT1409.DivisionID = AT1101.DivisionID

OPEN cur_AllDivision
FETCH NEXT FROM cur_AllDivision INTO @Division, @ModuleID

WHILE @@fetch_status = 0
  BEGIN
	IF NOT EXISTS (SELECT TOP 1 1 FROM AT1407 WHERE DataType = 'PE' 
													AND DivisionID = @Division 
													AND ModuleID = @ModuleID)
		BEGIN
			INSERT INTO AT1407	(	DivisionID,	ModuleID,DataID,DataName, DataType,
									CreateDate,	CreateUserID,LastModifyUserID,	LastModifyDate)
			Select @Division, @ModuleID, CAST(BeginMonth AS varchar(2))+'/' +Cast(beginyear as varchar(4)), N'Kỳ kế toán'+ CAST(BeginMonth AS varchar(2))+'/' +Cast(beginyear as varchar(4)),'PE', GETDATE(),'ADMIN', 'ADMIN',GETDATE()
			 From AT1101 where divisionID =@Division 

		END

    FETCH NEXT FROM cur_AllDivision INTO @Division, @ModuleID
  END
  
CLOSE cur_AllDivision
DEALLOCATE cur_AllDivision
