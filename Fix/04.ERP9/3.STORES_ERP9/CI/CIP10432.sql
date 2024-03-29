IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP10432]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CIP10432]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Load Grid Detail Form CIF1043 chon email template (cho phép màn hình gửi mail kế thừa)
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoàng vũ, Date: 07/04/2017
-- <Example> EXEC CIP10432 'AS' , 'MailTemplate01' , 'NV01'
Create PROCEDURE CIP10432
(
    @DivisionID VARCHAR(50), --Biến môi trường
    @TemplateID VARCHAR(MAX),	 --Giá trị chọn trên lưới master
	@UserID  VARCHAR(50)	 --Biến môi trường
)
AS
BEGIN
	DECLARE @sSQL NVARCHAR(MAX),
			@sWhere AS NVARCHAR(4000)
	SET @sWhere = ' '

	IF Isnull(@TemplateID, '') != ''
		SET @sWhere = @sWhere + ' D.TemplateID = N'''+@TemplateID+''''
		
	SET @sSQL = 'Select D.APK, D.TemplateID, D.MethodID, D.ShowDescriptionID, D.TableID, D.ScreenID, D.OrderNo
				 from AT0130 D WITH (NOLOCK)
				 WHERE '+@sWhere+' 
				 ORDER BY  D.OrderNo'
	Exec (@sSQL)
END	


