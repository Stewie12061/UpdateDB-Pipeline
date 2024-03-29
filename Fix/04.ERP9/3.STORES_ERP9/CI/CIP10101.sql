IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP10101]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CIP10101]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Man hinh truy van load du lieu danh muc to nhom -Store CIP10101
---- 
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Ho hoang tu, Date: 10/10/2014
----Edit by: Phan thanh hoang vu, 16/10/2014
--EXEC CIP10101 'AS','AS'',''', 'ADM','','','','',1,1,20
CREATE PROCEDURE CIP10101 ( 
        @DivisionID varchar(50),
		@DivisionIDList NVARCHAR(2000),       
		@DepartmentID nvarchar(50),	
		@TeamID nvarchar(50),
		@TeamName nvarchar(50),
		@BranchIDList NVARCHAR(2000),
	    @Notes nvarchar(50),
		@Notes01 nvarchar(50),
		@Disabled nvarchar(50),
		@PageNumber INT,
        @PageSize INT,
		@IsSearch BIT 
) 
AS
		DECLARE @sSQL NVARCHAR (MAX),
				@sWhere NVARCHAR(MAX),
				@OrderBy NVARCHAR(500),
				@TotalRow NVARCHAR(50)        
			SET @sWhere = ''
			SET @TotalRow = ''
			--Sap xep du lieu tra ve
			SET @OrderBy = 'HT1101.DivisionID, HT1101.TeamID,HT1101.TeamName'
			--Dem so dong phan trang
			IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'	
			
IF STR(@IsSearch) = 1
BEGIN
            IF @DivisionIDList IS NOT NULL  OR  @DivisionIDList != '' 
			      SET @sWhere = @sWhere + 'AND HT1101.DivisionID IN ('''+@DivisionIDList+''')'
			   ELSE 
		          SET @sWhere = @sWhere + 'AND HT1101.DivisionID = '''+@DivisionID+'''  '
			IF @DepartmentID IS NOT NULL 
				SET @sWhere = @sWhere +  'AND HT1101.DepartmentID LIKE ''%'+@DepartmentID+'%'' '
			IF @TeamID IS NOT NULL 
				SET @sWhere = @sWhere +  'AND HT1101.TeamID LIKE N''%'+@TeamID+'%'' '
		    IF @TeamName IS NOT NULL 
				SET @sWhere = @sWhere +  'AND HT1101.TeamName LIKE N''%'+@TeamName+'%'' '
			IF @BranchIDList IS NOT NULL 
			    SET @sWhere = @sWhere + 'AND HT1101.BranchID IN ('''+@BranchIDList+''') '
			IF @Notes IS NOT NULL 
				SET @sWhere = @sWhere +  'AND HT1101.Notes LIKE N''%'+@Notes+'%'' '
			IF @Notes01 IS NOT NULL 
				SET @sWhere = @sWhere +  'AND HT1101.Notes01 LIKE N''%'+@Notes01+'%'' '
			IF @Disabled IS NOT NULL
				SET @sWhere = @sWhere +  'AND HT1101.Disabled ='''+@Disabled+''''
END
IF STR(@IsSearch) = 0
BEGIN
     SET @sWhere = @sWhere + 'AND HT1101.DivisionID = '''+ @DivisionID+''''
END

			--Cau SQL truy van lay du lieu	

			SET @sSQL = '
			SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow, HT1101.DivisionID,HT1101.DepartmentID, HT1101.TeamID,HT1101.TeamName, HT1101.Notes, HT1101.Notes01, HT1101.Disabled, HT1101.CreateUserID, HT1101.LastModifyUserID, HT1101.CreateDate, HT1101.LastModifyDate, HT1101.BranchID 
			FROM HT1101
			WHERE 1 = 1 '+@sWhere+'
			ORDER BY '+@OrderBy+'
			OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
			FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
			EXEC (@sSQL)
			GO
			SET QUOTED_IDENTIFIER OFF
			GO
			SET ANSI_NULLS ON
			GO

