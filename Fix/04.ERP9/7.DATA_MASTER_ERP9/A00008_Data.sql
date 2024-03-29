DECLARE @ID VARCHAR(50),
		@Name VARCHAR(50),
		@ModuleID VARCHAR(50),
		@ScreenID VARCHAR(50),
		@KeyLanguage NVARCHAR(4000),
		@Url NVARCHAR(4000),
		@ParentID NVARCHAR(4000),
		@Level INT,
		@Enable BIT,
		@Order INT,
		@Visible BIT

SET @ID = 'ItemS'
SET @Name = 'ItemS'
SET @ModuleID = 'ASOFTS'
SET @ScreenID = ''
SET @KeyLanguage = 'A00.ASOFTS'
SET @Url = ''
SET @ParentID = ''
SET @Level = 0
SET @Enable = 1
SET @Order = 1
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemCI'
SET @Name = 'ItemCI'
SET @ModuleID = 'ASOFTCI'
SET @ScreenID = ''
SET @KeyLanguage = 'A00.ASOFTCI'
SET @Url = ''
SET @ParentID = ''
SET @Level = 0
SET @Enable = 1
SET @Order = 2
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemCRM'
SET @Name = 'ItemCRM'
SET @ModuleID = 'ASOFTCRM'
SET @ScreenID = ''
SET @KeyLanguage = 'A00.ASOFTCRM'
SET @Url = ''
SET @ParentID = ''
SET @Level = 0
SET @Enable = 1
SET @Order = 3
SET @Visible = 0
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemPOS'
SET @Name = 'ItemPOS'
SET @ModuleID = 'ASOFTPOS'
SET @ScreenID = ''
SET @KeyLanguage = 'A00.ASOFTPOS'
SET @Url = ''
SET @ParentID = ''
SET @Level = 0
SET @Enable = 1
SET @Order = 4
SET @Visible = 0
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemMT'
SET @Name = 'ItemMT'
SET @ModuleID = 'ASOFTMT'
SET @ScreenID = ''
SET @KeyLanguage = 'A00.ASOFTEDU'
SET @Url = ''
SET @ParentID = ''
SET @Level = 0
SET @Enable = 1
SET @Order = 5
SET @Visible = 0
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemDRM'
SET @Name = 'ItemDRM'
SET @ModuleID = 'ASOFTDRM'
SET @ScreenID = ''
SET @KeyLanguage = 'A00.ASOFTDRM'
SET @Url = ''
SET @ParentID = ''
SET @Level = 0
SET @Enable = 1
SET @Order = 6
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible


----------------- Menu module MT ---------------
----------------- Menu cấp 2 -------------------
SET @ID = 'ItemMT_Setting'
SET @Name = 'ItemMT_Setting'
SET @ModuleID = 'ASOFTMT'
SET @ScreenID = 'MTF0010'
SET @KeyLanguage = N'A00.Setting'
SET @Url = '/MT/MTF0010'
SET @ParentID = 'ItemMT'
SET @Level = 1
SET @Enable = 1
SET @Order = 1
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemMT_List'
SET @Name = 'ItemMT_List'
SET @ModuleID = 'ASOFTMT'
SET @ScreenID = ''
SET @KeyLanguage = N'A00.List'
SET @Url = ''
SET @ParentID = 'ItemMT'
SET @Level = 1
SET @Enable = 1
SET @Order = 2
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemMT_Business'
SET @Name = 'ItemMT_Business'
SET @ModuleID = 'ASOFTMT'
SET @ScreenID = ''
SET @KeyLanguage = N'A00.Business'
SET @Url = ''
SET @ParentID = 'ItemMT'
SET @Level = 1
SET @Enable = 1
SET @Order = 3
SET @Visible = 0
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemMT_Report'
SET @Name = 'ItemMT_Report'
SET @ModuleID = 'ASOFTMT'
SET @ScreenID = 'MTF0070'
SET @KeyLanguage = N'A00.Report'
SET @Url = '/MT/MTF0070'
SET @ParentID = 'ItemMT'
SET @Level = 1
SET @Enable = 1
SET @Order = 4
SET @Visible = 0
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible


----------------- Menu cấp 3 -------------------
SET @ID = 'ItemMT_List_Level'
SET @Name = 'ItemMT_List_Level'
SET @ModuleID = 'ASOFTMT'
SET @ScreenID = 'MTF1010'
SET @KeyLanguage = N'A00.ItemMT_List_Level'
SET @Url = '/MT/MTF1010'
SET @ParentID = 'ItemMT_List'
SET @Level = 2
SET @Enable = 1
SET @Order = 1
SET @Visible = 0
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemMT_List_Course'
SET @Name = 'ItemMT_List_Course'
SET @ModuleID = 'ASOFTMT'
SET @ScreenID = 'MTF1000'
SET @KeyLanguage = N'A00.ItemMT_List_Course'
SET @Url = '/MT/MTF1000'
SET @ParentID = 'ItemMT_List'
SET @Level = 2
SET @Enable = 1
SET @Order = 2
SET @Visible = 0
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemMT_List_Class'
SET @Name = 'ItemMT_List_Class'
SET @ModuleID = 'ASOFTMT'
SET @ScreenID = 'MTF1040'
SET @KeyLanguage = N'A00.ItemMT_List_Class'
SET @Url = '/MT/MTF1040'
SET @ParentID = 'ItemMT_List'
SET @Level = 2
SET @Enable = 1
SET @Order = 3
SET @Visible = 0
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemMT_List_SchoolTime'
SET @Name = 'ItemMT_List_SchoolTime'
SET @ModuleID = 'ASOFTMT'
SET @ScreenID = 'MTF1020'
SET @KeyLanguage = N'A00.ItemMT_List_SchoolTime'
SET @Url = '/MT/MTF1020'
SET @ParentID = 'ItemMT_List'
SET @Level = 2
SET @Enable = 1
SET @Order = 4
SET @Visible = 0
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemMT_List_StopReason'
SET @Name = 'ItemMT_List_StopReason'
SET @ModuleID = 'ASOFTMT'
SET @ScreenID = 'MTF1030'
SET @KeyLanguage = N'A00.ItemMT_List_StopReason'
SET @Url = '/MT/MTF1030'
SET @ParentID = 'ItemMT_List'
SET @Level = 2
SET @Enable = 1
SET @Order = 5
SET @Visible = 0
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemMT_Business_Student'
SET @Name = 'ItemMT_Business_Student'
SET @ModuleID = 'ASOFTMT'
SET @ScreenID = 'MTF2000'
SET @KeyLanguage = N'A00.ItemMT_Business_Student'
SET @Url = '/MT/MTF2000'
SET @ParentID = 'ItemMT_Business'
SET @Level = 2
SET @Enable = 1
SET @Order = 1
SET @Visible = 0
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemMT_Business_Education'
SET @Name = 'ItemMT_Business_Education'
SET @ModuleID = 'ASOFTMT'
SET @ScreenID = 'MTF2010'
SET @KeyLanguage = N'A00.ItemMT_Business_Education'
SET @Url = '/MT/MTF2010'
SET @ParentID = 'ItemMT_Business'
SET @Level = 2
SET @Enable = 1
SET @Order = 2
SET @Visible = 0
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemMT_Business_Stop'
SET @Name = 'ItemMT_Business_Stop'
SET @ModuleID = 'ASOFTMT'
SET @ScreenID = 'MTF2020'
SET @KeyLanguage = N'A00.ItemMT_Business_Stop'
SET @Url = '/MT/MTF2010'
SET @ParentID = 'ItemMT_Business'
SET @Level = 2
SET @Enable = 1
SET @Order = 3
SET @Visible = 0
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible


----------------- Menu module S ---------------
----------------- Menu cấp 2 ------------------
SET @ID = 'ItemS_List'
SET @Name = 'ItemS_List'
SET @ModuleID = 'ASOFTS'
SET @ScreenID = ''
SET @KeyLanguage = N'A00.List'
SET @Url = ''
SET @ParentID = 'ItemS'
SET @Level = 1
SET @Enable = 1
SET @Order = 1
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible


----------------- Menu cấp 3 -------------------
SET @ID = 'ItemS_List_User'
SET @Name = 'ItemS_List_User'
SET @ModuleID = 'ASOFTS'
SET @ScreenID = 'SF1000'
SET @KeyLanguage = N'A00.ItemS_List_UserName'
SET @Url = '/S/SF1000'
SET @ParentID = 'ItemS_List'
SET @Level = 2
SET @Enable = 1
SET @Order = 1
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemS_List_Group'
SET @Name = 'ItemS_List_Group'
SET @ModuleID = 'ASOFTS'
SET @ScreenID = 'SF1010'
SET @KeyLanguage = N'A00.ItemS_List_GroupName'
SET @Url = '/S/SF1010'
SET @ParentID = 'ItemS_List'
SET @Level = 2
SET @Enable = 1
SET @Order = 2
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible


