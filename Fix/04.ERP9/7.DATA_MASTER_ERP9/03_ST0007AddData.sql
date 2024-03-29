-- CREATE BY Trần Quốc Tuấn ON 21/09/2015
-- Thêm dữ liệu vào bảng nghiệp vụ
DECLARE @CustomerIndex INT
DELETE ST0007
INSERT INTO ST0007(TableID,TableName,ColumnPK) VALUES ('DRT1000',N'Danh mục nhân viên','EmployeeID')
INSERT INTO ST0007(TableID,TableName,ColumnPK) VALUES ('DRT1010',N'Danh mục khách hàng','CustomerID')
INSERT INTO ST0007(TableID,TableName,ColumnPK) VALUES ('DRT1020',N'Danh mục thông tin chung','InfoID')
INSERT INTO ST0007(TableID,TableName,ColumnPK) VALUES ('DRT2000',N'Danh sách hồ sơ nợ thương mại','ContractNo')
INSERT INTO ST0007(TableID,TableName,ColumnPK) VALUES ('DRT2010',N'Danh sách hồ sơ nợ tiêu dùng','ContractNo')
INSERT INTO ST0007(TableID,TableName,ColumnPK) VALUES ('DRT2020',N'Xử lý hàng ngày','ProcessingID')
INSERT INTO ST0007(TableID,TableName,ColumnPK) VALUES ('DRT2030',N'Dữ liệu thanh toán','PaidID')
INSERT INTO ST0007(TableID,TableName,ColumnPK) VALUES ('DRT2040',N'Hồ sơ lương','EmployeeID')
