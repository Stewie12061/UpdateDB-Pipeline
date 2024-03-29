IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP10411]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[CIP10411]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- <Summary>
---- Load Dropdown/Combo [Nội dung hiển thị] Form CIF1041 Cập nhật email template tab khai báo biến
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 01/06/2017
----Modify by: Thi Phượng, Date: 14/07/2017 bổ sung distinct tránh double dữ liệu
----Modify by: Phan thanh hoàng vũ, Date: 22/02/2018: Bổ sung thêm tham số truyền DBadmin tương ứng với từng dữ liệu khách hàng
-- <Example> EXEC CIP10411  'AS' ,'','CRMT10101' ,'CRMF1011', 'vi-VN', 'AS_ADMIN_OKIA'

CREATE PROCEDURE CIP10411 ( 
        @DivisionID VARCHAR(50),  --Biến môi trường
		@EmailGroup VARCHAR(50),
		@TableID nvarchar(50),
        @ScreenID nvarchar(250),		
		@LanguageID nvarchar(250), --Biến môi trường		
		@DBAdmin NVARCHAR(250) = null
) 
AS 
BEGIN
DECLARE @sSQL01 nvarchar(Max),
		@sSQL02 nvarchar(Max),
		@sSQL03 nvarchar(Max),
		@sWhere nvarchar(Max)
Set @sWhere = ''
IF Isnull(@ScreenID, '') = '' and Isnull(@TableID, '') = ''
Begin
	Set @sSQL01 = '	
		--Lấy các trường của bảng chính nếu Emailgroup chọn lấy từ trong view DRV0099
		Select NULL as ScreenID, NULL as ScreenName, NULL as TableID
				, ColumnID as ShowDescriptionID, ColumnName as ShowDescriptionName
				, EmailGroup+''.''+ ColumnID as ColumnAliasID
				, ''[''+EmailGroup+''].[''+ ColumnName+'']'' as ColumnAliasName
				, 1 as OrderNo 
				--into #ResultTableID
		from DRV0099
		Where EmailGroup = N'''+@EmailGroup+''''
		Exec  (@sSQL01)
