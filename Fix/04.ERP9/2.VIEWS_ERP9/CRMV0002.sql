IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CRMV0002]') AND OBJECTPROPERTY(ID, N'IsView') = 1)
DROP VIEW [DBO].[CRMV0002]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Loại giấy
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Kiều Nga, date: 18/02/2020
-- <Example>
---- 

CREATE VIEW [dbo].[CRMV0002] 
AS 

select 0 as PaperTypeID , N'OFFSET' as PaperTypeName  
Union all  
select 1 as PaperTypeID , N'CARTON' as PaperTypeName  
Union all  
select 2 as PaperTypeID , N'OFFSET BOI CARTON' as PaperTypeName

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO