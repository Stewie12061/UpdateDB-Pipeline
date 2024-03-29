IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[INSERTHISTORY]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[INSERTHISTORY]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Insert lich su
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Trần Quốc Tuấn, Date: 16/09/2015
---- Edit by:
-- <Example>
---- 
/*
	INSERTHISTORY 'XR','ASOFTADMIN','DRT2010','ContractNo','','0004378410000006616'',''0004378410000011459'',''0004378410000014321','HISTORYXR','DRF2010',2
	INSERTHISTORY 'XR','ASOFTADMIN','DRT2010','ContractNo','0004378410000013349','','HISTORYXR','DRF2010',2
*/
CREATE PROCEDURE dbo.INSERTHISTORY
(
	@DivisonID VARCHAR(50),
	@UserID VARCHAR(50),
	@TableID VARCHAR(50),
	@ColumnKey VARCHAR(50)='',
	@KeyAPK VARCHAR(50)='',
	@ListKeyAPK VARCHAR(500)='',
	@DataHistory VARCHAR(50),
	@ScreenID VARCHAR(50),
	@ActionType TINYINT -- 1: add new 2: edit 3: delete...
)
AS
DECLARE @sSQL NVARCHAR(MAX)

IF ISNULL(@ColumnKey,'') =''
SET @ColumnKey= 'APK'

IF (EXISTS (SELECT TOP 1 1 FROM master.dbo.sysdatabases WHERE ('[' + name + ']' = @DataHistory OR name = @DataHistory)))
BEGIN
	
	  IF ISNULL(@KeyAPK,'')<>''
	  BEGIN
	  	SET @sSQL='DECLARE @Version INT,
		@NEWID VARCHAR(50)
SET @Version = ISNULL((SELECT TOP 1 Version FROM '+@DataHistory+'.dbo.Histories WHERE ReAPK='''+@KeyAPK+'''),0)
SET @NEWID = NEWID()
--Insert Master
INSERT INTO '+@DataHistory+'.dbo.Histories  (APK,ReAPK,	ActionType,	CreateDate,	CreateUserID,TableID,Version,ScreenID,ColumnPK)
VALUES (@NEWID,'''+@KeyAPK+''','+STR(@ActionType)+',GETDATE(),'''+@UserID+''','''+@TableID+''',@Version+1,'''+@ScreenID+''','''+@ColumnKey+''')
--Insert Detail
INSERT INTO '+@DataHistory+'.dbo.HistoryDetail (ReAPK,DATA) VALUES 
(@NEWID,(SELECT TOP 1 * FROM '+@TableID+' 
	  	WHERE '+@ColumnKey+'='''+@KeyAPK+''' FOR XML AUTO, ELEMENTS ))'
	  END
	  ELSE IF ISNULL(@ListKeyAPK,'')<>''
		BEGIN
	  	SET @sSQL='DECLARE @Version INT,
		@NEWID VARCHAR(50),
		@Cur CURSOR,
		@Value VARCHAR(50)
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT '+@ColumnKey+' FROM '+@TableID+' WHERE '+@ColumnKey+' IN ('''+@ListKeyAPK+''')
OPEN @Cur
FETCH NEXT FROM @Cur INTO @Value
WHILE @@FETCH_STATUS = 0
BEGIN	
	SET @Version = ISNULL((SELECT TOP 1 Version FROM '+@DataHistory+'.dbo.Histories WHERE ReAPK=@Value),0)
	  				SET @NEWID = NEWID()
	  				--Insert Master
	  				INSERT INTO '+@DataHistory+'.dbo.Histories  (APK,ReAPK,	ActionType,	CreateDate,	CreateUserID,TableID,Version,ScreenID,ColumnPK)
	  				VALUES (@NEWID,@Value,'+STR(@ActionType)+',GETDATE(),'''+@UserID+''','''+@TableID+''',@Version+1,'''+@ScreenID+''','''+@ColumnKey+''')
	  				--Insert Detail
	  				INSERT INTO '+@DataHistory+'.dbo.HistoryDetail (ReAPK,DATA) VALUES 
	  				(@NEWID,(SELECT TOP 1 * FROM '+@TableID+' 
	  						WHERE '+@ColumnKey+'=@Value FOR XML AUTO, ELEMENTS))
	FETCH NEXT FROM @Cur INTO  @Value
END'
END 
	  
END
EXEC (@sSQL)
--PRINT @sSQL
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
