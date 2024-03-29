IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SP10001]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[SP10001]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----<Summary>
----Man hinh truy van load du lieu danh muc nguoi dung - Store SP10001
----<Param>
---- 
----<Return>
---- 
----<Reference>
---- 
----<History>
----Created by: Ho hoang tu, Date: 09/10/2014
----Modify by: Phan thanh hoang vu, 16/10/2014 
----Modify by: Trần Quốc Tuấn, 11/11/2014 bổ sung thêm trường khóa 
----Modified by Thanh Sơn on 01/12/2014: Bổ sung customize cho Xương Rồng
----Modified by Thị Phượng on 13/06/2016 :Cải tiến tốc độ
----Modified by Thị Phượng on 12/10/2016 :Bổ sung load AsoftAdmin khi người dung đăng nhập vào là ASOFTADMIN
----Modified by Trọng Kiên on 05/08/2020 :Fix lỗi không search được dữ liệu
----Modify by: Tấn Thành, Date :16/09/2020: Không load User Unassigned

CREATE PROCEDURE SP10001
( 
    @DivisionID NVARCHAR(50),
	@DivisionIDList NVARCHAR(2000),       
	@DepartmentID NVARCHAR(50),
	@EmployeeID NVARCHAR(50),
	@FullName NVARCHAR(50),
	@Address NVARCHAR(50),
	@Tel NVARCHAR(50),
	@Fax NVARCHAR(50),
	@Email NVARCHAR(50),
	@Disabled NVARCHAR(50),
	@IsCommon NVARCHAR(50), --0: không, 1: có, Null: tất cả
	@IsLock NVARCHAR(50), --- Null: tất cả, 0: không khóa, 1: Khóa
	@PageNumber INT,
    @PageSize INT,
	@IsSearch BIT ,
	@UserID  NVARCHAR(50)
) 
AS
DECLARE @sSQL NVARCHAR (MAX),
		@sSQL01 NVARCHAR (MAX),
		@sSQL02 NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX) = '',
		@OrderBy NVARCHAR(500)
        
