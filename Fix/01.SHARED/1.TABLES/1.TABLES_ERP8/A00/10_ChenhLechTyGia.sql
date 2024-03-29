------------------------------------------------------------------------------------------------------
--
-- Thêm thông tin phân quyền menu
--
------------------------------------------------------------------------------------------------------
IF NOT EXISTS(SELECT TOP 1 1 FROM A00004STD WHERE ModuleID = N'ASoftT' AND ScreenID = N'AF0252' AND CommandMenu = N'mnuBussiness_DifferentExchangeRateX')
INSERT A00004STD(ModuleID, ScreenID, CommandMenu)
VALUES (N'ASoftT', N'AF0252', N'mnuBussiness_DifferentExchangeRateX')

IF NOT EXISTS(SELECT TOP 1 1 FROM A00004STD WHERE ModuleID = N'ASoftT' AND ScreenID = N'AF0254' AND CommandMenu = N'mnuQuery_DifferentExchangeRateX')
INSERT A00004STD(ModuleID, ScreenID, CommandMenu)
VALUES (N'ASoftT', N'AF0254', N'mnuQuery_DifferentExchangeRateX')

DECLARE @DivisionID NVARCHAR(6)
DECLARE cur_DivisionID CURSOR
FOR SELECT DISTINCT DivisionID FROM AT1101

OPEN cur_DivisionID

FETCH NEXT FROM cur_DivisionID INTO @DivisionID

WHILE @@FETCH_STATUS = 0
BEGIN

IF NOT EXISTS(SELECT TOP 1 1 FROM A00004 WHERE DivisionID = @DivisionID AND ModuleID = N'ASoftT' AND ScreenID = N'AF0252' AND CommandMenu = N'mnuBussiness_DifferentExchangeRateX')
INSERT A00004(DivisionID, ModuleID, ScreenID, CommandMenu)
VALUES (@DivisionID, N'ASoftT', N'AF0252', N'mnuBussiness_DifferentExchangeRateX')

IF NOT EXISTS(SELECT TOP 1 1 FROM A00004 WHERE DivisionID = @DivisionID AND ModuleID = N'ASoftT' AND ScreenID = N'AF0254' AND CommandMenu = N'mnuQuery_DifferentExchangeRateX')
INSERT A00004(DivisionID, ModuleID, ScreenID, CommandMenu)
VALUES (@DivisionID, N'ASoftT', N'AF0254', N'mnuQuery_DifferentExchangeRateX')

FETCH NEXT FROM cur_DivisionID INTO @DivisionID
END

CLOSE cur_DivisionID
DEALLOCATE cur_DivisionID

------------------------------------------------------------------------------------------------------
--
-- Thêm thông tin phân quyền màn hình
--
------------------------------------------------------------------------------------------------------
IF NOT EXISTS(SELECT TOP 1 1 FROM AT1403STD WHERE ScreenID = N'AF0252' AND GroupID = N'ADMIN' AND ModuleID = N'ASoftT')
INSERT AT1403STD(ScreenID, GroupID, ModuleID, IsAddNew, IsUpdate, IsDelete, IsView, IsPrint, CreateDate, CreateUserID, LastModifyUserID, LastModifyDate)
VALUES (N'AF0252', N'ADMIN', N'ASoftT', 1, 1, 1, 1, 1, getdate(), N'ASOFTADMIN', N'ADMIN', getdate())

IF NOT EXISTS(SELECT TOP 1 1 FROM AT1403STD WHERE ScreenID = N'AF0253' AND GroupID = N'ADMIN' AND ModuleID = N'ASoftT')
INSERT AT1403STD(ScreenID, GroupID, ModuleID, IsAddNew, IsUpdate, IsDelete, IsView, IsPrint, CreateDate, CreateUserID, LastModifyUserID, LastModifyDate)
VALUES (N'AF0253', N'ADMIN', N'ASoftT', 1, 1, 1, 1, 1, getdate(), N'ASOFTADMIN', N'ADMIN', getdate())

IF NOT EXISTS(SELECT TOP 1 1 FROM AT1403STD WHERE ScreenID = N'AF0254' AND GroupID = N'ADMIN' AND ModuleID = N'ASoftT')
INSERT AT1403STD(ScreenID, GroupID, ModuleID, IsAddNew, IsUpdate, IsDelete, IsView, IsPrint, CreateDate, CreateUserID, LastModifyUserID, LastModifyDate)
VALUES (N'AF0254', N'ADMIN', N'ASoftT', 1, 1, 1, 1, 1, getdate(), N'ASOFTADMIN', N'ADMIN', getdate())

DECLARE @GroupID NVARCHAR(50)
DECLARE cur_GroupID CURSOR
FOR SELECT DISTINCT DivisionID, GroupID FROM AT1402

OPEN cur_GroupID

FETCH NEXT FROM cur_GroupID INTO @DivisionID, @GroupID

WHILE @@FETCH_STATUS = 0
BEGIN

IF NOT EXISTS(SELECT TOP 1 1 FROM AT1403 WHERE DivisionID = @DivisionID AND ScreenID = N'AF0252' AND GroupID = @GroupID AND ModuleID = N'ASoftT')
INSERT AT1403(DivisionID, ScreenID, GroupID, ModuleID, IsAddNew, IsUpdate, IsDelete, IsView, IsPrint, CreateDate, CreateUserID, LastModifyUserID, LastModifyDate)
VALUES (@DivisionID, N'AF0252', @GroupID, N'ASoftT', 1, 1, 1, 1, 1, getdate(), N'ASOFTADMIN', N'ADMIN', getdate())

IF NOT EXISTS(SELECT TOP 1 1 FROM AT1403 WHERE DivisionID = @DivisionID AND ScreenID = N'AF0253' AND GroupID = @GroupID AND ModuleID = N'ASoftT')
INSERT AT1403(DivisionID, ScreenID, GroupID, ModuleID, IsAddNew, IsUpdate, IsDelete, IsView, IsPrint, CreateDate, CreateUserID, LastModifyUserID, LastModifyDate)
VALUES (@DivisionID, N'AF0253', @GroupID, N'ASoftT', 1, 1, 1, 1, 1, getdate(), N'ASOFTADMIN', N'ADMIN', getdate())

IF NOT EXISTS(SELECT TOP 1 1 FROM AT1403 WHERE DivisionID = @DivisionID AND ScreenID = N'AF0254' AND GroupID = @GroupID AND ModuleID = N'ASoftT')
INSERT AT1403(DivisionID, ScreenID, GroupID, ModuleID, IsAddNew, IsUpdate, IsDelete, IsView, IsPrint, CreateDate, CreateUserID, LastModifyUserID, LastModifyDate)
VALUES (@DivisionID, N'AF0254', @GroupID, N'ASoftT', 1, 1, 1, 1, 1, getdate(), N'ASOFTADMIN', N'ADMIN', getdate())

FETCH NEXT FROM cur_GroupID INTO @DivisionID, @GroupID
END

CLOSE cur_GroupID
DEALLOCATE cur_GroupID