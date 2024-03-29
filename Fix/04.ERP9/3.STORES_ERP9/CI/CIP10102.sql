IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP10102]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CIP10102]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Kiểm tra Sửa/Xóa Danh mục tổ nhóm
---- Xóa danh mục Nhân viên
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Nguyễn Thanh Sơn, Date: 02/11/2014
-- <Example>
---- 
/*
	EXEC CIP10102 @DivisionID = 'EIS', @UserID = '', @TeamIDList = 'HK1_2014'',''HK2_2014' , @Mode = 1
	EXEC CIP10102 @DivisionID = 'EIS', @UserID = '', @TeamID = 'HK1_2014', @Mode = 0
*/

CREATE PROCEDURE CIP10102
( 
	@DivisionID VARCHAR(50),	--Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
	@TeamIDList NVARCHAR(MAX),	--Trường hợp Delete 1 hoặc nhiều record
	@ID NVARCHAR(50),			--Trường hợp Edit chỉ 1 record
	@TableName NVARCHAR(250),	--Là bảng cần xóa record
	@Mode TINYINT				--0: Edit, 1: Delete
) 
AS 
DECLARE @sSQL NVARCHAR(MAX),
		@sSQL1 NVARCHAR(MAX)

IF @Mode = 1 SET @sSQL = '
DECLARE @Cur CURSOR,
		@Params1 NVARCHAR(MAX),
		@Params2 NVARCHAR(MAX),
		@DelDivisionID VARCHAR(50),
		@DelTeamID VARCHAR(50)
		
SET @Params1 = ''''
SET @Params2 = ''''
SET @Cur = CURSOR SCROLL KEYSET FOR
SELECT DivisionID, TeamID FROM HT1101 WHERE TeamID IN ('''+@TeamIDList+''')
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelTeamID
WHILE @@FETCH_STATUS = 0
BEGIN
	IF (@DelDivisionID <> '''+@DivisionID+''')   --kiểm tra khác DivisionID
		SET @Params1 = @Params1 + @DelTeamID+ '', ''
	ELSE
		BEGIN		
			IF (EXISTS (SELECT TOP 1 1 FROM HT1400 WHERE TeamID = @DelTeamID)
				OR EXISTS (SELECT TOP 1 1 FROM DRT2012 WHERE TeamID = @DelTeamID))-- kiểm tra đã được sử dụng	
				SET @Params2 = @Params2 + @DelTeamID+ '', ''			
			ELSE
				BEGIN
					DELETE HT1101 WHERE TeamID = @DelTeamID
					DELETE CIT1013 WHERE TeamID = @DelTeamID
				END
		END	
	FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelTeamID
END 
IF @Params1 <> '''' SET @Params1 = LEFT(@Params1, LEN(@Params1)- 1)
IF @Params2 <> '''' SET @Params2 = LEFT(@Params2, LEN(@Params2)- 1)

SELECT * FROM
(
SELECT 2 AS Status,''00ML000050'' AS MessageID, @Params1 AS Params             
UNION ALL 
SELECT 2 AS Status,''00ML000082'' AS MessageID, @Params2 AS Params
)A WHERE A.Params <> '''' '

IF @Mode = 0 SET @sSQL = '
DECLARE @Params NVARCHAR(MAX),
		@MessageID VARCHAR(50)
SET @Params = ''''

IF ('''+@DivisionID+''' <> (SELECT TOP 1 DivisionID FROM DRT1000 WHERE TeamID = '''+@ID+''')) -- kiểm tra khác Division
	BEGIN
		SET @Params = '''+@ID+'''
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

