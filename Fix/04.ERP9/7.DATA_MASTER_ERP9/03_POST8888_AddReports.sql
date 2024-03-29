--- Create by Nguyễn Thanh Sơn on 12/12/2013
--- Bổ sung các báo cáo vào quản lý báo cáo MTT8888

DECLARE @CustomerName INT
--Tao bang tam de kiem tra day co phai la khach hang CustomerIndex 
CREATE Table #CustomerName (CustomerName INT, ImportExcel int)
INSERT #CustomerName EXEC AP4444
SET @CustomerName = (SELECT TOP 1 CustomerName FROM #CustomerName)

DROP TABLE #CustomerName

DECLARE
    @GroupID NVARCHAR(50),
    @ModuleID NVARCHAR(50),
    @ReportID NVARCHAR(50),
    @FormID NVARCHAR(50),
    @ReportName NVARCHAR(250),
    @ReportNameE NVARCHAR(250),
    @ReportTitle NVARCHAR(250),
    @ReportTitleE NVARCHAR(250),
    @Description NVARCHAR(250),
    @DescriptionE NVARCHAR(250),
    @Type TINYINT,
    @Disabled TINYINT,
    @SQLstring NVARCHAR(4000),
    @Orderby NVARCHAR(200),
    @IsCommon TINYINT
------------------------------------------Báo cáo chênh lệch cửa hàng---------------------------------------------------    
SET @ReportID = N'POSR0045'
SET @FormID = N'POSF0045'
SET @ReportName = N'Báo cáo chênh lệch từng cửa hàng'
SET @ReportNameE = N'Unequal shop report'
SET @ReportTitle = N'Báo cáo chênh lệch từng cửa hàng'
SET @ReportTitleE = N'Unequal shop report'
SET @Description = N'Báo cáo chênh lệch từng cửa hàng'
SET @DescriptionE = N'Unequal shop report'
SET @GroupID = N'G03'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID

--------------------------------------------Báo cáo bán hàng-------------------------------------------------------
SET @ReportID = N'POSR0046'
SET @FormID = N'POSF0046'
SET @ReportName = N'Báo cáo chi tiết bán hàng theo cửa hàng và theo nhân viên'
SET @ReportNameE = N'Detail sales of shop and employee report'
SET @ReportTitle = N'Báo cáo chi tiết bán hàng theo cửa hàng và theo nhân viên'
SET @ReportTitleE = N'Detail sales of shop and employee report'
SET @Description = N'Báo cáo chi tiết bán hàng theo cửa hàng và theo nhân viên'
SET @DescriptionE = N'Detail sales of shop and employee report'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
     
SET @ReportID = N'POSR0048'
SET @FormID = N'POSF0048'
SET @ReportName = N'Báo cáo chi tiết bán hàng'
SET @ReportNameE = N'Detail sales report'
SET @ReportTitle = N'Báo cáo chi tiết bán hàng'
SET @ReportTitleE = N'Detail sales report'
SET @Description = N'Báo cáo chi tiết bán hàng'
SET @DescriptionE = N'Detail sales report'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID

SET @ReportID = N'POSR30091'
SET @FormID = N'POSF3009'
SET @ReportName = N'Báo cáo tổng hợp bán hàng theo mặt hàng'
SET @ReportNameE = N'Aggregate sales by inventory'
SET @ReportTitle = N'Báo cáo tổng hợp bán hàng theo mặt hàng'
SET @ReportTitleE = N'Aggregate sales by inventory'
SET @Description = N'Báo cáo tổng hợp bán hàng theo mặt hàng'
SET @DescriptionE = N'Aggregate sales by inventory'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID


SET @ReportID = N'POSR30111'
SET @FormID = N'POSR3011'
SET @ReportName = N'Báo cáo bán hàng theo khu vực'
SET @ReportNameE = N'Sales by area'
SET @ReportTitle = N'Báo cáo bán hàng theo khu vực'
SET @ReportTitleE = N'Sales by area'
SET @Description = N'Báo cáo bán hàng theo khu vực'
SET @DescriptionE = N'Sales by area'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
		UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID

SET @ReportID = N'POSR30101'
SET @FormID = N'POSR3010'
SET @ReportName = N'Bảng đối chiếu doanh thu bán với thu tiền và công nợ'
SET @ReportNameE = N'Comparison table of sales with collection and debt'
SET @ReportTitle = N'Bảng đối chiếu doanh thu bán với thu tiền và công nợ'
SET @ReportTitleE = N'Comparison table of sales with collection and debt'
SET @Description = N'Bảng đối chiếu doanh thu bán với thu tiền và công nợ'
SET @DescriptionE = N'Comparison table of sales with collection and debt'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID


	 SET @ReportID = N'POSR30121'
SET @FormID = N'POSR3012'
SET @ReportName = N'Bảng đối chiếu số lượng hàng xuất kho so với hàng bán ra'
SET @ReportNameE = N'The table compares the amount of inventory versus sales'
SET @ReportTitle = N'Bảng đối chiếu số lượng hàng xuất kho so với hàng bán ra'
SET @ReportTitleE = N'The table compares the amount of inventory versus sales'
SET @Description = N'Bảng đối chiếu số lượng hàng xuất kho so với hàng bán ra'
SET @DescriptionE = N'The table compares the amount of inventory versus sales'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID

	 
	 SET @ReportID = N'POSR30131'
SET @FormID = N'POSR3013'
SET @ReportName = N'Báo cáo tổng hợp lương'
SET @ReportNameE = N'Summary report of salary'
SET @ReportTitle = N'Báo cáo tổng hợp lương'
SET @ReportTitleE = N'Summary report of salary'
SET @Description = N'Báo cáo tổng hợp lương'
SET @DescriptionE = N'Summary report of salary'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
    

SET @ReportID = N'POSR30141'
SET @FormID = N'POSF3014'
SET @ReportName = N'Daily Sales Report'
SET @ReportNameE = N'Daily Sales Report'
SET @ReportTitle = N'Daily Sales Report'
SET @ReportTitleE = N'Daily Sales Report'
SET @Description = N'Daily Sales Report'
SET @DescriptionE = N'Daily Sales Report'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID

	 
SET @ReportID = N'POSR30161'
SET @FormID = N'POSF3016'
SET @ReportName = N'Detail Of ReConcile Daily Report (Metro)'
SET @ReportNameE = N'Detail Of ReConcile Daily Report (Metro)'
SET @ReportTitle = N'Detail Of ReConcile Daily Report (Metro)'
SET @ReportTitleE = N'Detail Of ReConcile Daily Report (Metro)'
SET @Description = N'Detail Of ReConcile Daily Report (Metro)'
SET @DescriptionE = N'Detail Of ReConcile Daily Report (Metro)'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 1
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
		UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID


	 SET @ReportID = N'POSR30181'
SET @FormID = N'POSF3018'
SET @ReportName = N'AGING METRO'
SET @ReportNameE = N'AGING METRO'
SET @ReportTitle = N'AGING METRO'
SET @ReportTitleE = N'AGING METRO'
SET @Description = N'AGING METRO'
SET @DescriptionE = N'AGING METRO'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 1
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID

	 
	 SET @ReportID = N'POSR30171'
SET @FormID = N'POSF3017'
SET @ReportName = N'TOTAL SHOWROOM PRODUCT MOVEMENT'
SET @ReportNameE = N'TOTAL SHOWROOM PRODUCT MOVEMENT'
SET @ReportTitle = N'TOTAL SHOWROOM PRODUCT MOVEMENT'
SET @ReportTitleE = N'TOTAL SHOWROOM PRODUCT MOVEMENT'
SET @Description = N'TOTAL SHOWROOM PRODUCT MOVEMENT'
SET @DescriptionE = N'TOTAL SHOWROOM PRODUCT MOVEMENT'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID

	 	 SET @ReportID = N'POSR30211'
SET @FormID = N'POSF3021'
SET @ReportName = N'BẢNG KÊ BÁN LẺ HÀNG HÓA DỊCH VỤ'
SET @ReportNameE = N'BẢNG KÊ BÁN LẺ HÀNG HÓA DỊCH VỤ'
SET @ReportTitle = N'BẢNG KÊ BÁN LẺ HÀNG HÓA DỊCH VỤ'
SET @ReportTitleE = N'BẢNG KÊ BÁN LẺ HÀNG HÓA DỊCH VỤ'
SET @Description = N'BẢNG KÊ BÁN LẺ HÀNG HÓA DỊCH VỤ'
SET @DescriptionE = N'BẢNG KÊ BÁN LẺ HÀNG HÓA DỊCH VỤ'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID

	 	 	 SET @ReportID = N'POSR30221'
SET @FormID = N'POSF3022'
SET @ReportName = N'THEO DÕI NỘP TIỀN TTTM'
SET @ReportNameE = N'THEO DÕI NỘP TIỀN TTTM'
SET @ReportTitle = N'THEO DÕI NỘP TIỀN TTTM'
SET @ReportTitleE = N'THEO DÕI NỘP TIỀN TTTM'
SET @Description = N'THEO DÕI NỘP TIỀN TTTM'
SET @DescriptionE = N'THEO DÕI NỘP TIỀN TTTM'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID

SET @ReportID = N'POSR30231'
SET @FormID = N'POSF3023'
SET @ReportName = N'DAILY DEPOSIT REPORT'
SET @ReportNameE = N'DAILY DEPOSIT REPORT'
SET @ReportTitle = N'DAILY DEPOSIT REPORT'
SET @ReportTitleE = N'DAILY DEPOSIT REPORT'
SET @Description = N'DAILY DEPOSIT REPORT'
SET @DescriptionE = N'DAILY DEPOSIT REPORT'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID

	 	 	 SET @ReportID = N'POSR30241'
SET @FormID = N'POSF3024'
SET @ReportName = N'SALES REPORT'
SET @ReportNameE = N'SALES REPORT'
SET @ReportTitle = N'SALES REPORT'
SET @ReportTitleE = N'SALES REPORT'
SET @Description = N'SALES REPORT'
SET @DescriptionE = N'SALES REPORT'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 1
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID

    
    
--------------------------------------------Nhật ký-------------------------------------------------------
SET @ReportID = N'POSR0049'
SET @FormID = N'POSF0049'
SET @ReportName = N'Báo cáo nhật ký hàng hóa'
SET @ReportNameE = N'Inventory history report'
SET @ReportTitle = N'Báo cáo nhật ký hàng hóa'
SET @ReportTitleE = N'Inventory history report'
SET @Description = N'Báo cáo nhật ký hàng hóa'
SET @DescriptionE = N'Inventory history report'
SET @GroupID = N'G04'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
     
--------------------------------------------Quản lý kho-------------------------------------------------------
SET @ReportID = N'POSR0064'
SET @FormID = N'POSF0064'
SET @ReportName = N'Báo cáo sổ chi tiết vật tư'
SET @ReportNameE = N'Detail book of material report'
SET @ReportTitle = N'Báo cáo sổ chi tiết vật tư'
SET @ReportTitleE = N'Detail book of material report'
SET @Description = N'Báo cáo sổ chi tiết vật tư'
SET @DescriptionE = N'Detail book of material report'
SET @GroupID = N'G05'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID

	 --------------------------------------------Báo cáo bảng cân đối nhập xuất tồn-------------------------------------------------------
SET @ReportID = N'POSR00711'
SET @FormID = N'POSF0071'
SET @ReportName = N'Báo cáo bảng cân đối nhập xuất tồn'
SET @ReportNameE = N'Import balance sheet'
SET @ReportTitle = N'Báo cáo bảng cân đối nhập xuất tồn'
SET @ReportTitleE = N'Import balance sheet'
SET @Description = N'Báo cáo bảng cân đối nhập xuất tồn'
SET @DescriptionE = N'Import balance sheet'
SET @GroupID = N'G05'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID



----- Modify by: Lê Thị Hạnh on 11/08/2014 
----- Bổ sung mẫu báo cáo POSR0007 - Báo cáo tổng hợp doanh thu
SET @ReportID = N'POSR0007'
SET @FormID = N'POSF0037'
SET @ReportName = N'Báo cáo tổng hợp doanh số nhân viên'
SET @ReportNameE = N'Gross Revenue Report'
SET @ReportTitle = N'Báo cáo tổng hợp doanh số nhân viên'
SET @ReportTitleE = N'Gross Revenue Report'
SET @Description = N'Báo cáo tổng hợp doanh số nhân viên'
SET @DescriptionE = N'Gross Revenue Report'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''


IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, 
				[Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, 
			@Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID


IF @CustomerName = 87
BEGIN

--------------------------------------------Báo cáo tổng hợp doanh số hội viên-------------------------------------------------------
SET @ReportID = N'POSR0069'
SET @FormID = N'POSF0069'
SET @ReportName = N'Báo cáo tổng hợp doanh số khách hàng'
SET @ReportNameE = N'Total sales of members'
SET @ReportTitle = N'Báo cáo tổng hợp doanh số khách hàng'
SET @ReportTitleE = N'Total sales of members'
SET @Description = N'Báo cáo tổng hợp doanh số khách hàng'
SET @DescriptionE = N'Total sales of members'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID

--------------------------------------------Báo cáo chi tiết doanh số hội viên-------------------------------------------------------
SET @ReportID = N'POSR0076'
SET @FormID = N'POSF0076'
SET @ReportName = N'Báo cáo chi tiết doanh số khách hàng'
SET @ReportNameE = N'Detailed sales member report'
SET @ReportTitle = N'Báo cáo chi tiết doanh số khách hàng'
SET @ReportTitleE = N'Detailed sales member report'
SET @Description = N'Báo cáo chi tiết doanh số khách hàng'
SET @DescriptionE = N'Detailed sales member report'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID


END
ELSE
BEGIN

SET @ReportID = N'POSR0069'
SET @FormID = N'POSF0069'
SET @ReportName = N'Báo cáo tổng hợp doanh số hội viên'
SET @ReportNameE = N'Total sales of members'
SET @ReportTitle = N'Báo cáo tổng hợp doanh số hội viên'
SET @ReportTitleE = N'Total sales of members'
SET @Description = N'Báo cáo tổng hợp doanh số hội viên'
SET @DescriptionE = N'Total sales of members'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID

	 --------------------------------------------Báo cáo chi tiết doanh số hội viên-------------------------------------------------------
SET @ReportID = N'POSR0076'
SET @FormID = N'POSF0076'
SET @ReportName = N'Báo cáo chi tiết doanh số hội viên'
SET @ReportNameE = N'Detailed sales member report'
SET @ReportTitle = N'Báo cáo chi tiết doanh số hội viên'
SET @ReportTitleE = N'Detailed sales member report'
SET @Description = N'Báo cáo chi tiết doanh số hội viên'
SET @DescriptionE = N'Detailed sales member report'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID

END





--------------------------------------------Báo cáo Total Sales Report POSR30151 -------------------------------------------------------
SET @ReportID = N'POSR30151'
SET @FormID = N'POSF3015'
SET @ReportName = N'Báo cáo total sales report'
SET @ReportNameE = N'total sales report'
SET @ReportTitle = N'Total sales report'
SET @ReportTitleE = N'Total sales report'
SET @Description = N'Total sales report'
SET @DescriptionE = N'Total Sales report'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID



--------------------------------------------Báo cáo Reconcile of daily report (aeon) -------------------------------------------------------
SET @ReportID = N'POSR30201'
SET @FormID = N'POSF3020'
SET @ReportName = N'Reconcile of daily report'
SET @ReportNameE = N'Reconcile of daily report'
SET @ReportTitle = N'Reconcile of daily report'
SET @ReportTitleE = N'Reconcile of daily report'
SET @Description = N'Reconcile of daily report'
SET @DescriptionE = N'Reconcile of daily report'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 1
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID


--------------------------------------------Báo cáo tồn kho theo cửa hàng -------------------------------------------------------
SET @ReportID = N'POSR30191'
SET @FormID = N'POSF3019'
SET @ReportName = N'Báo cáo tồn kho theo cửa hàng'
SET @ReportNameE = N'Báo cáo tồn kho theo cửa hàng'
SET @ReportTitle = N'Báo cáo tồn kho theo cửa hàng'
SET @ReportTitleE = N'Báo cáo tồn kho theo cửa hàng'
SET @Description = N'Báo cáo tồn kho theo cửa hàng'
SET @DescriptionE = N'Báo cáo tồn kho theo cửa hàng'
SET @GroupID = N'G05'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID





--------------------------------------------Báo cáo lịch trình giao hàng và thu tiền -------------------------------------------------------
SET @ReportID = N'POSR30271'
SET @FormID = N'POSF3027'
SET @ReportName = N'Báo cáo lịch trình giao hàng và thu tiền'
SET @ReportNameE = N'Báo cáo lịch trình giao hàng và thu tiền'
SET @ReportTitle = N'Báo cáo tồn kho theo cửa hàng'
SET @ReportTitleE = N'Báo cáo lịch trình giao hàng và thu tiền'
SET @Description = N'Báo cáo lịch trình giao hàng và thu tiền'
SET @DescriptionE = N'Báo cáo lịch trình giao hàng và thu tiền'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID



-------------------------------------------- Báo cáo bảng kê phiếu nhập -------------------------------------------------------
SET @ReportID = N'POSR30281'
SET @FormID = N'POSF3028'
SET @ReportName = N'Bảng kê phiếu nhập'
SET @ReportNameE = N'Bảng kê phiếu nhập'
SET @ReportTitle = N'Bảng kê phiếu nhập'
SET @ReportTitleE = N'Bảng kê phiếu nhập'
SET @Description = N'Bảng kê phiếu nhập'
SET @DescriptionE = N'Bảng kê phiếu nhập'
SET @GroupID = N'G05'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID


Update POST8888
Set FormID = 'POSF3028'
Where ReportID = 'POSR30281'


-------------------------------------------- Báo cáo bảng kê phiếu xuất -------------------------------------------------------
SET @ReportID = N'POSR30291'
SET @FormID = N'POSF3029'
SET @ReportName = N'Bảng kê phiếu xuất'
SET @ReportNameE = N'Bảng kê phiếu xuất'
SET @ReportTitle = N'Bảng kê phiếu xuất'
SET @ReportTitleE = N'Bảng kê phiếu xuất'
SET @Description = N'Bảng kê phiếu xuất'
SET @DescriptionE = N'Bảng kê phiếu xuất'
SET @GroupID = N'G05'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID



-------------------------------------------- Báo cáo bill đặt cọc -------------------------------------------------------
SET @ReportID = N'POSR30301'
SET @FormID = N'POSF3030'
SET @ReportName = N'Báo cáo bill đặt cọc'
SET @ReportNameE = N'Báo cáo bill đặt cọc'
SET @ReportTitle = N'Báo cáo bill đặt cọc'
SET @ReportTitleE = N'Báo cáo bill đặt cọc'
SET @Description = N'Báo cáo bill đặt cọc'
SET @DescriptionE = N'Báo cáo bill đặt cọc'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID

	 
-------------------------------------------- Báo cáo tổng hợp công nợ bán lẻ theo khách hàng -------------------------------------------------------
SET @ReportID = N'POSR3077'
SET @FormID = N'POSF3077'
SET @ReportName = N'Báo cáo chi tiết mua hàng'
SET @ReportNameE = N'Purchase details report'
SET @ReportTitle = N'Báo cáo chi tiết mua hàng'
SET @ReportTitleE = N'Purchase details report'
SET @Description = N'Báo cáo chi tiết mua hàng'
SET @DescriptionE = N'Purchase details report'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID


	 -------------------------------------------- Báo cáo hoa hồng nhân viên -------------------------------------------------------
SET @ReportID = N'POSR3078'
SET @FormID = N'POSF3078'
SET @ReportName = N'Báo cáo hoa hồng nhân viên'
SET @ReportNameE = N'Employee commission report'
SET @ReportTitle = N'Báo cáo hoa hồng nhân viên'
SET @ReportTitleE = N'Employee commission report'
SET @Description = N'Báo cáo hoa hồng nhân viên'
SET @DescriptionE = N'Employee commission report'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID


	 	 -------------------------------------------- Báo cáo hoa hồng nhân viên NHÂN NGỌC -------------------------------------------------------
IF EXISTS (select top 1 1 from CustomerIndex where CustomerName=N'108')
Begin
SET @ReportID = N'POSR3078NN'
SET @FormID = N'POSF3078NN'
SET @ReportName = N'Báo cáo hoa hồng nhân viên'
SET @ReportNameE = N'Employee commission report'
SET @ReportTitle = N'Báo cáo hoa hồng nhân viên'
SET @ReportTitleE = N'Employee commission report'
SET @Description = N'Báo cáo hoa hồng nhân viên'
SET @DescriptionE = N'Employee commission report'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
END
ELSE
Delete From POST8888 WHERE ReportID = @ReportID

	 	 -------------------------------------------- Báo cáo hoa hồng nhân viên -------------------------------------------------------
SET @ReportID = N'POSR3079'
SET @FormID = N'POSF3079'
SET @ReportName = N'Báo cáo lịch sử mua hàng theo từng khách hàng'
SET @ReportNameE = N'Purchase history of each customer report'
SET @ReportTitle = N'Báo cáo lịch sử mua hàng theo từng khách hàng'
SET @ReportTitleE = N'Purchase history of each customer report'
SET @Description = N'Báo cáo lịch sử mua hàng theo từng khách hàng'
SET @DescriptionE = N'Purchase history of each customer report'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID


IF NOT EXISTS (select top 1 1 from CustomerIndex where CustomerName=N'87')
Begin
SET @ReportID = N'POSR0046_OK'
SET @FormID = N'POSR0046_OK'
SET @ReportName = N'SALE REPORT BY STAFF'
SET @ReportNameE = N'SALE REPORT BY STAFF'
SET @ReportTitle = N'SALE REPORT BY STAFF'
SET @ReportTitleE = N'SALE REPORT BY STAFF'
SET @Description = N'SALE REPORT BY STAFF'
SET @DescriptionE = N'SALE REPORT BY STAFF'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
END
ELSE
   Delete From POST8888 WHERE ReportID = @ReportID

	 	 -------------------------------------------- Báo cáo hoa hồng nhân viên NHÂN NGỌC -------------------------------------------------------
IF EXISTS (select top 1 1 from CustomerIndex where CustomerName=N'108')
Begin
SET @ReportID = N'POSR3031'
SET @FormID = N'POSF3031'
SET @ReportName = N'Báo cáo chấm công nhân viên'
SET @ReportNameE = N'Báo cáo chấm công nhân viên'
SET @ReportTitle = N'Báo cáo chấm công nhân viên'
SET @ReportTitleE = N'Báo cáo chấm công nhân viên'
SET @Description = N'Báo cáo chấm công nhân viên'
SET @DescriptionE = N'Báo cáo chấm công nhân viên'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
END
ELSE
Delete From POST8888 WHERE ReportID = @ReportID

	 	 -------------------------------------------- Báo cáo theo dõi công nợ công ty tài chính NHÂN NGỌC -------------------------------------------------------
IF EXISTS (select top 1 1 from CustomerIndex where CustomerName=N'108')
Begin
SET @ReportID = N'POSR3083'
SET @FormID = N'POSF3083'
SET @ReportName = N'Báo cáo theo dõi công nợ công ty tài chính'
SET @ReportNameE = N'Báo cáo theo dõi công nợ công ty tài chính'
SET @ReportTitle = N'Báo cáo theo dõi công nợ công ty tài chính'
SET @ReportTitleE = N'Báo cáo theo dõi công nợ công ty tài chính'
SET @Description = N'Báo cáo theo dõi công nợ công ty tài chính'
SET @DescriptionE = N'Báo cáo theo dõi công nợ công ty tài chính'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
END
ELSE
Delete From POST8888 WHERE ReportID = N'POSR3083'


	 	 -------------------------------------------- Báo cáo doanh số dịch vụ cửa hàng và nhân viên NHÂN NGỌC -------------------------------------------------------
IF EXISTS (select top 1 1 from CustomerIndex where CustomerName=N'108')
Begin
SET @ReportID = N'POSR3087'
SET @FormID = N'POSF3087'
SET @ReportName = N'Báo cáo doanh số dịch vụ cửa hàng và nhân viên'
SET @ReportNameE = N'Báo cáo doanh số dịch vụ cửa hàng và nhân viên'
SET @ReportTitle = N'Báo cáo doanh số dịch vụ cửa hàng và nhân viên'
SET @ReportTitleE = N'Báo cáo doanh số dịch vụ cửa hàng và nhân viên'
SET @Description = N'Báo cáo doanh số dịch vụ cửa hàng và nhân viên'
SET @DescriptionE = N'Báo cáo doanh số dịch vụ cửa hàng và nhân viên'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
END
ELSE
Delete From POST8888 WHERE ReportID = N'POSR3087'

	 	 -------------------------------------------- Báo cáo huê hồng nhân viên dịch vụ NHÂN NGỌC -------------------------------------------------------
IF EXISTS (select top 1 1 from CustomerIndex where CustomerName=N'108')
Begin
SET @ReportID = N'POSR3084'
SET @FormID = N'POSF3084'
SET @ReportName = N'Báo cáo huê hồng nhân viên dịch vụ'
SET @ReportNameE = N'Báo cáo huê hồng nhân viên dịch vụ'
SET @ReportTitle = N'Báo cáo huê hồng nhân viên dịch vụ'
SET @ReportTitleE = N'Báo cáo huê hồng nhân viên dịch vụ'
SET @Description = N'Báo cáo huê hồng nhân viên dịch vụ'
SET @DescriptionE = N'Báo cáo huê hồng nhân viên dịch vụ'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
END
ELSE
Delete From POST8888 WHERE ReportID = N'POSR3084'

	 	 -------------------------------------------- Báo cáo tồn kho linh kiện vật tư NHÂN NGỌC -------------------------------------------------------
IF EXISTS (select top 1 1 from CustomerIndex where CustomerName=N'108')
Begin
SET @ReportID = N'POSR3085'
SET @FormID = N'POSF3085'
SET @ReportName = N'Báo cáo tồn kho linh kiện vật tư'
SET @ReportNameE = N'Báo cáo tồn kho linh kiện vật tư'
SET @ReportTitle = N'Báo cáo tồn kho linh kiện vật tư'
SET @ReportTitleE = N'Báo cáo tồn kho linh kiện vật tư'
SET @Description = N'Báo cáo tồn kho linh kiện vật tư'
SET @DescriptionE = N'Báo cáo tồn kho linh kiện vật tư'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
END
ELSE
Delete From POST8888 WHERE ReportID = N'POSR3085'

	 	 -------------------------------------------- Báo cáo vật tư nhân viên đang giữ NHÂN NGỌC -------------------------------------------------------
IF EXISTS (select top 1 1 from CustomerIndex where CustomerName=N'108')
Begin
SET @ReportID = N'POSR3086'
SET @FormID = N'POSF3086'
SET @ReportName = N'Báo cáo vật tư nhân viên đang giữ'
SET @ReportNameE = N'Báo cáo vật tư nhân viên đang giữ'
SET @ReportTitle = N'Báo cáo vật tư nhân viên đang giữ'
SET @ReportTitleE = N'Báo cáo vật tư nhân viên đang giữ'
SET @Description = N'Báo cáo vật tư nhân viên đang giữ'
SET @DescriptionE = N'Báo cáo vật tư nhân viên đang giữ'
SET @GroupID = N'G02'
SET @Type = 1
SET @IsCommon = 1
SET @Disabled = 0
SET @SQLstring = N''
SET @Orderby = N''

IF NOT EXISTS (SELECT TOP 1 1 FROM POST8888 WHERE ReportID = @ReportID)
	INSERT INTO POST8888( ReportID, FormID, ReportName, ReportNameE, Title, TitleE, [Description], DescriptionE, GroupID, [Type], [Disabled], SQLstring, Orderby,IsCommon)
	VALUES (@ReportID,@FormID, @ReportName, @ReportNameE, @ReportTitle, @ReportTitleE, @Description, @DescriptionE, @GroupID, @Type, @Disabled, @SQLstring, @Orderby, @IsCommon)
ELSE 
	UPDATE POST8888 
	SET FormID = @FormID ,ReportName = @ReportName, ReportNameE = @ReportNameE, Title = @ReportTitle, TitleE = @ReportTitleE, [Description] = @Description, DescriptionE = @DescriptionE, GroupID = @GroupID, [Type] = @Type, SQLstring = @SQLstring, Orderby = @Orderby,IsCommon = @IsCommon
     WHERE ReportID = @ReportID
END
ELSE
Delete From POST8888 WHERE ReportID = N'POSR3086'