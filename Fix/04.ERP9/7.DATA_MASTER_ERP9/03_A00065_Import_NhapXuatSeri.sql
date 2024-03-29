DECLARE @CustomerName INT
SET @CustomerName = (SELECT CustomerName FROM CustomerIndex)

IF @CustomerName = 162
BEGIN 

DELETE FROM A00065 WHERE ImportTransTypeID = N'SerialImWareHouse_ERP9'
INSERT INTO A00065(ImportTransTypeID, ImportTransTypeName, ImportTransTypeNameEng, ScreenID, TemplateFileName, ExecSQL, OrderNum, ColID, ColName, ColNameEng, 
	InputMask, ColWidth, ColLength, ColType, ColSQLDataType, CheckExpression, IsObligated, DataCol, SType)
VALUES (N'SerialImWareHouse_ERP9', N'Serial phiếu nhập kho', N'SerialImWareHouse_ERP9', N'WF0155', N'Import_Excel_SerialPhieuNhapKho.xlsx', N'EXEC WMP22801 @DivisionID = @DivisionID, @UserID = @UserID, @TranMonth = @TranMonth, @TranYear = @TranYear,@Mode = @Mode, @ImportTransTypeID = @ImportTransTypeID, @TransactionKey = @TransactionKey, @XML = @XML', 1, N'DivisionID', N'Đơn vị', N'Division', 
	N'', 50, 50, 0, N'VARCHAR(50)', N'{CheckValidDivision} @Module = ''ASOFT-WM''', 1, N'B3', 0)
INSERT INTO A00065(ImportTransTypeID, ImportTransTypeName, ImportTransTypeNameEng, ScreenID, TemplateFileName, ExecSQL, OrderNum, ColID, ColName, ColNameEng, 
	InputMask, ColWidth, ColLength, ColType, ColSQLDataType, CheckExpression, IsObligated, DataCol, SType)
VALUES (N'SerialImWareHouse_ERP9', N'Serial phiếu nhập kho', N'SerialImWareHouse_ERP9', N'WF0155', N'Import_Excel_SerialPhieuNhapKho.xlsx', N'EXEC WMP22801 @DivisionID = @DivisionID, @UserID = @UserID, @TranMonth = @TranMonth, @TranYear = @TranYear,@Mode = @Mode, @ImportTransTypeID = @ImportTransTypeID, @TransactionKey = @TransactionKey, @XML = @XML', 2, N'Period', N'Kỳ kế toán', N'Period', 
	N'', 80, 7, 0, N'VARCHAR(10)', N'{CheckValidPeriod} @Module = ''ASOFT-WM''', 1, N'B4', 0)
INSERT INTO A00065(ImportTransTypeID, ImportTransTypeName, ImportTransTypeNameEng, ScreenID, TemplateFileName, ExecSQL, OrderNum, ColID, ColName, ColNameEng, 
	InputMask, ColWidth, ColLength, ColType, ColSQLDataType, CheckExpression, IsObligated, DataCol, SType)
VALUES (N'SerialImWareHouse_ERP9', N'Serial phiếu nhập kho', N'SerialImWareHouse_ERP9', N'WF0155', N'Import_Excel_SerialPhieuNhapKho.xlsx', N'EXEC WMP22801 @DivisionID = @DivisionID, @UserID = @UserID, @TranMonth = @TranMonth, @TranYear = @TranYear,@Mode = @Mode, @ImportTransTypeID = @ImportTransTypeID, @TransactionKey = @TransactionKey, @XML = @XML', 3, N'VoucherNo', N'Số chứng từ ', N'VoucherNo', 
	N'', 50, 50, 0, N'VARCHAR(50)', N'', 1, N'A', 0)
INSERT INTO A00065(ImportTransTypeID, ImportTransTypeName, ImportTransTypeNameEng, ScreenID, TemplateFileName, ExecSQL, OrderNum, ColID, ColName, ColNameEng, 
	InputMask, ColWidth, ColLength, ColType, ColSQLDataType, CheckExpression, IsObligated, DataCol, SType)
VALUES (N'SerialImWareHouse_ERP9', N'Serial phiếu nhập kho', N'SerialImWareHouse_ERP9', N'WF0155', N'Import_Excel_SerialPhieuNhapKho.xlsx', N'EXEC WMP22801 @DivisionID = @DivisionID, @UserID = @UserID, @TranMonth = @TranMonth, @TranYear = @TranYear,@Mode = @Mode, @ImportTransTypeID = @ImportTransTypeID, @TransactionKey = @TransactionKey, @XML = @XML', 4, N'InventoryID', N'Mã mặt hàng', N'InventoryID',
	N'', 50, 50, 0, N'VARCHAR(50)', N'', 0, N'B', 0)
