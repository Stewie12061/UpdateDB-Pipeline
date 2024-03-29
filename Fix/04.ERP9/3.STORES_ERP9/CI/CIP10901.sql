IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP10901]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[CIP10901]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
--- Load form CIF1090 - Danh mục mã tự động đối tượng
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Phan thanh hoàng Vũ on 12/04/2017
----Editted by: Phan thanh hoàng Vũ, Date: 01/09/2017 Sắp xếp thứ tự giảm dần thao ngày (Record mới nhất sẽ load lên đầu tiên)
-- <Example>
/*
	--Lưu ý chưa bổ sung phân quyền xem dữ liệu người khác

    EXEC CIP10901 'AS', 'AS'',''GS'',''GSC','' ,'' ,'' , '', '', '', 'NV01', 1, 25 
*/

CREATE PROCEDURE CIP10901 
(	@DivisionID VARCHAR(50),		--Biến môi trường
	@DivisionIDList NVARCHAR(MAX),	--Chọn trong DropdownChecklist DivisionID	
    @TypeID nvarchar(250),
	@STypeID nvarchar(250),
	@S nvarchar(250),
	@SName nvarchar(250),
	@IsCommon nvarchar(100),
	@Disabled nvarchar(100),
	@UserID  VARCHAR(50),			--Biến môi trường
	@PageNumber INT,
	@PageSize INT
)
AS
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
		@OrderBy NVARCHAR(500)
		
	SET @sWhere = ''
	SET @OrderBy = ' M.CreateDate DESC, M.TypeID, M.STypeID, M.S '

	--Check Para DivisionIDList null then get DivisionID 
	IF Isnull(@DivisionIDList, '') != ''
		SET @sWhere = @sWhere + ' (M.DivisionID IN ('''+@DivisionIDList+''') or M.IsCommon = 1)'
	Else 
		SET @sWhere = @sWhere + ' (M.DivisionID = '''+ @DivisionID+''' or M.IsCommon = 1)'		

	IF isnull(@TypeID, '') != ''
		SET @sWhere = @sWhere + ' AND M.TypeID LIKE N''%'+@TypeID+'%''  '
	
	IF isnull(@STypeID, '') != ''
		SET @sWhere = @sWhere + ' AND M.STypeID LIKE N''%'+@STypeID+'%'' '

	IF isnull(@S, '') != ''
		SET @sWhere = @sWhere + ' AND M.S LIKE N''%'+@S+'%'' '
	
	IF isnull(@SName, '') != ''
		SET @sWhere = @sWhere + ' AND M.SName LIKE N''%'+@SName+'%'' '

	IF Isnull(@IsCommon, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.IsCommon,'''') LIKE N''%'+@IsCommon+'%'' '
	
	IF Isnull(@Disabled, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.Disabled,'''') LIKE N''%'+@Disabled+'%'' '

SET @sSQL =	  ' Declare @TempTable Table (
					  [APK] UNIQUEIDENTIFIER NOT NULL,
					  [DivisionID] VARCHAR(50) NOT NULL,
					  [S] NVARCHAR(50) NOT NULL,
					  [SName] NVARCHAR(250) NULL,
					  [STypeID] NVARCHAR(50) NULL,
					  [TypeID] NVARCHAR(50) NULL,
					  [IsCommon] TINYINT DEFAULT (0) NULL,
					  [Disabled] TINYINT DEFAULT (0) NULL,
					  [TableID] NVARCHAR(50) NULL,
					  [CreateDate] DATETIME NULL,
					  [CreateUserID] VARCHAR(50) NULL,
					  [LastModifyDate] DATETIME NULL,
					  [LastModifyUserID] VARCHAR(50) NULL
						)
				Insert into  @TempTable (APK, DivisionID, S, SName, STypeID, TypeID, Disabled, IsCommon, CreateDate, CreateUserID
										 , LastModifyDate, LastModifyUserID, TableID)
				SELECT M.APK, M.DivisionID, M.S, M.SName, M.STypeID, Isnull(M.TypeID, ''O'') as TypeID, M.Disabled, M.IsCommon, M.CreateDate, M.CreateUserID
										 , M.LastModifyDate, M.LastModifyUserID, ''AT1207'' as TableID
				FROM AT1207 M With (NOLOCK)
				WHERE '+@sWhere+'
				Union all
				SELECT M.APK, M.DivisionID, M.S, M.SName, M.STypeID, M.TypeID, M.Disabled, M.IsCommon, M.CreateDate, M.CreateUserID
										 , M.LastModifyDate, M.LastModifyUserID, ''AT1331'' as TableID
				FROM AT1331 M With (NOLOCK)
				WHERE '+@sWhere+'

				DECLARE @count int
				Select @count = Count(S) From @TempTable

				SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @count AS TotalRow
					, M.APK, Case when M.IsCommon = 1 then '''' else M.DivisionID end DivisionID
					, M.TypeID, D.TypeName, M.STypeID, D1.StypeName , M.S, M.SName
					, M.Disabled, M.IsCommon, M.TableID, M.CreateDate, M.CreateUserID
										 , M.LastModifyDate, M.LastModifyUserID
				FROM @TempTable M left join (
											 SELECT Distinct  D.TypeID, M.Description as TypeName
											 FROM CRMT0099 M WITH (NOLOCK)  inner join 
											 CRMT0097 D WITH (NOLOCK) on M.CodeMaster = D.CodeMaster and M.ID = D.ID 
											 WHERE M.CodeMaster =''CRMT00000002'' AND M.Disabled = 0 
											 ) D on M.TypeID = D.TypeID
								  left join CRMT0097 D1 WITH (NOLOCK) on M.TypeID = D1.TypeID and  M.STypeID = D1.STypeID and D1.CodeMaster =''CRMT00000002''
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
EXEC (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
