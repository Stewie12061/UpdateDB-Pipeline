IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SP10502]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[SP10502]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
-- Kiểm tra trước khi xóa và xóa thành công vai trò
-- Nếu mã vai trò chưa được sử dụng thì cho phép xóa (Xóa ngầm) ngược lại thì báo message ID đã sử dụng không được phép xóa
-- <Param>
-- <Return>
-- <Reference>
-- <History>
-- Created by: Phan thanh hoàng vũ, Date: 03/05/2017
---- Modified by Thị Phượng, Date 23/06/2017 Bổ sung set lại giá trị @Status khi chạy con trỏ
-- <Example> EXEC SP10502 'AS', 'aa', 'ST10501', NULL

CREATE PROCEDURE SP10502 ( 
	@DivisionID varchar(50),	--Biến môi trường
	@RoleIDList NVARCHAR(MAX),	
	@TableID nvarchar(50),		--ST10501
	@UserID Varchar(50)			--Biến môi trường
	) 
AS 
BEGIN
	DECLARE @sSQL NVARCHAR(MAX)
	SET @sSQL = '
				DECLARE @Status TINYINT,
						@Message NVARCHAR(1000),
						@Cur CURSOR,
						@DelAPKRoleID VARCHAR(50),
						@DelRoleID VARCHAR(50)
						
				Declare @ST10501temp table (
						Status tinyint,
						MessageID varchar(100),
						Params varchar(4000))
				SET @Status = 0
				SET @Message = ''''
				Insert into @ST10501temp (	Status, MessageID, Params) 
											Select 2 as Status, ''00ML000112'' as MessageID, Null as Params
											Union all
											Select 2 as Status, ''00ML000052'' as MessageID, Null as Params
				SET @Cur = CURSOR SCROLL KEYSET FOR
				SELECT APK , RoleID FROM ST10501 WITH (NOLOCK) WHERE RoleID IN ('''+@RoleIDList+''')
				OPEN @Cur
				FETCH NEXT FROM @Cur INTO @DelAPKRoleID, @DelRoleID
				WHILE @@FETCH_STATUS = 0
				BEGIN
					EXEC CRMP90000 '''+@DivisionID+''', NULL, '''+@TableID+''', NULL, @DelRoleID, NULL, NULL, @Status OUTPUT
					IF  EXISTS (SELECT TOP 1 1 From ST10501 Where ParentRoleID = @DelRoleID)
							update @ST10501temp set Params = ISNULL(Params,'''') + @DelRoleID+'',''  where MessageID = ''00ML000112''
					Else IF (Select @Status) = 1
							update @ST10501temp set Params = ISNULL(Params,'''') + @DelRoleID+'',''  where MessageID = ''00ML000052''
					ELSE 
						Begin
							DELETE FROM ST10501 WHERE APK = @DelAPKRoleID
							DELETE FROM ST10502 WHERE RoleID = @DelRoleID
							DELETE FROM ST10503 WHERE RoleID = @DelRoleID
							Update AT1401 Set RoleID = NULL WHERE RoleID = @DelRoleID
							Update AT1402 Set UserJoinRoleID = NULL WHERE UserJoinRoleID = @DelRoleID
						End
					FETCH NEXT FROM @Cur INTO @DelAPKRoleID, @DelRoleID
				Set @Status = 0
				END
				CLOSE @Cur
				SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @ST10501temp where Params is not null'
	EXEC (@sSQL)
	
END
