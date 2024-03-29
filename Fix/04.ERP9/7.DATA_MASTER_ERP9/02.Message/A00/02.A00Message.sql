/*
=====================================================================
--- Script message tiếng Việt
=====================================================================
*/

IF NOT EXISTS (SELECT 1 FROM   [A00002] WHERE [ID] =  'MTFML000001' and LanguageID = 'vi-VN')
  INSERT INTO [A00002]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate])
  VALUES ('MTFML000001','vi-VN',N'Bạn chưa nhập','00', GetDate(), GetDate());
  
IF NOT EXISTS (SELECT 1 FROM   [A00002] WHERE [ID] =  'MTFML000002' and LanguageID = 'vi-VN')
  INSERT INTO [A00002]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate])
  VALUES ('MTFML000002','vi-VN',N' đã tồn tại. Vui lòng nhập mã khác!','00', GetDate(), GetDate());
  
IF NOT EXISTS (SELECT 1 FROM   [A00002] WHERE [ID] =  'MTFML000003' and LanguageID = 'vi-VN')
  INSERT INTO [A00002]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate])
  VALUES ('MTFML000003','vi-VN',N'Khóa học này đã được sử dụng. Bạn không thể Sửa / Xóa','00', GetDate(), GetDate());
  
IF NOT EXISTS (SELECT 1 FROM   [A00002] WHERE [ID] =  'MTFML000004' and LanguageID = 'vi-VN')
  INSERT INTO [A00002]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate])
  VALUES ('MTFML000004','vi-VN',N'Chương trình đào tạo này đã được sử dụng. Bạn không thể Sửa / Xóa','00', GetDate(), GetDate());

IF NOT EXISTS (SELECT 1 FROM   [A00002] WHERE [ID] =  'MTFML000005' and LanguageID = 'vi-VN')
  INSERT INTO [A00002]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate])
  VALUES ('MTFML000005','vi-VN',N'Giờ học này đã được sử dụng. Bạn không thể Sửa / Xóa','00', GetDate(), GetDate());

IF NOT EXISTS (SELECT 1 FROM   [A00002] WHERE [ID] =  'MTFML000006' and LanguageID = 'vi-VN')
  INSERT INTO [A00002]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate])
  VALUES ('MTFML000006','vi-VN',N'Lý do này đã được sử dụng. Bạn không thể Sửa / Xóa','00', GetDate(), GetDate());

IF NOT EXISTS (SELECT 1 FROM   [A00002] WHERE [ID] =  'MTFML000007' and LanguageID = 'vi-VN')
  INSERT INTO [A00002]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate])
  VALUES ('MTFML000007','vi-VN',N'Lớp học này đã được sử dụng. Bạn không thể Sửa / Xóa','00', GetDate(), GetDate());

IF NOT EXISTS (SELECT 1 FROM   [A00002] WHERE [ID] =  'MTFML000008' and LanguageID = 'vi-VN')
  INSERT INTO [A00002]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate])
  VALUES ('MTFML000008','vi-VN',N'Đã đăng kí khóa học cho học viên này, Bạn không thể xóa!','00', GetDate(), GetDate());
  
IF NOT EXISTS (SELECT 1 FROM   [A00002] WHERE [ID] =  'MTFML000009' and LanguageID = 'vi-VN')
  INSERT INTO [A00002]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate])
  VALUES ('MTFML000009','vi-VN',N'Dữ liệu mặc định! Bạn không thể xóa','00', GetDate(), GetDate());

IF NOT EXISTS (SELECT 1 FROM   [A00002] WHERE [ID] =  'MTFML000010' and LanguageID = 'vi-VN')
  INSERT INTO [A00002]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate])
  VALUES ('MTFML000010','vi-VN',N'Bạn có muốn chuyển hồ sơ học viên này qua bên đối tượng','00', GetDate(), GetDate());

IF NOT EXISTS (SELECT 1 FROM   [A00002] WHERE [ID] =  'MTFML000016' and LanguageID = 'vi-VN')
  INSERT INTO [A00002]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate])
  VALUES ('MTFML000016','vi-VN',N'Vượt quá số lần API cho phép gọi. Cài đặt tại API Google của bạn.','00', GetDate(), GetDate());

IF NOT EXISTS (SELECT 1 FROM   [A00002] WHERE [ID] =  'MTFML000017' and LanguageID = 'vi-VN')
  INSERT INTO [A00002]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate])
  VALUES ('MTFML000017','vi-VN',N'Dữ liệu đầu vào không hợp lệ!','00', GetDate(), GetDate());

IF NOT EXISTS (SELECT 1 FROM   [A00002] WHERE [ID] =  'MTFML000018' and LanguageID = 'vi-VN')
INSERT INTO [A00002]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate])
VALUES ('MTFML000018','vi-VN',N'Sản phẩm của điểm xuất phát và điểm đến vượt quá giới hạn cho mỗi truy vấn.','00', GetDate(), GetDate());

IF NOT EXISTS (SELECT 1 FROM   [A00002] WHERE [ID] =  'MTFML000019' and LanguageID = 'vi-VN')
INSERT INTO [A00002]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate])
VALUES ('MTFML000019','vi-VN',N'Yêu cầu của bạn có hơn 25 điểm xuất phát hoặc hơn 25 điểm đến.','00', GetDate(), GetDate());

IF NOT EXISTS (SELECT 1 FROM   [A00002] WHERE [ID] =  'MTFML000020' and LanguageID = 'vi-VN')
INSERT INTO [A00002]([ID],[LanguageID],[Name],[Module], [InsertDate], [UpdateDate])
VALUES ('MTFML000020','vi-VN',N'Không thể xử lý yêu cầu Ma trận khoảng cách do lỗi máy chủ. Yêu cầu có thể thành công nếu bạn thử lại.','00', GetDate(), GetDate());
