---------------------------Phương thức thanh toán tổng hop-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0006' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0006' AND col.name='PaymentID')
	ALTER TABLE POST0006 ADD PaymentID varchar(100) NULL
END

---------------------------Phương thức thanh toán mặc dịnh-------------------------------------
IF EXISTS (SELECT * FROM sysobjects WHERE NAME='POST0006' AND xtype='U')
BEGIN
	IF NOT EXISTS (SELECT * FROM syscolumns col INNER JOIN sysobjects tab 
	ON col.id=tab.id WHERE tab.name='POST0006' AND col.name='IsDefault')
	ALTER TABLE POST0006 ADD IsDefault varchar(100) Default(0) NULL
END
