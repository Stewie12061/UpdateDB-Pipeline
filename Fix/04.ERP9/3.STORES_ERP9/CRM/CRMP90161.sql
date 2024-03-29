IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CRMP90161]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[CRMP90161]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
--- Load màn hình chọn người nhận (1: đầu mối; 2: liên hệ; 3: khách hàng)
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Hoàng Vũ Date 7/04/2017
----Edited by: Phan thanh hoàng vũ, Date: 05/05/2017: Bổ sung điều kiện search phân quyền xem
----Modify by Hoàng vũ, Date 25/09/2018: Convert chuyển lấy dữ liệu khách hàng CRM (CRMT10101)-> Khách hàng POS (POST0011)
----Modify by Tấn Lộc, Date 11/11/2020: Bổ sung cột RelTableID để truyền vào mã table
-- <Example> EXEC CRMP90161 @DivisionID=N'AS',@TxtSearch=N'',	@UserID=N'CALL002',@PageNumber=N'1',@PageSize=N'100', @ConditionGroupReceiverID= N'ASOFTADMIN'', ''DANH'', ''HOANG'', ''HUYEN'', ''LIEN'', ''LUAN'', ''PHUONG'', ''QUI'', ''QUYNH'', ''VU'

 CREATE PROCEDURE CRMP90161 (
     @DivisionID NVARCHAR(2000),
     @TxtSearch NVARCHAR(250),
	 @UserID VARCHAR(50),
     @PageNumber INT,
     @PageSize INT,
	 @ConditionGroupReceiverID nvarchar(max)
)
AS
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
    	@OrderBy NVARCHAR(500)
	DECLARE @CustomerName INT
	IF EXISTS (SELECT *	FROM tempdb.dbo.sysobjects WHERE ID = OBJECT_ID(N'tempdb.dbo.#CustomerName')) 
	DROP TABLE #CustomerName
	CREATE Table #CustomerName (CustomerName INT, ImportExcel int)
	INSERT #CustomerName EXEC AP4444
	SET @CustomerName = (SELECT TOP 1 CustomerName FROM #CustomerName) 

	SET @sWhere = ''
	SET @OrderBy = ' M.ReceiverID, M.ReceiverName'

	IF Isnull(@TxtSearch, '')!='' SET @sWhere = @sWhere +'
							AND (M.ReceiverID LIKE N''%'+@TxtSearch+'%'' 
							OR M.ReceiverName LIKE N''%'+@TxtSearch+'%'' 
							OR M.Mobile LIKE N''%'+@TxtSearch+'%'' 
							OR M.Address LIKE N''%'+@TxtSearch+'%'' 
							OR M.Tel LIKE N''%'+@TxtSearch + '%'' 
							OR M.Email LIKE N''%'+@TxtSearch+'%'')'
	IF Isnull(@ConditionGroupReceiverID, '') != ''
		SET @sWhere = @sWhere + ' AND ISNULL(M.AssignedToUserID, M.CreateUserID) in (N'''+@ConditionGroupReceiverID+''' )'

	SET @sSQL = 'Declare @TempReceiverID Table (
					  [APK] UNIQUEIDENTIFIER NULL,
					  [DivisionID] VARCHAR(50) NULL,
					  [ReceiverID] VARCHAR(50) NULL,
					  [ReceiverName] NVARCHAR(250)  NULL,
					  [Address] NVARCHAR(250) NULL,
					  [Email] NVARCHAR(250) NULL,
					  [Mobile] NVARCHAR(250) NULL,
					  [Tel] NVARCHAR(250) NULL,
					  [Description] NVARCHAR(250) NULL,
					  [RelatedToTypeID] INT ,
					  [RelatedToTypeName] NVARCHAR(250) NULL,
					  [RelTableID] VARCHAR(50),
					  [IsCommon] TINYINT NULL,
					  [Disabled] TINYINT NULL
					  ) 
				 Insert into @TempReceiverID (APK, DivisionID, ReceiverID, ReceiverName, Address, Email, Mobile, Tel, Description
							, RelatedToTypeID, RelatedToTypeName, IsCommon, Disabled, RelTableID)
				 Select  M.APK, M.DivisionID, M.ReceiverID, M.ReceiverName, Address, M.Email, M.Mobile, M.Tel, M.Description
						, M.RelatedToTypeID, D.Description as RelatedToTypeName, M.IsCommon, M.Disabled, RelTableID
				 From (
						Select M.APK, M.DivisionID, M.ContactID as ReceiverID, M.ContactName as ReceiverName, M.Address, 2 as RelatedToTypeID
								, Isnull(M.HomeEmail, M.BusinessEmail) as Email, M.HomeMobile as Mobile, M.HomeTel as Tel
								, M.Description, M.IsCommon, M.Disabled, NULL as AssignedToUserID, M.CreateUserID, ''CRMT10001'' AS RelTableID
						from CRMT10001 M
						Union all
						Select M.APK, M.DivisionID, M.LeadID, M.LeadName, M.Address, 1  as RelatedToTypeID, M.Email, M.LeadMobile
								, M.LeadTel, M.Description, M.IsCommon, M.Disabled, M.AssignedToUserID, M.CreateUserID, ''CRMT20301'' AS RelTableID
						from CRMT20301 M 
						Union all
						Select M.APK, M.DivisionID,  M.MemberID as AccountID, M.MemberName as AccountName, M.Address, 3  as RelatedToTypeID, M.Email, '''' as Mobile
								, M.Tel, M.Description, M.IsCommon, M.Disabled, M.AssignedToUserID, M.CreateUserID, ''POST0011'' AS RelTableID
						from POST0011 M
				   ) M left join CRMT0099 D on M.RelatedToTypeID = D.ID and D.CodeMaster = ''CRMT00000002'' 
				 Where (M.DivisionID = '''+ @DivisionID+''' or M.IsCommon = 1) and M.Disabled = 0  and Isnull(M.Email, '''') !='''' '+@sWhere+'
				  
				 DECLARE @count int
				 Select @count = Count(ReceiverID) From @TempReceiverID

				 SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, @count AS TotalRow
						, M.APK, Case when M.IsCommon = 1 then '''' else M.DivisionID end DivisionID
						, M.ReceiverID, M.ReceiverName, M.Address, M.Email, M.Mobile, M.Tel, M.Description
						, M.RelatedToTypeID, M.RelatedToTypeName, M.IsCommon, M.Disabled, RelTableID
				FROM @TempReceiverID M
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
	EXEC (@sSQL)
	print(@sSQL)
	

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
