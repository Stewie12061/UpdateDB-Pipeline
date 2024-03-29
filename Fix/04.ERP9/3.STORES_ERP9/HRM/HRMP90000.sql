IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WITH (NOLOCK) WHERE ID = OBJECT_ID(N'[DBO].[HRMP90000]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[HRMP90000]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
----<Summary>
----Kiểm tra @ID (Dùng cho danh mục) hoặc @APK (Dùng cho nghiệp vụ) đã sử dụng trước khi xóa
---- 
----<Param>
---- 
----<Return>
---- 
----<Reference>
----
----<History>
----<Created by>: Hải Long, Date: 15/09/2017
---- Modified by
----<Example>
/*
	Declare @Status TINYINT
	Exec HRMP90000 'HT','CRMF2020', 'CRMT10101', '65043073-43f1-4233-a2f7-b742d4370eaa' ,'65043073-43f1-4233-a2f7-b742d4370eaa', 6, 2016, @Status output
	Select @Status
*/
CREATE PROCEDURE [dbo].[HRMP90000] 	
			(
				@DivisionID varchar(50),
				@FormID  nvarchar(50),
				@TableID nvarchar(50) = null,
				@APK uniqueidentifier = null, 
				@ID varchar(Max) = null, 
				@TranMonth int = null, 
				@TranYear int = null, 
				@Status  TINYINT OUTPUT
			)
AS

DECLARE @Message AS NVARCHAR(250)

IF @FormID = 'HRMF1040' --Danh mục lĩnh vực đào tạo
BEGIN
	-- Tồn tại ở khóa đào tạo
	IF EXISTS (SELECT TOP 1 1 FROM HRMT1050 WITH (NOLOCK) WHERE TrainingFieldID = @ID)
	BEGIN
		SET @Status = 1
		SET @Message = N'00ML000052'
		GOTO Mess

	END
	
	-- Tồn tại ở yêu cầu đào tạo
	IF EXISTS (SELECT TOP 1 1 FROM HRMT2080 WITH (NOLOCK) WHERE TrainingFieldID = @ID)
	BEGIN
		SET @Status = 1
		SET @Message = N'00ML000052'
		GOTO Mess
	END
	
	-- Tồn tại ở kế hoạch đào tạo định kỳ
	IF EXISTS (SELECT TOP 1 1 FROM HRMT2071 WITH (NOLOCK) WHERE TrainingFieldID = @ID)
	BEGIN
		SET @Status = 1
		SET @Message = N'00ML000052'
		GOTO Mess
	END	
END

IF @FormID = 'HRMF1050' --Danh mục khóa đào tạo
BEGIN
	-- Tồn tại ở khóa đào tạo
	IF EXISTS (SELECT TOP 1 1 FROM HRMT2100 WITH (NOLOCK) WHERE TrainingCourseID = @ID)
	BEGIN
		SET @Status = 1
		SET @Message = N'00ML000052'
		GOTO Mess

	END
END	

IF @FormID = 'HRMF1050' --Danh mục khóa đào tạo
BEGIN
	-- Tồn tại ở khóa đào tạo
	IF EXISTS (SELECT TOP 1 1 FROM HRMT2100 WITH (NOLOCK) WHERE TrainingCourseID = @ID)
	BEGIN
		SET @Status = 1
		SET @Message = N'00ML000052'
		GOTO Mess

	END
END	

IF @FormID = 'HRMF2070' --Ngân sách đào tạo
BEGIN
	-- Tồn tại ở đề xuất đào tạo
	IF EXISTS (SELECT TOP 1 1 FROM HRMT2091 WITH (NOLOCK) WHERE HRMT2091.DivisionID = @DivisionID AND HRMT2091.ID = @ID AND HRMT2091.InheritTableID = 'HRMT2071')
	BEGIN
		SET @Status = 1
		SET @Message = N'00ML000052'
		GOTO Mess
	END
	
	IF EXISTS (
		SELECT TOP 1 1 
		FROM HRMT2090 WITH (NOLOCK)
		INNER JOIN HRMT2071 WITH (NOLOCK) ON HRMT2071.DivisionID = HRMT2090.DivisionID AND HRMT2071.TransactionID = HRMT2090.InheritID2
		INNER JOIN HRMT2070 WITH (NOLOCK) ON HRMT2071.DivisionID = HRMT2070.DivisionID AND HRMT2071.TrainingPlanID = HRMT2070.TrainingPlanID
		WHERE HRMT2070.DivisionID = @DivisionID
		AND HRMT2070.TrainingPlanID = @ID
	)
	BEGIN
		SET @Status = 1
		SET @Message = N'00ML000052'
		GOTO Mess
	END	
END	

IF @FormID = 'HRMF2080' --Yêu cầu đào tạo
BEGIN
	-- Tồn tại ở đề xuất đào tạo
	IF EXISTS (SELECT TOP 1 1 FROM HRMT2091 WITH (NOLOCK) WHERE HRMT2091.DivisionID = @DivisionID AND HRMT2091.ID = @ID AND HRMT2091.InheritTableID = 'HRMT2080')
	BEGIN
		SET @Status = 1
		SET @Message = N'00ML000052'
		GOTO Mess

	END
END	
	
Mess:

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO