IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'CIF10411') AND XTYPE IN (N'FN', N'IF', N'TF'))
DROP FUNCTION  CIF10411
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Dropdown/Combo [Nội dung hiển thị] Form CIF1041 Cập nhật email template
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 31/03/2017
----Modified by :Cao Thị Phương, Date: 24/04/2017: Bổ sung with (NOLOCK)
-- <Example>
/*
--Lấy dữ liệu đối với trường hợp DBadmin
EXEC CIF10411  'AS' ,'','CRMT20301' ,'CRMF2031' 
--Lấy dữ liệu đối với trường hợp view DRV0099
Declare @LanguageID varchar(50)
EXEC CIF10411  'AS' ,'Contract','' ,'', @LanguageID output 
Select * from CIF10411('AS' ,'','CRMT20501' ,'CRMF2051', 'vi-VN')
*/
CREATE FUNCTION CIF10411 ( 
        @DivisionID VARCHAR(50),  --Biến môi trường
		@EmailGroup VARCHAR(50),
		@TableID nvarchar(50),
        @ScreenID nvarchar(250),		
		@LanguageID nvarchar(250)		
) 
returns @ResultTableID Table ( 
			ColumnID nvarchar(50),			--Mã cột
			ColumnName nvarchar(250),		--Tên cột
			ColumnAliasID nvarchar(50),		--Alias mã cột
			ColumnAliasName nvarchar(250),	--Alias tên cột
			ScreenID nvarchar(50),			--Mã màn hình
			ScreenName nvarchar(50),			--Tên màn hình
			TableID nvarchar(50),			--Mã bảng
			OrderNo int						--Thứ tự
			)  
