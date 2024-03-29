-- <Summary>
---- Insert dữ liệu từ điển nhóm tính cách D.I.S.C vào bảng HRMT21102, để phục vụ đánh giá  D.I.S.C
-- <History>
---- Create on 16/11/2017 by Hoàng vũ: Do Từ điển nhóm tính cách không có màn hình, nên chỉ viết Script insert dữ liệu ngầm D.I.S.C phục vụ cho việc in báo cáo
---- Modified on ... by ...
---- <Example>

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Tính cách')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Tính cách', N'- Dễ giận.
- Fast. Thẳng thắn, quyết đoán, lãnh đạo.
- Thích mới, có mục tiêu, thích chống đối, Mạnh mẽ trong giao tiếp.
- Rất nhiều quy tắc và quy định.
- Nhiều D thì sẽ đánh nhau.', N'- Lạc quan
- Fast/tự phát.
- Thích mới, xã giao, nhiều bạn.
- Nói nhiều.', N'- U uất
- Slower/Relaxed. Chăm chỉ, chậm rãi, nice, thích cũ, không phô trương, bị ép quá thì sẽ nổ tung, thù dai.', N'- Lãnh đạm
- Slower/Systematic
- Thích điều khiển bằng luật chứ không bằng ảnh hưởng cá nhân.
- Có quy tắc hành xử, thích lễ nghĩa, truyền thống. Trật tự, kỹ thuật, tìm hiểu kỹ, lên kế hoạch hoàn hảo.
- Thích làm việc một mình.
- Khiêm tốn, bảo thủ, hoài nghi sự thay đổi, QC, quyết định dựa trên phân tích, thích người cẩn thận, thích chính xác, phân quyền, trách nhiệm, hệ thống chặt chẽ.
- Tập trung cao, ghét gián đoạn.',  1)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Priority/Độ ưu tiên')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Priority/Độ ưu tiên', N'- Goal/Mục tiêu', N'- People/Con người', N'- Relationship/Mối quan hệ', N'- Task/Công việc cụ thể',  2)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Seek/Tìm kiếm')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Seek/Tìm kiếm', N'- Hiệu suất và Kiểm soát', N'- Tham gia và Khen ngợi', N'- Hòa đồng', N'- Chính xác',  3)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Ưu')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Ưu', N'- Suy nghĩ độc lập, quyết tâm, hiệu suất tốt.
- Ra quyết định nhanh.
- Có khả năng lãnh đạo/Leadership.', N'- Nhiệt tình, cởi mở, thích tụ tập
- Rất tự tin.', N'- Chậm, chắc, kiên nhẫn, không đòi hỏi, thông cảm, trung thành, hỗ trợ.
- Ít bạn, nhưng bạn thân.', N'- Tổ chức, kỷ luật, chi tiết, thực tế, chính xác. Ít bạn, bạn cùng chí hướng hơn là bạn tình cảm.
- Tự tin vào năng lực mình.
- Critical thinker (tư duy phê phán), tư duy tốt, kỹ thuật tốt, cảm nhận vấn đề tốt, quản lý thời gian tốt, tư duy hệ thống, thực tế, có lương tâm, đánh giá con người bằng kết quả. Đạo đức, lương tâm.',  4)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Nhược')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Nhược', N'- Nóng nảy, nôn nóng, quá cương.
- Không lắng nghe.', N'- Hấp tấp, phi lý.
- Dễ bị kích động, nôn nóng, dễ bị lừa.
- Không chi tiết, dễ nản.
- Cực đoan. Giữ bí mật kém.', N'- Ghét thay đổi, ghét tranh cãi.
- Thụ động.
- Quá nhạy cảm, chần chừ, thiếu tổng thể.
- Thỏa hiệp, nhượng bộ.', N'- Ngại giao tiếp, Thích ẩn cư, nên bị giảm lòng tin. Self-reliant (tự chủ).
- Cầu toàn, thích đánh giá, lạnh lùng, ngoan cố.
- Không thích cãi nhau, nhưng khi luật bị vi phạm thì sẽ nói thẳng. Chần chừ, quá cẩn thận.
- Ngại xung đột.
- Sa lầy chi tiết, số liệu.
- Nguyên tắc',  5)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Việc phù hợp')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Việc phù hợp', N'- Admin,
- Leadership.
- Pioneering (Tiên phong)', N'- Persuading(Thuyết phục).
- Motivating (Tạo động lực),
- Entertaining (Giải trí),', N'- Listening (Lắng nghe).
- Teamwork (Đội nhóm).
- Following.', N'- Planning (Lên kế hoạch).
- Systemizing (Hệ thống hóa).',  6)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Làm tốt')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Làm tốt', N'- Cạnh tranh, chấp nhận rủi ro.
- Không sợ trở ngại.
- Chịu trách nhiệm, BẢO ĐẢM kết quả cuối cùng', N'- Lạc quan, trực giác, sáng tạo
- THÚC ĐẨY các ý tưởng, cơ hội hoặc con người', N'- Hòa đồng, thân thiện, nhạy bén, biết lắng nghe
- PHỐI HỢP và HỢP TÁC.', N'- Tổ chức tốt; Kế hoạch kỹ lưỡng.
- Tốc độ suy nghĩ nhanh nhưng nói chậm, cần thời gian suy nghĩ.
Tự tin trong công việc, công việc rõ ràng, nhìn tổng thể, ít bất ngờ, kiểm soát công việc tốt, quyết định logic hơn là emotion.',  7)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Ghét làm')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Ghét làm', N'- Việc lặp lại.
- Cởi mở, nhưng riêng tư về các vấn đề cá nhân.
- Ghét người thiếu hiệu suất, thiếu quyết đoán', N'- Nhiều quy định giới hạn. - Báo cáo chính thức hoặc liên tục ghi nhận các chi tiết.
- Việc phức tạp, lặp lại, nhàm chán, phải làm lại điều gì khi việc đó đã xong', N'- Cạnh tranh
- Làm việc với những người độc tài hoặc không thân thiện
- Phải thay đổi nhiều.
- Bày tỏ những ý kiến trái ngược người khác.
- Ghét người thô lỗ, thiếu kiên nhẫn', N'- Môi trường không có sự tổ chức, định hướng không rõ ràng/chưa hoàn chỉnh. Cởi mở nhưng khép kín về vấn đề cá nhân. Ghét người vô tổ chức. Casual (tình cờ), suồng sã, gấp gáp, tùy tiện, lộn xộn, nguồn tin không đáng tin, thời gian không thực tế, xét đoán vội vàng.',  8)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Sợ')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Sợ', N'- Sợ mất quyền', N'- Sợ mất danh tiếng
- Sợ bị từ chối (rejection)', N'- Sợ thay đổi bất ngờ
- Sự không ổn định', N'- Sợ bị đánh giá thấp kết quả công việc',  9)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Thích')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Thích', N'- Control
- Leadership', N'- Vui vẻ
- Được chấp nhận', N'- Friendship (hữu nghị)
- Hợp tác', N'- Chuẩn bị kỹ càng
- Chi tiết và logic mọi thứ',  10)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Khi gặp khó')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Khi gặp khó', N'- Độc tài.
- Chỉ trích.', N'- Mỉa mai, hời hợt.
- Lý sự cùn.', N'- Phục tùng.
- Do dự.', N'- Khép kín.
- Cứng đầu.
- Tránh né.',  11)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Đánh giá người khác')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Đánh giá người khác', N'- Kết quả
- Lý lịch.', N'- Sự công nhận
- Khen, tán đồng', N'- Sự hòa đồng
- Mức độ cống hiến', N'- Chính xác
- Chất lượng kết quả',  12)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Sửa nhược điểm')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Sửa nhược điểm', N'- Tạo ra hình ảnh thoải mái hơn
- Tập lắng nghe, kiên nhẫn, khiêm tốn, nhạy cảm, đồng cảm
- Nói ra lý do để đi đến kết luận.
- Nhận thức được về luật, quy định.
- Khen người khác.', N'- Tư duy logic.
- Làm tới cùng.
- Lập kế hoạch, kiểm soát thời gian và cảm xúc. Giữ lời hứa.
- Tập trung vào các nhiệm vụ trong khả năng.', N'- Thỉnh thoảng nói “không”
- Hoàn thành công việc mà không quá nhạy cảm với cảm xúc người khác
- Chấp nhận rủi ro khi vượt ra khỏi vùng an toàn
- Ủy quyền cho người khác
- Chấp nhận các thay đổi về thủ tục
- Diễn tả cảm xúc và suy nghĩ', N'- Khen ngợi người khác.
- Sẵn sàng điều chỉnh nhiều hơn đối với các thay đổi và xáo trộn
- Ra quyết định kịp thời
- Thỏa hiệp với người khác
- Bớt cứng nhắc. Sử dụng các chính sách như các hướng dẫn, không phải luật pháp. - Cần coi việc cãi nhau là không nghiêm trọng.
- Cởi mở hơn, hỏi ý kiến người khác.',  13)
END


IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Nơi làm việc')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Nơi làm việc', N'- Hiệu quả, bận rộn, hệ thống', N'- Tương tác, bận rộn, con người', N'- Thân thiện, functional, con người, có chỉ thị rõ ràng, hỗ trợ đầy đủ', N'- Nghiêm túc, hiệu quả, hệ thống.',  15)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Đồ dùng, trang phục')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Đồ dùng, trang phục', N'- Trang phục thể hiện địa vị, những thứ mang theo là phục vụ cho công việc.', N'- Trang phục lòe loẹt, nhiều đồ trang sức.', N'- Trang phục giản dị, không nổi bật.', N'- Trang phục bảo thủ, nhưng sẵn sàng chọn đồ hiệu.',  16)
END


IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Giao tiếp')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Giao tiếp', N'- Hợp tác cùng thực hiện mục tiêu.
- Đặt câu hỏi để họ tự trả lời và đưa ra quyết định.
- Không cần tỏ ra quá thân tình.
- Khi phản luận, phải dựa trên chứng cứ xác thực.
- Lắng nghe. Công nhận kết quả, ý tưởng của họ.
- Cho cơ hội, lý do, data, khung làm việc. Họ tự làm, chỉ kiểm tra kết quả. Bám sát công việc.
- Khen/chê kết quả, không động đến con người.
- Ủng hộ mục tiêu của họ
- Không phí thời gian của họ. Rõ ràng, cụ thể, ngắn gọn, cần có agenda.
- Chính xác, hiệu quả và có tổ chức.
- Đưa ra các phương án hành động thay thế với những phân tích tóm tắt mang tính hỗ trợ.', N'- Quan hệ tốt, cởi mở.
- Tránh tranh luận vấn đề phức tạp.
- Cho họ thấy minh thích họ.
- Lạc quan, hỗ trợ tình cảm, cùng làm, cùng sống. - Focus big picture. Tránh commitment dài hạn. Tập trung vào thời gian hiện tại.
- Cho cơ hội mới, làm nhanh. Khen ý tưởng.
- Cho họ vị trí để tỏa sáng.
- Tạo không khí hào hứng, vui vẻ và đa dạng.
- Ủng hộ ý tưởng và ước mơ của họ
- Thư giãn và năng động; đừng vội vàng tham gia các cuộc thảo luận
- Tóm tắt bằng văn bản ai làm gì, ở đâu, khi nào.
- Tán đồng những ước mơ của họ.
- Không thúc ép quyết định, cùng họ tạo dựng ước mơ.
- Tránh phản luận, lựa theo ý kiến của họ.
- Hợp đồng cụ thể. Ghi nhận lại sự đồng ý.
- Khơi gợi ước mơ, sự nổi danh.', N'- Tình cảm. Từ từ, tránh tranh cãi, nhạy cảm, công nhận, khen ngợi. - Cầm tay chỉ việc. Cho họ chăm sóc, đóng góp công sức cho cả tổ chức. Khen sự tận tình của họ.
- Kiên nhẫn trả lời các câu hỏi và sự quan tâm của họ. Ủng hộ cảm xúc của họ bằng cách thể hiện sự quan tâm cá nhân và tích cực lắng nghe
- Phát triển mối quan hệ dần dần, không quá thân mật. Cho họ thời gian để tin bạn.
- Khi không đồng ý, hãy trao đổi với họ về cảm xúc cá nhân.
- Bảo đảm giảm risk. Đưa ra những sự cam kết và bảo đảm về cá nhân.
- Tạo không khí thân thiện, quan tâm đến cá nhân họ, tạo dựng niềm tin.
- Lắng nghe ý kiến, nhưng phải phân loại rõ cái gì làm được và không làm được.
- Khi phản luận, thì không quá dựa trên lý lẽ, mà phải dựa trên tình cảm.
- Ký hợp đồng, thì phải làm rõ những điều khoản mờ mịt.', N'- Tiếp cận logic. Lắng nghe lý lẽ, đề xuất. Trả lời nghiêm túc. Thảo luận tiêu cực cũng OK, không phê phán cá nhân. Công nhận suy nghĩ của họ. Chấp nhận quy trình của họ. Xin họ cho ý kiến. Thể hiện bằng hành động, không phải lời nói.
- Họ ít nói, nhưng suy nghĩ nhanh, nên phải hỏi ý kiến trực tiếp, thì họ mới nói. Tiếp cận từ từ. Khen sự chính xác. Giải thích Why & How. Làm việc nhanh gọn, có chuẩn bị, chính xác, quy trình, plan cụ thể, chứng cứ rõ ràng.
- Cho họ thời gian suy nghĩ, hãy thoải mái khi họ im lặng.
- Chứng minh bằng hành động, không phải bằng lời nói.
- Lên danh sách những thuận lợi và bất lợi rõ ràng của kế hoạch, sản phẩm.
- Đưa ra các cam kết và minh chứng mà hành động mang lại kết quả như mong đợi.',  18)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Phone/Điện thoại')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Phone/Điện thoại', N'- Cung cấp số điện thoại, tên, thông tin… cho họ khi bắt đầu và khi kết thúc.
- Nói rõ ràng với tốc độ nói mỗi lúc càng nhanh.
- Cho họ biết chính xác lý do bạn gọi tới, cần họ làm những gì.', N'- Giọng ấm, biểu cảm.
- Tạo ấn tượng rằng bạn lạc quan.
- Nếu thích hợp, cho họ số điện thoại “cá nhân”.
- Hẹn gặp chia sẻ ý tưởng. - Cho họ biết cuộc gặp đầu tiên chỉ mang tính thăm dò.', N'- Relax. Cười cũng như nói chuyện một cách ấm áp.
- Tạo cảm giác riêng tư; nhưng vẫn chuyên nghiệp.
- Nếu có thể, hãy cho họ biết ai liên quan đến bạn.
- Cảm ơn họ trước vì đã trao đổi với bạn.', N'- Nói rõ ràng với tốc độ ổn định.
- Duy trì sự thoải mái, bình tĩnh và chuyên nghiệp.
- Nói cho họ biết chính xác lí do bạn gọi tới, muốn họ làm điều, gì bước kế tiếp làm gì.',  19)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Khách hàng')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Khách hàng', N'- Mua đồ vì mình thích đồ đó.
- Hunter Sale.
- Muốn được tôn trọng từ 2 phía. Không cần thân thiện, tùy lúc có thể thô lỗ cũng
- OK. Cần tóm tắt (không quá chi tiết) về fact & reason là sản phẩm sẽ giúp họ hiệu quả (tiết kiệm thời gian, chi phí), thành công, leadership.
- Họ có thể đặt các câu hỏi để kiểm tra năng lực của bạn.
- Thích người không lãng phí thời gian của họ.
- Yêu cầu bạn giữ lời hứa bằng văn bản, lời nói và ngụ ý.
- Ra quyết định nhanh chóng khi họ thấy được lợi ích.', N'- Mua vì thích con người (mua từ bạn bè)
- Farmer sale. Hãy trở thành I giống họ. Humor (hài hước), khái quát (đừng quá chi tiết), để họ nói và góp ý kiến chân thành cho họ.
- Ra quyết định tức thời khi họ hào hứng về sản phẩm/dịch vụ
- Thấy được lợi ích trước khi chúng được chỉ ra
- Ghét thủ tục giấy tờ, muốn việc mua hàng trở nên đơn giản
- Cần có tài liệu để nhắc nhở họ về các thỏa thuận', N'- Mua vì sự trung thành, thói quen, Guarantee.
- Be casual (vờ tình cờ). Không vội. Outline (tổng quan), give detail (chi tiết), đưa ra lịch hành động. Đến lịch thì nhắc, nhưng không push. Nói với họ là thay đổi không nhiều.
- Eye contact. Thích mối quan hệ bán hàng dựa trên niềm tin.
- Có xu hướng đưa ra quyết định một cách hợp tác.
- Ghét người bán hàng hung hăng, cao ngạo
- Trung thành tuyệt đối một khi đã tạo được niềm tin.
- Phản ứng rất tốt đối với các trường hợp đảm bảo cá nhân.
- Cần được hướng dẫn nhẹ nhàng để giúp ra quyết định.', N'- Kỹ tính, tìm hiểu kỹ. Cho thật nhiều data, chứng minh là sản phẩm sẽ giúp họ hiệu quả hơn, cho kỳ hạn suy nghĩ, và liên lạc lại. Không cần làm bạn. Cần thời gian và dữ liệu để đánh giá, phục vụ cho việc ra quyết định
- Đôi khi sa đà vào chi tiết không quan trọng; phải giúp họ tập trung lại.
- Phản ứng rất tốt đối với các vấn đề giảm thiểu hoặc loại trừ rủi ro.
- Muốn bạn thể hiện chuyên môn tuyệt vời trong lĩnh vực của bạn
- Xem xét quá nhiệt tình với thái độ hoài nghi.',  20)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Bán hàng')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Bán hàng', N'- Kế hoạch cẩn thận. Làm việc PRO. Hiểu Goal của họ. Đề xuất giải pháp cho họ chọn. Giữ cho mối quan hệ đâu ra đấy.
- Chuẩn bị kỹ, làm việc nhanh gọn.
- Tìm hiểu kết quả và thời hạn mong muốn của họ.
- Cung cấp cho họ các lựa chọn với bản tóm tắt chi phí/ lợi ích.
- Thường xuyên nhắc nhở họ về việc theo dõi của bạn.
- Phản hồi nhanh chóng các vấn đề của họ bằng các giải pháp.', N'- Cho họ thấy minh thích họ. Support their dream, goals. Lắng nghe. Vẽ ước mơ của minh phù hợp họ. 
- Chỉ ra công việc cụ thể. Incentive để thúc đẩy kết luận sớm. Để cho họ tạo nên môi trường gặp gỡ.
- Cho họ thấy sự sinh động và nhiệt tình. Tìm hiểu mong muốn và động cơ của họ. Giúp họ tạo ấn tượng tốt đẹp trong mắt người khác, đặc biệt là ông chủ của họ
- Tóm tắt tất cả chi tiết.
- Cứu họ ra khỏi rắc rối.
- Dùng testimonial hay ưu đãi để làm họ quyết định.', N'- Thân thiện, an toàn, xây dựng long tin. Yêu cầu họ thể hiện tình cảm. Không thúc ép gấp. Tập trung xây dựng lòng tin và sự tín nhiệm trước khi xây dựng doanh nghiệp.
- Tìm hiểu thực tế hiện nay và nhu cầu của họ.
- Cung cấp sự hướng dẫn, định hướng và đảm bảo cá nhân.
- Thực hiện các dịch vụ nhất quán, có thể dự đoán được bằng việc gây sự chú ý của cá nhân.', N'- Chuẩn bị kỹ lưỡng cho mọi câu hỏi. Chào hỏi nghiêm túc, nhưng đi thẳng vào câu chuyện, không lan man chuyện cá nhân, chuyện xã hội. Nói chuyện thực tế & logic. Đưa ra hướng rõ ràng, có văn bản, giải thích rõ Why & How. Cho thời gian suy nghĩ. Giữ lời hứa.
- Tìm hiểu mục tiêu và kiến thức của họ.
- Cung cấp các lựa chọn hợp lý bao gồm cả ưu và khuyết điểm.
- Cung cấp Guarantee, bằng chứng bằng văn bản.
- Theo dõi thời gian biểu cụ thể để đo lường kết quả.
- Cung cấp đúng những gì đã hứa.',  21)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Đào tạo')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Đào tạo', N'- Thách thức họ để lập mục tiêu dài hạn nhiều hứa hẹn; họ có xu hướng muốn phát triển nhanh.
- Hỏi họ về các ý tưởng 
- Họ thích giải quyết vấn đề. 
- Cung cấp cho họ các lựa chọn hơn là đề xuất các giải pháp cụ thể.
- Họ thường cảm thấy thoải mái với việc ít liên hệ/theo dõi thường xuyên so với những phong cách còn lại.
- Ca ngợi sự làm việc vất vả và kết quả tích cực của họ.', N'- Lập mục tiêu có thể đạt nhanh, sau đó lập mục tiêu tiếp theo ngay lập tức.
- Thừa nhận các ý tưởng phong phú của họ; thể hiện quan điểm dựa trên kết quả mong đợi mà không làm xem nhẹ các kế hoạch khả quan của họ.
- Vì họ không thích chi tiết, nên hãy chắc chắn rằng cả hai viết ra những gì sẽ thảo luận.
- Thường xuyên khen ngợi.
- Ý thức được những lúc họ phóng đại.', N'- Kết nối mục tiêu công việc với những ưu tiên cá nhân của họ.
- Giúp họ chia nhỏ mọi việc thành các bước nhỏ, rõ ràng.
- Nhưng không ép buộc quyết định của họ
- Vì họ có thể trì hoãn nên hãy đặt ra thời hạn trong ngắn hạn cho những bước hành động tiếp theo.
- Theo dõi thường xuyên và có trách nhiệm.', N'- Giúp họ xác định rõ mong muốn và ước lượng mục tiêu của họ bằng cách đặt ra những câu hỏi hay.
- Chuẩn bị các đề xuất của bạn kĩ lưỡng trước khi cung cấp cho họ.
- Khuyến khích họ lập kế hoạch chủ động, nhưng hãy để họ quyết định chính xác cần phải làm gì.Theo dõi thường xuyên, vì họ phát huy mạnh dựa vào sự ủng hộ đáng tin cậy của bạn. Chỉ ra những tiến bộ cụ thể để họ không trở nên chán nản.',  22)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Phát triển')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Phát triển', N'- Tập trung vào “bức tranh tổng thể”
- Cho họ thấy lộ trình đơn giản, nhanh nhất giúp họ tới được đích đến đã vạch ra.
- Nói cho họ biết việc gì được làm khi nào.
- Giúp họ tìm ra những biện pháp nhanh chóng.
- Kết nối ý tưởng của họ với giá trị cao nhất.', N'- Bức tranh tổng thể. Bỏ qua chi tiết và tài liệu nhàm chán
- Cho họ tham gia các hoạt động vận động
- Hãy để họ chỉ bạn biết họ học được gì
- Phê bình từ từ nhưng khen ngợi nhanh chóng.
- Để họ truyền đạt ý tưởng cho người khác', N'- Sử dụng chỉ dẫn cụ thể, lần lượt từng bước một.
- Bắt đầu và kết thúc đúng lúc.
- Để họ quan sát người khác trước khi thử hành động.
- Lên danh sách từng bước theo quy trình hoặc thời gian biểu/ lịch làm việc cụ thể.
- Cho phép hành động của họ lặp đi lặp lại nhiều lần.
- Sử dụng cách tiếp cận dễ chịu và kiên nhẫn.', N'- Chỉ ra những điều quan trọng nhất cần nhớ đầu tiên.
- Chứng minh một cách hợp lý, hiệu quả, nhấn mạnh mục đích của từng bước.
- Tiến hành từ từ, dừng lại ở những điểm quan trọng để kiểm tra sự hiểu biết của họ.
- Yêu cầu đầu vào, đặc biệt là việc nâng cao chất lượng tiềm năng.
- Xây dựng thành “bức tranh tổng thể”.',  23)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Motivation/Tạo động lực')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Motivation/Tạo động lực', N'- Tạo cơ hội để họ làm việc độc lập.
- Tăng cường kiểm soát thông qua môi trường làm việc. 
- Giao quyền và chỉ định rõ trách nhiệm chỉ đạo/quản lý người khác.
- Tạo ra các cuộc thi/cạnh tranh và khen thưởng.', N'- Phân công công việc có cấu trúc để họ làm việc theo nhóm. Thích bầy đàn, ghét bị bỏ rơi.
- Cung cấp ưu đãi “đặc biệt” để truyền cảm hứng cho họ đạt được mục tiêu.
- Chỉ cho họ thấy cách họ có thể tạo được ấn tượng tốt trong mắt người khác.
- Giao họ các mục tiêu ngắn hạn mà không đòi hỏi phải cam kết lâu dài.
- Công nhận thành tích của họ một cách nhiệt tình, khen ngợi họ công khai trước đám đông.
- Để họ nói thoải mái về thành công của mình hãy nhưng suy nghĩ, cảm xúc và ý tưởng của họ.', N'- Tạo cơ hội hợp tác với người khác để tạo ra kết quả hữu hình. 
- Hãy làm rõ kỳ vọng của bạn đối với họ, chỉ cho họ thấy sự theo đuổi của họ đem lại kết quả tốt hơn nhiều như thế nào. 
- Công nhận sự đóng góp của họ. 
- Thưởng hiệu suất cho họ một cách nhất quán.
- Thích được hỗ trợ, cần thời gian làm quen môi trường. Thích giữ nguyên hiện trạng đến khi không giữ được nữa. Ghét thay đổi đột ngột.
- Chỉ cho họ thấy công việc của họ mang lại lợi ích cho người khác như thế nào.
- Kết nối công việc cá nhân của họ với lợi ích của cả nhóm.
- Chỉ cho họ thấy có thể tăng cường mối quan hệ với người khác thế nào.', N'- Tạo cơ hội để chứng minh kiến thức chuyên môn.
- Hỗ trợ nỗ lực để tạo ra các kết quả chất lượng.
- Cung cấp các tình huống trong đó các nỗ lực hợp lý, có hệ thống sẽ góp phần vào thành công lâu dài. Chỉ cho họ làm thế nào để có chọn lựa tốt nhất sẵn có hiện nay.
- Luôn tiếp cận rõ ràng và theo quy trình, tốt hơn là cung cấp các ví dụ minh họa, data và tài liệu.
- Tránh phóng đại và mơ hồ, thíc rõ ràng, cụ thể, chắc chắn.',  24)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Điều chỉnh')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Điều chỉnh', N'- Mô tả kết quả mong muốn.
- Cho họ thấy khoảng cách giữa hiện thực và mong muốn.
- Đề xuất rõ ràng các cải tiến cần thiết và lập thời gian để thấy kết quả', N'- Họ tránh đối mặt với vấn đề, nếu áp lực vẫn còn, có thể bỏ qua điều đó.
- Đôi khi nhấn mạnh biểu hiện trong lúc hoảng loạn.
- Cho họ biết cụ thể những thách thức và hành vi để giải quyết vấn đề.
- Thỏa thuận bằng văn bản.
- Sử dụng các câu hỏi và các cụm từ khả quan, tích cực.', N'- Trấn an với họ rằng bạn chỉ điều chỉnh một hành vi cụ thể, không phải cá nhân họ.
- Họ có xu hướng thực hiện mọi thứ theo cá nhân, vì vậy hãy loại bỏ những hạn chế không phù hợp với bạn càng nhanh càng tốt.
- Chỉ cho họ thấy những gì họ đã làm đúng và nhấn mạnh điều gì cần thay đổi.', N'- Chỉ cho họ thấy cách hoàn thành tốt công việc và họ sẽ thành thạo và sửa đổi điều đó để phù hợp với nhu cầu của họ.
- Xác định hành vi chính xác được chỉ định và bạn muốn điều đó thay đổi thế nào.
- Thỏa thuận về những điểm trọng yếu và lộ trình.
- Giữ thể diện cho họ, vì họ sợ bị sai.',  25)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Quản lý nhóm')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Quản lý nhóm', N'- Leadership cao, thích hợp cho nhóm có nhiều bất đồng.
- Bảo đảm kết quả.
- Tốc độ và nhiệm vụ rõ ràng.', N'- Thúc đẩy ý tưởng, cơ hội.
- Thích hợp cho nhóm thiếu động lực.', N'- Phối hợp người khác.
- Theo dõi.
- Thích hợp cho nhóm thiếu phối hợp.', N'- Khả năng thích ứng cao, thích hợp cho việc tạo nhóm ban đầu.
- Lên kế hoạch, đánh giá, phân tích.',  26)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Support/Hỗ trợ')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Support/Hỗ trợ', N'- Giúp họ ra quyết định thận trọng.', N'- Giúp họ sắp xếp, ưu tiên, làm tới cùng.
- Giúp họ viết ra task, kiểm tra task bằng số liệu, tránh cho/nhận quá nhiều advice.', N'- Giúp họ lược bỏ những thứ rườm rà. Track their growth.
- Tránh làm 1 thứ lặp lại. Giúp họ thấy nhiều cách giải quyết 1 vấn đề.
- Giúp họ thay đổi mà không sợ rủi ro.
- Chân thành, lắng nghe. Giúp họ tránh thụ động nghe lời mọi người.
- Giúp họ có được sự tin cậy và khen ngợi.', N'- Giúp họ chia sẻ kiến thức, kinh nghiệm. - Giúp họ hòa đồng, bớt chỉ trích, bớt nghiêm trọng, bớt công việc, chỉ tập trung vào việc quan trọng.',  27)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Delegating/Giao việc')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Delegating/Giao việc', N'- Phải làm rõ về kết quả mong muốn. 
- Có dealine cụ thể. 
- Chỉ ra giới hạn về quyền. 
- Để họ làm việc độc lập. 
- Hãy để họ tự xác định cách thức thực hiện để đạt kết quả.', N'- Chỉ ra cụ thể các kết quả dự kiến. - Đặt ra thời hạn hợp lý. 
- Yêu cầu thực hiện theo lịch trình/tiến độ dự án. 
- Chỉ cụ thể các task phức tạp và cung cấp một phương pháp xử lý phù hợp.', N'- Cung cấp cho họ từng bước về những gì được yêu cầu. 
- Chuẩn bị các cuộc họp thường xuyên để đánh giá tiến trình và trả lời các câu hỏi. - Phác thảo rõ ràng các nguồn lực. Giúp họ tìm kiếm sự trợ giúp.', N'- Cung cấp giải thích chi tiết tối đa về nhiệm vụ. 
- Các tiêu chuẩn về chất lượng và độ chính xác cần có. 
- Giải thích mục đích phân công và lợi ích của công ty. 
- Giúp họ tìm kiếm sự trợ giúp.',  28)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Decision making/Ra quyết định')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Decision making/Ra quyết định', N'- Khuyến khích họ dành thời gian để thu thập thông tin và đánh giá các rủi ro/hậu quả tiềm ẩn. 
- Yêu cầu họ tham khảo kiến người khác. 
- Làm rõ ai sẽ là người đưa ra quyết định.', N'- Thảo luật về sự không chắc chắn sẽ khiến người khác khó chịu và ảnh hưởng đến mối quan hệ cá nhân. 
- Khuyến khích họ sử dụng logic và thông tin.', N'- Sử dụng phương pháp ra quyết định của họ. 
- Khuyết khích họ đưa ra quyết định kịp thời. 
- Hỗ trợ họ khi họ ra quyết định sẽ nhận lại sự đề kháng.', N'- Cho họ thời gian để họ thu thập các dữ kiện. 
- Đặt cho họ các giới hạn về phân tích và thời gian thực thi. 
- Chỉ ra các điểm nhận biết/hậu quả thực sự khi họ bắt đầu sai.',  29)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Complimenting/Praising/Đánh giá/Khen ngợi')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Complimenting/Praising/Đánh giá/Khen ngợi', N'- Ngắn ngọn và trực tiếp 
- Tập trung vào thành tích và kết quả cụ thể. 
- Hãy khen ngợi khả năng lãnh đạo của họ.
- Chỉ đưa ra những lời khen chân thành. 
- Tránh nhận xét về cảm xúc.', N'- Khen thưởng công khai. 
- Tạo sự nhiệt huyết động lực, ồn ào. 
- Nhấn mạnh vào kỹ năng giao tiếp và sự sáng tạo của họ.', N'- Hãy thể hiện sự ấm áp và chân thành. 
- Đánh giá cao sự hợp tác, hỗ trợ, nhất quán và trung thành của họ.', N'- Khen thưởng cá nhân/riêng tư. 
- Tóm tắt và cụ thể. 
- Viết nó ra dạng văn bản. 
- Công nhận khả năng logic, năng lực, độ chính xác và công công việc khó khăn.',  30)
END