INSERT INTO A00065(ImportTransTypeID, ImportTransTypeName, ImportTransTypeNameEng, ScreenID, TemplateFileName, ExecSQL, OrderNum, ColID, ColName, ColNameEng, 
	InputMask, ColWidth, ColLength, ColType, ColSQLDataType, CheckExpression, IsObligated, DataCol, SType)
VALUES (N'SerialImWareHouse_ERP9', N'Serial phiếu nhập kho', N'SerialImWareHouse_ERP9', N'WF0155', N'Import_Excel_SerialPhieuNhapKho.xlsx', N'EXEC WMP22801 @DivisionID = @DivisionID, @UserID = @UserID, @TranMonth = @TranMonth, @TranYear = @TranYear,@Mode = @Mode, @ImportTransTypeID = @ImportTransTypeID, @TransactionKey = @TransactionKey, @XML = @XML', 5, N'SerialNo', N'Số serial', N'SerialNo', 
	N'', 50, 50, 0, N'VARCHAR(50)', N'', 0, N'C', 0)

---Customize GREE: Import phiếu xuất mã vạch - SerialDeliveryWareHouse_ERP9
DELETE FROM A00065 WHERE ImportTransTypeID = N'SerialDeliveryWareHouse_ERP9'
INSERT INTO A00065(ImportTransTypeID, ImportTransTypeName, ImportTransTypeNameEng, ScreenID, TemplateFileName, ExecSQL, OrderNum, ColID, ColName, ColNameEng, 
	InputMask, ColWidth, ColLength, ColType, ColSQLDataType, CheckExpression, IsObligated, DataCol)
VALUES (N'SerialDeliveryWareHouse_ERP9', N'Xuất kho mã vạch', N'Serial Delivery WareHouse', N'WF0156', N'Import_Excel_SerialPhieuXuatKho.xls', N'EXEC WMP22901 @DivisionID = @DivisionID, @UserID = @UserID, @TranMonth = @TranMonth, @TranYear = @TranYear,@Mode = @Mode, @ImportTransTypeID = @ImportTransTypeID, @TransactionKey = @TransactionKey, @XML = @XML', 1, N'DivisionID', N'Đơn vị', N'Division', 
	N'', 50, 50, 0, N'NVARCHAR(50)', N'{CheckValidDivision}', 1, N'B3')
INSERT INTO A00065(ImportTransTypeID, ImportTransTypeName, ImportTransTypeNameEng, ScreenID, TemplateFileName, ExecSQL, OrderNum, ColID, ColName, ColNameEng, 
	InputMask, ColWidth, ColLength, ColType, ColSQLDataType, CheckExpression, IsObligated, DataCol)
VALUES (N'SerialDeliveryWareHouse_ERP9', N'Xuất kho mã vạch', N'Serial Delivery WareHouse', N'WF0156', N'Import_Excel_SerialPhieuXuatKho.xls', N'EXEC WMP22901 @DivisionID = @DivisionID, @UserID = @UserID, @TranMonth = @TranMonth, @TranYear = @TranYear,@Mode = @Mode, @ImportTransTypeID = @ImportTransTypeID, @TransactionKey = @TransactionKey, @XML = @XML', 2, N'Period', N'Kỳ kế toán', N'Period', 
	N'', 80, 7, 0, N'VARCHAR(10)', N'{CheckValidPeriod} @Module = ''ASOFT-WM''', 1, N'B4')
INSERT INTO A00065(ImportTransTypeID, ImportTransTypeName, ImportTransTypeNameEng, ScreenID, TemplateFileName, ExecSQL, OrderNum, ColID, ColName, ColNameEng, 
	InputMask, ColWidth, ColLength, ColType, ColSQLDataType, CheckExpression, IsObligated, DataCol)
