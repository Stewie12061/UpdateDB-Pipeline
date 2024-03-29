IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[EDMF1004]') AND XTYPE IN (N'FN', N'IF', N'TF'))
	DROP FUNCTION [DBO].EDMF1004
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
---- <Summary>
---- Lấy số ngày trong tháng trừ đi thứ 7 và chủ nhật (Customize = BLUESKY)
---- <Param>
---- 
---- <Return>
---- 
---- <Reference>
---- 
---- <History>
---- Created on 
---- <Example> SELECT  DBO.EDMF1004('2019-07-01')

CREATE FUNCTION EDMF1004 (  
    @CURRENT_DATETIME AS DATETIME
) 
RETURNS INT

AS
BEGIN


DECLARE @D_O_M INT
DECLARE @COUNT_DAY_OF_MONTH INT =0;
DECLARE @d datetime = @CURRENT_DATETIME;
DECLARE @d_ater datetime

-- LẤY NGÀY CUỐI CÙNG CỦA THÁNG
SET @D_O_M = DAY(EOMONTH(@d));

WHILE(@D_O_M>0)
BEGIN 
	--PRINT @D_O_M
	-- KHỞI TẠO NGÀY THEO DAY, MONTH,YEAR
	SET @d_ater = datefromparts(YEAR(@D),MONTH(@d), @D_O_M)
	--SELECT DATENAME(weekday, @d_ater) 
	-- KIỂM TRA NẾU THỨ TRONG TUẦN KHÁC SUN AND SAT
	IF (DATENAME(weekday, @d_ater) <> 'Sunday' AND DATENAME(weekday, @d_ater) <> 'Saturday')
	BEGIN
		SET @COUNT_DAY_OF_MONTH = @COUNT_DAY_OF_MONTH + 1
	END

	-- TRỪ NGÀY ĐI 1
	SET @D_O_M = @D_O_M-1
END

RETURN @COUNT_DAY_OF_MONTH

END 






GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

