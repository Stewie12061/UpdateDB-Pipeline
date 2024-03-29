IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[GetNumberText]') AND XTYPE IN (N'FN', N'IF', N'TF')) DROP FUNCTION [GetNumberText]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Hàm loại bỏ các ký tự đặc biệt, nhận về chuỗi số
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
----
-- <History>
---- Created by Vĩnh Tâm on 06/12/2019
-- <Example>
CREATE FUNCTION [dbo].GetNumberText
(
    @Value NVARCHAR(MAX)
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
	-- Chỉ giữ lại các giá trị số
	DECLARE @KeepValues varchar(50) = '%[^0-9]%'

	WHILE PATINDEX(@KeepValues, @Value) > 0
		SET @Value = STUFF(@Value, PATINDEX(@KeepValues, @Value), 1, '')

	RETURN @Value
END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
