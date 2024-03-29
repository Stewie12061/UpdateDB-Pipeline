IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[MTX1040]') AND OBJECTPROPERTY(ID, N'IsTrigger') = 1)
DROP TRIGGER [DBO].[MTX1040]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE TRIGGER [dbo].[MTX1040] ON [dbo].[MTT1040] 
FOR DELETE
AS

DECLARE @DivisionID NVARCHAR(3), @AnaID VARCHAR(50), @AnaTypeID VARCHAR(50)
SET @AnaTypeID = 'A06'
SELECT @DivisionID = DivisionID, @AnaID = ClassID FROM DELETED 

IF EXISTS (SELECT TOP 1 1 FROM AT1011 WHERE DivisionID = @DivisionID AND AnaTypeID = @AnaTypeID AND AnaID = @AnaID)
DELETE FROM AT1011 WHERE DivisionID = @DivisionID AND AnaTypeID = @AnaTypeID AND AnaID = @AnaID

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
