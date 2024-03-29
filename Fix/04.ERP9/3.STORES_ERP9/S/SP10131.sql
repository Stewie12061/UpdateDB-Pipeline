IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SP10131]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[SP10131]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- <Summary>
--- Load Grid danh sách người dùng
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Nguyễn Chánh Thi Create date: 13/10/2014
----Modified by Thanh Sơn on 01/12/2014
----Modified by Tấn Thành on 21/08/2020
----Modified by Tấn Thành on 16/09/2020: Thêm điều kiện không load user UNASSIGNED
----Modified By Tấn Thành on 22/09/2020: Thêm điều kiện không load User đã bị khóa
----Modified By Văn Tài   on 09/12/2021: Bổ sung trường hợp load tài khoản dùng chung. (Hỗ trợ đăng nhập, chuyển đổi làm việc 2 Division trở lên).
/*
	EXEC SP10131 'KC','ADMIN',1,50
*/
 CREATE PROCEDURE SP10131
(
     @DivisionID VARCHAR(50),
	 @GroupID VARCHAR(50), -- APK truyền từ màn hinh POSF0054.
	 @ListUserID VARCHAR(MAX), -- List User không load ra.
	 @TxtSearch NVARCHAR(MAX), -- Tìm kiếm theo UserName và UserID.
	 @DepartmentID VARCHAR(50), -- Lọc theo Khối.
	 @SectionID VARCHAR(50) = NULL, -- Lọc theo phòng ban.
	 @PageNumber INT,
     @PageSize INT
)
AS
DECLARE @sSQL NVARCHAR(MAX), @sWhere NVARCHAR(MAX) = ''
-- Customize Xương Rồng (34)
IF ISNULL((SELECT TOP 1 CustomerName FROM CustomerIndex), 0) = 34
	SET @sWhere = '
AND A.UserID NOT IN (SELECT TeamID FROM HT1101 WHERE DivisionID = ''' + @DivisionID + ''')'

IF ISNULL(@ListUserID,'') != ''
	SET @sWhere = @sWhere + 'AND A.UserID NOT IN ('''+ @ListUserID +''')'

IF ISNULL(@TxtSearch, '') != ''
	SET @sWhere = @sWhere + 'AND (A.UserID LIKE N''%'+ @TxtSearch+ '%'' OR A.UserName LIKE N''%'+ @TxtSearch+ '%'')'

IF ISNULL(@DepartmentID, '') != ''
	SET @sWhere = @sWhere + ' AND A.UserID IN (SELECT A1.EmployeeID AS UserID FROM AT1103 A1 WITH (NOLOCK) WHERE A1.DepartmentID = '''+ @DepartmentID + ''')'
SET @sSQL = '
SELECT ROW_NUMBER() OVER (ORDER BY A.UserID) AS RowNum, COUNT(*) OVER () AS TotalRow, A.UserID, A.UserName
FROM AT1405 A WITH (NOLOCK)
	LEFT JOIN AT1103 A2 WITH(NOLOCK) ON A2.EmployeeID = A.UserID
WHERE A.DivisionID IN (''@@@'',  ''' + @DivisionID + ''')
AND A.Disabled = 0 ' + @sWhere + ' AND A.UserID NOT IN(''UNASSIGNED'')
AND ISNULL(A.IsLock,0) = 0
AND A.UserID NOT IN (SELECT UserID FROM AT1402 WITH (NOLOCK) WHERE DivisionID = ''' + @DivisionID + ''' AND GroupID = ''' + @GroupID + ''')
AND ISNULL(A2.Disabled,0) = 0
ORDER BY UserID '

EXEC (@sSQL)
PRINT (@sSQL)


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
