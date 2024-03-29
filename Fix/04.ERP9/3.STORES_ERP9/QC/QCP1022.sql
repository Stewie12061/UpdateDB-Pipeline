IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP1022]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP1022]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- <Summary>
---- Load Detail Cập nhật định nghĩa tiêu chuẩn
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
---- 
-- <History>
----Created by: Thanh Thi on 16/10/2020
----Edit by : Đình Hòa on 07/05/2021 :  Bổ sung load cột MathFormula
----Edit by : Hoàng Long on 03/04/2023 :  Bổ sung load cột Dụng cụ đo, Loại
----Edit by : Hoàng Long on 11/04/2023 :  Bổ sung load cột Thứ tự sản xuất
----Edit by : Viết Toàn on 11/09/2023 : Bổ sung cột tần suất đo
-- <Example> EXEC QCP1022 @DivisionID = 'BE', @UserID = 'ASOFTADMIN ', @APK = '9B8430BF-53C2-4EAB-A524-50BC4F2FCA82'

CREATE PROCEDURE [dbo].[QCP1022]
( 
	 @DivisionID VARCHAR(50),
	 @UserID VARCHAR(50),
	 @APK VARCHAR(50)
)

AS 

	SELECT T1.APK, T1.APKMaster, T1.DivisionID, T1.StandardID, T2.StandardName, T2.StandardNameE
						, T3.UnitID, T3.UnitName AS StandardUnitID, T1.SRange01, T1.SRange02, T1.SRange03, T1.SRange04, T1.SRange05, T1.SRange06, T1.SRange07, T1.SRange08, T1.SRange09
						, T1.Disabled, T1.CreateDate, T1.CreateUserID, T1.LastModifyDate, T1.LastModifyUserID
						, T4.Description AS StandardTypeID, T1.MathFormula
	FROM QCT1021 T1 WITH (NOLOCK) 
	LEFT JOIN QCT1000 T2 WITH (NOLOCK) ON T2.DivisionID IN (T1.DivisionID,'@@@') AND T1.StandardID = T2.StandardID
	LEFT JOIN QCT0099 T4 WITH (NOLOCK) ON T2.TypeID = T4.ID AND T4.CodeMaster = 'Standard'
	LEFT JOIN AT1304 T3 WITH (NOLOCK) ON T2.UnitID = T3.UnitID
	WHERE T1.APKMaster = @APK
	Order by T1.Orders, T1.StandardID



GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
