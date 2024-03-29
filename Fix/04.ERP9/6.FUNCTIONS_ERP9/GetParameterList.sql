IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[GetParameterList]') AND XTYPE IN (N'FN', N'IF', N'TF'))
DROP FUNCTION [DBO].[GetParameterList]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Trả ra danh sách tham số từ 1 chuỗi công thức
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---- Create on 22/02/2019 by Bảo Anh
---- Modified on
---- Example: SELECT * FROM dbo.[GetParameterList] ('@T001/@T002 + 8*@T003')

CREATE FUNCTION [dbo].[GetParameterList]
(
	@String AS VARCHAR(MAX)
)
RETURNS @DateTable TABLE 
(
    ParameterID VARCHAR(50),
	ParameterName NVARCHAR(500)
)
AS
BEGIN

DECLARE @Pos AS INT

SET @Pos = -1

SET @Pos = CHARINDEX('@',@String)

WHILE @Pos > 0
BEGIN
	INSERT INTO @DateTable (ParameterID, ParameterName)	
	SELECT SUBSTRING(@String,@Pos,5), ParameterName
	FROM KPIT10441 WITH (NOLOCK)
	WHERE ParameterID = SUBSTRING(@String,@Pos+1,4)

	SET @String = STUFF (@String, @Pos, 5, '')
	SET @Pos = CHARINDEX('@',@String)
END

RETURN

END