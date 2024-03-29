IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CRMP10301]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[CRMP10301]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
--- Load form CRMF1030 - Danh mục nhóm người nhận
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Phan thanh hoàng Vũ on 17/03/2017
----Edited by: Phan thanh hoàng vũ, Date: 05/05/2017: Bổ sung điều kiện search phân quyền xem
----Editted by: Phan thanh hoàng Vũ, Date: 01/09/2017 Sắp xếp thứ tự giảm dần thao ngày (Record mới nhất sẽ load lên đầu tiên)
--- Modify by Thị Phượng, Date 08/11/2017: Bổ sung thêm xử lý search nâng cao
-- <Example> EXEC CRMP10301 'AS', 'AS'',''GS'',''GSC','' ,'' ,'' , '', '', 'NV01',  N'ASOFTADMIN'', ''DANH'', ''HOANG'', ''HUYEN'', ''LIEN'', ''LUAN'', ''PHUONG'', ''QUI'', ''QUYNH'', ''VU', 1, 10 ,''

CREATE PROCEDURE CRMP10301 
(	@DivisionID VARCHAR(50),		--Biến môi trường
	@DivisionIDList NVARCHAR(MAX),	--Chọn trong DropdownChecklist DivisionID	
    @GroupReceiverID nvarchar(50),
	@GroupReceiverName nvarchar(250),
	@Description nvarchar(250), 
	@IsCommon nvarchar(100),
	@Disabled nvarchar(100),
	@UserID  VARCHAR(50),			--Biến môi trường
	@ConditionGroupReceiverID nvarchar(max),
	@PageNumber INT,
	@PageSize INT,
	@SearchWhere NVARCHAR(Max) = null
)
AS
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
		@OrderBy NVARCHAR(500)
		
	SET @sWhere = ''
	SET @OrderBy = ' M.CreateDate DESC,  M.GroupReceiverID, M.GroupReceiverName '
IF isnull(@SearchWhere,'') =''
Begin
	--Check Para DivisionIDList null then get DivisionID 
	IF Isnull(@DivisionIDList, '') != ''
		SET @sWhere = @sWhere + ' M.DivisionID IN ('''+@DivisionIDList+''', ''@@@'')'
	Else 
		SET @sWhere = @sWhere + ' M.DivisionID IN ('''+ @DivisionID+''', ''@@@'')'	

	IF isnull(@GroupReceiverID, '') != ''
		SET @sWhere = @sWhere + ' AND M.GroupReceiverID LIKE N''%'+@GroupReceiverID+'%''  '
	
	IF isnull(@GroupReceiverName, '') != ''
		SET @sWhere = @sWhere + ' AND M.GroupReceiverName LIKE N''%'+@GroupReceiverName+'%'' '

	IF isnull(@Description, '') != ''
		SET @sWhere = @sWhere + ' AND M.Description LIKE N''%'+@Description+'%'' '
	
	IF Isnull(@IsCommon, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.IsCommon,'''') LIKE N''%'+@IsCommon+'%'' '
	
	IF Isnull(@Disabled, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.Disabled,'''') LIKE N''%'+@Disabled+'%'' '

	IF Isnull(@ConditionGroupReceiverID, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.CreateUserID, '''') in (N'''+@ConditionGroupReceiverID+''' )'
End
IF isnull(@SearchWhere,'') !=''
Begin
	SET  @sWhere='1 = 1'
End
		
SET @sSQL =	  ' SELECT M.APK, M.DivisionID, M.GroupReceiverID, M.Description, M.GroupReceiverName
					   , M.IsCommon, M.Disabled, M.CreateDate, M.CreateUserID, M.LastModifyDate, M.LastModifyUserID
					    into #TempCRMT10301
				FROM CRMT10301 M With (NOLOCK)
				WHERE '+@sWhere+'

				DECLARE @count int
				Select @count = Count(GroupReceiverID) From #TempCRMT10301
				'+Isnull(@SearchWhere,'')+'
				SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @count AS TotalRow
					, M.APK, Case when M.IsCommon = 1 then '''' else M.DivisionID end DivisionID
					, M.GroupReceiverID, M.GroupReceiverName, M.Description
					, M.IsCommon, M.Disabled, M.CreateDate, M.CreateUserID, M.LastModifyDate, M.LastModifyUserID
				FROM #TempCRMT10301 M
				'+Isnull(@SearchWhere,'')+'
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
EXEC (@sSQL)


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
