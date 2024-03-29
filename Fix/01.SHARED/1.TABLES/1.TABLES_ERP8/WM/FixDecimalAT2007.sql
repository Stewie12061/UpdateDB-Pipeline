-- Tạo bởi Võ Việt Khánh (26/04/2011)
-- Fix lại giá xuất kho và giá nhập kho trong trường hợp thay đổi Số thập phân qui đổi (ConvertedDecimals)
--   Ví dụ: 
--   + Trước đây ConvertedDecimals = 3 thì ConvertedAmount = 1,888
--   + Sau này đổi ConvertedDecimals = 1 thì sẽ cập nhật ConvertedAmount = 1,8 (chú ý không phải 1,9)

DECLARE
    @Cursor CURSOR, 
    @DivisionID NVARCHAR(3),
    @ConvertedDecimals INT,
	@CustomerIndex int


SELECT @CustomerIndex = CustomerName From CustomerIndex

IF (@CustomerIndex = 43)
BEGIN	
	-- Mã đơn vị cần fix. Mặc định '%' để fix tất cả đơn vị
	SET @DivisionID = '%'

	SET @Cursor = CURSOR SCROLL KEYSET FOR 
		SELECT DivisionID, POWER(10, ConvertedDecimals) ConvertedDecimals FROM AT0001 WHERE DivisionID LIKE @DivisionID
	OPEN @Cursor
	FETCH NEXT FROM @Cursor INTO @DivisionID, @ConvertedDecimals
	WHILE @@Fetch_Status = 0 
	BEGIN
		UPDATE AT2007
		SET 
		OriginalAmount = FLOOR(OriginalAmount * @ConvertedDecimals) / @ConvertedDecimals,
		ConvertedAmount = FLOOR(ConvertedAmount * @ConvertedDecimals) / @ConvertedDecimals
		WHERE OriginalAmount <> FLOOR(OriginalAmount * @ConvertedDecimals) / @ConvertedDecimals
		OR ConvertedAmount <> FLOOR(ConvertedAmount * @ConvertedDecimals) / @ConvertedDecimals
		FETCH NEXT FROM @Cursor INTO @DivisionID, @ConvertedDecimals
	END 
	CLOSE @Cursor

END
