IF EXISTS (SELECT * FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[GetManagerList]') AND XTYPE IN (N'FN', N'IF', N'TF'))
DROP FUNCTION [DBO].[GetManagerList]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Lấy người đứng đầu mỗi cấp ứng với từng nhân viên theo sơ đồ tổ chức
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---- Create on 02/01/2019 by Bảo Anh
---- Modified on 07/06/2019 by Như Hàn: Sửa bảng HT1403 thành AT1103 lấy theo sơ đồ tổ chức trên 9
---- Modified on 11/03/2021 by Văn Tài: Bổ sung điều kiện Division IN thuộc bảng AT1103.
---- Modified on

CREATE FUNCTION [dbo].[GetManagerList]
(
	@DivisionID AS VARCHAR(50),
	@EmployeeID AS VARCHAR(50),
	@DirectionTypeID TINYINT = 0,	--- 0: duyệt từ dưới lên theo SĐTC, 1: duyệt từ trên xuống theo SĐTC
	@DepartmentID VARCHAR(50) = ''
)

RETURNS @ResultTable TABLE 
(
	LevelNo INT,
	ApproveLevelNo INT,
    ManagerID VARCHAR(50),
	DepartmentID VARCHAR(50)
)
AS
BEGIN

DECLARE @DepartmentID1 VARCHAR(50) = '',
		@Orders INT = 0,
		@ManagerID VARCHAR(50) = ''

DECLARE @TempTable TABLE (LevelNo INT, ManagerID VARCHAR(50), DepartmentID VARCHAR(50))

IF ISNULL(@DepartmentID,'') <> ''
	SET @DepartmentID1 = @DepartmentID
ELSE
	SELECT @DepartmentID1 = DepartmentID FROM AT1103 WITH (NOLOCK) WHERE DivisionID IN (@DivisionID, '@@@') AND EmployeeID = @EmployeeID

SELECT @ManagerID = ContactPerson FROM AT1102 WITH (NOLOCK) WHERE DivisionID IN ('@@@', @DivisionID) AND DepartmentID = @DepartmentID1

WHILE ISNULL(@ManagerID,'') <> ''
BEGIN

	SET @Orders = @Orders + 1
	INSERT INTO @TempTable (LevelNo,ManagerID,DepartmentID) VALUES (@Orders,@ManagerID, @DepartmentID1)

	IF EXISTS (SELECT 1 FROM AT1103 WITH (NOLOCK) WHERE  DivisionID IN (@DivisionID, '@@@') AND DepartmentID = @DepartmentID1 AND EmployeeID = @ManagerID)
		break

	SET @DepartmentID1 = ''
	SELECT @DepartmentID1 = DepartmentID FROM AT1103 WITH (NOLOCK) WHERE  DivisionID IN (@DivisionID, '@@@') AND EmployeeID = @ManagerID

	SET @ManagerID = ''
	SELECT @ManagerID = ContactPerson FROM AT1102 WITH (NOLOCK) WHERE DivisionID IN ('@@@', @DivisionID) AND DepartmentID = @DepartmentID1		
END

IF @DirectionTypeID = 0
	INSERT INTO @ResultTable (LevelNo,ApproveLevelNo,ManagerID,DepartmentID)
	SELECT ROW_NUMBER() OVER(ORDER BY LevelNo) AS LevelNo, ROW_NUMBER() OVER(ORDER BY LevelNo) AS ApproveLevelNo, ManagerID, DepartmentID
	FROM @TempTable
	ORDER BY LevelNo
ELSE
	INSERT INTO @ResultTable (LevelNo,ApproveLevelNo,ManagerID,DepartmentID)
	SELECT ROW_NUMBER() OVER(ORDER BY LevelNo DESC) AS LevelNo, ROW_NUMBER() OVER(ORDER BY LevelNo) AS ApproveLevelNo, ManagerID, DepartmentID
	FROM @TempTable
	ORDER BY LevelNo

RETURN

END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