IF NOT EXISTS  (SELECT TOP 1 1 FROM HRMT21102 WHERE LanguageID = N'vi-VN' and  CharacterGroupName = N'Problem Solving/Giải quyết vấn đề')
BEGIN
Insert into HRMT21102 (LanguageID, CharacterGroupName, Character_D, Character_I, Character_S, Character_C, OrderNo) 
Values (N'vi-VN', N'Problem Solving/Giải quyết vấn đề', N'- Thể hiện sự tự tin vào khả năng tìm ra giải pháp. 
- Khuyến khích họ kiểm tra các vấn đề phức tạp từ nhiều gốc độ. 
- Xác định kết quả mong đợi. 
- Tìm giải pháp có tính thực tiễn.', N'- Khen ngợi sự sâu sắc của họ về con người và tình huống. 
- Nhấn mạnh sự cần thiết của việc vượt ra ngoài bản năng và phân tích dựa trên sự thật. 
- Chia công việc/qui trình thành nhiều bước nhỏ.', N'- Khen ngợi cách tiếp cận giải quyết vấn đề có phương pháp của họ. 
- Khuyến khích họ sử dụng sự đổi mới và sáng tạo. 
- Cho họ thời gian để phản ảnh/tìm hiểu trước khi yêu cầu giải pháp. 
- Chọ họ các đánh giá về mức độ khẩn cấp của vấn đề.', N'- Khen ngợi khả năng phân tích của họ. 
- Đưa ra quan điểm khi họ muốn có Sự hoàn hảo. 
- Phác thảo các kỹ thuật giải quyết vấn đề cho các tình huống gấp cần giải pháp ngay.',  31)
END