SET @OrderBy = 'x.DivisionID, x.EmployeeID'					
IF @IsSearch = 1
BEGIN
	IF 	@DivisionIDList is null OR @DivisionIDList =''
		SET @sWhere = @sWhere + '
		AND (A13.DivisionID = '''+@DivisionID+'''  or A13.IsCommon =1) '	
	ELSE  
		SET @sWhere = @sWhere + '
		AND (A13.DivisionID IN ('''+@DivisionIDList+''') or A13.IsCommon =1)' 			  	
	IF isnull(@DepartmentID, '') != '' SET @sWhere = @sWhere + '
	AND ISNULL(A13.DepartmentID,'''') LIKE ''%'+@DepartmentID+'%'' '
	IF isnull(@EmployeeID, '') != '' SET @sWhere = @sWhere + '
	AND A13.EmployeeID LIKE ''%'+@EmployeeID+'%'' '
	IF isnull(@FullName, '') != '' SET @sWhere = @sWhere + '
	AND A13.FullName LIKE N''%'+@FullName+'%'' '
	IF isnull(@Address, '') != '' SET @sWhere = @sWhere + '
	AND A13.Address LIKE N''%'+@Address+'%'' '
	IF isnull(@Tel, '') != '' SET @sWhere = @sWhere + '
	AND A13.Tel LIKE ''%'+@Tel+'%'' '
	IF isnull(@Fax, '') != '' SET @sWhere = @sWhere + '
	AND A13.Fax LIKE ''%'+@Fax+'%'' '
	IF isnull(@Email, '') != '' SET @sWhere = @sWhere + '
	AND A13.Email LIKE ''%'+@Email+'%'' '
	IF isnull(@Disabled, '') != '' SET @sWhere = @sWhere + '
	AND A13.Disabled = '''+@Disabled+''' '
	IF isnull(@IsCommon, '') != '' SET @sWhere = @sWhere + '
	AND A13.IsCommon = '''+@IsCommon+''' '
	IF isnull(@IsLock, '') != '' SET @sWhere = @sWhere + '
	AND ISNULL(A05.IsLock, ''0'') LIKE '''+@IsLock+''' '
END

SET @sSQL01 = '		DECLARE @AT1103 table 
								(	APK NVARCHAR(Max),
									DivisionID NVARCHAR(50),
									EmployeeID NVARCHAR(50),
									FullName NVARCHAR(250),
									DepartmentID NVARCHAR(50),
									Address NVARCHAR(250),
									Tel NVARCHAR(100),
									Email NVARCHAR(100),
									CreateUserID NVARCHAR(50),
									CreateDate Datetime,
									LastModifyUserID NVARCHAR(50),
									LastModifyDate Datetime,
									Disabled int,
									IsLock int,
									IsCommon int, 
									QuantityMax DECIMAL(28,8), 
									FunctionID VARCHAR(50)
								)
								Insert into @AT1103 (APK, DivisionID, EmployeeID, FullName , DepartmentID , Address, Tel
														, Email, IsCommon, CreateUserID, LastModifyUserID,CreateDate, LastModifyDate,
														Disabled, IsLock, QuantityMax, FunctionID)
								Select Distinct A13.APK, A13.DivisionID, A13.EmployeeID, A13.FullName, A13.DepartmentID, A13.Address, A13.Tel,
									A13.Email, A13.IsCommon,A13.CreateUserID, A13.LastModifyUserID, A13.CreateDate, A13.LastModifyDate
									,A13.Disabled, A05.IsLock, A13.QuantityMax, A13.FunctionID
								FROM AT1103 A13 WITH (NOLOCK)
								INNER JOIN AT1405 A05 With (NOLOCK) ON  (A05.DivisionID = A13.DivisionID or A13.IsCommon=1) AND A05.UserID = A13.EmployeeID
					
								WHERE A05.UserID != ''ASOFTADMIN'' '+@sWhere
--Kiểm tra load mac định thì lấy tổng số trang, ngược lại thì không lấy tổng số trang (Cải tiến tốc độ )
			SET @sSQL02 = '		Declare @CountTotal NVARCHAR(Max)
								IF '+Cast(@PageNumber as varchar(2)) + ' = 1
									Set @CountTotal = (Select Count(APK) From @AT1103)
								Else
									Set @CountTotal = 0
									'

SET @sSQL = '
Select ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @CountTotal AS TotalRow, x.APK, x.DivisionID, x.EmployeeID, x.FullName, x.DepartmentID, x.Address, x.Tel,
x.Email, x.IsCommon,x.CreateUserID, x.LastModifyUserID, x.CreateDate, x.LastModifyDate, x.QuantityMax, x.FunctionID
,x.Disabled, x.IsLock From 
	(Select  APK, DivisionID, UserID as EmployeeID, UserName as FullName,
	null as DepartmentID,  null as Address, null as Tel,
	null as Email, 0 as IsCommon,null as CreateUserID, null as LastModifyUserID, null as CreateDate, null as LastModifyDate
	,0 as Disabled, 0 as IsLock, 0 AS QuantityMax, NULL AS FunctionID
	FROM AT1405  
	where UserID =''ASOFTADMIN'' and  '''+@UserID+''' = ''ASOFTADMIN'' and DivisionID ='''+@DivisionID+'''
	Union All
	SELECT 
	A13.Apk, A13.DivisionID, A13.EmployeeID, A13.FullName, A13.DepartmentID, A13.Address, A13.Tel,
	A13.Email, A13.IsCommon,A13.CreateUserID, A13.LastModifyUserID, A13.CreateDate, A13.LastModifyDate
	,A13.Disabled, A13.IsLock, A13.QuantityMax, A13.FunctionID
	FROM @AT1103 A13
	WHERE A13.EmployeeID NOT IN (''UNASSIGNED'') )x
ORDER BY '+@OrderBy+'
OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY 
'
EXEC (@sSQL01 + @sSQL02 + @sSQL)
--Print (@sSQL01 + @sSQL02 + @sSQL)


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
