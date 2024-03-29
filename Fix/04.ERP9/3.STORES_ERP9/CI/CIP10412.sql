IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP10412]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[CIP10412]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- <Summary>
---- Load lưới Form CIF1041 Cập nhật email template tab khai báo biến
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 01/06/2017: cải tiến load lưới Email template bằng Store không dùng câu sql thường
----Eidted by: Phan thanh hoàng vũ, Date: 22/02/2018: Bổ sung thêm tham số truyền DBadmin tương ứng với từng dữ liệu khách hàng
-- <Example> EXEC CIP10412  'HCM' , 'TEST','vi-VN', 'AS_ADMIN_OKIA'
CREATE PROCEDURE CIP10412 ( 
        @DivisionID VARCHAR(50),  --Biến môi trường
		@TemplateID VARCHAR(50),
		@LanguageID nvarchar(250), --Biến môi trường		
		@DBAdmin NVARCHAR(250) = null
) 
AS 
BEGIN
DECLARE @sSQL01 nvarchar(Max),
		@sSQL02 nvarchar(Max),
		@sWhere nvarchar(Max)
		
		
Set @sWhere = ''
Set @sSQL01 = '	
		DECLARE @RefScreenID  VARCHAR(50), 
				@RefScreenName nVarchar(250), 
				@RefTableID  VARCHAR(50), 
				@RefLanguageID  VARCHAR(50),
				@cur_AllDivision CURSOR
		Declare @ResultTableID Table (
					ID int, 
					ScreenID varchar(50), 
					ScreenName nvarchar(250), 
					TableID varchar(50), 
					ColumnID varchar(50), 
					ColumnName nvarchar(250), 
					ColumnAliasID varchar(50), 
					ColumnAliasName nvarchar(250))
		--Duyệt DBAdmin để lấy ngôn ngữ và tên màn hình
		SET @cur_AllDivision = CURSOR SCROLL KEYSET FOR
				Select Distinct M.ScreenID, D2.Name as ScreenName, M.TableID, N'''+@LanguageID +'''  as LanguageID
				from AT0130 M WITH (NOLOCK) Left join ['+@DBAdmin +'].[dbo].sysScreen D With (NOLOCK) on  M.TableID = D.sysTable and M.ScreenID = D.ScreenID
											Left join ['+@DBAdmin +'].[dbo].[sysMenu] D1 With (NOLOCK) on  D.Parent = D1.sysScreenID
											Left join A00001 D2 With (NOLOCK) on D1.MenuText = D2.ID  and D2.LanguageID = N'''+@LanguageID +'''
				Where M.TemplateID =  N'''+@TemplateID +''' '
Set @sSQL02 = '	
		OPEN @cur_AllDivision
		FETCH NEXT FROM @cur_AllDivision INTO @RefScreenID, @RefScreenName, @RefTableID, @RefLanguageID
		WHILE @@FETCH_STATUS = 0
			BEGIN	
					--Lấy các trường của bảng chính nếu Emailgroup chọn lấy từ trong DBadmin
					Insert into @ResultTableID (ID, ScreenID, ScreenName, TableID, ColumnID, ColumnName, ColumnAliasID, ColumnAliasName)
					Select TabIndexPopup, @RefScreenID, @RefScreenName, @RefTableID, M.ColumnName, D.Name
							, @RefScreenID+''.''+ M.ColumnName, ''[''+@RefScreenName+''].[''+ D.Name+'']''
					from ['+@DBAdmin +'].[dbo].[sysFields]  M With (NOLOCK) 
								Left join A00001 D With (NOLOCK) on @RefScreenID+''.''+ M.ColumnName = D.ID and D.LanguageID = @RefLanguageID
					Where M.Systable = @RefTableID and D.Name is not null and (M.TabIndexPopup is not null and TabIndexPopup !=0)
				
			FETCH NEXT FROM @cur_AllDivision INTO @RefScreenID, @RefScreenName, @RefTableID, @RefLanguageID
			END
		CLOSE @cur_AllDivision
	
		Select M.TemplateID
			, M.MethodID
			, M.ShowDescriptionID
			, Isnull(D.ColumnAliasName, ''[''+M.ShowDescriptionID+''].[''+V99.ColumnName+'']'' ) as ShowDescriptionName
			, D.ColumnName
			, D.ColumnAliasID
			, M.TableID, M.ScreenID
		from AT0130 M WITH (NOLOCK)  left join @ResultTableID D on M.ShowDescriptionID = D.ColumnID and M.ScreenID = D.ScreenID and M.TableID = D.TableID
									 Inner join AT0129 WITH (NOLOCK) on M.TemplateID = AT0129.TemplateID
									 Left join DRV0099 V99 ON V99.ColumnID = M.ShowDescriptionID AND V99.EmailGroup = AT0129.EmailGroupID 
		Where M.TemplateID = N'''+@TemplateID +''' 
		Order by M.OrderNo, D.ID
		'
		EXEC (@sSQL01 + @sSQL02)
		print (@sSQL01 + @sSQL02)
END		



GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
