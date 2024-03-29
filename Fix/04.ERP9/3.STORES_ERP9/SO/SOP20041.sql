IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SOP20041]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[SOP20041]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
---- Created by:  	Phan thanh hoàng Vũ,  on 26/07/2016
---- Purpose: thong tin ton kho cua mat hang (Xem nhanh ton kho - SOF2004)
---- Edit by: hoàng vũ customize cho hoàng trần: xử lý trường hợp giao hộ
/***************************************************************
EXEC SOP20041 'HT', 12, 2016, 'HV_BINH', '', 1, 25
**************************************************************/

CREATE PROCEDURE SOP20041
(
	@DivisionID NVARCHAR(50),
	@TranMonth INT,
	@TranYear INT,
	@InventoryID NVARCHAR(50),
	@UserID VARCHAR(50),
    @PageNumber INT,
    @PageSize INT
)				
AS
DECLARE @sSQL NVARCHAR(4000),
		@IsColumn TINYINT,
		@RowField NVARCHAR(50),
		@Caption VARCHAR(150),
		@AmountType1 NVARCHAR(50),
		@AmountType2 NVARCHAR(50),
		@AmountType3 NVARCHAR(50),
		@AmountType4 NVARCHAR(50),
		@AmountType5 NVARCHAR(50),
		@ColumnID NVARCHAR(50),
		@Sign1 NVARCHAR(50),
	 	@Sign2 NVARCHAR(50),
		@Sign3 NVARCHAR(50),
		@Sign4 NVARCHAR(50),
		@Sign5 NVARCHAR(50),
		@SQL NVARCHAR(4000),
		@Cur CURSOR,
		@Index TINYINT,
		@CustomerName INT,
		@sWarehouseID NVARCHAR(4000)
		CREATE Table #CustomerName (CustomerName INT, ImportExcel int)
		INSERT #CustomerName EXEC AP4444
		SET @CustomerName = (SELECT TOP 1 CustomerName FROM #CustomerName)

		--Biến bảng @OV2801 thay thế view động OV2801
		Declare @OV2801 table (
								DivisionID varchar(50),
								InventoryID varchar(50),
								WareHouseID varchar(50),
								SQuantity decimal(28,8),
								PQuantity decimal(28,8))			
		
		IF @CustomerName = 51
		Begin
			Insert into @OV2801 (DivisionID, InventoryID, WareHouseID, SQuantity, PQuantity)
			SELECT DivisionID, InventoryID, WareHouseID, 
							SUM(CASE WHEN TypeID <> 'PO' AND Finish <> 1 THEN OrderQuantity - ActualQuantity ELSE 0 END) SQuantity,
							SUM(CASE WHEN TypeID = 'PO' AND Finish <> 1  THEN OrderQuantity - ActualQuantity ELSE 0 END) PQuantity
			FROM OV2800 WITH (NOLOCK)
			GROUP BY DivisionID, InventoryID, WareHouseID 
			Set @sWarehouseID = ' Where M.WareHouseID  = 
									( Case when Isnull(A.IsBottle, 0)  = 0
										   then (Select WareHouseID From CRMT00000 where DivisionID = '''+@DivisionID+''')
										   else (Select WareHouseTempID From CRMT00000 where DivisionID = '''+@DivisionID+''') end )'
			
		End
		Else
		Begin
			Insert into @OV2801 (DivisionID, InventoryID, WareHouseID, SQuantity, PQuantity)
			SELECT DivisionID, InventoryID, WareHouseID, 
							SUM(CASE WHEN TypeID <> 'PO' AND Finish <> 1 THEN OrderQuantity - ActualQuantity ELSE 0 END) SQuantity,
							SUM(CASE WHEN TypeID = 'PO' AND Finish <> 1  THEN OrderQuantity - ActualQuantity ELSE 0 END) PQuantity
			FROM OV2800 WITH (NOLOCK)
			GROUP BY DivisionID, InventoryID, WareHouseID 
			
			Set @sWarehouseID = ''
			
		End
		--Biến bảng @OV2401 thay thế view động OV2401
		Declare @OV2401 table (
								DivisionID varchar(50),
								WareHouseID varchar(50),
								InventoryID varchar(50),
								DebitQuantity decimal(28,8),
								CreditQuantity decimal(28,8),
								ENDQuantity decimal(28,8))	
		Insert into @OV2401 (DivisionID, WareHouseID, InventoryID, DebitQuantity, CreditQuantity, ENDQuantity)
		Select x.DivisionID, x.WareHouseID, x.InventoryID
			   , Sum(x.DebitQuantity) DebitQuantity
			   , sum(x.CreditQuantity) CreditQuantity
			   , Case when x.IsBottle = 1 then sum(x.CreditQuantity) - Sum(x.DebitQuantity) else Sum(x.DebitQuantity)-sum(x.CreditQuantity) end ENDQuantity
		From (
				Select DivisionID,  WareHouseID,  InventoryID, DebitQuantity, CreditQuantity, isnull(IsBottle, 0) as IsBottle
				from AV7000_HT 
				Where DivisionID = @DivisionID AND TranMonth + 100* TranYear <     @TranMonth + 100* @TranYear 
				Union all
				Select DivisionID,  WareHouseID,  InventoryID, DebitQuantity, CreditQuantity, isnull(IsBottle, 0) as IsBottle
				from AV7001_HT
				Where DivisionID = @DivisionID AND TranMonth + 100* TranYear =     @TranMonth + 100* @TranYear 
					) x
		Where x.DivisionID = @DivisionID and x.InventoryID = @InventoryID
		Group by x.DivisionID,  x.WareHouseID, x.InventoryID, x.IsBottle
		HAVING Sum(x.DebitQuantity)-sum(x.CreditQuantity) <> 0 or sum(x.CreditQuantity) - Sum(x.DebitQuantity) <> 0
		
		--Bảng tạm #OV2506 thay thế view động OV2506		
		SELECT ISNULL(V00.DivisionID, V01.DivisionID) DivisionID,
				ISNULL(V00.WareHouseID,V01.WareHouseID) WareHouseID,
				ISNULL(V00.InventoryID,V01.InventoryID) InventoryID,
				CASE WHEN V01.ENDQuantity = 0 THEN NULL ELSE V01.ENDQuantity END  ENDQuantity,
				CASE WHEN V00.SQuantity = 0 THEN NULL ELSE V00.SQuantity END SQuantity,
				CASE WHEN V00.PQuantity = 0 THEN NULL ELSE V00.PQuantity END PQuantity,
				ISNULL(V01.ENDQuantity,0) - ISNULL(V00.SQuantity, 0) +  ISNULL(V00.PQuantity, 0) ReadyQuantity,
				CASE WHEN ISNULL(T01.MaxQuantity,0) = 0 THEN NULL ELSE T01.MaxQuantity END MaxQuantity, 
			CASE WHEN ISNULL(T01.MinQuantity, 0) = 0 THEN NULL ELSE T01.MinQuantity END MinQuantity
			into #OV2506
		FROM @OV2801 V00 FULL JOIN @OV2401 V01 ON V00.WareHouseID = V01.WareHouseID AND V00.InventoryID = V01.InventoryID AND V00.DivisionID = V01.DivisionID
							LEFT JOIN AT1314 T01  WITH (NOLOCK) ON T01.InventoryID = ISNULL(V00.InventoryID, V01.InventoryID) 
													AND ISNULL (V00.WareHouseID, V01.WareHouseID) LIKE T01.WareHouseID AND T01.DivisionID = V00.DivisionID
		WHERE ISNULL(V00.InventoryID, V01.InventoryID) = isnull(@InventoryID,'')
			AND(ISNULL(EndQuantity,0) <> 0 OR ISNULL(SQuantity,0) <> 0 OR PQuantity <> 0) 
			AND ISNULL(V00.DivisionID, V01.DivisionID)  = @DivisionID

		--Xử lý cột động phục vụ thiết lập báo cáo tồn kho trong MODULE OP
		SET @Index =1		
		SET @SQL =''
		SET @Cur =  CURSOR SCROLL KEYSET FOR 
			SELECT ColumnID, Caption, IsColumn, Sign1, AmountType1, Sign2, AmountType2, Sign3, AmountType3
			FROM OT4010  WITH (NOLOCK) ORDER BY ColumnID
		OPEN @Cur
		FETCH NEXT FROM  @Cur INTO @ColumnID, @Caption,  @IsColumn, @Sign1, @AmountType1, @Sign2, @AmountType2, @Sign3, @AmountType3
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @SQL = @SQL  + '('
			IF ISNULL(@Sign1, '') <> ''
			BEGIN
				IF ISNULL(@AmountType1, '') = 'DV'												-- hàng đang về
					SET @SQL = @SQL + @Sign1 + ' ISNULL(PQuantity, 0) '
				ELSE IF ISNULL(@AmountType1, '') = 'GC'										    -- hàng giữ chỗ
						SET @SQL = @SQL + @Sign1 + ' ISNULL( SQuantity, 0) '
					 ELSE IF ISNULL(@AmountType1,'') = 'TT'										-- tồn kho thực tế
							 SET @SQL =  @SQL + @Sign1 + ' ISNULL(EndQuantity, 0) '
						  ELSE IF ISNULL(@AmountType1, '') = 'MIN'								-- tồn kho thực tế
									SET @SQL = @SQL + @Sign1 + ' ISNULL(MinQuantity, 0) '
								ELSE IF ISNULL(@AmountType1, '') = 'MAX'						-- tồn kho thực tế
										SET @SQL = @SQL + @Sign1 + ' ISNULL(MaxQuantity, 0) '
			END
			IF ISNULL(@Sign2, '') <> ''
				BEGIN
					IF ISNULL(@AmountType2, '') = 'DV'											-- hàng đang về
						SET @SQL = @SQL + @Sign2 + ' ISNULL(PQuantity, 0) '
					ELSE if ISNULL(@AmountType2, '') = 'GC'										-- hàng giữ chỗ
							SET @SQL = @SQL + @Sign2 + ' ISNULL(SQuantity, 0) '
						 ELSE IF ISNULL(@AmountType2, '') = 'TT'								-- tồn kho thực tế
								 SET @SQL = @SQL + @Sign2 + ' ISNULL(EndQuantity, 0)'
							  ELSE IF ISNULL(@AmountType2, '') = 'MIN'							-- tồn kho thực tế
									  SET @SQL = @SQL + @Sign1 + ' ISNULL(MinQuantity, 0) '
								   ELSE IF ISNULL(@AmountType2, '') = 'MAX'						-- tồn kho thực tế
										   SET @SQL = @SQL + @Sign1 + ' ISNULL(MaxQuantity, 0) '
				END
			IF ISNULL(@Sign3, '') <> ''
				BEGIN
					IF ISNULL(@AmountType3, '') = 'DV'											-- hàng đang về
						SET @SQL = @SQL + @Sign3 + ' ISNULL(PQuantity, 0) '
					ELSE IF ISNULL(@AmountType3, '') = 'GC'										-- hàng giữ chỗ
							SET @SQL = @SQL + @Sign3 + ' ISNULL(SQuantity, 0) '
						 ELSE IF ISNULL(@AmountType3, '') = 'TT'								-- tồn kho thực tế
								 SET @SQL = @SQL + @Sign3 + ' ISNULL(EndQuantity, 0)'
							  ELSE IF ISNULL(@AmountType3, '') = 'MIN'							-- tồn kho thực tế
									  SET @SQL = @SQL + @Sign1 + ' ISNULL(MinQuantity, 0) '
								   ELSE IF ISNULL(@AmountType3, '') = 'MAX'						-- tồn kho thực tế
											SET @SQL = @SQL + @Sign1 + ' ISNULL(MaxQuantity, 0) '
				END
			IF ISNULL(@Sign4, '') <> ''
				BEGIN
					IF ISNULL(@AmountType4, '') = 'DV'											-- hàng đang về
					   SET @SQL = @SQL + @Sign4 + ' ISNULL(PQuantity, 0)  '
					ELSE IF ISNULL(@AmountType4, '') = 'GC'										-- hàng giữ chỗ
							SET @SQL = @SQL + @Sign4 + '  ISNULL(SQuantity, 0) '
						 ELSE IF ISNULL(@AmountType4, '') = 'TT'								-- tồn kho thực tế
								 SET @SQL = @SQL + @Sign4 + ' ISNULL(EndQuantity, 0)'
							  ELSE IF ISNULL(@AmountType4, '') = 'MIN'							-- tồn kho thực tế
									  SET @SQL = @SQL + @Sign4 + ' ISNULL(MinQuantity, 0) '
								   ELSE IF ISNULL(@AmountType4, '') = 'MAX'						-- tồn kho thực tế
										   Set @SQL = @SQL + @Sign4 + ' ISNULL(MaxQuantity, 0) '
				END
			IF ISNULL(@Sign5, '') <> ''
				BEGIN
					IF ISNULL( @AmountType5, '') = 'DV'											-- hàng đang về
					   SET @SQL = @SQL + @Sign5 + ' ISNULL(PQuantity, 0) '
					ELSE IF ISNULL(@AmountType5, '') = 'GC'										-- hàng giữ chỗ
							SET @SQL = @SQL + @Sign5 + ' ISNULL(SQuantity, 0) '
						 ELSE IF ISNULL(@AmountType5, '') = 'TT'								-- tồn kho thực tế
								 SET @SQL = @SQL + @Sign5 + ' ISNULL(EndQuantity, 0)'
							  ELSE IF ISNULL(@AmountType5, '') = 'MIN'							-- tồn kho thực tế
									  SET @SQL = @SQL + @Sign5 + ' ISNULL(MinQuantity, 0) '
								   ELSE IF ISNULL(@AmountType5, '') = 'MAX'						-- tồn kho thực tế
										   SET @SQL = @SQL + @Sign5 + ' ISNULL(MaxQuantity, 0) '
				END
			SET @SQL = @SQL + ') AS ColumnValue' + LTRIM(@Index) + ','
			SET @Index = @Index + 1
			FETCH NEXT FROM @Cur INTO @ColumnID, @Caption, @IsColumn, @Sign1, @AmountType1, @Sign2, @AmountType2, @Sign3, @AmountType3
		END
		CLOSE @Cur 

		--Đểm số dòng xử lý phân trang
		Declare @CountTotal NVARCHAR(Max)
		IF Cast(@PageNumber as varchar(2)) = 1
			Set @CountTotal = (Select Count(WareHouseID) From #OV2506  WITH (NOLOCK))
		Else
			Set @CountTotal = 0

		--Lấy kết quả trả ra trực tiếp thay thế dùng view động OV2504
		SET @sSQL = 'SELECT M.DivisionID, M.WareHouseID, M.InventoryID, A.InventoryName, M.EndQuantity, M.SQuantity, M.PQuantity, M.ReadyQuantity, M.MaxQuantity, M.MinQuantity, '
					 +@SQL+ @CountTotal + ' AS TotalRow, ROW_NUMBER() OVER (ORDER BY M.DivisionID, M.WareHouseID) AS RowNum
					 FROM #OV2506 M WITH (NOLOCK) Left join AT1302 A WITH (NOLOCK) on M.DivisionID = A.DivisionID and M.InventoryID = A.InventoryID
					 '
					 + @sWarehouseID+'
					 ORDER BY M.DivisionID, M.WareHouseID
					 OFFSET '+STR((@PageNumber-1) * @PageSize)+' ROWS
					 FETCH NEXT '+STR(@PageSize)+' ROWS ONLY '
		EXEC (@sSQL)
		Print (@sSQL)
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO


