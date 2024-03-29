IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CY90031_REL]') AND OBJECTPROPERTY(ID, N'IsTrigger') = 1)
DROP TRIGGER [DBO].[CY90031_REL]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----- Created	by Văn Tài, Date 03/06/2022.
----- Modify	by Văn Tài, Date 30/11/2022: Cập nhật thông tin Mã hợp đồng.
-----
----- Purpose: Cập nhật thông tin Mã hợp đồng.

CREATE TRIGGER [dbo].[CY90031_REL] ON [dbo].[CRMT90031_REL] 
FOR INSERT

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
			@APK_OOT9000 VARCHAR(50),
			@DocumentID VARCHAR(50)

		SET @Data_Cur = CURSOR SCROLL KEYSET FOR 
			SELECT	APK
					, DivisionID 
					, NotesID
					, RelatedToTypeID_REL
					, RelatedToID
					FROM Inserted

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
					SET @DocumentID = NULL

					SELECT TOP 1 
					@APK_OOT2340 = OOT2340.APK,
					@DocumentID = OOT2340.DocumentID
					FROM OOT2340 WITH (NOLOCK) WHERE APKMaster_9000 = @ReleateToID

					IF(ISNULL(@APK_OOT2340, '') != '')
					BEGIN
						INSERT INTO CRMT90031_REL
						(
							APK
							, DivisionID 
							, NotesID
							, RelatedToTypeID_REL
							, RelatedToID
						)
						VALUES
						(
							 NEWID()
							, @DivisionID 
							, @NotesID
							, @RelatedToTypeID_REL
							, @APK_OOT2340
						)

						UPDATE OOT9002 
							SET [Parameters] = @DocumentID
						WHERE 
								OOT9002.APKMaster IN (@APK_OOT2340, @ReleateToID)			
								
					END
				END

				IF EXISTS (SELECT TOP 1 1 FROM OOT2340 WITH (NOLOCK) 
							WHERE 
								DivisionID = @DivisionID
								AND APK = @ReleateToID)
				BEGIN

					SET @APK_OOT9000 = NULL
					SET @DocumentID = NULL

					SELECT TOP 1 @APK_OOT9000 = OOT2340.APKMaster_9000
					, @DocumentID = OOT2340.DocumentID
					FROM OOT2340 WITH (NOLOCK) WHERE APK = @ReleateToID

					IF(ISNULL(@APK_OOT9000, '') != '')
					BEGIN
						INSERT INTO CRMT90031_REL
						(
							APK
							, DivisionID 
							, NotesID
							, RelatedToTypeID_REL
							, RelatedToID
						)
						VALUES
						(
							 NEWID()
							, @DivisionID 
							, @NotesID
							, @RelatedToTypeID_REL
							, @APK_OOT9000
						)

						UPDATE OOT9002 
							SET [Parameters] = @DocumentID
						WHERE 
								OOT9002.APKMaster IN (@APK_OOT2340, @ReleateToID)		

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