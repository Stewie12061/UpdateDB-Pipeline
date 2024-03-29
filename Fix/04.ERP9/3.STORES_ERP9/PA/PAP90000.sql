IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[PAP90000]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[PAP90000]
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
----<Created by>: Phan thanh hoang vu, Date: 11/08/2017
----<Modify by>: 
----<Example>
/*
	Declare @Status TINYINT
	Exec PAP90000 'KC', 'AT1010', 'T01',@Status  output
	SELECT @Status
*/
CREATE PROCEDURE PAP90000 (
				@DivisionID varchar(50),
				@TableID  nvarchar(50) = null,
				@KeyValues varchar(Max) = null,
				@Status  TINYINT OUTPUT
			)
AS
	If @TableID ='PAT10101' ---Danh muc năng lực 
		If exists (Select top 1 1  From PAT10202 Where AppraisalID = @KeyValues
				   Union all
				   Select top 1 1  From PAT20002 Where AppraisalID = @KeyValues and DeleteFlg = 0
				  )
		Begin
			Set @Status =1
			GOTO Mess
		End
	If @TableID ='PAT10201' ---Danh muc thiet lap bang danh gia năng lực 
		If exists (Select top 1 1  From PAT20001 Where EvaluationKitID = @KeyValues and DeleteFlg = 0)
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