----------------- Menu module CI ---------------
----------------- Menu cấp 2 -------------------
SET @ID = 'ItemCI_List'
SET @Name = 'ItemCI_List'
SET @ModuleID = 'ASOFTCI'
SET @ScreenID = ''
SET @KeyLanguage = N'A00.List'
SET @Url = ''
SET @ParentID = 'ItemCI'
SET @Level = 1
SET @Enable = 1
SET @Order = 1
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

----------------- Menu cấp 3 -------------------
SET @ID = 'ItemCI_List_Department'
SET @Name = 'ItemCI_List_Department'
SET @ModuleID = 'ASOFTCI'
SET @ScreenID = 'CIF1000'
SET @KeyLanguage = N'A00.ItemCI_List_DepartmentCategory'
SET @Url = '/CI/CIF1000'
SET @ParentID = 'ItemCI_List'
SET @Level = 2
SET @Enable = 1
SET @Order = 1
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemCI_List_Team'
SET @Name = 'ItemCI_List_Team'
SET @ModuleID = 'ASOFTCI'
SET @ScreenID = 'CIF1010'
SET @KeyLanguage = N'A00.ItemCI_List_TeamCategory'
SET @Url = '/CI/CIF1010'
SET @ParentID = 'ItemCI_List'
SET @Level = 2
SET @Enable = 1
SET @Order = 2
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemCI_List_Duty'
SET @Name = 'ItemCI_List_Duty'
SET @ModuleID = 'ASOFTCI'
SET @ScreenID = 'CIF1020'
SET @KeyLanguage = N'A00.ItemCI_List_DutyCategory'
SET @Url = '/CI/CIF1020'
SET @ParentID = 'ItemCI_List'
SET @Level = 2
SET @Enable = 1
SET @Order = 3
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemCI_List_EmailTemplate'
SET @Name = 'ItemCI_List_EmailTeamplate'
SET @ModuleID = 'ASOFTCI'
SET @ScreenID = 'CIF1040'
SET @KeyLanguage = N'A00.ItemCI_List_TemplateCategory'
SET @Url = '/CI/CIF1040'
SET @ParentID = 'ItemCI_List'
SET @Level = 2
SET @Enable = 1
SET @Order = 4
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemCI_List_AnaID'
SET @Name = 'ItemCI_List_AnaID'
SET @ModuleID = 'ASOFTCI'
SET @ScreenID = 'CIF1030'
SET @KeyLanguage = N'A00.ItemCI_List_AnaID'
SET @Url = '/CI/CIF1030'
SET @ParentID = 'ItemCI_List'
SET @Level = 2
SET @Enable = 1
SET @Order = 5
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible


----------------- Menu module DRM ---------------
----------------- Menu cấp 2 --------------------
SET @ID = 'ItemDRM_Dashboard'
SET @Name = 'ItemDRM_Dashboard'
SET @ModuleID = 'ASOFTDRM'
SET @ScreenID = 'DRF0000'
SET @KeyLanguage = N'A00.DRM_DashBoard'
SET @Url = '/DRM/DRF0000'
SET @ParentID = 'ItemDRM'
SET @Level = 1
SET @Enable = 1
SET @Order = 1
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemDRM_List'
SET @Name = 'ItemDRM_List'
SET @ModuleID = 'ASOFTDRM'
SET @ScreenID = ''
SET @KeyLanguage = N'A00.List'
SET @Url = ''
SET @ParentID = 'ItemDRM'
SET @Level = 1
SET @Enable = 1
SET @Order = 2
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemDRM_Business'
SET @Name = 'ItemDRM_Business'
SET @ModuleID = 'ASOFTDRM'
SET @ScreenID = ''
SET @KeyLanguage = N'A00.Business'
SET @Url = ''
SET @ParentID = 'ItemDRM'
SET @Level = 1
SET @Enable = 1
SET @Order = 3
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemDRM_Report'
SET @Name = 'ItemDRM_Report'
SET @ModuleID = 'ASOFTDRM'
SET @ScreenID = 'DRF0150'
SET @KeyLanguage = N'A00.Report'
SET @Url = '/DRM/DRF0150'
SET @ParentID = 'ItemDRM'
SET @Level = 1
SET @Enable = 1
SET @Order = 4
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible


