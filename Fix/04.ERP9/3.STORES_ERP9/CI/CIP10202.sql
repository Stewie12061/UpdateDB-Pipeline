IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP10202]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CIP10202]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- <Summary>
----Xóa 1 hoặc nhiều ID 
----Nếu Mode = 1 thì thực hiện kiểm tra trước khi xóa ngược lại, Nếu Mode = 0 thì Thực hiện kiểm tra trước khi sửa.
---- 
-- <Param>
----Lưu ý: các tham số có tiền tố @@_[...] thì phải thay đổi cho những màn hình tương ứng 
----XP10Y0D: là tên store tương ứng từng màn hình truy vấn
----X: Mã modul viết tắt (ví dụ: modul ASOFT-CI thì X=CI, modul ASOFT-S thì X=S, ...)
----Y: Số thứ tự màn hình truy vấn
----D: Số store trong một màn hình
----Ví dụ: CIP10001, CIP10002, CIP10003 ( X=CI, Y= 0, D = [1,2,3])
-- <Return>
---- 
-- <Reference>
----Thiếu chiếu kiểm tra trong Store AP1000
----
-- <History>
----Created by: Hồ Hoàng Tú, Date: 12/10/2014
----Modify by: 
---- 
-- <Example>
----EXEC CIP10202 'KC', 'dsds'',''abc', null, 'AT1103', 1
----
CREATE PROCEDURE CIP10202
( 
		  @DivisionID varchar(50),	--Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
		  @DutyIDList NVARCHAR(MAX),	--Trường hợp Delete 1 hoặc nhiều record
		  @ID nvarchar(50),			--Trường hợp Edit chỉ 1 record
		  @TableName nvarchar(50),	--Là bảng cần xóa record
		  @Mode TINYINT				--0: Edit, 1: Delete
) 
AS 
	Declare @sSQL NVARCHAR(MAX)
	Begin

	    ---MODE=1 :XÓA MỘT HOẶC NHIỀU DÒNG
		IF @Mode = 1--Trường hợp xóa 1 hoặc nhiều record
			Begin
				SET @sSQL = '
					Declare @Status TINYINT,
							@Message NVARCHAR(1000),
							@Cur CURSOR,
							@DelDivisionID VARCHAR(50),
							@DelDutyID VARCHAR(50)
						
					Declare @temp table 
							(	Status tinyint,
								MessageID varchar(100),
								Params varchar(4000))
					Declare @tempstatus table 
							(Status tinyint,VieMessage varchar,EngMessage varchar)
					SET @Status = 0
					SET @Message = ''''
					Insert into @temp (	Status, MessageID, Params) 
												Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
												union all
												Select 2 as Status, ''00ML000052'' as MessageID, Null as Params	
					SET @Cur = CURSOR SCROLL KEYSET FOR

					
		--DutyID: Mã record cần xóa
		--HT1102: Bảng cần xóa record
					SELECT DivisionID, DutyID FROM HT1102 WHERE DutyID IN ('''+@DutyIDList+''')
					OPEN @Cur
					FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelDutyID
					WHILE @@FETCH_STATUS = 0
					Begin
		--Table dùng để xóa dòng: HT1102
		--Kiểm tra Store AP1000 đã kiểm tra tại table AT1103 khi thêm mới màn hình hoặc tồn tại màn hình đó


                            delete from @tempstatus
							Insert into @tempstatus (Status,VieMessage,EngMessage) exec HP2000 @DelDivisionID, '''+@TableName+''',@DelDutyID
							IF @DelDivisionID != '''+@DivisionID+'''
								Begin
									update @temp set Params = ISNULL(Params,'''') + @DelDutyID +'','' where MessageID = ''00ML000050''
								End
							IF (Select Status from @tempstatus) = 1
								update @temp set Params = ISNULL(Params,'''') + @DelDutyID+'',''  where MessageID = ''00ML000052''
							IF (Select Status from @tempstatus) = 0 and @DelDivisionID = '''+@DivisionID+'''
								Begin
									DELETE FROM HT1102 WHERE DivisionID = @DelDivisionID and DutyID = @DelDutyID				
								End
						FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelDutyID		
					END
					CLOSE @Cur
					SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @temp where Params is not null'					
			End
		
		
		
		  ---MODE=0 : SỬA DÒNG HIỆN TẠI
		IF @Mode = 0 --Trường hợp kiểm tra sửa record hiện tại
			Begin
					Declare @Status TINYINT,
							@Message NVARCHAR(1000),
							@Params Varchar(100),
							@DelDivisionID Varchar(50), 
							@DutyID Varchar(50)							
					Declare @temp table 
							(
								Status tinyint,
								MessageID varchar(100),
								Params varchar(4000)
							)
		--DutyID: Mã record cần sửa
		--HT1102:  Bảng cần sửa
					SELECT @DelDivisionID = DivisionID, @DutyID = DutyID
					FROM HT1102
					Where DutyID= @ID
					IF @DelDivisionID != @DivisionID
						Begin
							SET @Message = '00ML000050' 
							SET	@Status = 2
							SET @Params = @ID
						End 			
					Insert into @temp (	Status, MessageID, Params) 
					Select	@Status as Status, @Message as MessageID, @Params as Params
					SELECT Status, MessageID, Params From  @temp where Params is not null
			End
		EXEC (@sSQL)
	End
	
