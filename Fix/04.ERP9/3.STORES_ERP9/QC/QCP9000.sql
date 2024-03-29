IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[QCP9000]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[QCP9000]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


----<Summary>
----Kiểm tra @KeyValues (@ID hoặc @APK) đã sử dụng trước khi xóa/sửa
----Do ERP9 đã xử lý trường hợp dùng chung không bắn qua DivisionID và khi insert kiểm tra Mã duy nhất nên không kiểm tra DivisionID
----Store này nếu kiểm tra Danh mục thì không truyền DivisionID, nếu kiểm tra nghiệp vụ thì truyền DivisionID
----<Param>
---- 
----<Return>
---- 
----<Reference>
----
----<History>
----<Created by>: Cao Thanh Thi, Date: 22/12/2020
----<Modify by>: 
----<Example>
/*
	Declare @Status TINYINT
	Exec QCP9000_CHECK_DELETE 'VNP',null, 'QCT1000', 'T01',@Status  output
	SELECT @Status
*/
CREATE PROCEDURE QCP9000 (
				@DivisionID varchar(50),
				@FormID  nvarchar(50) = null,
				@TableID  nvarchar(50) = null,
				@KeyValues varchar(Max) = null,
				@Status  TINYINT OUTPUT
			)
AS
	If @TableID ='QCT1000' ---Danh mục tiêu chuẩn
		If exists (Select top 1 1  From QCT1021 WITH (NOLOCK) Where StandardID = (SELECT TOP 1 StandardID FROM QCT1000 WHERE APK = @KeyValues AND DivisionID = @DivisionID)) OR 
		   exists(Select top 1 1  From QCT2002 WITH (NOLOCK) Where StandardID = (SELECT TOP 1 StandardID FROM QCT1000 WHERE APK = @KeyValues AND DivisionID = @DivisionID)) OR
		   exists(Select top 1 1  From QCT1000 WITH (NOLOCK) Where CONCAT(',',QCT1000.ParentID,',') LIKE (SELECT TOP 1 CONCAT('%,',StandardID,',%') FROM QCT1000 WHERE APK = @KeyValues AND DivisionID = @DivisionID))
		Begin
			Set @Status =1
			GOTO Mess
		End
	
	If @TableID ='QCT1020' ---Danh mục định nghĩa tiêu chuẩn
		If exists (SELECT TOP 1 1 
					FROM QCT1021 T1
					JOIN QCT1020 T2 ON T1.APKMaster = T2.APK
					JOIN QCT2001 T3 ON T2.InventoryID = T3.InventoryID
					WHERE T2.APK = @KeyValues AND T2.DivisionID = @DivisionID)
		Begin
			Set @Status =1
			GOTO Mess
		End
Mess:


GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
