-------------Create on  20/12/2013 by Khanh Van
-------------Create on  03/06/2020 by Le Hoang - kiem tra GroupID khác NULL 


DECLARE @Division nvarchar(50),
		@GroupID NVARCHAR(50),
		@ModuleID NVARCHAR(50)

DECLARE cur_AllDivision CURSOR FOR
SELECT AT1101.DivisionID, AT1401.GroupID, ModuleID FROM AT1101
LEFT JOIN AT1401
	ON	AT1401.DivisionID = AT1101.DivisionID
LEFT JOIN AT1409
	ON AT1409.DivisionID = AT1101.DivisionID
WHERE ISNULL(AT1401.GroupID,'') <> ''

OPEN cur_AllDivision
FETCH NEXT FROM cur_AllDivision INTO @Division, @GroupID, @ModuleID

WHILE @@fetch_status = 0
  BEGIN
	
	IF NOT EXISTS (SELECT TOP 1 1 FROM AT1406 WHERE DataType = 'PE' 
													AND DivisionID = @Division 
													AND GroupID = @GroupID
													AND ModuleID = @ModuleID)
		BEGIN
			INSERT INTO AT1406	(	DivisionID,	ModuleID,GroupID,DataID,DataType,	Permission,
									CreateDate,	CreateUserID,LastModifyUserID,	LastModifyDate)
			Select top 1 @Division, @ModuleID, @GroupID, CAST(BeginMonth AS varchar(2))+'/' +Cast(beginyear as varchar(4)), 'PE', 1, getdate(), 'ADMIN', 'ADMIN',GETDATE()
			From AT1101 where divisionID =@Division 

		END
	
	
    FETCH NEXT FROM cur_AllDivision INTO @Division,@GroupID, @ModuleID
  END
  
CLOSE cur_AllDivision
DEALLOCATE cur_AllDivision
