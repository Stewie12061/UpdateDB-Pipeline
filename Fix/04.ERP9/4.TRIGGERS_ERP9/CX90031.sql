/****** Object:  Trigger [dbo].[AY1401]    Script Date: 01/12/2011 09:49:50 ******/
IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CX90031_REL]') AND OBJECTPROPERTY(ID, N'IsTrigger') = 1)
DROP TRIGGER [DBO].[CX90031_REL]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----- Created by Nguyen Van Nhan and Nguyen Lam Hoa, Date 17/11/2003.
----- Modify by Cao Thị Phượng, Date 18/05/2017: Bổ sung insert thêm trường SourceID cho các trường trên bảng ERP9
----- Modified by Tấn Thành - Date 10/03/2021: Bổ sung thêm phân quyền Module khi tạo nhóm mới.
---- Purpose: Them tat cac cac man hinh va bang chi tiet phan quyen (AT1403)

CREATE TRIGGER [dbo].[CX90031_REL] ON [dbo].[CRMT90031_REL] 
FOR DELETE

AS
BEGIN
	IF EXISTS(SELECT TOP 1 1 FROM CustomerIndex WHERE CustomerName = 152)
	BEGIN
		DECLARE 
			@Data_Cur CURSOR,
			@APK VARCHAR(50),
			@DivisionID VARCHAR(50),
			@NotesID VARCHAR(50),
			@RelatedToTypeID_REL int,
			@ReleateToID VARCHAR(50),
			@APK_OOT2340 VARCHAR(50),
			@APK_OOT9000 VARCHAR(50)

		SET @Data_Cur = CURSOR SCROLL KEYSET FOR 
			SELECT	APK
					, DivisionID 
					, NotesID
					, RelatedToTypeID_REL
					, RelatedToID
					FROM Deleted

		OPEN	@Data_Cur
		FETCH NEXT FROM @Data_Cur  INTO 
											  @APK
											, @DivisionID 
											, @NotesID
											, @RelatedToTypeID_REL
											, @ReleateToID

		WHILE @@FETCH_STATUS = 0
			BEGIN
		
				IF EXISTS (SELECT TOP 1 1 FROM OOT9000 WITH (NOLOCK) 
							WHERE 
								DivisionID = @DivisionID
								AND Type IN ('VBDEN', 'VBDI') 
								AND APK = @ReleateToID)
				BEGIN

					SET @APK_OOT2340 = NULL

					SELECT TOP 1 @APK_OOT2340 = OOT2340.APK FROM OOT2340 WITH (NOLOCK) WHERE APKMaster_9000 = @ReleateToID

					IF(ISNULL(@APK_OOT2340, '') != '')
					BEGIN
						DELETE CRMT90031_REL WHERE DivisionID = @DivisionID AND RelatedToID = @APK_OOT2340 AND NotesID = @NotesID
					END
				END

				IF EXISTS (SELECT TOP 1 1 FROM OOT2340 WITH (NOLOCK) 
							WHERE 
								DivisionID = @DivisionID
								AND APK = @ReleateToID)
				BEGIN

					SET @APK_OOT9000 = NULL

					SELECT TOP 1 @APK_OOT9000 = OOT2340.APKMaster_9000 FROM OOT2340 WITH (NOLOCK) WHERE APK = @ReleateToID

					IF(ISNULL(@APK_OOT9000, '') != '')
					BEGIN
						DELETE CRMT90031_REL WHERE DivisionID = @DivisionID AND RelatedToID = @APK_OOT9000 AND NotesID = @NotesID
					END
				END
				

				FETCH NEXT FROM @Data_Cur  INTO   
											  @APK
											, @DivisionID 
											, @NotesID
											, @RelatedToTypeID_REL
											, @ReleateToID
			END


		CLOSE @Data_Cur
	END

END