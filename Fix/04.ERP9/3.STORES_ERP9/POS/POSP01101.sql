IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP01101]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP01101]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
--- Load grid danh sách đơn hàng POS (danh sách đơn hàng trên APP)
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: Phan thanh hoang vu on 07/08/2017
---- Modify by Thị Phượng Date 26/09/2017 bổ sung phân quyền dữ liệu dưới APP
----Edited by: 
----Example: EXEC POSP01101 'MS', 'CH001',  '2017-01-01', '2017-12-31', '', '', '', 1, 20

 CREATE PROCEDURE POSP01101 (
		 @DivisionID VARCHAR(50),
		 @ShopID NVARCHAR(50),
		 @FromDate DATETIME,
		 @ToDate DATETIME,
		 @VoucherNo NVARCHAR(50),
		 @MemberName NVARCHAR(250),
		 @UserID VARCHAR(50),
		 @PageNumber INT,
		 @PageSize INT
		)
AS
BEGIN
	--Do store WP0141 đặt dưới bảng chuẩn ERP8, nhưng lấy bảng trên ERP9, nếu khách hàng không dùng ERP9 thì chạy store bị lỗi 
	--để xử lý vấn đề này kiểm tra thì kiểm tra bên ERP8 chạy vào không có bảng POST0016 thì không chạy vào store này
	IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[POST0011]') AND type in (N'U'))
	BEGIN
			DECLARE @sSQL NVARCHAR (4000),
				@OrderBy NVARCHAR(500),
				@sWhere NVARCHAR(MAX),
				@TotalRow VARCHAR(50)
	
			SET @sWhere = ''
	
			SET @OrderBy = ' M.CreateDate DESC, M.VoucherNo '

			SET @TotalRow = ''
			IF @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'

			IF Isnull(@DivisionID, '')!=''
				SET @sWhere = @sWhere + ' AND CONVERT(VARCHAR(10),M.VoucherDate,112) BETWEEN '+CONVERT(VARCHAR(10),@FromDate,112)+' AND '+CONVERT(VARCHAR(10),@ToDate,112)+' '
	
			--Check Para DivisionIDList null then get DivisionID 
			IF Isnull(@DivisionID, '')!=''
				SET @sWhere = @sWhere + ' AND M.DivisionID = N'''+ @DivisionID+''''		
	
			IF Isnull(@ShopID, '')!=''
				SET @sWhere = @sWhere + ' AND M.ShopID = N'''+@ShopID+''''
	
			IF Isnull(@VoucherNo, '')!=''
				SET @sWhere = @sWhere + ' AND M.VoucherNo LIKE N''%'+@VoucherNo+'%'''
	
			IF Isnull(@MemberName, '')!=''
				SET @sWhere = @sWhere + ' AND (M.MemberID LIKE N''%'+@MemberName+'%'' or P11.MemberName LIKE N''%'+@MemberName+'%'')'
			SELECT CONVERT(VARCHAR(50),'''') DataType,CONVERT(VARCHAR(Max),'''') Condition
			INTO #Permission
			--xóa dòng rỗng
			DELETE #Permission
			INSERT INTO #Permission(DataType,Condition) EXEC SP10504 @DivisionID,@UserID,'APPSaleOrderID'
			Declare @Condition Varchar(Max)
			Set  @Condition = (Select REPLACE(Condition, ',', ''',''') From #Permission) 
			IF Isnull(@Condition, '')!=''
				SET @sWhere = @sWhere + ' AND M.CreateUserID in (N'''+@Condition+''')'
	
			SET @sSQL = '
				SELECT 	ROW_NUMBER() OVER (ORDER BY '+@OrderBy+') AS RowNum, '+@TotalRow+' AS TotalRow
						, M.APK, M.DivisionID, M.ShopID, M.VoucherNo, M.VoucherDate
						, M.TranMonth, M.TranYear
						, M.SaleManID, A03.FullName as SaleManName
						, M.MemberID, P11.MemberName
						, M.CurrencyID, M.ExchangeRate
						, M.TotalAmount, M.TotalAmountConverted
						, M.PromoteChangeAmount, M.PromoteChangeAmountConverted
				FROM POST01101 M left join POST0011 P11 on M.MemberID = P11.MemberID
								 left join AT1103 A03 on M.SaleManID = A03.EmployeeID
				WHERE M.DeleteFlg = 0 ' +@sWhere + '
				ORDER BY '+@OrderBy+'
				OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
				FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
			EXEC (@sSQL)
		END
END
	




