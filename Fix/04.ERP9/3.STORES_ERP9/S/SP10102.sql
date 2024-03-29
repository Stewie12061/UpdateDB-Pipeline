IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SP10102]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[SP10102]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

----<Summary>
----Store xóa dữ liệu màn hình SF1010
----<Param>
---- 
----<Return>
---- 
----<Reference>
---- 
----<History>
----Created by: Nguyen chanh thi, Date: 17/10/2014
---- Modified by Thị Phượng, Date 23/06/2017 Bổ sung set lại giá trị @Status khi chạy con trỏ
---- 
----EXEC SP10102 'KC','','FFF','AT1401',1
----
CREATE PROCEDURE SP10102
( 
		  @DivisionID varchar(50),	--Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
		  @IDList NVARCHAR(MAX),	--Trường hợp Delete 1 hoặc nhiều record
		  @ID nvarchar(50),			--Trường hợp Edit chỉ 1 record
		  @TableID nvarchar(50),	--Là bảng cần xóa record
		  @Mode TINYINT				--0: Edit, 1: Delete
) 
AS 
	Declare @sSQL NVARCHAR(MAX)
	Begin
		IF @Mode = 1--Trường hợp xóa 1 hoặc nhiều record
			Begin
				SET @sSQL = '
					Declare @Status TINYINT,
							@Message NVARCHAR(1000),
							@Cur CURSOR,
							@DelDivisionID VARCHAR(50),
							@DelID VARCHAR(50)
					Declare @temp table 
							(	Status tinyint,
								MessageID varchar(100),
								Params varchar(4000))
					Declare @tempstatus table 
							(Status tinyint)
					SET @Status = 0
					SET @Message = ''''
					Insert into @temp (	Status, MessageID, Params) 
												Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
												union all
												Select 2 as Status, ''00ML000052'' as MessageID, Null as Params	
					SET @Cur = CURSOR SCROLL KEYSET FOR

					SELECT DivisionID, GroupID FROM AT1401 WHERE GroupID IN ('''+@IDList+''')
					OPEN @Cur
					FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelID
					WHILE @@FETCH_STATUS = 0
					Begin
		--Trong đó: @TableID = @@TableID_DEL
		--Kiểm tra Store AP1000 đã kiểm tra @@TableID_DEL khi thêm mới màn hình hoặc tồn tại màn hình đó
							Insert into @tempstatus (Status)
							exec AP1000 @DelDivisionID, '''+@TableID+''',@DelID
							IF @DelDivisionID != '''+@DivisionID+'''
								Begin
									update @temp set Params = ISNULL(Params,'''') + @DelID +'','' where MessageID = ''00ML000050''
								End
							IF (Select Status from @tempstatus) = 1
								update @temp set Params = ISNULL(Params,'''') + @DelID+'',''  where MessageID = ''00ML000052''
							IF (Select Status from @tempstatus) = 0 and @DelDivisionID = '''+@DivisionID+'''
								Begin
									DELETE FROM AT1401 WHERE DivisionID = @DelDivisionID and GroupID = @DelID				
								End
						FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelID		
						Set @Status = 0
					END
					CLOSE @Cur
					SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @temp where Params is not null'
			End
		IF @Mode = 0 --Trường hợp kiểm tra sửa record hiện tại
			Begin
					Declare @Status TINYINT,
							@Message NVARCHAR(1000),
							@Params Varchar(100),
							@DelDivisionID Varchar(50), 
							@DelID Varchar(50)							
					Declare @temp table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
		--@@ColumnID_DEL: Mã record cần xóa
		--@@TableID_DEL: Bảng cần xóa record
					SELECT @DelDivisionID = DivisionID, @DelID = GroupID
					FROM AT1401
					Where GroupID = @ID

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
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
