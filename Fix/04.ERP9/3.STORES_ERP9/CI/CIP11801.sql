IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'CIP11801') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE CIP11801
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Grid Form CIP11801 Danh muc bộ đính mức kít
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 12/05/2016
-- <Example>
----EXEC CIP11801 'HT','HT'',''Q7'',''TB',null,null,'157',null,null, 'NV01',1,10


CREATE PROCEDURE CIP11801 ( 
        @DivisionID VARCHAR(50),  --Biến môi trường
		@DivisionIDList NVARCHAR(2000),  --Chọn trong DropdownChecklist DivisionID
        @KITID nvarchar(100), 
		@KITName nvarchar(50),
		@EmployeeName nvarchar(50),
     	@DisabledName nvarchar(50),
		@IsCommonName nvarchar(50),
        @UserID  VARCHAR(50),
		@PageNumber INT,
		@PageSize INT		
) 
AS 
BEGIN
	DECLARE @sSQL01 NVARCHAR (MAX),
		@sSQL02 NVARCHAR (MAX),
		@sSQL03 NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
		@OrderBy NVARCHAR(500)
		
		

	SET @sWhere = ''
	SET @OrderBy = 'AT1325.DivisionID, AT1325.KITID'

	--Check DivisionIDList null then get DivisionID 
	IF @DivisionIDList IS NULL or @DivisionIDList = ''
		SET @sWhere = @sWhere + 'and (AT1325.DivisionID = '''+ @DivisionID+''' or AT1325.IsCommon = 1)'
	Else 
		SET @sWhere = @sWhere + 'and (AT1325.DivisionID IN ('''+@DivisionIDList+''') or AT1325.IsCommon = 1)'
		
	IF isnull(@KITID, '') != ''
		SET @sWhere = @sWhere +  'AND ISNULL(AT1325.KITID,'''') LIKE N''%'+@KITID+'%'' '
	
	IF isnull(@KITName, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(AT1325.KITName, '''') LIKE N''%'+@KITName+'%'' '
	
	IF isnull(@EmployeeName, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(AT1325.EmployeeIDName,'''') LIKE N''%'+@EmployeeName+'%'''
	
	IF Isnull(@DisabledName, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(AT1325.Disabled,0) ='+@DisabledName
	
	IF isnull(@IsCommonName, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(AT1325.IsCommon,0) = '+@IsCommonName
	
	
	--Lấy Distinct bộ kít
	SET @sSQL01 = '		DECLARE @AT1325 table 
						(
							DivisionID NVARCHAR(Max),
							KITID NVARCHAR(Max),
							KITName NVARCHAR(Max),
							EmployeeID NVARCHAR(Max),
							EmployeeName NVARCHAR(Max),
							EmployeeIDName NVARCHAR(Max),
							Disabled Tinyint,
							IsCommon Tinyint
						)
						Insert into @AT1325 (DivisionID, KITID, KITName, EmployeeID , EmployeeName, EmployeeIDName, Disabled, IsCommon)
						SELECT AT1325.DivisionID 
							  , AT1325.KITID, AT1325.KITName
							  , AT1325.EmployeeID, AT1103.FullName as EmployeeName
							  , AT1325.EmployeeID+''-''+ AT1103.FullName as EmployeeIDName
							  , AT1325.DISABLED, AT1325.IsCommon
							  FROM AT1325 WITH (NOLOCK) Left join AT1103 WITH (NOLOCK) on AT1325.EmployeeID = AT1103.EmployeeID	'
	--Kiểm tra load mac định thì lấy tổng số trang, ngược lại thì không lấy tổng số trang (Cải tiến tốc độ )
	SET @sSQL02 = '		Declare @CountTotal NVARCHAR(Max)
						DECLARE @CountEXEC table (CountRow NVARCHAR(Max))
						IF '+Cast(@PageNumber as varchar(2)) + ' = 1
						Begin
							Insert into @CountEXEC (CountRow)
							Select Count(KITID) From @AT1325 AT1325 WHERE 1=1 '+@sWhere + '
						End'
	--Lấy kết quả
	SET @sSQL03 = '		SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, (Select CountRow from @CountEXEC) AS TotalRow	
							  , AT1325.DivisionID
							  , AT1325.KITID, AT1325.KITName
							  , AT1325.EmployeeID, AT1325.EmployeeName
							  , AT1325.Disabled, AT1325.IsCommon
							  FROM  @AT1325 AT1325
						WHERE 1=1 '+@sWhere + '
						ORDER BY '+@OrderBy+'
						OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
						FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
	EXEC (@sSQL01+@sSQL02+@sSQL03)
END	