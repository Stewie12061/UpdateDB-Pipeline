IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP00691]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[POSP00691]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- <Summary>
---- Load Grid Search hội viên POSF0069 và POSF0076
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: trí thiện, Date: 10/03/2015
----Modify by Hoàng vũ, on 01/02/2018: Load ra số điện thoại
----Modify by Thị Phượng, on 26/03/2018: Chỉ lấy 1 số điện thoại không lấy 2 số
----Modify by Hoàng vũ, on 01/02/2018: Search thêm số điện thoại
----Modify by Hoàng vũ, on 01/02/2018: Search thêm Tên công ty, Địa chỉ công ty
----Modify by Hoàng vũ, on 12/06/2019: Điều chỉnh sắp xếp
-- <Example>
----    EXEC POSP00691 'KY','','','',1,20
----
CREATE PROCEDURE POSP00691 ( 
        @DivisionID VARCHAR(50),  
		@DivisionIDList NVARCHAR(2000),  
        @MemberID nvarchar(50),
        @MemberName nvarchar(250),
		@PageNumber INT,
        @PageSize INT
) 
AS 
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50),
		@CustomizeName int
Set @CustomizeName = (Select CustomerName from CustomerIndex)
        
SET @sWhere = ''
SET @TotalRow = ''
SET @OrderBy = 'MemberID'

IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
--Check Para DivisionIDList null then get DivisionID 
	IF @DivisionIDList IS NULL or @DivisionIDList = ''
		SET @sWhere = @sWhere + 'DivisionID IN ('''+ @DivisionID+''',''@@@'')'
	Else 
		SET @sWhere = @sWhere + 'DivisionID IN ('''+@DivisionIDList+''',''@@@'')'
		
	SET @sWhere = @sWhere + ' AND ( (ISNULL(MemberID, '''') LIKE N''%' + ISNULL(@MemberID, '') +'%'') '
	SET @sWhere = @sWhere + ' OR (ISNULL(Phone,'''') LIKE N''%'+ ISNULL(@MemberName, '') +'%'')'
	SET @sWhere = @sWhere + ' OR (ISNULL(MemberName,'''') LIKE N''%'+ ISNULL(@MemberName, '') +'%'') )  '
If @CustomizeName = 82 
SET @sSQL='
SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, * FROM
(SELect APK, DivisionID, MemberID, MemberName, ShopID, ShortName,
	[Address], Identify, Phone,  Tel, Fax, Email, Birthday, AreaID, CityID, CountryID, AccruedScore, [Disabled], CreateUserID, CreateDate, LastModifyUserID, LastModifyDate
	FROM POST0011
	Union ALL 
SELect A.APK, A.DivisionID, A.EmployeeID MemberID, B.FUllNAME MemberName, A.ShopID, NULL ShortName,
	B.[Address], null Identify, B.Tel Phone,  B.Tel, B.Fax, B.Email, B.Birthday, NULL AreaID, NULL CityID, NULL CountryID, NULL AccruedScore, B.Disabled, A.CreateUserID, A.CreateDate, A.LastModifyUserID, A.LastModifyDate
	FROM POST00101 A
	Left JOIN AT1103 B ON A.EmployeeID = B.EmployeeID
	WHERE A.IsUsed =1 and isnull(A.DeleteFlg,0) = 0)B
	WHERE '+@sWhere+'
	ORDER BY '+@OrderBy+'
	OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
	FETCH NEXT '+STR(@PageSize)+' ROWS ONLY 
'
ELSE 	
SET @sSQL = '
	SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, DivisionID, MemberID, MemberName, ShopID, ShortName,
	[Address], Identify, IIF(ISNULL(POST0011.Phone, '''') != '''', POST0011.Tel, POST0011.Phone) AS Phone,
	Fax, Email, Birthday, AreaID, CityID, CountryID, AccruedScore, [Disabled], CreateUserID, CreateDate, LastModifyUserID, LastModifyDate, 
	VATNo, 
	CompanyName,
	CompanyAddress
	FROM POST0011
	WHERE '+@sWhere+'
	ORDER BY '+@OrderBy+'
	OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
	FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '


EXEC (@sSQL)
Print (@sSQL)



GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
