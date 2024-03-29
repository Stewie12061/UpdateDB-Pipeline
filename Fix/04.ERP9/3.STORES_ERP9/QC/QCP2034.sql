IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP2034]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP2034]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


-- <Summary>
---- Load Detail Định nghĩa tiêu chuẩn (Xem chi tiết)
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
---- 
-- <History>
----Created by: Thanh Thi on 15/10/2020
-- <Example> EXEC QCP2034 @DivisionID = 'BE', @UserID = '', @APK = '9B8430BF-53C2-4EAB-A524-50BC4F2FCA82',@PageNumber='1',@PageSize='25'
CREATE PROCEDURE QCP2034
( 
	 @DivisionID VARCHAR(50),
	 @UserID VARCHAR(50),
	 @APK VARCHAR(50),
	 @PageNumber INT,
	 @PageSize INT
)

AS 

	DECLARE @sSQL NVARCHAR(MAX) = N'',
			@OrderBy NVARCHAR(MAX) = N'', 
			@TotalRow NVARCHAR(50) = N'',
			@sWhere NVARCHAR(MAX) = N''

	SET @OrderBy = N'T4.StandardID'
	IF  @PageNumber = 1 SET @TotalRow = 'COUNT(*) OVER ()' ELSE SET @TotalRow = 'NULL'

	SET @sSQL = N'
				SELECT  CONVERT(INT, ROW_NUMBER() OVER (ORDER BY '+@OrderBy+')) AS RowNum, '+@TotalRow+' AS TotalRow
						, T1.APK, T1.DivisionID, T3.APK, T3.APKMaster, T4.StandardID, T4.StandardName, T4.StandardNameE, T5.UnitID, T5.UnitName, T3.StandardValue,
						T1.CreateDate, T1.CreateUserID, T1.LastModifyDate, T1.LastModifyUserID,
						T1.InheritDate AS ManufacturingDate, 
						T1.InheritShift AS ShiftID, T6.ShiftName AS ShiftName, 
						T1.InheritMachine AS MachineID, T7.MachineName AS MachineName, 
						T2.APK AS Voucher_QCT2000
						FROM QCT2010 T1 WITH (NOLOCK)
						LEFT JOIN QCT2000 T2 WITH (NOLOCK) ON T1.APKMaster = T2.APK
						LEFT JOIN QCT2002 T3 WITH (NOLOCK) ON T1.APK = T3.APKMaster 
						LEFT JOIN QCT1000 T4 WITH (NOLOCK) ON T3.StandardID = T4.StandardID 
						LEFT JOIN AT1304 T5 WITH (NOLOCK) ON T4.UnitID = T5.UnitID
						LEFT JOIN HT1020 T6 WITH (NOLOCK) ON T1.InheritShift = T6.ShiftID
						LEFT JOIN CIT1150 T7 WITH (NOLOCK) ON T1.InheritMachine = T7.MachineID
				WHERE T1.APK = '''+@APK+''' AND T1.DivisionID = ''' + @DivisionID + ''' AND T1.DeleteFlg = 0 AND T3.DeleteFlg = 0
				ORDER BY '+@OrderBy+''

 	 EXEC (@sSQL)
 

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
