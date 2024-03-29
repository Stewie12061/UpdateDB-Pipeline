IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SP1040]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[SP1040]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
---- Load Grid Form SF1040: Thông tin lịch sử
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Trần quốc Tuấn, Date: 16/09/2015
-- <Example>
---- 
/*

exec SP1040 @DivisionID=N'XR',@PageNumber=1,@PageSize=50,@IsSearch=1,
			@TableID='DRT2000',@ColumnPK='ContractNo',@UserID='ASOFTADMIN',@UserName=NULL,@ID= NULL,@ActionType='%',
			@FromCreateDate=NULL,@ToCreateDate=NULL
*/

CREATE PROCEDURE SP1040
( 
	@DivisionID VARCHAR(50),
	@PageNumber INT,
	@PageSize INT,
	@IsSearch BIT,
	@TableID VARCHAR(50),
	@ColumnPK VARCHAR(500),
	@UserID VARCHAR(50),
	@UserName NVARCHAR(250),
	@ID VARCHAR(50),
	@ActionType VARCHAR(50),
	@FromCreateDate DATETIME,
	@ToCreateDate DATETIME
)
AS 
DECLARE @sSQL NVARCHAR (MAX)='',
        @sWhere NVARCHAR(MAX) = '',
        @sWhere1 NVARCHAR(MAX) = '',
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50) = ''
 
SET @OrderBy = 'CreateDate DESC'
IF ISNULL(@ColumnPK,'')=''
	SET @ColumnPK='APK'
IF @TableID IS NOT NULL SET @TableID='dbo_'+@TableID+'_CT'

IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
IF @IsSearch = 1
BEGIN
	IF @UserID IS NOT NULL SET @sWhere = @sWhere + '
	AND UserID LIKE ''%'+@UserID+'%'' '
	IF ISNULL(@UserName,'%') <> '%' SET @sWhere = @sWhere + '
	AND UserName LIKE ''%'+@UserName+'%'' '
	IF (@FromCreateDate IS NOT NULL OR   @ToCreateDate IS NOT NULL) SET @sWhere = @sWhere + '
	AND CONVERT(VARCHAR, CreateDate, 112) BETWEEN '''+ISNULL(CONVERT(VARCHAR, @FromCreateDate, 112),'')+''' AND '''+ISNULL(CONVERT(VARCHAR, @ToCreateDate, 112),'A')+''' '
	IF @ActionType IS NOT NULL AND @ActionType<>'%' SET @sWhere = @sWhere + '
	AND ActionType  ='+STR(@ActionType)+' '
	IF @ID IS NOT NULL SET @sWhere = 'WHERE ID LIKE ''%'+@ID+'%'' '
END

IF (EXISTS (SELECT TOP 1 1 FROM syscolumns col INNER JOIN sysobjects obj ON obj.id = col.id 
			WHERE col.name='LastModifyUserID'
			AND obj.name=@TableID
			AND obj.xtype='U'))
BEGIN
	SET @sSQL =' 
	BEGIN
		WITH Temp AS
		(
			SELECT H.APK,H.[__$operation] ActionType, (CASE WHEN  H.[__$operation] =4 then HD.UserID ELSE H.LastModifyUserID END) UserID,
			(CASE WHEN  H.[__$operation] =4 then HD.CreateDate ELSE H.LastModifyDate END) CreateDate,
			A45.UserName,S99.Description ActionTypeName,H.'+@ColumnPK+' ID
			FROM cdc.'+@TableID+' H
			LEFT JOIN HistoryDEL HD ON HD.APK = H.APK
			LEFT JOIN AT1405 A45 ON A45.UserID=(CASE WHEN  H.[__$operation] =4 then HD.UserID ELSE H.LastModifyUserID END) AND A45.DivisionID='''+@DivisionID+'''
			LEFT JOIN ST0099 S99 ON S99.ID = H.[__$operation] AND S99.CodeMaster=''ActionType''
			WHERE H.[__$operation] <> 3
		)
	
	SELECT  ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow,
			APK,ActionType,CreateDate,UserID,UserName,ActionTypeName, ID
	FROM Temp T
	WHERE ID IS NOT NULL
	'+@sWhere+'
	ORDER BY '+@OrderBy+'
	OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
	FETCH NEXT '+STR(@PageSize)+' ROWS ONLY
	END
	'
END 

EXEC (@sSQL)
PRINT (@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