----------------- Menu cấp 3 --------------------
SET @ID = 'ItemDRM_List_Employee'
SET @Name = 'ItemDRM_List_Employee'
SET @ModuleID = 'ASOFTDRM'
SET @ScreenID = 'DRF1000'
SET @KeyLanguage = N'A00.ItemDRM_List_Employee'
SET @Url = '/DRM/DRF1000'
SET @ParentID = 'ItemDRM_List'
SET @Level = 2
SET @Enable = 1
SET @Order = 1
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemDRM_List_Customer'
SET @Name = 'ItemDRM_List_Customer'
SET @ModuleID = 'ASOFTDRM'
SET @ScreenID = 'DRF1010'
SET @KeyLanguage = N'A00.ItemDRM_List_Customer'
SET @Url = '/DRM/DRF1010'
SET @ParentID = 'ItemDRM_List'
SET @Level = 2
SET @Enable = 1
SET @Order = 2
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemDRM_List_Infomation'
SET @Name = 'ItemDRM_List_Infomation'
SET @ModuleID = 'ASOFTDRM'
SET @ScreenID = 'DRF1020'
SET @KeyLanguage = N'A00.ItemDRM_List_Common'
SET @Url = '/DRM/DRF1020'
SET @ParentID = 'ItemDRM_List'
SET @Level = 2
SET @Enable = 1
SET @Order = 3
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemDRM_Business_BusinessResume'
SET @Name = 'ItemDRM_Business_BusinessResume'
SET @ModuleID = 'ASOFTDRM'
SET @ScreenID = 'DRF2000'
SET @KeyLanguage = N'A00.ItemDRM_Business_BusinessResume'
SET @Url = '/DRM/DRF2000'
SET @ParentID = 'ItemDRM_Business'
SET @Level = 2
SET @Enable = 1
SET @Order = 1
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemDRM_Business_ConsumerResume'
SET @Name = 'ItemDRM_Business_ConsumerResume'
SET @ModuleID = 'ASOFTDRM'
SET @ScreenID = 'DRF2010'
SET @KeyLanguage = N'A00.ItemDRM_Business_Consumer'
SET @Url = '/DRM/DRF2010'
SET @ParentID = 'ItemDRM_Business'
SET @Level = 2
SET @Enable = 1
SET @Order = 2
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemDRM_Business_Everyday'
SET @Name = 'ItemDRM_Business_Everyday'
SET @ModuleID = 'ASOFTDRM'
SET @ScreenID = 'DRF2020'
SET @KeyLanguage = N'A00.ItemDRM_Business_HandledEveryDay'
SET @Url = '/DRM/DRF2020'
SET @ParentID = 'ItemDRM_Business'
SET @Level = 2
SET @Enable = 1
SET @Order = 3
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemDRM_Business_Payment'
SET @Name = 'ItemDRM_Business_Payment'
SET @ModuleID = 'ASOFTDRM'
SET @ScreenID = 'DRF2030'
SET @KeyLanguage = N'A00.ItemDRM_Business_Payment'
SET @Url = '/DRM/DRF2030'
SET @ParentID = 'ItemDRM_Business'
SET @Level = 2
SET @Enable = 1
SET @Order = 4
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemDRM_Business_SendDoc'
SET @Name = 'ItemDRM_Business_SendDoc'
SET @ModuleID = 'ASOFTDRM'
SET @ScreenID = 'DRF2060'
SET @KeyLanguage = N'A00.ItemDRM_Business_Document'
SET @Url = '/DRM/DRF2060'
SET @ParentID = 'ItemDRM_Business'
SET @Level = 2
SET @Enable = 1
SET @Order = 5
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemDRM_Business_CloseResume'
SET @Name = 'ItemDRM_Business_CloseResume'
SET @ModuleID = 'ASOFTDRM'
SET @ScreenID = 'DRF2050'
SET @KeyLanguage = N'A00.ItemDRM_Business_ClosedResume'
SET @Url = '/DRM/DRF2050'
SET @ParentID = 'ItemDRM_Business'
SET @Level = 2
SET @Enable = 1
SET @Order = 6
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

SET @ID = 'ItemDRM_Business_SalaryResume'
SET @Name = 'ItemDRM_Business_SalaryResume'
SET @ModuleID = 'ASOFTDRM'
SET @ScreenID = 'DRF2040'
SET @KeyLanguage = N'A00.ItemDRM_Business_SalaryResume'
SET @Url = '/DRM/DRF2040'
SET @ParentID = 'ItemDRM_Business'
SET @Level = 2
SET @Enable = 1
SET @Order = 7
SET @Visible = 1
EXEC AP00008 @ID, @Name, @ModuleID, @ScreenID, @KeyLanguage, @Url, @ParentID, @Level, @Enable, @Order, @Visible

select * from A00008
order by [Order]