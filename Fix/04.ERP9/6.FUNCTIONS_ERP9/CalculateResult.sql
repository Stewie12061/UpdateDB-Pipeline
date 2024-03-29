IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CalculateResult]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
	DROP PROCEDURE [DBO].[CalculateResult]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Tính kết quả thực hiện chỉ tiêu KPI từ 1 công thức
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---- Create on 22/02/2019 by Bảo Anh
---- Modified on
---- Example: 
--declare @p3 xml
--set @p3=convert(xml,N'<Data><ParameterID>@T001</ParameterID><Value>20</Value></Data>
--<Data><ParameterID>@T002</ParameterID><Value>4</Value></Data>
--<Data><ParameterID>@T003</ParameterID><Value>5</Value></Data>')
--EXEC CalculateResult ('@T001/@T002 + 8*@T003',@p3)

CREATE PROCEDURE [dbo].[CalculateResult]
(
	@DivisionID VARCHAR(50),
	@FormulaDes AS VARCHAR(250),
	@XML AS XML	--- danh sách tham số và giá trị tham số
)

AS

DECLARE @XMLTable AS Table (ParameterID VARCHAR(50), Value DECIMAL(28,8))
DECLARE	@Cur AS CURSOR,
		@ParameterID VARCHAR(50),
		@Value DECIMAL(20,2),
		@ConvertedDecimal INT,
		@SQL VARCHAR(MAX)

SET @ConvertedDecimal = (SELECT ConvertedDecimals FROM HT0000 WITH (NOLOCK) where DivisionID = @DivisionID)

INSERT INTO @XMLTable
SELECT	X.Data.query('ParameterID').value('.', 'VARCHAR(50)') AS ParameterID,
			X.Data.query('Value').value('.', 'DECIMAL(28,8)') AS Value
FROM	@XML.nodes('//Data') AS X (Data)


SET @Cur = CURSOR SCROLL KEYSET FOR 
			SELECT * FROM @XMLTable
        
OPEN @Cur
FETCH NEXT FROM @Cur INTO @ParameterID, @Value

WHILE @@Fetch_Status = 0 
	BEGIN
		SET @FormulaDes = REPLACE(@FormulaDes,@ParameterID,@Value)
		FETCH NEXT FROM @Cur INTO @ParameterID, @Value
	END

SET @SQL = 'SELECT CONVERT(DECIMAL(20,' + LTRIM(@ConvertedDecimal) + '),' +@FormulaDes + ') AS ResultValue'

EXEC(@SQL)



GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
