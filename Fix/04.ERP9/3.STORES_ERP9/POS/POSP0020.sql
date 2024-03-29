IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0020]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [dbo].[POSP0020]
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<MaiVu>
-- Create date: <28/03/2014>: Lọc dữ liệu Thẻ hội viên
-- Edit by Thị Phượng on 13/06/2016: bổ sung trường @UserID và thêm WITH (NOLOCK) cải tiến store
-- Edit by Hoàng Vũ on 02/06/2017: Bổ sung chức năng dùng chung
-- Example: EXEC POSP0020 'AS', 'AS'',''GS','x','x','x',NULL,NULL,NULL,NULL,0,1,20,1, ''
CREATE PROCEDURE [dbo].[POSP0020] 
	@DivisionID varchar(50),--DivisionID dùng để đăng nhập
	@DivisionIDList NVARCHAR(max), 
	@MemberCardID VARCHAR(50),
	@MemberCardName NVARCHAR(250),
	@TypeNoList NVARCHAR(max),
	@ReleaseDate DATETIME,
	@ExpireDate DATETIME,
	@MemberID VARCHAR(50),
	@MemberName NVARCHAR(250),
	@Disabled NVARCHAR(50),
	@PageNumber INT,
    @PageSize INT,
    @IsCommonName NVARCHAR(50),
	@UserID NVARCHAR(50)
AS
BEGIN
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500)
	SET @sWhere = ''
	SET @OrderBy = 'M.MemberCardID, M.TypeNo, M.DivisionID'
	
	 IF Isnull(@DivisionIDList, '') != ''
		SET @sWhere = @sWhere + ' M.DivisionID IN ('''+@DivisionIDList+''', ''@@@'')'
	 Else 
		SET @sWhere = @sWhere + ' M.DivisionID IN ('''+ @DivisionID+''', ''@@@'')'	

	 IF isnull(@TypeNoList, '') != '' 
		SET @sWhere = @sWhere + ' AND M.TypeNo IN ('''+@TypeNoList+''')' 
	
	 IF isnull(@MemberCardID, '') != '' 
		SET @sWhere = @sWhere + ' AND M.MemberCardID LIKE ''%'+ @MemberCardID+ '%'''
     
	 IF isnull(@MemberCardName, '') != '' 
		SET @sWhere = @sWhere + ' AND ISNULL(M.MemberCardName,'''') LIKE N''%'+ @MemberCardName +'%'''
     
	 IF isnull(@ReleaseDate, '') != '' 
		SET @sWhere = @sWhere + ' AND M.ReleaseDate ='+ CONVERT( CHAR(10) ,@ReleaseDate,103 )
     
	 IF isnull(@ExpireDate, '') != '' 
		SET @sWhere = @sWhere + ' AND M.ExpireDate ='+ CONVERT( CHAR(10),@ExpireDate,103 )

	 IF isnull(@MemberID, '') != '' 
		SET @sWhere = @sWhere + ' AND M.MemberID LIKE ''%'+ @MemberID+ '%'''

     IF isnull(@MemberName, '') != '' 
		SET @sWhere = @sWhere + ' AND ISNULL(M.MemberName,'''') LIKE N''%'+ @MemberName +'%'''

     IF isnull(@Disabled, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.Disabled,'''') LIKE N'''+@Disabled+''''

	 IF isnull(@IsCommonName, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.IsCommon,'''') LIKE N'''+@IsCommonName+''''


	 --Lay danh sach the hoi vien
	 SET @sSQL   = 'Select M.APK, M.DivisionID, M.MemberCardID, M.MemberCardName, M.TypeNo
							,M.MemberID , M.MemberName, M.ReleaseDate, M.ExpireDate, M.Disabled, M.LockedReason, M.Locked, M.IsCommon
							into #POST0020
					FROM POST0020 M WITH (NOLOCK)
					WHERE '+@sWhere +'
					
					--Kiểm tra load mac định thì lấy tổng số trang, ngược lại thì không lấy tổng số trang (Cải tiến tốc độ )
	 				DECLARE @count int
					Select @count = Count(MemberCardID) From #POST0020	
	
					SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @count AS TotalRow,  M.APK, M.DivisionID, M.MemberCardID, M.MemberCardName, 
						   M.TypeNo, M.MemberID, M.MemberName, M.ReleaseDate, M.ExpireDate, M.Disabled, M.LockedReason, M.Locked, M.IsCommon
					FROM #POST0020 M
					ORDER BY '+@OrderBy+'
					OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
					FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
	 EXEC (@sSQL)
	 
END	 
