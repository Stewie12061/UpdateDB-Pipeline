IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP1020]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP1020]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- <Summary>
---- Load Grid danh sách đăng ký mua cổ phần( màn hình truy vấn)
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Thanh Thi , Date: 30/07/2020
-- <Example>

/*
--Lọc nâng cao
EXEC QCP1020 @DivisionID='BE' , @DivisionList='', @FromDate='2020-07-01',@ToDate ='2020-07-31',@IsDate =1,@PeriodIDList ='10/2018',@VoucherNo ='a',@SHPublishPeriodID='a',@ObjectID ='',@ObjectName ='a',
@Address ='a',@Tel='a',@VATno='a',@Email ='a',@Contactor='a',@PhoneNumber='a',@IdentificationNumber ='a',@ShareHolderCategoryID ='a', @UserID ='a',@PageNumber ='1',
@PageSize ='25',@SearchWhere=N' where IsNull(VoucherNo,'''') = N''asdas'''

--Lọc thường
EXEC QCP1020 @DivisionID='BE' , @DivisionList='', @FromDate='2020-07-01',@ToDate ='2020-07-31',@IsDate =1,@PeriodIDList ='10/2018',@VoucherNo ='a',@SHPublishPeriodID='a',@ObjectID ='',@ObjectName ='a',
@Address ='a',@Tel='a',@VATno='a',@Email ='a',@Contactor='a',@PhoneNumber='a',@IdentificationNumber ='a',@ShareHolderCategoryID ='a', @UserID ='a',@PageNumber ='1',
@PageSize ='25',@SearchWhere=NULL
*/

CREATE PROCEDURE QCP1020 ( 
        @DivisionID VARCHAR(50), 
		@DivisionList VARCHAR(MAX), 
		@InventoryID VARCHAR(MAX),
		@InventoryName NVARCHAR(MAX),
		@Notes NVARCHAR(MAX),
		@Notes01 NVARCHAR(MAX),
		@Notes02 NVARCHAR(MAX),
		@Notes03 NVARCHAR(MAX),
		@Disabled TINYINT,
		@IsCommon TINYINT,
		@UserID  VARCHAR(50),
		@PageNumber INT,
		@PageSize INT,
		@SearchWhere NVARCHAR(MAX) = NULL --#NULL: Lọc nâng cao; =NULL: Lọc thường
) 
AS 
BEGIN
	DECLARE @sSQL NVARCHAR(MAX),
			@sWhere NVARCHAR(MAX) = N'',
			@OrderBy NVARCHAR(500) = N'', 
			@TotalRow NVARCHAR(50) = N''

		IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
		SET @OrderBy = ' InventoryID'
		SET @sWhere = ' 1 = 1 '
		
		If Isnull(@SearchWhere, '') = '' --Lọc thường
		Begin
				IF ISNULL(@DivisionList, '') != ''
					SET @sWhere = @sWhere + N' AND T1.DivisionID IN ('''+@DivisionList+''')'
				ELSE 
					SET @sWhere = @sWhere + N' AND T1.DivisionID = '''+@DivisionID+''''

				IF ISNULL(@InventoryID, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.InventoryID LIKE N''%'+@InventoryID+'%'''

				IF ISNULL(@InventoryName, '') != '' 
					SET @sWhere = @sWhere + N' AND T2.InventoryName LIKE N''%'+@InventoryName+'%'''

				IF ISNULL(@Notes, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.Notes LIKE N''%'+@Notes+'%'''

				IF ISNULL(@Notes01, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.Notes01 LIKE N''%'+@Notes01+'%'''

				IF ISNULL(@Notes02, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.Notes02 LIKE N''%'+@Notes02+'%'''

				IF ISNULL(@Notes03, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.Notes03 LIKE N''%'+@Notes03+'%'''

				IF ISNULL(@Disabled, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.Disabled = N''%'+@Disabled+'%'''

				IF ISNULL(@IsCommon, '') != '' 
					SET @sWhere = @sWhere + N' AND T1.IsCommon = N''%'+@IsCommon+'%'''

				--nếu giá trị NULL thì set về rổng 
				SET @SearchWhere = Isnull(@SearchWhere, '')
		End
		SET @sSQL = N'
				SELECT T1.APK, T1.DivisionID, T1.InventoryID, T2.InventoryName, T1.Notes, T1.Notes01, T1.Notes02
						, T1.Notes03, T1.Disabled, T1.IsCommon, T1.CreateDate, T1.CreateUserID
						, T1.LastModifyDate, T1.LastModifyUserID, T1.UpdateDate
				INTO #QCP1020
				FROM QCT1020 T1 WITH (NOLOCK)
						LEFT JOIN AT1302 T2 WITH (NOLOCK) ON T1.InventoryID = T2.InventoryID AND T2.DivisionID IN (T1.DivisionID,''@@@'')
				WHERE '+@sWhere+'

				SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow
						, APK, DivisionID, InventoryID, InventoryName, Notes, Notes01, Notes02
						, Notes03, Disabled, IsCommon, CreateDate, CreateUserID
						, LastModifyDate, LastModifyUserID, UpdateDate
				FROM #QCP1020
				'+@SearchWhere +'
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY'
		EXEC (@sSQL)
END

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO