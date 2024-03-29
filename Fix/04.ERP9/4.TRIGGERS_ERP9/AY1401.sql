/****** Object:  Trigger [dbo].[AY1401]    Script Date: 01/12/2011 09:49:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----- Created by Nguyen Van Nhan and Nguyen Lam Hoa, Date 17/11/2003.
----- Modify by Cao Thị Phượng, Date 18/05/2017: Bổ sung insert thêm trường SourceID cho các trường trên bảng ERP9
----- Modified by Tấn Thành - Date 10/03/2021: Bổ sung thêm phân quyền Module khi tạo nhóm mới.
----- Modified by Hoài Bảo - Date 26/09/2022: Bổ sung insert thêm trường CommonID cho các màn hình trên APP,ERP9
---- Purpose: Them tat cac cac man hinh va bang chi tiet phan quyen (AT1403)

ALTER TRIGGER [dbo].[AY1401] ON [dbo].[AT1401] 
FOR INSERT

AS
DECLARE @ScreenList_Cur AS CURSOR,
	@GroupID AS NVARCHAR(50),
	@DivisionID NVARCHAR(50)
	
SET @ScreenList_Cur = CURSOR SCROLL KEYSET FOR 
	SELECT GroupID, DivisionID FROM Inserted
OPEN	@ScreenList_Cur
FETCH NEXT FROM @ScreenList_Cur  INTO  @GroupID, @DivisionID
WHILE @@FETCH_STATUS = 0
	BEGIN
		-- Insert Dữ liệu phân quyền Màn hình.
		INSERT AT1403 (DivisionID, ModuleID , ScreenID,  GroupID,	
		              IsAddNew, IsUpdate, IsDelete, IsView, IsPrint, CreateDate, CreateUserID, LastModifyUserID, LastModifyDate, SourceID, CommonID)

		SELECT DivisionID, ModuleID, ScreenID, @GroupID, 0, 0, 0, 0, 0,
			GETDATE(), 'ASOFTADMIN',  'ASOFTADMIN', GETDATE(), SourceID,
			CASE WHEN SourceID = 'APP' THEN SUBSTRING(ScreenID, 0,LEN(ScreenID) - 2)
				 WHEN SourceID = 'ERP9' THEN ScreenID
				 ELSE NULL
			END
		FROM AT1404 WHERE DivisionID = @DivisionID
		
		-- Insert Dữ liệu phân quyền Module

		INSERT AT1403 (DivisionID, ModuleID , ScreenID,  GroupID,	
		              IsAddNew, IsUpdate, IsDelete, IsView, IsPrint, IsHidden,  CreateDate, CreateUserID, LastModifyUserID, LastModifyDate, SourceID)

		SELECT DivisionID, ModuleID, ModuleID, @GroupID, 0, 0, 0, 0, 0, 0,
			GETDATE(), 'ASOFTADMIN',  'ASOFTADMIN', GETDATE(), 'HIDDEN'
		FROM AT1409 WHERE DivisionID = @DivisionID
		FETCH NEXT FROM @ScreenList_Cur  INTO  @GroupID, @DivisionID
	END
CLOSE @ScreenList_Cur