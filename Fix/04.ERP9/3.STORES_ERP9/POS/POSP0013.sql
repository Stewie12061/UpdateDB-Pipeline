IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0013]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP0013]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Grid Form POSP0013 danh muc hinh thuc thanh toan
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
----Created by: Phan thanh hoang vu, Date: 28/03/2014
-- <Example>
----EXEC POSP0013 'AS','AS'',''GS'',''MS','','',1,10
----
CREATE PROCEDURE POSP0013 ( 
		@DivisionID VARCHAR(50),
        @DivisionIDList NVARCHAR(2000),  
        @PaymentID nvarchar(50),
        @PaymentName nvarchar(250),
		@PageNumber INT,
        @PageSize INT		
) 
AS 
DECLARE @sSQL NVARCHAR (MAX),
		@sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50)
        
SET @sWhere = ''
SET @TotalRow = ''
SET @OrderBy = 'DivisionID, PaymentID'
	IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
--Check Para DivisionIDList null then get DivisionID 
	IF @DivisionIDList IS NULL 
		SET @sWhere = @sWhere + 'DivisionID IN (''@@@'','''+ @DivisionID+''')'
	Else 
		SET @sWhere = @sWhere + 'DivisionID IN (''@@@'','''+@DivisionIDList+''')'
	
	IF @PaymentID IS NOT NULL SET @sWhere = @sWhere + ' AND PaymentID LIKE N''%'+@PaymentID+'%'' '
	IF @PaymentName IS NOT NULL SET @sWhere = @sWhere + ' AND ISNULL(PaymentName,'''') LIKE N''%'+@PaymentName+'%''  '

SET @sSQL = '
SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, 
Case when IsCommon = 1 then '''' else DivisionID end as DivisionID, PaymentID, PaymentName, 
[Disabled], IsCommon, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate
FROM AT1205
WHERE '+@sWhere+'
ORDER BY '+@OrderBy+'
OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
EXEC (@sSQL)