AS 
BEGIN
DECLARE @RefScreenID  VARCHAR(50), 
		@RefTableID  VARCHAR(50), 
		@RefScreenName nVarchar(250), 
		@OrderNo  VARCHAR(50), 
		@cur_AllDivision CURSOR
		
		Insert into @ResultTableID (ScreenID, ScreenName, TableID, ColumnID, ColumnName, ColumnAliasID, ColumnAliasName, OrderNo)
		--Lấy các trường của bảng chính nếu Emailgroup chọn lấy từ trong view DRV0099
		Select NULL as ScreenID, NULL as ScreenName, NULL as TableID
				, ColumnID , ColumnName
				, EmailGroup+'.'+ ColumnID as ColumnAliasID
				, '['+EmailGroup+'].['+ ColumnName+']' as ColumnAliasName
				, 1 as OrderNo 
		from DRV0099
		Where EmailGroup = @EmailGroup
		Union all
		--Lấy các trường của bảng chính nếu Emailgroup chọn lấy từ trong DBadmin
		Select @ScreenID as ScreenID, D4.Name as ScreenName, M.Systable as TableID
				, M.ColumnName as ColumnID , D1.Name as ColumnName
				, @ScreenID+'.'+ M.ColumnName as ColumnAliasID
				, '['+D4.Name+'].['+ D1.Name+']' as ColumnAliasName
				, 1 as OrderNo 
		from AS_ADMIN_CRM.[dbo].[sysFields]  M  With (NOLOCK) 
				left join AS_ADMIN_CRM.[dbo].[sysTable] D With (NOLOCK) on M.Systable = D.TableName
				Left join A00001 D1 With (NOLOCK) on @ScreenID+'.'+ M.ColumnName = D1.ID and D1.LanguageID = @LanguageID
				Left join AS_ADMIN_CRM.[dbo].sysScreen D2 With (NOLOCK) on  D2.sysTable = D.TableName and D2.ScreenID = D.RefScreenMainID
				Left join AS_ADMIN_CRM.[dbo].[sysMenu] D3 With (NOLOCK) on  D2.Parent = D3.sysScreenID
				Left join A00001 D4 With (NOLOCK) on D3.MenuText = D4.ID  and D4.LanguageID = @LanguageID
		Where M.Systable = @TableID and D1.Name is not null
		Union all
		--Lấy các trường chung đơn vị hay thông tin công ty (Luôn có biến môi trường)
		Select N'CIF1121' as ScreenID, D4.Name as ScreenName, M.Systable as TableID
				, M.ColumnName as ColumnID , D1.Name as ColumnName
				, N'CIF1121'+'.'+ M.ColumnName as ColumnAliasID
				, '['+D4.Name+'].['+ D1.Name+']' as ColumnAliasName
				, 3 as OrderNo 
		from AS_ADMIN_CRM.[dbo].[sysFields]  M With (NOLOCK)  
				left join AS_ADMIN_CRM.[dbo].[sysTable] D With (NOLOCK)  on M.Systable = D.TableName
				Left join A00001 D1 With (NOLOCK)  on N'CIF1121'+'.'+ M.ColumnName = D1.ID and D1.LanguageID = @LanguageID
				Left join AS_ADMIN_CRM.[dbo].sysScreen D2 With (NOLOCK)  on  D2.sysTable = D.TableName and D2.ScreenID = D.RefScreenMainID
				Left join AS_ADMIN_CRM.[dbo].[sysMenu] D3 With (NOLOCK)  on  D2.Parent = D3.sysScreenID
				Left join A00001 D4 With (NOLOCK)  on D3.MenuText = D4.ID  and D4.LanguageID = @LanguageID
		Where M.Systable = N'AT1101' and D1.Name is not null


		--Duyệt tất cả các trường trong bảng chính để lấy ra những ID lưu mã của bảng khác
		SET @cur_AllDivision = CURSOR SCROLL KEYSET FOR
				Select D.RefScreenMainID, M.RefTableComboboxID, D4.Name, 2 + DENSE_RANK() over (order by D.Description)  as OrderNo
				from AS_ADMIN_CRM.[dbo].[sysFields]  M With (NOLOCK) 
						Inner join AS_ADMIN_CRM.[dbo].[sysTable] D With (NOLOCK) on M.RefTableComboboxID = D.TableName
						Left join AS_ADMIN_CRM.[dbo].sysScreen D2 With (NOLOCK) on  D2.sysTable = D.TableName and D2.ScreenID = D.RefScreenMainID
						Left join AS_ADMIN_CRM.[dbo].[sysMenu] D3 With (NOLOCK) on  D2.Parent = D3.sysScreenID
						Left join A00001 D4 With (NOLOCK) on D3.MenuText = D4.ID  and D4.LanguageID = @LanguageID
				Where M.Systable = @TableID and D.RefScreenMainID is not null and M.RefTableComboboxID is not null

		OPEN @cur_AllDivision
		FETCH NEXT FROM @cur_AllDivision INTO @RefScreenID, @RefTableID, @RefScreenName, @OrderNo
		WHILE @@FETCH_STATUS = 0
			BEGIN	
				IF NOT EXISTS ( SELECT TOP 1 1 FROM @ResultTableID WHERE ScreenID = @RefScreenID and TableID = @RefTableID)
				BEGIN
					--Lấy các trường của bảng chính nếu Emailgroup chọn lấy từ trong DBadmin
					Insert into @ResultTableID (ScreenID, ScreenName, TableID, ColumnID, ColumnName, ColumnAliasID, ColumnAliasName, OrderNo)

					Select @RefScreenID, @RefScreenName, @RefTableID, M.ColumnName, D.Name
							, @RefScreenID+'.'+ M.ColumnName, '['+@RefScreenName+'].['+ D.Name+']'
							, @OrderNo
					from AS_ADMIN_CRM.[dbo].[sysFields]  M With (NOLOCK) Left join A00001 D With (NOLOCK) on @RefScreenID+'.'+ M.ColumnName = D.ID
					Where M.Systable = @RefTableID and D.Name is not null
				End
			FETCH NEXT FROM @cur_AllDivision INTO @RefScreenID, @RefTableID, @RefScreenName, @OrderNo
			END
		CLOSE @cur_AllDivision
	RETURN
END		
