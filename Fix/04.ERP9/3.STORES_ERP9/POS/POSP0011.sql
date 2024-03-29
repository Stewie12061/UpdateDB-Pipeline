IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0011]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP0011]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Grid Form POSP0011 Danh muc hội viên
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 31/03/2014
----Modify By Thị Phượng, Bổ sung trường IsCommon on 13/06/2016
----Modified by Thị Phượng, Bổ sung chỉnh sửa sort dữ liệu ngày tạo
----Modified by Hoàng Vũ, on 29/01/2018: Bổ sung điều kiện search thời gian người tạo (Làm bên OKIA, đưa vào bảng chuẩn POS)
----Modified by Hoàng Vũ, on 19/04/2019: Lấy trường mã số thuế ra
-- <Example> EXEC POSP0011 '2018-01-01', '2018-01-10', 'HCM', 'HCM'',''DN'',''HP'',''HN', '', '', '', '', '', '', '', '', '', 0, '', 1, 20, 1, 'As'

CREATE PROCEDURE POSP0011 ( 
        @FromDate Datetime,
		@ToDate Datetime,
		@DivisionID VARCHAR(50),  
		@DivisionIDList NVARCHAR(2000),  
        @MemberID nvarchar(50),
        @MemberName nvarchar(250),
		@ShopID varchar(50),
        @Address nvarchar(100), 
		@Identify nvarchar(100), 
		@Phone nvarchar(100), 
        @Tel nvarchar(100),
        @Fax nvarchar(100),
        @Email nvarchar(100),
        @DisabledName nvarchar(100),
        @IsCommon nvarchar(100),
		@PageNumber INT,
        @PageSize INT,
		@IsExcel BIT, --1: thực hiện xuất file Excel; 0: Thực hiện Filter
		@UserID NVARCHAR(20)
) 
AS 
BEGIN
	DECLARE @sSQL NVARCHAR (MAX),
			@sSQL01 NVARCHAR (MAX),
			@sSQL02 NVARCHAR (MAX),
			@sWhere NVARCHAR(MAX),
			@OrderBy NVARCHAR(500)
        
		SET @sWhere = ''
		SET @OrderBy = ' x.CreateDate DESC, x.MemberID'
	

		--Check Para DivisionIDList null then get DivisionID 
		IF isnull(@DivisionIDList, '') != '' 
			SET @sWhere = @sWhere + ' DivisionID IN ('''+ @DivisionIDList+''', ''@@@'')'
		Else 
			SET @sWhere = @sWhere + ' DivisionID IN ('''+@DivisionID+''', ''@@@'')'

		IF (Isnull(@FromDate, '') = '' and Isnull(@ToDate, '') != '')
			SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10), CreateDate,112) <= '+ CONVERT(VARCHAR(10),@ToDate,112)+''
		ELSE IF (Isnull(@FromDate, '') != '' and Isnull(@ToDate, '') = '')
			SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10), CreateDate,112) >= '+ CONVERT(VARCHAR(10),@FromDate,112)+''
		ELSE IF (Isnull(@FromDate, '') != '' and Isnull(@ToDate, '') != '')
			SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10), CreateDate,112) BETWEEN '+CONVERT(VARCHAR(10),@FromDate,112)+' AND '+CONVERT(VARCHAR(10),@ToDate,112)+''
		ELSE
			SET @sWhere = @sWhere

		IF isnull(@MemberID, '') != '' 
			SET @sWhere = @sWhere + ' AND MemberID LIKE N''%'+@MemberID+'%'' '
		IF isnull(@MemberName, '') != ''
			SET @sWhere = @sWhere + ' AND ISNULL(MemberName,'''') LIKE N''%'+@MemberName+'%''  '
		IF isnull(@ShopID, '') != '' 
			SET @sWhere = @sWhere +  'AND ISNULL([ShopID],'''') LIKE N''%'+@ShopID+'%'' '
		IF isnull(@Address, '') != '' 
			SET @sWhere = @sWhere +  'AND ISNULL([Address],'''') LIKE N''%'+@Address+'%'' '
		IF isnull(@Identify, '') != '' 
			SET @sWhere = @sWhere +  'AND ISNULL(VATNo, Identify) LIKE N''%'+@Identify+'%'' '
		IF isnull(@Phone, '') != ''
			SET @sWhere = @sWhere +  'AND ISNULL(Phone,'''') LIKE N''%'+@Phone+'%'' '
		IF isnull(@Tel, '') != ''
			SET @sWhere = @sWhere + ' AND ISNULL([Tel],'''') LIKE N''%'+@Tel+'%'' '
		IF isnull(@Fax, '') != '' 
			SET @sWhere = @sWhere +  'AND ISNULL([Fax],'''') LIKE N''%'+@Fax+'%'' '
		IF isnull(@Email, '') != '' 
			SET @sWhere = @sWhere + ' AND ISNULL([Email],'''') LIKE N''%'+@Email+'%'' '
		IF isnull(@DisabledName, '') != ''
				SET @sWhere = @sWhere + ' AND ISNULL(Disabled,'''') = '''+@DisabledName+''''
		IF isnull(@IsCommon, '') != ''
				SET @sWhere = @sWhere + ' AND ISNULL(IsCommon,'''') = '''+@IsCommon+''''
		--Lay danh sach the hoi vien
		SET @sSQL01 = '		
				Select APK, DivisionID, MemberID, MemberName, ShopID , ShortName, [Address], Identify, VATNo, Phone,Tel, Fax, Email
						, Birthday,  AreaID, CityID, CountryID, AccruedScore, Disabled, IsCommon, CreateDate
						into #POST0011
				FROM POST0011 WITH (NOLOCK)
				WHERE '+@sWhere+''
			--Kiểm tra load mac định thì lấy tổng số trang, ngược lại thì không lấy tổng số trang (Cải tiến tốc độ )
		SET @sSQL02 = '		
				Declare @CountTotal NVARCHAR(Max)
				IF '+Cast(@PageNumber as varchar(50)) + ' = 1
					Set @CountTotal = (Select Count(APK) From #POST0011)
				Else
					Set @CountTotal = 0
				'
		IF @IsExcel = 0
			SET @sSQL = '
				SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @CountTotal AS TotalRow, x.DivisionID, x.MemberID, x.MemberName, x.ShopID, x.ShortName,
				x.[Address], Isnull(x.VATNo, x.Identify) as Identify, x.VATNo, x.Phone,  x.Tel, x.Fax, x.Email, x.Birthday, x.AreaID, x.CityID, x.CountryID, x.AccruedScore, x.[Disabled], x.IsCommon,x.CreateDate
				FROM #POST0011 x
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
		IF @IsExcel =1
			SET @sSQL = '
				SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @CountTotal AS TotalRow, x.DivisionID, x.MemberID, x.MemberName, x.ShopID, x.ShortName,
				x.[Address], Isnull(x.VATNo, x.Identify) as Identify, x.VATNo, x.Phone,  x.Tel, x.Fax, x.Email, x.Birthday, x.AreaID, x.CityID, x.CountryID, x.AccruedScore, x.[Disabled], x.IsCommon, x.CreateDate
				FROM #POST0011 x
				ORDER BY '+@OrderBy+' '
		EXEC (@sSQL01 + @sSQL02 +@sSQL)
		PRINT (@sSQL01 + @sSQL02 +@sSQL)
END		