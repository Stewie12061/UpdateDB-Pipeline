-- CREATE BY Nguyễn Thanh Sơn ON 15/01/2014
-- Thêm dữ liệu vào bảng Master

DELETE FROM MTT0099
------------------------------------------------ Day --------------------------------------------------------

IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'DayID' AND ID = '2') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('DayID',2,N'Thứ hai','Monday',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'DayID' AND ID = '3') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('DayID',3,N'Thứ ba','Tuesday',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'DayID' AND ID = '4') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('DayID',4,N'Thứ tư','Wednesday',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'DayID' AND ID = '5') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('DayID',5,N'Thứ năm','Thursday',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'DayID' AND ID = '6') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('DayID',6,N'Thứ sáu','Friday',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'DayID' AND ID = '7') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('DayID',7,N'Thứ bảy','Saturday',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'DayID' AND ID = '1') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('DayID',1,N'Chủ nhật','Sunday',0)

------------------------------------------------ Source --------------------------------------------------------

IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'SourceID' AND ID = '1') INSERT INTO MTT0099 (CodeMaster, OrderNo, ID, [Description], DescriptionE, [Disabled]) VALUES ('SourceID',1,'1',N'Học viên cũ','Old student',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'SourceID' AND ID = '2') INSERT INTO MTT0099 (CodeMaster, OrderNo, ID, [Description], DescriptionE, [Disabled]) VALUES ('SourceID',2,'2',N'Quan hệ đối tác','Partner Relationship',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'SourceID' AND ID = '3') INSERT INTO MTT0099 (CodeMaster, OrderNo, ID, [Description], DescriptionE, [Disabled]) VALUES ('SourceID',3,'3',N'Website','Website',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'SourceID' AND ID = '4') INSERT INTO MTT0099 (CodeMaster, OrderNo, ID, [Description], DescriptionE, [Disabled]) VALUES ('SourceID',4,'4',N'Câu lạc bộ','Club',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'SourceID' AND ID = '5') INSERT INTO MTT0099 (CodeMaster, OrderNo, ID, [Description], DescriptionE, [Disabled]) VALUES ('SourceID',5,'5',N'Học viên giới thiệu','Introduction of Student',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'SourceID' AND ID = '6') INSERT INTO MTT0099 (CodeMaster, OrderNo, ID, [Description], DescriptionE, [Disabled]) VALUES ('SourceID',6,'6',N'Tờ rơi','Leaflet',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'SourceID' AND ID = '7') INSERT INTO MTT0099 (CodeMaster, OrderNo, ID, [Description], DescriptionE, [Disabled]) VALUES ('SourceID',7,'7',N'Street Marketing','Street Marketing',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'SourceID' AND ID = '8') INSERT INTO MTT0099 (CodeMaster, OrderNo, ID, [Description], DescriptionE, [Disabled]) VALUES ('SourceID',8,'8',N'Các sự kiện Aston tổ chức','Events of Aston',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'SourceID' AND ID = '9') INSERT INTO MTT0099 (CodeMaster, OrderNo, ID, [Description], DescriptionE, [Disabled]) VALUES ('SourceID',9,'9',N'GV/NV giới thiệu','Introduction of Tea/Emp',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'SourceID' AND ID = '10') INSERT INTO MTT0099 (CodeMaster, OrderNo, ID, [Description], DescriptionE, [Disabled]) VALUES ('SourceID','10',10,N'Phiếu ưu đãi','Voucher',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'SourceID' AND ID = '11') INSERT INTO MTT0099 (CodeMaster, OrderNo, ID, [Description], DescriptionE, [Disabled]) VALUES ('SourceID',11,'11',N'Xem TV','TV',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'SourceID' AND ID = '12') INSERT INTO MTT0099 (CodeMaster, OrderNo, ID, [Description], DescriptionE, [Disabled]) VALUES ('SourceID',12,'12',N'Ở gần/ Đi ngang qua trường','Near/Going through school',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'SourceID' AND ID = '13') INSERT INTO MTT0099 (CodeMaster, OrderNo, ID, [Description], DescriptionE, [Disabled]) VALUES ('SourceID',13,'13',N'Học bổng','Scholarship',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'SourceID' AND ID = '14') INSERT INTO MTT0099 (CodeMaster, OrderNo, ID, [Description], DescriptionE, [Disabled]) VALUES ('SourceID',14,'14',N'Báo/ Tạp chí','Newspaper / Magazine',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'SourceID' AND ID = '15') INSERT INTO MTT0099 (CodeMaster, OrderNo, ID, [Description], DescriptionE, [Disabled]) VALUES ('SourceID',15,'15',N'Khác','Other',0)

------------------------------------------------ StatusID --------------------------------------------------------

IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'StatusID' AND ID = '1') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('StatusID',1,N'Đang theo học','Current',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'StatusID' AND ID = '2') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('StatusID',2,N'Đang chờ lớp','Waiting',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'StatusID' AND ID = '3') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('StatusID',3,N'Kết thúc khóa học','Finish',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'StatusID' AND ID = '4') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('StatusID',4,N'Đang học dự thính chờ lớp khai giảng','Join free and waiting for class',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'StatusID' AND ID = '5') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('StatusID',5,N'Chưa hoàn tất học phí cho khóa hiện tại','Have not pay education fee',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'StatusID' AND ID = '6') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('StatusID',6,N'Đóng 2 khóa/ 3 khóa','Pay 2 / 3 course',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'StatusID' AND ID = '7') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('StatusID',7,N'Đang bảo lưu học phí','Reserving education fee',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'StatusID' AND ID = '8') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('StatusID',8,N'Đang xuống lớp học lại','Changed class for studying again',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'StatusID' AND ID = '9') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('StatusID',9,N'Đã chuyển lớp','Changed class',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'StatusID' AND ID = '10') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('StatusID',10,N'Đã chuyển cơ sở khác','Change Branch',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'StatusID' AND ID = '11') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('StatusID',11,N'Đã chuyển học phí cho HV khác','Giving education fee to other student',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'StatusID' AND ID = '12') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('StatusID',12,N'Đã thôi học','Quit',0)
------------------------------------------------ ReturnReason --------------------------------------------------------

IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'ReturnReason' AND ID = '01') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('ReturnReason','01',N'Không thu xếp được thời gian đi học (lịch học thêm, đi nhà thờ, học năng khiếu…)',N'Không thu xếp được thời gian đi học (lịch học thêm, đi nhà thờ, học năng khiếu…)',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'ReturnReason' AND ID = '02') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('ReturnReason','02',N'Học không thấy tiến bộ hay hiệu quả',N'Học không thấy tiến bộ hay hiệu quả',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'ReturnReason' AND ID = '03') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('ReturnReason','03',N'Không hài lòng với phương pháp hoặc chất lượng giảng dạy',N'Không hài lòng với phương pháp hoặc chất lượng giảng dạy',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'ReturnReason' AND ID = '04') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('ReturnReason','04',N'Không hài lòng với phục vụ chăm sóc của nhà trường',N'Không hài lòng với phục vụ chăm sóc của nhà trường',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'ReturnReason' AND ID = '05') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('ReturnReason','05',N'Do thay đổi chỗ ở hoặc nhà xa - ngược tuyến đường không tiện đưa đón',N'Do thay đổi chỗ ở hoặc nhà xa - ngược tuyến đường không tiện đưa đón',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'ReturnReason' AND ID = '06') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('ReturnReason','06',N'Bé còn nhỏ để học cho rành tiếng Việt trước',N'Bé còn nhỏ để học cho rành tiếng Việt trước',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'ReturnReason' AND ID = '07') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('ReturnReason','07',N'Không người đưa đón (Do Bố/Mẹ chuyển đổi công tác, mẹ giữ em nhỏ, mẹ sinh em bé,…)',N'Không người đưa đón (Do Bố/Mẹ chuyển đổi công tác, mẹ giữ em nhỏ, mẹ sinh em bé,…)',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'ReturnReason' AND ID = '08') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('ReturnReason','08',N'Bố/mẹ/ông/bà muốn chuyển trường khác ',N'Bố/mẹ/ông/bà muốn chuyển trường khác ',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'ReturnReason' AND ID = '09') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('ReturnReason','09',N'Do học viên hoặc người thân bị tai nạn, đau ốm nhập viện, nhà có tang…',N'Do học viên hoặc người thân bị tai nạn, đau ốm nhập viện, nhà có tang…',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'ReturnReason' AND ID = '10') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('ReturnReason','10',N'Không mở được lớp do phía Aston không đủ sỉ số hoặc Phụ huynh không hài lòng về chất lượng giảng dạy (được sự phê duyệt của Ban Giám Đốc Aston)',N'Không mở được lớp do phía Aston không đủ sỉ số hoặc Phụ huynh không hài lòng về chất lượng giảng dạy (được sự phê duyệt của Ban Giám Đốc Aston)',0)

------------------------------------------------ ResultID --------------------------------------------------------

IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'ResultID' AND ID = 'A') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('ResultID','A',N'A','A',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'ResultID' AND ID = 'B') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('ResultID','B',N'B','B',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'ResultID' AND ID = 'C') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('ResultID','C',N'C','C',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'ResultID' AND ID = 'D') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('ResultID','D',N'D','D',0)
IF NOT EXISTS (SELECT TOP 1 1 FROM MTT0099 WHERE CodeMaster = 'ResultID' AND ID = 'E') INSERT INTO MTT0099 (CodeMaster, ID, [Description], DescriptionE, [Disabled]) VALUES ('ResultID','E',N'E','E',0)
