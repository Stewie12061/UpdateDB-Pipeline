IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SP10121]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[SP10121]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load Grid danh sách người dùng thuộc nhóm người dùng 
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Phan thanh hoang vu --Create date: 05/08/2014
----Modified by Thanh Sơn on 01/12/2014
/*
	EXEC SP10121 'KC','ADMIN',1,50
*/
 CREATE PROCEDURE SP10121
(
     @DivisionID VARCHAR(50),
	 @GroupID VARCHAR(50),
	 @PageNumber INT,
     @PageSize INT
)
AS
SELECT ROW_NUMBER() OVER (ORDER BY A02.UserID) AS RowNum, COUNT(*) OVER () AS TotalRow, 
	A02.UserID, A05.UserName
FROM AT1402 A02
LEFT JOIN AT1405 A05 ON A05.UserID = A02.UserID
WHERE A02.DivisionID = @DivisionID
AND A02.GroupID = @GroupID
ORDER BY A02.UserID

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
