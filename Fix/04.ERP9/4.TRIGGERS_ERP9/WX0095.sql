IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[WX0095]') AND OBJECTPROPERTY(ID, N'IsTrigger') = 1)
DROP TRIGGER [DBO].[WX0095]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--- Created by Nguyen Nhat Thanh, Date 26/12/2023
---- purpose:  X�a detail

CREATE TRIGGER [dbo].[WX0095] ON [dbo].[WT0095] 
FOR DELETE 
AS

DELETE FROM WT0096 WHERE VoucherID in (SELECT VoucherID FROM DELETED)



GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
