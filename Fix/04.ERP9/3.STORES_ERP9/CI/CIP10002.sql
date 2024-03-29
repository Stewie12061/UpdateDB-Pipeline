IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CIP10002]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CIP10002]
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
----Modify by:  Thị Phượng, bổ sung trường hợp Edit và chuyển sang store CIP90000
---- 
-- <Example>
----EXEC CIP10002 'KC', 'GM-OS'',''GM-LG', null, 'AT1102', 1,1
----
CREATE PROCEDURE CIP10002
( 
		  @DivisionID varchar(50),	--Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
		  @DepartmentIDList NVARCHAR(MAX),	--Trường hợp Delete 1 hoặc nhiều record
		  @ID nvarchar(50),			--Trường hợp Edit chỉ 1 record
		  @TableID nvarchar(50),	--Là bảng cần xóa record
		  @Mode TINYINT,				--0: Edit, 1: Delete
		  @IsDisabled TINYINT --0: Hiện , 1: Ẩn
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
							@DelDepartmentID VARCHAR(50)
						
					Declare @temp table 
							(	Status tinyint,
								MessageID varchar(100),
								Params varchar(4000))
					SET @Status = 0
					SET @Message = ''''
					Insert into @temp (	Status, MessageID, Params) 
												Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
												union all
												Select 2 as Status, ''00ML000052'' as MessageID, Null as Params	
					SET @Cur = CURSOR SCROLL KEYSET FOR

					
		--DepartmentID: Mã record cần xóa

		--AT1103: Bảng cần xóa record
					SELECT DivisionID, DepartmentID FROM AT1102 With (NOLOCK) WHERE DepartmentID IN ('''+@DepartmentIDList+''')
					OPEN @Cur
					FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelDepartmentID
					WHILE @@FETCH_STATUS = 0
					Begin
		--Table dùng để xóa dòng: AT1102
		--Kiểm tra Store CIP90000 đã kiểm tra tại table AT1102 khi thêm mới màn hình hoặc tồn tại màn hình đó
					EXEC CIP90000 @DelDivisionID, NULL, '''+@TableID+''',@DelDepartmentID, @Status OUTPUT
							IF (@DelDivisionID != '''+@DivisionID+''' AND @DelDivisionID != ''@@@'')
								Begin
									update @temp set Params = ISNULL(Params,'''') + @DelDepartmentID +'','' where MessageID = ''00ML000050''
								End
							IF (@Status = 1)
								update @temp set Params = ISNULL(Params,'''') + @DelDepartmentID+'',''  where MessageID = ''00ML000052''
							IF (@Status = 0)
								Begin
									DELETE FROM AT1102 WHERE DivisionID = @DelDivisionID and DepartmentID = @DelDepartmentID				
								End
						FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelDepartmentID		
					END
					CLOSE @Cur
					SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @temp where Params is not null'
					
			End
		
		
		
		  ---MODE=0 : SỬA DÒNG HIỆN TẠI
		IF @Mode = 0 --Trường hợp kiểm tra sửa record hiện tại
			BEGIN SET @sSQL = '
					Declare @Status TINYINT,
							@Cur CURSOR,
							@Message NVARCHAR(1000),
							@DelDivisionID Varchar(50), 
							@DelDepartmentID Varchar(50)							
					Declare @temp table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
						SET @Status = 0
					SET @Message = ''''
					Insert into @temp (	Status, MessageID, Params) 
												Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
												union all
												Select 2 as Status, ''00ML000052'' as MessageID, Null as Params	
					SET @Cur = CURSOR SCROLL KEYSET FOR

					
		--DepartmentID: Mã record cần xóa

		--AT1103: Bảng cần xóa record
					SELECT DivisionID, DepartmentID FROM AT1102 With (NOLOCK) WHERE DepartmentID IN ('''+@DepartmentIDList+''')
					OPEN @Cur
					FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelDepartmentID
					WHILE @@FETCH_STATUS = 0
					Begin
					EXEC CIP90000 @DelDivisionID, NULL, '''+@TableID+''', @DelDepartmentID, @Status OUTPUT
					IF (@DelDivisionID != '''+@DivisionID+''' AND @DelDivisionID != ''@@@'')
						Begin
							update @temp set Params = ISNULL(Params,'''') + @DelDepartmentID +'','' where MessageID = ''00ML000050''
						End
					IF (@Status =1) 
						IF ('+STR(@IsDisabled)+' =1)
						 Begin
							update @temp set Params = ISNULL(Params,'''') + @DelDepartmentID+'',''  where MessageID = ''00ML000052''
						 End 
						IF ('+STR(@IsDisabled)+' =0) UPDATE AT1102 SET [Disabled] = 0 WHERE DepartmentID = @DelDepartmentID
					IF (@Status =0) 
						IF ('+STR(@IsDisabled)+'  =1)
							UPDATE AT1102 SET [Disabled] = 1  WHERE DepartmentID = @DelDepartmentID
						IF ('+STR(@IsDisabled)+' =0) UPDATE AT1102 SET [Disabled] = 0 WHERE DepartmentID = @DelDepartmentID
			
						FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelDepartmentID		
					END
					CLOSE @Cur
					SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @temp where Params is not null'
			End
		EXEC (@sSQL)
	End
	
