IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'CIP11804') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE CIP11804
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Grid Form CIP11804 in bộ đính mức kít
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 12/05/2016
-- <Example>
----EXEC CIP11804 'HT','HT'',''Q7'',''TB',null,null,null,null,null, 'NV01'


CREATE PROCEDURE CIP11804 ( 
        @DivisionID VARCHAR(50),  --Biến môi trường
		@DivisionIDList NVARCHAR(2000),  --Chọn trong DropdownChecklist DivisionID
        @KITID nvarchar(100), 
		@KITName nvarchar(50),
		@EmployeeName nvarchar(50),
     	@DisabledName nvarchar(50),
		@IsCommonName nvarchar(50),
        @UserID  VARCHAR(50)
) 
AS 
BEGIN
	DECLARE @sSQL01 NVARCHAR (MAX),
		@sSQL02 NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX)

	SET @sWhere = ''
	
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
						SELECT  Distinct Case when AT1325.DivisionID = ''@@@'' then Null Else AT1325.DivisionID end as DivisionID
							  , AT1325.KITID, AT1325.KITName
							  , AT1325.EmployeeID, AT1103.FullName as EmployeeName
							  , AT1325.EmployeeID+''-''+ AT1103.FullName as EmployeeIDName
							  , AT1325.DISABLED, AT1325.IsCommon
							  FROM AT1325 WITH (NOLOCK) Left join AT1103 WITH (NOLOCK) on AT1325.EmployeeID = AT1103.EmployeeID	'
	--Lấy kết quả
	SET @sSQL02 = '		SELECT AT1325.DivisionID
							  , AT1325.KITID, AT1325.KITName
							  , AT1325.EmployeeID, AT1325.EmployeeName
							  , AT1325.Disabled, AT1325.IsCommon
							  FROM  @AT1325 AT1325
						WHERE 1=1 '+@sWhere + '
						ORDER BY AT1325.KITID, AT1325.KITName'
	EXEC (@sSQL01+@sSQL02)
END