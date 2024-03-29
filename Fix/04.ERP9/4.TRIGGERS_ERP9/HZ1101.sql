IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[HZ1101]') AND OBJECTPROPERTY(ID, N'IsTrigger') = 1)
DROP TRIGGER [DBO].[HZ1101]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

/*
Chuyển danh mục tổ nhóm qua danh mục người dùng của Xương Rồng 
*/
 
CREATE TRIGGER [dbo].[HZ1101] ON [dbo].[HT1101]
FOR UPDATE 
AS
DECLARE @TeamID VARCHAR(50)

SELECT @TeamID = TeamID FROM INSERTED

IF (NOT EXISTS (SELECT TOP 1 1 FROM AT1103 WHERE EmployeeID = @TeamID)
AND (SELECT TOP 1 ISNULL(CustomerName, 0) FROM CustomerIndex) = 34) -- Customize Xương Rồng
INSERT INTO AT1103 (DivisionID, EmployeeID, FullName, DepartmentID, IsUserID, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate)
SELECT DivisionID, TeamID, TeamName, DepartmentID, 1, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate
FROM INSERTED

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