VALUES (N'SerialDeliveryWareHouse_ERP9', N'Xuất kho mã vạch', N'Serial Delivery WareHouse', N'WF0156', N'Import_Excel_SerialPhieuXuatKho.xls', N'EXEC WMP22901 @DivisionID = @DivisionID, @UserID = @UserID, @TranMonth = @TranMonth, @TranYear = @TranYear,@Mode = @Mode, @ImportTransTypeID = @ImportTransTypeID, @TransactionKey = @TransactionKey, @XML = @XML', 3, N'VoucherTypeID', N'Loại chứng từ', N'Voucher Type', 
	N'', 80, 50, 0, N'NVARCHAR(50)', N'{CheckValidVoucherType} @ObligeCheck = 1, @SQLFilter = ''''', 1, N'B5')
INSERT INTO A00065(ImportTransTypeID, ImportTransTypeName, ImportTransTypeNameEng, ScreenID, TemplateFileName, ExecSQL, OrderNum, ColID, ColName, ColNameEng, 
	InputMask, ColWidth, ColLength, ColType, ColSQLDataType, CheckExpression, IsObligated, DataCol)
VALUES (N'SerialDeliveryWareHouse_ERP9', N'Xuất kho mã vạch', N'Serial Delivery WareHouse', N'WF0156', N'Import_Excel_SerialPhieuXuatKho.xls', N'EXEC WMP22901 @DivisionID = @DivisionID, @UserID = @UserID, @TranMonth = @TranMonth, @TranYear = @TranYear,@Mode = @Mode, @ImportTransTypeID = @ImportTransTypeID, @TransactionKey = @TransactionKey, @XML = @XML', 4, N'VoucherNo', N'Số chứng từ', N'Voucher No', 
	N'', 80, 50, 0, N'NVARCHAR(50)', N'', 1, N'A')
INSERT INTO A00065(ImportTransTypeID, ImportTransTypeName, ImportTransTypeNameEng, ScreenID, TemplateFileName, ExecSQL, OrderNum, ColID, ColName, ColNameEng, 
	InputMask, ColWidth, ColLength, ColType, ColSQLDataType, CheckExpression, IsObligated, DataCol)
VALUES (N'SerialDeliveryWareHouse_ERP9', N'Xuất kho mã vạch', N'Serial Delivery WareHouse', N'WF0156', N'Import_Excel_SerialPhieuXuatKho.xls', N'EXEC WMP22901 @DivisionID = @DivisionID, @UserID = @UserID, @TranMonth = @TranMonth, @TranYear = @TranYear,@Mode = @Mode, @ImportTransTypeID = @ImportTransTypeID, @TransactionKey = @TransactionKey, @XML = @XML', 5, N'VoucherDate', N'Ngày chứng từ', N'Voucher Date', 
	N'dd/mm/yyyy', 80, 10, 2, N'DATETIME', N'{CheckValidVoucherDate}', 1, N'B')
INSERT INTO A00065(ImportTransTypeID, ImportTransTypeName, ImportTransTypeNameEng, ScreenID, TemplateFileName, ExecSQL, OrderNum, ColID, ColName, ColNameEng, 
	InputMask, ColWidth, ColLength, ColType, ColSQLDataType, CheckExpression, IsObligated, DataCol)
VALUES (N'SerialDeliveryWareHouse_ERP9', N'Xuất kho mã vạch', N'Serial Delivery WareHouse', N'WF0156', N'Import_Excel_SerialPhieuXuatKho.xls', N'EXEC WMP22901 @DivisionID = @DivisionID, @UserID = @UserID, @TranMonth = @TranMonth, @TranYear = @TranYear,@Mode = @Mode, @ImportTransTypeID = @ImportTransTypeID, @TransactionKey = @TransactionKey, @XML = @XML', 6, N'ObjectID', N'Đối tượng', N'ObjectID',
	N'', 110, 50, 0, N'NVARCHAR(250)', N'', 1, N'C')
INSERT INTO A00065(ImportTransTypeID, ImportTransTypeName, ImportTransTypeNameEng, ScreenID, TemplateFileName, ExecSQL, OrderNum, ColID, ColName, ColNameEng, 
	InputMask, ColWidth, ColLength, ColType, ColSQLDataType, CheckExpression, IsObligated, DataCol)
VALUES (N'SerialDeliveryWareHouse_ERP9', N'Xuất kho mã vạch', N'Serial Delivery WareHouse', N'WF0156', N'Import_Excel_SerialPhieuXuatKho.xls', N'EXEC WMP22901 @DivisionID = @DivisionID, @UserID = @UserID, @TranMonth = @TranMonth, @TranYear = @TranYear,@Mode = @Mode, @ImportTransTypeID = @ImportTransTypeID, @TransactionKey = @TransactionKey, @XML = @XML', 7, N'WareHouseID', N'Kho xuất', N'Ware House', 
	N'', 110, 50, 0, N'NVARCHAR(250)', N'', 1, N'D')
INSERT INTO A00065(ImportTransTypeID, ImportTransTypeName, ImportTransTypeNameEng, ScreenID, TemplateFileName, ExecSQL, OrderNum, ColID, ColName, ColNameEng, 
	InputMask, ColWidth, ColLength, ColType, ColSQLDataType, CheckExpression, IsObligated, DataCol)
VALUES (N'SerialDeliveryWareHouse_ERP9', N'Xuất kho mã vạch', N'Serial Delivery WareHouse', N'WF0156', N'Import_Excel_SerialPhieuXuatKho.xls', N'EXEC WMP22901 @DivisionID = @DivisionID, @UserID = @UserID, @TranMonth = @TranMonth, @TranYear = @TranYear,@Mode = @Mode, @ImportTransTypeID = @ImportTransTypeID, @TransactionKey = @TransactionKey, @XML = @XML', 8, N'RDAddress', N'Địa chỉ giao hàng', N'RDAddress', 
	N'', 110, 50, 0, N'NVARCHAR(250)', N'', 0, N'E')
INSERT INTO A00065(ImportTransTypeID, ImportTransTypeName, ImportTransTypeNameEng, ScreenID, TemplateFileName, ExecSQL, OrderNum, ColID, ColName, ColNameEng, 
	InputMask, ColWidth, ColLength, ColType, ColSQLDataType, CheckExpression, IsObligated, DataCol)
VALUES (N'SerialDeliveryWareHouse_ERP9', N'Xuất kho mã vạch', N'Serial Delivery WareHouse', N'WF0156', N'Import_Excel_SerialPhieuXuatKho.xls', N'EXEC WMP22901 @DivisionID = @DivisionID, @UserID = @UserID, @TranMonth = @TranMonth, @TranYear = @TranYear,@Mode = @Mode, @ImportTransTypeID = @ImportTransTypeID, @TransactionKey = @TransactionKey, @XML = @XML', 9, N'Description', N'Diễn giải', N'Description', 
	N'', 110, 50, 0, N'NVARCHAR(250)', N'', 0, N'F')
INSERT INTO A00065(ImportTransTypeID, ImportTransTypeName, ImportTransTypeNameEng, ScreenID, TemplateFileName, ExecSQL, OrderNum, ColID, ColName, ColNameEng, 
	InputMask, ColWidth, ColLength, ColType, ColSQLDataType, CheckExpression, IsObligated, DataCol)
VALUES (N'SerialDeliveryWareHouse_ERP9', N'Xuất kho mã vạch', N'Serial Delivery WareHouse', N'WF0156', N'Import_Excel_SerialPhieuXuatKho.xls', N'EXEC WMP22901 @DivisionID = @DivisionID, @UserID = @UserID, @TranMonth = @TranMonth, @TranYear = @TranYear,@Mode = @Mode, @ImportTransTypeID = @ImportTransTypeID, @TransactionKey = @TransactionKey, @XML = @XML', 10, N'SerialNo', N'Số serial', N'SerialNo', 
	N'', 50, 50, 0, N'VARCHAR(50)', N'', 1, N'G')
INSERT INTO A00065(ImportTransTypeID, ImportTransTypeName, ImportTransTypeNameEng, ScreenID, TemplateFileName, ExecSQL, OrderNum, ColID, ColName, ColNameEng, 
	InputMask, ColWidth, ColLength, ColType, ColSQLDataType, CheckExpression, IsObligated, DataCol)
VALUES (N'SerialDeliveryWareHouse_ERP9', N'Xuất kho mã vạch', N'Serial Delivery WareHouse', N'WF0156', N'Import_Excel_SerialPhieuXuatKho.xls', N'EXEC WMP22901 @DivisionID = @DivisionID, @UserID = @UserID, @TranMonth = @TranMonth, @TranYear = @TranYear,@Mode = @Mode, @ImportTransTypeID = @ImportTransTypeID, @TransactionKey = @TransactionKey, @XML = @XML', 11, N'InventoryID', N'Mã mặt hàng', N'InventoryID',
	N'', 50, 50, 0, N'VARCHAR(50)', N'', 1, N'H')
INSERT INTO A00065(ImportTransTypeID, ImportTransTypeName, ImportTransTypeNameEng, ScreenID, TemplateFileName, ExecSQL, OrderNum, ColID, ColName, ColNameEng, 
	InputMask, ColWidth, ColLength, ColType, ColSQLDataType, CheckExpression, IsObligated, DataCol)
VALUES (N'SerialDeliveryWareHouse_ERP9', N'Xuất kho mã vạch', N'Serial Delivery WareHouse', N'WF0156', N'Import_Excel_SerialPhieuXuatKho.xls', N'EXEC WMP22901 @DivisionID = @DivisionID, @UserID = @UserID, @TranMonth = @TranMonth, @TranYear = @TranYear,@Mode = @Mode, @ImportTransTypeID = @ImportTransTypeID, @TransactionKey = @TransactionKey, @XML = @XML', 12, N'Quantity', N'Số lượng', N'Quantity', 
	N'', 50, 20, 1, N'INT', N'', 0, N'I')
INSERT INTO A00065(ImportTransTypeID, ImportTransTypeName, ImportTransTypeNameEng, ScreenID, TemplateFileName, ExecSQL, OrderNum, ColID, ColName, ColNameEng, 
	InputMask, ColWidth, ColLength, ColType, ColSQLDataType, CheckExpression, IsObligated, DataCol)
VALUES (N'SerialDeliveryWareHouse_ERP9', N'Xuất kho mã vạch', N'Serial Delivery WareHouse', N'WF0156', N'Import_Excel_SerialPhieuXuatKho.xls', N'EXEC WMP22901 @DivisionID = @DivisionID, @UserID = @UserID, @TranMonth = @TranMonth, @TranYear = @TranYear,@Mode = @Mode, @ImportTransTypeID = @ImportTransTypeID, @TransactionKey = @TransactionKey, @XML = @XML', 13, N'Notes', N'Ghi chú', N'Notes', 
	N'', 110, 50, 0, N'NVARCHAR(250)', N'', 0, N'J')

IF NOT EXISTS (SELECT TOP 1 1 FROM A01065 WHERE ImportTemplateID = 'SerialImWareHouse_ERP9')
exec sp_executesql N'
      INSERT INTO A01065(
      ImportTemplateID,
      ImportTemplateName,
      ImportTransTypeID,
      DefaultSheet,
      AnchorCol,
      StartRow,
      DataFolder,
      DefaultFileName,
      Disabled,
      CreateUserID,
      CreateDate,
      LastModifyUserID,
      LastModifyDate
      ) VALUES (
      @ImportTemplateID,
      @ImportTemplateName,
      @ImportTransTypeID,
      @DefaultSheet,
      @AnchorCol,
      @StartRow,
      @DataFolder,
      @DefaultFileName,
      @Disabled,
      ''ASOFTADMIN'',
      GETDATE(),
      ''ASOFTADMIN'',
      GETDATE()
      )
    ',N'@ImportTemplateID nvarchar(50),@ImportTemplateName nvarchar(50),@ImportTransTypeID nvarchar(50),@DefaultSheet nvarchar(4),@AnchorCol nvarchar(1),@StartRow int,@DataFolder nvarchar(10),@DefaultFileName nvarchar(50),@Disabled tinyint',@ImportTemplateID=N'SerialImWareHouse_ERP9',@ImportTemplateName=N'Bảng phân ca',@ImportTransTypeID=N'SerialImWareHouse_ERP9',@DefaultSheet=N'Data',@AnchorCol=N'A',@StartRow=10,@DataFolder=N'C:\IMPORTS',@DefaultFileName=N'Import_Excel_SerialPhieuNhapKho',@Disabled=0

IF NOT EXISTS (SELECT TOP 1 1 FROM A01065 WHERE ImportTemplateID = 'SerialDeliveryWareHouse_ERP9')
exec sp_executesql N'
      INSERT INTO A01065(
      ImportTemplateID,
      ImportTemplateName,
      ImportTransTypeID,
      DefaultSheet,
      AnchorCol,
      StartRow,
      DataFolder,
      DefaultFileName,
      Disabled,
      CreateUserID,
      CreateDate,
      LastModifyUserID,
      LastModifyDate
      ) VALUES (
      @ImportTemplateID,
      @ImportTemplateName,
      @ImportTransTypeID,
      @DefaultSheet,
      @AnchorCol,
      @StartRow,
      @DataFolder,
      @DefaultFileName,
      @Disabled,
      ''ASOFTADMIN'',
      GETDATE(),
      ''ASOFTADMIN'',
      GETDATE()
      )
    ',N'@ImportTemplateID nvarchar(50),@ImportTemplateName nvarchar(50),@ImportTransTypeID nvarchar(50),@DefaultSheet nvarchar(4),@AnchorCol nvarchar(1),@StartRow int,@DataFolder nvarchar(10),@DefaultFileName nvarchar(50),@Disabled tinyint',@ImportTemplateID=N'SerialDeliveryWareHouse_ERP9',@ImportTemplateName=N'Bảng phân ca',@ImportTransTypeID=N'SerialDeliveryWareHouse_ERP9',@DefaultSheet=N'Data',@AnchorCol=N'A',@StartRow=10,@DataFolder=N'C:\IMPORTS',@DefaultFileName=N'Import_Excel_SerialPhieuXuatKho',@Disabled=0

END 




 
