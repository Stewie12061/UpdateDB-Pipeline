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
----Modified by Hoàng Vũ on 18/05/2017: Load lưới chi tiết bị double nhiều lần userID
----Modified by Tấn Thành on 24/08/2020: Bổ sung load UserJoinRoleID, thêm điều kiện WHERE không load những USER đã Disabled và đã khóa.
----Modified By Văn Tài   on 09/12/2021: Bổ sung trường hợp load tài khoản dùng chung. (Hỗ trợ đăng nhập, chuyển đổi làm việc 2 Division trở lên).
/*
	EXEC SP10121 'AS','ADMIN',1,50
*/
 CREATE PROCEDURE SP10121
(
     @DivisionID VARCHAR(50),
	 @GroupID VARCHAR(50),
	 @PageNumber INT,
     @PageSize INT
)
AS
SELECT Distinct A02.GroupID, A02.UserID, A05.UserName, A02.UserJoinRoleID into #AT1402Temp
FROM AT1402 A02 
	LEFT JOIN AT1405 A05 ON A05.DivisionID IN ('@@@', A02.DivisionID) AND A05.UserID = A02.UserID
	LEFT JOIN AT1103 A06 ON A06.DivisionID IN ('@@@', A06.DivisionID) AND A06.EmployeeID = A02.UserID
WHERE A02.DivisionID IN ('@@@', @DivisionID) 
		AND A02.GroupID = @GroupID 
		AND ISNULL(A05.[Disabled],0) = 0 
		AND ISNULL(A05.IsLock,0) = 0 
		AND ISNULL(A06.[Disabled],0) = 0

SELECT  ROW_NUMBER() OVER (ORDER BY A02.UserID, A02.UserName) AS RowNum, COUNT(*) OVER () AS TotalRow, 
	A02.GroupID, A02.UserID, A02.UserName, A02.UserJoinRoleID
FROM #AT1402Temp A02
Order by A02.UserID, A02.UserName

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
