IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0010]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP0010]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load dữ liệu lên màn hình Danh mục cửa hàng
---- 
---- 
----
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoang vu, Date: 27/03/2014
----Modify by: Lê Thị Hạnh on 25/07/2014
---- Bổ sung lấy trường APK cho màn hình POSF0010 - Cột Thiết lập bảng giá
----Modify by: Cao THị Phượng on 06/06/2016 Cải tiến tốc độ Store
----Modify by Thị Phượng on 10/3/2016 bổ sung load trường BusinessArea
----Modify by Hoàng vũ on 13/01/2017 Biến bảng số điện thoại tel chuyển từ kiểu nguyên thành kiểu nvarchar
----Modify by Hoàng vũ on 20/12/2017 Bổ sung điều kiện isnull(AT14.IsEvents, 0) = 0 để chỉ load những cửa hàng, không load event (do cửa hàng và event lưu trữ cùng 1 bảng nên dùng trường này để phân biệt)
-- <Example>
----    EXEC POSP0010 'AS','','','','','','','','','','',1,20
----
CREATE PROCEDURE POSP0010 ( 
        @DivisionID VARCHAR(50),
		@DivisionIDList NVARCHAR(2000),
        @ShopID varchar(50),
        @ShopName nvarchar(250),
        @ObjectID varchar(50),
        @Address nvarchar(100), 
        @Tel nvarchar(100),
        @Fax nvarchar(100),
        @Email nvarchar(100),
        @DisabledName nvarchar(100),
        @UserID NVARCHAR, 
		@PageNumber INT,
        @PageSize INT
) 
AS 
DECLARE @sSQL NVARCHAR (MAX),
		@sSQL01 NVARCHAR (MAX),
		@sSQL02 NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500)
        
	SET @sWhere = ''
	SET @OrderBy = 'DivisionID, ShopID'

--Check Para DivisionIDList null then get DivisionID 
	IF @DivisionIDList IS NULL or @DivisionIDList = ''
		SET @sWhere = @sWhere + 'AND DivisionID = '''+ @DivisionID+''''
	Else 
		SET @sWhere = @sWhere + 'AND DivisionID IN ('''+@DivisionIDList+''')'

	IF Isnull(@ShopID,'') != ''
		SET 
		@sWhere = @sWhere + ' AND ShopID LIKE ''%'+@ShopID+'%'' '
	IF Isnull(@ShopName,'') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(ShopName,'''') LIKE N''%'+@ShopName+'%''  '
	IF Isnull(@ObjectID,'') != ''
		SET @sWhere = @sWhere +  'AND ObjectID LIKE ''%'+@ObjectID+'%'' '
	IF Isnull(@Address,'') != ''
		SET @sWhere = @sWhere +  'AND ISNULL([Address],'''') LIKE N''%'+@Address+'%'' '
	IF Isnull(@Tel,'') != '' 
		SET @sWhere = @sWhere + ' AND ISNULL([Tel],'''') LIKE N''%'+@Tel+'%'' '
	IF Isnull(@Fax,'') != ''
		SET @sWhere = @sWhere +  'AND ISNULL([Fax],'''') LIKE N''%'+@Fax+'%'' '
	IF Isnull(@Email,'') != ''
		SET @sWhere = @sWhere + ' AND ISNULL([Email],'''') LIKE N''%'+@Email+'%'' '
	IF isnull(@DisabledName, '') != ''
			SET @sWhere = @sWhere + ' AND ISNULL(Disabled,0) = '+@DisabledName
    SET @sSQL = N'   
				Declare @POST0010 TABLE (
				APK uniqueidentifier,
  				DivisionID NVARCHAR(50),
  				Fax NVARCHAR(250),
  				ShopID NVARCHAR(50),
  				ShopName NVARCHAR(250),
  				ObjectID NVARCHAR(50),
  				Address NVARCHAR(250),
  				Email NVARCHAR(250),
  				Tel nvarchar(100),
  				Disabled int,
  				ObjectName NVARCHAR(250),
  				BusinessArea Int
			  )
			 INSERT INTO @POST0010
			 (
 				APK, DivisionID,  ShopID, ShopName, ObjectID, 
 				Address, Email, Tel, Fax,Disabled, ObjectName, BusinessArea
			 )
			 SELECT AT14.APK, AT14.DivisionID,  AT14.ShopID, AT14. ShopName,
					AT14.ObjectID, AT14.Address, AT14.Email, AT14.Tel, AT14.Fax, AT14.Disabled,
					(AT14.ObjectID+''_'' + B.ObjectName) as ObjectName, BusinessArea
			 FROM POST0010 AT14 WITH (NOLOCK)
			 LEFT JOIN AT1202 B WITH (NOLOCK) ON B.ObjectID = AT14.ObjectID
			 Where isnull(AT14.IsEvents, 0) = 0
					'
    set @sSQL01='
						Declare @CountTotal NVARCHAR(Max)
						DECLARE @CountEXEC table (CountRow NVARCHAR(Max))
						IF '+Cast(@PageNumber as varchar(2)) + ' = 1
						Begin
							Insert into @CountEXEC (CountRow)
							Select Count(POST0010.ShopID) From @POST0010 POST0010 WHERE 1=1 '+@sWhere + '
						End
    '
    ---lấy kết quả
	SET @sSQL02 = N'
				 SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, (Select CountRow from @CountEXEC) AS TotalRow	,
				 POST0010.APK,
				 POST0010.DivisionID, 
				 POST0010.ShopID, POST0010.ShopName, POST0010.ObjectID,
				 POST0010.Address, POST0010.Email, POST0010.Tel,  POST0010.Fax, POST0010.Disabled,
				 POST0010.ObjectName, POST0010.BusinessArea
				 FROM @POST0010 POST0010
				 WHERE 1=1 '+@sWhere+'
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
	EXEC (@sSQL+ @sSQL01+@sSQL02)