End
Else
Begin
		Set @sSQL01 = '	
		DECLARE @RefScreenID  VARCHAR(50), 
		@RefTableID  VARCHAR(50), 
		@RefScreenName nVarchar(250), 
		@OrderNo  VARCHAR(50), 
		@cur_AllDivision CURSOR
		--Lấy các trường của bảng chính nếu Emailgroup chọn lấy từ trong DBadmin
		Select Distinct TabIndexPopup as ID, '''+@ScreenID+''' as ScreenID, D4.Name as ScreenName, M.Systable as TableID
				, M.ColumnName as ColumnID , D1.Name as ColumnName
				, '''+@ScreenID+'''+''.''+M.ColumnName as ColumnAliasID
				, ''[''+D4.Name+''].[''+D1.Name+'']'' as ColumnAliasName, 1 as OrderNo 
				into #ResultTableID
		from ['+@DBAdmin +'].[dbo].[sysFields]  M  With (NOLOCK) 
				left join ['+@DBAdmin +'].[dbo].[sysTable] D With (NOLOCK) on M.Systable = D.TableName
				Left join A00001 D1 With (NOLOCK) on '''+@ScreenID+'''+''.''+M.ColumnName = D1.ID and D1.LanguageID = N'''+@LanguageID+'''
				Left join ['+@DBAdmin +'].[dbo].sysScreen D2 With (NOLOCK) on  D2.sysTable = D.TableName and D2.ScreenID = D.RefScreenMainID
				Left join ['+@DBAdmin +'].[dbo].[sysMenu] D3 With (NOLOCK) on  D2.Parent = D3.sysScreenID
				Left join A00001 D4 With (NOLOCK) on D3.MenuText = D4.ID  and D4.LanguageID = N'''+@LanguageID+'''
		Where M.Systable = '''+@TableID +''' and D1.Name is not null and (M.TabIndexPopup is not null and TabIndexPopup !=0) '
		Set @sSQL02 = '		Union all
		--Lấy các trường chung đơn vị hay thông tin công ty (Luôn có biến môi trường)
		Select Distinct TabIndexPopup, N''CIF1121'' as ScreenID, D4.Name as ScreenName, M.Systable as TableID
				, M.ColumnName as ColumnID , D1.Name as ColumnName
				, ''CIF1121''+''.''+M.ColumnName as ColumnAliasID
				, ''[''+D4.Name+''].[''+D1.Name+'']'' as ColumnAliasName, 3 as OrderNo 
		from ['+@DBAdmin +'].[dbo].[sysFields]  M With (NOLOCK)  
				left join ['+@DBAdmin +'].[dbo].[sysTable] D With (NOLOCK)  on M.Systable = D.TableName
				Left join A00001 D1 With (NOLOCK)  on ''CIF1121''+''.''+M.ColumnName = D1.ID and D1.LanguageID = N'''+@LanguageID+'''
				Left join ['+@DBAdmin +'].[dbo].sysScreen D2 With (NOLOCK)  on  D2.sysTable = D.TableName and D2.ScreenID = D.RefScreenMainID
				Left join ['+@DBAdmin +'].[dbo].[sysMenu] D3 With (NOLOCK)  on  D2.Parent = D3.sysScreenID
				Left join A00001 D4 With (NOLOCK)  on D3.MenuText = D4.ID  and D4.LanguageID = N'''+@LanguageID+'''
		Where M.Systable = N''AT1101'' and D1.Name is not null and (M.TabIndexPopup is not null and TabIndexPopup !=0)

		--Duyệt tất cả các trường trong bảng chính để lấy ra những ID lưu mã của bảng khác
		SET @cur_AllDivision = CURSOR SCROLL KEYSET FOR
				Select D.RefScreenMainID, M.RefTableComboboxID, D4.Name, 2 + DENSE_RANK() over (order by D.Description)  as OrderNo
				from ['+@DBAdmin +'].[dbo].[sysFields]  M With (NOLOCK) 
						Inner join ['+@DBAdmin +'].[dbo].[sysTable] D With (NOLOCK) on M.RefTableComboboxID = D.TableName and D.RefScreenMainID is not null and M.RefTableComboboxID is not null
						Left join ['+@DBAdmin +'].[dbo].sysScreen D2 With (NOLOCK) on  D2.sysTable = D.TableName and D2.ScreenID = D.RefScreenMainID
						Left join ['+@DBAdmin +'].[dbo].[sysMenu] D3 With (NOLOCK) on  D2.Parent = D3.sysScreenID
						Left join A00001 D4 With (NOLOCK) on D3.MenuText = D4.ID  and D4.LanguageID = N'''+@LanguageID+'''
				Where M.Systable =N'''+@TableID +''' '
		Set @sSQL03 = '	
		OPEN @cur_AllDivision
		FETCH NEXT FROM @cur_AllDivision INTO @RefScreenID, @RefTableID, @RefScreenName, @OrderNo
		WHILE @@FETCH_STATUS = 0
			BEGIN	
				IF NOT EXISTS ( SELECT TOP 1 1 FROM #ResultTableID WHERE ScreenID = @RefScreenID and TableID = @RefTableID)
				BEGIN
					--Lấy các trường của bảng chính nếu Emailgroup chọn lấy từ trong DBadmin
					Insert into #ResultTableID (ID, ScreenID, ScreenName, TableID, ColumnID, ColumnName, ColumnAliasID, ColumnAliasName, OrderNo)
					Select TabIndexPopup, @RefScreenID, @RefScreenName, @RefTableID, M.ColumnName, D.Name
							, @RefScreenID+''.''+ M.ColumnName, ''[''+@RefScreenName+''].[''+ D.Name+'']'', @OrderNo
					from ['+@DBAdmin +'].[dbo].[sysFields]  M With (NOLOCK) Left join A00001 D With (NOLOCK) on @RefScreenID+''.''+ M.ColumnName = D.ID and D.LanguageID = N'''+@LanguageID+'''
					Where M.Systable = @RefTableID and D.Name is not null and (M.TabIndexPopup is not null and TabIndexPopup !=0)
				End
			FETCH NEXT FROM @cur_AllDivision INTO @RefScreenID, @RefTableID, @RefScreenName, @OrderNo
			END
		CLOSE @cur_AllDivision
		Select ColumnID as ShowDescriptionID
			, ColumnAliasName as ShowDescriptionName
			, ScreenID, ScreenName
			, TableID, ColumnName , ColumnAliasID
		From #ResultTableID
		Order by OrderNo, ID '
	Exec  (@sSQL01+@sSQL02+@sSQL03)
	End
	
	
END		


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
