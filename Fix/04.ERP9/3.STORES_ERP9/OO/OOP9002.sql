IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[OOP9002]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[OOP9002]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO





-- <Summary>
---- Delete Th�ng b�o c?a b?ng OOT9002 v� OOT9003
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>

-- <History>
----Create on 05/09/2019 by [T?n L?c]

CREATE PROCEDURE [dbo].[OOP9002] (
	@APK VARCHAR(50)) 
	AS
-- X�a th�ng b�o trong b?ng OOT9003
DELETE FROM OOT9003
	WHERE CAST(APKMaster AS VARCHAR(50)) IN (SELECT APK FROM OOT9002 WHERE CAST(APKMaster AS VARCHAR(50)) = @APK)
-- X�a th�ng b�o trong b?ng OOT9002
DELETE FROM OOT9002 WHERE CAST(APKMaster AS VARCHAR(50)) = @APK										
		




GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
