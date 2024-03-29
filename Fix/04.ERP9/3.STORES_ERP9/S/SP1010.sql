IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SP1010]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[SP1010]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Kiểm tra Sửa/Xóa Danh mục nhóm người dùng
---- Xóa danh mục nhóm người dùng
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Nguyễn Thanh Sơn, Date: 24/11/2014
----Modify by: Thị Phượng, Date 10/05/2017: Xóa nhóm vai trò khi xóa nhóm người dùng
-- <Example>
---- 
/*
	EXEC SP1010 @DivisionID = 'AS', @UserID = 'PHUONG', @GroupIDList = 'CON' , @Mode = 1
	EXEC SP1010 @DivisionID = 'EIS', @UserID = '', @GroupID = 'HK1_2014', @Mode = 0
*/

CREATE PROCEDURE SP1010
( 
  @DivisionID VARCHAR(50),
  @UserID VARCHAR(50),
  @GroupID VARCHAR(50) = NULL,
  @GroupIDList NVARCHAR(MAX) = NULL,
  @Mode TINYINT --0: Edit, 1: Delete
) 
AS 
DECLARE @sSQL NVARCHAR(MAX),
		@sSQL1 NVARCHAR(MAX)

IF @Mode = 1 SET @sSQL = '
DECLARE @Cur CURSOR,
		@Params1 NVARCHAR(MAX),
		@Params2 NVARCHAR(MAX),
		@DelDivisionID VARCHAR(MAX),
		@DelGroupID VARCHAR(MAX)
SET @Params1 = ''''
SET @Params2 = ''''
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT DivisionID, GroupID FROM AT1401 WHERE GroupID IN ('''+@GroupIDList+''') AND GroupID <> ''ADMIN''
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelGroupID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF (@DelDivisionID <> '''+@DivisionID+''')   --kiểm tra khác DivisionID
		SET @Params1 = @Params1 + @DelGroupID + '', ''
	ELSE
		BEGIN		
			IF EXISTS (SELECT TOP 1 1 FROM AT1402 WHERE GroupID = @DelGroupID)	-- kiểm tra đã được sử dụng	
				SET @Params2 = @Params2 + @DelGroupID + '', ''			
			ELSE 
			BEGIN
				DELETE FROM AT1406 WHERE GroupID = @DelGroupID AND DivisionID = '''+@DivisionID+'''  -- Phân quyền dữ liệu
				DELETE FROM AT1401 WHERE GroupID = @DelGroupID AND DivisionID = '''+@DivisionID+'''  -- Danh mục nhóm người dùng
				DELETE FROM DRT0130 WHERE GroupID = @DelGroupID AND DivisionID = '''+@DivisionID+''' -- Phân quyền chức năng	
				DELETE FROM ST10503 WHERE GroupID = @DelGroupID AND DivisionID = '''+@DivisionID+''' -- Xóa nhóm người dùng trong nhóm vai trò 					
			END
		END	
	FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelGroupID
END 
IF @Params1 <> '''' SET @Params1 = LEFT(@Params1, LEN(@Params1)- 1)
IF @Params2 <> '''' SET @Params2 = LEFT(@Params2, LEN(@Params2)- 1)

SELECT * FROM
(
SELECT 2 AS Status,''00ML000050'' AS MessageID, @Params1 AS Params             
UNION ALL 
SELECT 2 AS Status,''00ML000052'' AS MessageID, @Params2 AS Params
)A WHERE A.Params <> '''' '

IF @Mode = 0 SET @sSQL = '
DECLARE @Params NVARCHAR(MAX),
		@MessageID VARCHAR(50)
SET @Params = ''''
IF ('''+@DivisionID+''' <> (SELECT TOP 1 DivisionID FROM AT1401 WHERE GroupID = '''+@GroupID+''')) -- kiểm tra khác Division
	BEGIN
		SET @Params = '''+@GroupID+'''
		SET @MessageID = ''00ML000050''
	END
IF @Params <> '''' SET @Params = LEFT(@Params, LEN(@Params)- 1)
SELECT 2 AS Status, @MessageID AS MessageID, @Params AS Params
WHERE @Params <> ''''   '

EXEC (@sSQL)
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

