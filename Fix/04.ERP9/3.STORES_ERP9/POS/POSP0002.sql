IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[POSP0002]') AND 
		   OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[POSP0002]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- <Summary>
--- Kiểm tra sử dụng của mã phiếu chứng từ
-- <Param>
----
-- <Return>
----
-- <Reference>
----
-- <History>
----Created by: MaiVu on 08/05/2014
----Modify bu Thị Phượng on 08/06/2016: Bổ suung WITh (NOLOCK)
-- <Example>
/*
    EXEC POSP0002 'KC'
*/

CREATE PROCEDURE [dbo].[POSP0002] 
	@DivisionID varchar(50),
	@ShopID varchar(50)
AS
DECLARE @Status TINYINT,
		@Message NVARCHAR(1000),
		@Cur CURSOR,
		@ID VARCHAR(50)
Declare @POST0002temp table 
		(Status tinyint,
		 MessageID varchar(100),
		 Params nvarchar(4000)
		)
SET @Status = 0
SET @Message = ''
SET @ID = ''
Insert into @POST0002temp (	Status, MessageID, Params) 
							Select 2 as Status, '00ML000052' as MessageID, Null as Params
SET @Cur = CURSOR SCROLL KEYSET FOR
select distinct VoucherTypeID
from (
      Select VoucherTypeID from POST0015 WITH (NOLOCK)
					 WHERE DivisionID = @DivisionID and ShopID =  @ShopID and DeleteFlg = 0
      Union all
      Select VoucherTypeID from POST0016 WITH (NOLOCK)
					WHERE DivisionID = @DivisionID and ShopID =  @ShopID and DeleteFlg = 0
      Union all
      Select VoucherTypeID from POST0017 WITH (NOLOCK)
					WHERE DivisionID = @DivisionID and ShopID =  @ShopID and DeleteFlg = 0
      Union all
      Select VoucherTypeID from POST0019 WITH (NOLOCK)
					WHERE DivisionID = @DivisionID and ShopID =  @ShopID and DeleteFlg = 0
      Union all
      Select VoucherTypeID from POST0022 WITH (NOLOCK)
					WHERE DivisionID = @DivisionID and ShopID =  @ShopID and DeleteFlg = 0
	  Union all
      Select VoucherTypeID from POST0024 WITH (NOLOCK)
					WHERE DivisionID = @DivisionID and ShopID =  @ShopID and DeleteFlg = 0
      Union all
	  Select VoucherTypeID from POST0027 WITH (NOLOCK)
					WHERE DivisionID = @DivisionID and ShopID =  @ShopID and DeleteFlg = 0
      Union all
      Select VoucherTypeID from POST9000 WITH (NOLOCK)
					WHERE DivisionID = @DivisionID and ShopID =  @ShopID and DeleteFlg = 0
	  Union all
      Select VoucherTypeID from WT0095 WITH (NOLOCK) WHERE VoucherTypeID = (Select VoucherType10 from POST0004 WHERE DivisionID = @DivisionID and ShopID =  @ShopID ) AND  IsCheck = 0
)x

OPEN @Cur
FETCH NEXT FROM @Cur INTO @ID
WHILE @@FETCH_STATUS = 0
BEGIN
SET @Message = @ID
update @POST0002temp set Params = ISNULL(Params,'') + @Message+', ' where MessageID = '00ML000052'
FETCH NEXT FROM @Cur INTO @ID
END
CLOSE @Cur
SELECT Status, MessageID, Left ( Params, LEN(Params) -1) AS Params From  @POST0002temp where Params is not null
GO
