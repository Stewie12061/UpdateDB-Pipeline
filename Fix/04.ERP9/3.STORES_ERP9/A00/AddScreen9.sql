------------------------------------------------------------------------------------------------------
-- Fix Bổ sung phân quyền màn hình -- Module HRM
-- ScreenID: 1-Báo cáo; 2-Danh mục; 3-Nhập liệu; 4-Khác
------------------------------------------------------------------------------------------------------
-- Store Insert dữ liệu vào Table chuẩn
------------------------------------------------------------------------------------------------------
-- create by Quốc Tuấn Date 05/11/2014
-- Modified by Tấn Thành at 02/02/2021: Bổ sung lưu CommonID, Trường hợp @CommonID NUll => không update CommonID
-- Modified by Tấn Thành at 23/02/2021: Bổ sung Cập nhật SourceID AT1403 Trong trường hợp update AT1404
-- Modified by Tấn Lộc at 21/12/2022: Bổ sung cột OrderNo sắp xếp vị trí dữ liệu phân quyền
-- Modified by Văn Tài	 at 21/06/2023: Bổ sung WITH (NOLOCK)


IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[AddScreenERP9]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[AddScreenERP9]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE AddScreenERP9
(
    @ModuleID VARCHAR(50),
    @ScreenID NVARCHAR(4000),
    @ScreenType TINYINT,
    @ScreenName NVARCHAR(4000),
    @ScreenNameE NVARCHAR(4000),
	@CommonID VARCHAR(50) = NULL,
	@OrderNo INT = NULL
)
AS

--DECLARE @ModuleID AS NVARCHAR(50) = 'AsoftS'

--Insert thêm vào bảng STD
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404STD WITH (NOLOCK) WHERE ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404STD ( ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType) 
			VALUES(@ModuleID, @ScreenID, @ScreenName, @ScreenNameE, @ScreenType)
ELSE  
	UPDATE AT1404STD  SET 
	ScreenType = @ScreenType,
	ScreenName = @ScreenName,
	ScreenNameE = @ScreenNameE
	WHERE ModuleID = @ModuleID 
	AND ScreenID = @ScreenID

-- insert vào bảng thường
IF NOT EXISTS (SELECT TOP 1 1 FROM AT1404 WITH (NOLOCK) WHERE ModuleID = @ModuleID AND ScreenID = @ScreenID)
INSERT INTO AT1404 (DivisionID, ModuleID, ScreenID,ScreenName,ScreenNameE, ScreenType, CreateUserID, CreateDate, LastModifyUserID, LastModifyDate,SourceID, CommonID) 
			(SELECT DivisionID, @ModuleID, @ScreenID, @ScreenName, @ScreenNameE, @ScreenType, 'ASOFTADMIN', GETDATE() , 'ASOFTADMIN', GETDATE(),'ERP9', @CommonID
			FROM AT1101 WITH (NOLOCK))
ELSE
BEGIN
	IF(@CommonID IS NULL)
	BEGIN
		UPDATE AT1404  SET 
		ScreenType = @ScreenType,
		ScreenName = @ScreenName,
		ScreenNameE = @ScreenNameE,
		SourceID = 'ERP9',
		OrderNo = @OrderNo,
		LastModifyUserID = 'ASOFTADMIN',
		LastModifyDate = GETDATE()
		WHERE ModuleID = @ModuleID 
		AND ScreenID = @ScreenID
		AND EXISTS (SELECT TOP 1 1 FROM AT1101 WITH (NOLOCK) WHERE AT1101.DivisionID=AT1404.DivisionID)

		UPDATE AT1403
		SET SourceID = 'ERP9'
		WHERE ModuleID = @ModuleID
		AND ScreenID = @ScreenID
		AND EXISTS (SELECT TOP 1 1 FROM AT1101 WITH (NOLOCK) WHERE AT1101.DivisionID=AT1403.DivisionID)
	END
	ELSE
	BEGIN
		UPDATE AT1404  SET 
		ScreenType = @ScreenType,
		ScreenName = @ScreenName,
		ScreenNameE = @ScreenNameE,
		SourceID = 'ERP9',
		LastModifyUserID = 'ASOFTADMIN',
		LastModifyDate = GETDATE(),
		CommonID = @CommonID,
		OrderNo = @OrderNo
		WHERE ModuleID = @ModuleID 
		AND ScreenID = @ScreenID
		AND EXISTS (SELECT TOP 1 1 FROM AT1101 WITH (NOLOCK) WHERE AT1101.DivisionID=AT1404.DivisionID)

		UPDATE AT1403
		SET SourceID = 'ERP9'
		WHERE ModuleID = @ModuleID
		AND ScreenID = @ScreenID
		AND EXISTS (SELECT TOP 1 1 FROM AT1101 WITH (NOLOCK) WHERE AT1101.DivisionID=AT1403.DivisionID)
	END
END


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
