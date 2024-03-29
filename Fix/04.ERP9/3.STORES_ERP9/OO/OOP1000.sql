﻿IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[OOP1000]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[OOP1000]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- <Summary>
---- Load Grid Form OOF1000: Danh mục loại phép
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Bảo Thy, Date: 26/11/2015
----Updated by: Thanh Phương, Date 19/12/2023
----Updated by Thanh Phương, Date 19/12/2023: - Cập nhật bổ sung điều kiện lọc ( DeleteFlg = 0 )
-- <Example>
---- 
/*-- <Example>EXEC [OOP1000] 	@DivisionID = N'BBA-SI', @UserID = N'ADMIN', @PageNumber = 1, @PageSize = 25, @IsSearch = 1, 
	@AbsentTypeID = N'', @Description = N'', @TypeID = N'', @Note = N'', @Disabled = N'', 
	@FromDate = NULL, @ToDate = NULL, @IsPeriod = 1, @PeriodList = N'12/2023,11/2023'
----*/

CREATE PROCEDURE OOP1000
( 
	 @DivisionID VARCHAR(50),
	 @UserID VARCHAR(50),
	 @PageNumber INT,
	 @PageSize INT,
	 @IsSearch BIT,
	 @AbsentTypeID VARCHAR(50),
	 @Description NVARCHAR(250),
	 @TypeID VARCHAR(50),
	 @Note NVARCHAR(250),
	 @Disabled NVARCHAR(1)
	 ,@FromDate DATETIME = NULL,  
     @ToDate DATETIME = NULL,  
     @IsPeriod INT = 0,  
     @PeriodList VARCHAR(MAX) = ''
)
AS 
DECLARE @sSQL NVARCHAR (MAX),
        @sWhere NVARCHAR(MAX),
        @OrderBy NVARCHAR(500),
        @TotalRow NVARCHAR(50),
		@LanguageID VARCHAR(50),
		@sSQLLanguage VARCHAR(100)='',
		@FromDateText NVARCHAR(20),  
        @ToDateText NVARCHAR(20)  

SELECT TOP 1 @LanguageID=LanguageID FROM AT14051 WHERE UserID=@UserID
IF @LanguageID='vi-VN'
 SET @sSQLLanguage='OOT1000.Description'
ELSE SET @sSQLLanguage='OOT1000.DescriptionE'

                
SET @sWhere = ''
SET @TotalRow = ''
SET @OrderBy = 'OOT1000.AbsentTypeID'
SET @FromDateText = CONVERT(NVARCHAR(20), @FromDate, 111)  
SET @ToDateText = CONVERT(NVARCHAR(20), @ToDate, 111) + ' 23:59:59'  

IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'
IF  @IsSearch = 1
BEGIN
	
	IF @AbsentTypeID IS NOT NULL SET @sWhere = @sWhere + '
	AND OOT1000.AbsentTypeID LIKE ''%'+@AbsentTypeID+'%'' '
	IF @Description IS NOT NULL SET @sWhere = @sWhere + '
	AND '+@sSQLLanguage+' LIKE N''%'+@Description+'%'' '
	IF @TypeID IS NOT NULL SET @sWhere = @sWhere + '
	AND OOT1000.TypeID LIKE N''%'+@TypeID+'%'' '
	IF @Note IS NOT NULL SET @sWhere = @sWhere + '
	AND OOT1000.Note LIKE N''%'+@Note+'%'' '
	--IF @Disabled IS NOT NULL SET @sWhere = @sWhere + '
	--AND OOT1000.Disabled = '+@Disabled
	IF @Disabled <> N'' SET @sWhere = @sWhere + '
	AND OOT1000.Disabled = '+@Disabled
	-- Check Para FromDate và ToDate
	IF @IsPeriod = 0
	BEGIN
		IF(ISNULL(@FromDate,'') != '' AND ISNULL(@ToDate,'') = '' )
			BEGIN
				SET @sWhere = @sWhere + ' AND (OOT1000.CreateDate >= ''' + @FromDateText + ''')'
			END
		ELSE IF(ISNULL(@FromDate,'') = '' AND ISNULL(@ToDate,'') != '')
			BEGIN
				SET @sWhere = @sWhere + ' AND (OOT1000.CreateDate <= ''' + @ToDateText + ''')'
			END
		ELSE IF(ISNULL(@FromDate, '') != '' AND ISNULL(@ToDate, '') != '')
			BEGIN
				SET @sWhere = @sWhere + ' AND (OOT1000.CreateDate BETWEEN ''' + @FromDateText + ''' AND ''' + @ToDateText + ''') '
			END
	END
	ELSE IF @IsPeriod = 1 AND ISNULL(@PeriodList, '') != ''
		BEGIN
			SET @sWhere = @sWhere + 'AND (SELECT FORMAT(OOT1000.CreateDate, ''MM/yyyy'')) IN (SELECT * FROM StringSplit(REPLACE('''+ @PeriodList + ''', '''', ''''), '',''))' 
		END
	END
	--Bổ sung điều kiện cờ xóa = 0
	SET @sWhere = @sWhere + ' AND ISNULL(OOT1000.DeleteFlg,0) = 0 '

SET @sSQL = '
SELECT ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow,
	OOT1000.DivisionID,OOT1000.APK,OOT1000.AbsentTypeID, OOT1000.TypeID, '+@sSQLLanguage+' Description,
	AbsentName as TypeName, OOT1000.Note, 
	OOT1000.CreateUserID +'' - ''+ (SELECT TOP 1 UserName FROM AT1405 WHERE UserID = OOT1000.CreateUserID) CreateUserID, OOT1000.CreateDate, 
	OOT1000.LastModifyUserID +'' - ''+ (SELECT TOP 1 UserName FROM AT1405 WHERE UserID = OOT1000.LastModifyUserID) LastModifyUserID, OOT1000.LastModifyDate,
	OOT1000.Disabled    
FROM OOT1000
LEFT JOIN HT1013 ON OOT1000.DivisionID = HT1013.DivisionID AND OOT1000.TypeID = HT1013.AbsentTypeID
where OOT1000.DivisionID = ''' +@DivisionID +'''
'
+@sWhere +'
ORDER BY '+@OrderBy+'

OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
FETCH NEXT '+STR(@PageSize)+' ROWS ONLY'

EXEC (@sSQL)
PRINT(@sSQL)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
