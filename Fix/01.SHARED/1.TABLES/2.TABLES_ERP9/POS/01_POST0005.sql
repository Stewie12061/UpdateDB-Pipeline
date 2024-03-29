---------------------------Xóa Constraints cột AutoUpgradeCard ,AutoDecreaseCard-------------------------------------

DECLARE @defaultconstraint sysname
DECLARE @DropStmt NVARCHAR(500)
DECLARE @TableCur CURSOR

SET @TableCur = CURSOR SCROLL KEYSET FOR
SELECT NAME 
FROM sys.default_constraints 
WHERE parent_object_id = object_ID('POST0005') 
AND ( NAME Like '%DF__POST0005__AutoUp%' OR NAME Like '%DF__POST0005__AutoDe%')

OPEN @TableCur
FETCH NEXT FROM @TableCur INTO @defaultconstraint
WHILE @@FETCH_STATUS = 0
BEGIN	
	SET @DropStmt = 'ALTER TABLE POST0005 DROP CONSTRAINT ' + @defaultconstraint
	EXEC (@DropStmt)
	FETCH NEXT FROM @TableCur INTO @defaultconstraint
END	
CLOSE @TableCur

---------------------------Xóa cột AutoUpgradeCard-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0005' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0005' AND col.name='AutoUpgradeCard')
	ALTER TABLE POST0005 Drop Column AutoUpgradeCard
END

---------------------------Xóa cột AutoDecreaseCard-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0005' AND xtype='U')
BEGIN
	IF EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0005' AND col.name='AutoDecreaseCard')
	ALTER TABLE POST0005 Drop Column AutoDecreaseCard
END

