IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[DROPCONSTRAINT]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[DROPCONSTRAINT]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- Create by Thanh Sơn on 21/05/2014
-- Xóa contraint

CREATE PROCEDURE DROPCONSTRAINT
(
	@table_name VARCHAR(50),
	@col_name VARCHAR(50)
)
AS 
DECLARE @sSQL NVARCHAR(2000)		
SELECT @sSQL= 'ALTER TABLE ' + @table_name + ' DROP CONSTRAINT ' + d.name
FROM sys.tables t 
JOIN sys.default_constraints d ON d.parent_object_id = t.object_id  
JOIN sys.columns c ON  c.object_id = t.object_id AND c.column_id = d.parent_column_id
WHERE t.name = @table_name
AND c.name = @col_name
EXEC(@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO

