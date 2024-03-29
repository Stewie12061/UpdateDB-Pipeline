------------------------------------------------------------------------------------------------------
-- Fix Bổ sung phân quyền màn hình -- Module HRM
-- ScreenID: 1-Báo cáo; 2-Danh mục; 3-Nhập liệu; 4-Khác
------------------------------------------------------------------------------------------------------
-- Store Insert dữ liệu vào Table chuẩn
------------------------------------------------------------------------------------------------------
-- create by Quốc Tuấn Date 05/11/2014 
-- Thêm dữ liệu vào bảng Master


IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[AP00008]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[AP00008]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE AP00008
(
	@ID VARCHAR(50),
	@Name VARCHAR(50),
	@ModuleID VARCHAR(50),
    @ScreenID VARCHAR(50),
    @KeyLanguage VARCHAR(50),
    @Url NVARCHAR(4000),
    @ParentID NVARCHAR(4000),
    @Level INT,
    @Enable BIT,
	@Order INT,
	@Visible BIT
)
AS

IF NOT EXISTS (SELECT TOP 1 1 FROM A00008 WHERE ID = @ID)
	INSERT INTO A00008(APK, ID, Name, ModuleID, ScreenID, KeyLanguage, Url, ParentID, [Level], [Enable], [Order], Visible, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate)
	VALUES(NEWID(), @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible, 'ASOFTADMIN', GETDATE(), 'ASOFTADMIN', GETDATE())
ELSE  
	UPDATE A00008  SET 
	ModuleID = @ModuleID,
	ScreenID = @ScreenID,
	KeyLanguage = @KeyLanguage,
	Url = @Url,
	ParentID = @ParentID,
	[Level] = @Level,
	[Enable] = @Enable,
	[Order] = @Order,
	Visible = @Visible,
	LastModifyUserID = 'ASOFTADMIN',
	LastModifyDate = GETDATE()
	WHERE ID = @ID

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO