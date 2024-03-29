IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[SP10002]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[SP10002]
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
----Modify by: Thị Phượng Date 19/08/2016: Bổ sung xóa trực tiếp bảng AT1405 thay cho trigger
----Modify by: Hoàng vũ Date 15/02/2017: Khi xóa người dùng thì xóa người dùng thuộc nhóm người dùng và xóa đơn vị thuộc nhóm người dùng (Gọi Store SP10004)
----Modify by: Thị Phượng Date 04/05/2017: Comment out Delete bảng AT1405 vì dùng cho ERP có trigger
---- Modified by Thị Phượng, Date 23/06/2017 Bổ sung set lại giá trị @Status khi chạy con trỏ
-- <Example>
----EXEC SP10002 'AS', 'NV-008', 'AT1103', 3,'ADMIn'
----
CREATE PROCEDURE SP10002
( 
		  @DivisionID varchar(50),	--Trường hợp @DivisionID đúng với DivisionID đăng nhập thì cho xóa
		  @EmployeeIDList NVARCHAR(MAX),	--Trường hợp Delete 1 hoặc nhiều record
		  @TableID nvarchar(50),	--Là bảng cần xóa record
		  @Mode TINYINT		,		--1: Disable, 2: Enable, 3: Delete, 0: Edit
		  @UserID NVARCHAR(50)
) 
AS 
Declare @sSQL NVARCHAR(MAX)
Begin
IF @Mode=1
Begin
SET @sSQL = ' 
	DECLARE @Status TINYINT,
			@Message NVARCHAR(1000),
			@Cur CURSOR,
			@DelDivisionID VARCHAR(50),
			@DelEmployeeID VARCHAR(50),
			@DelIsCommon tinyint
		Declare @AT1103temp table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
	SET @Status = 0
	SET @Message = ''''
	Insert into @AT1103temp (	Status, MessageID, Params) 
								Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''00ML000052'' as MessageID, Null as Params	
	SET @Cur = CURSOR SCROLL KEYSET FOR
	SELECT DivisionID, EmployeeID, IsCommon FROM AT1103 With (NOLOCK) WHERE EmployeeID IN ('''+@EmployeeIDList+''')

	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelEmployeeID, @DelIsCommon
	WHILE @@FETCH_STATUS = 0
	BEGIN
			EXEC CIP90000 @DelDivisionID, NULL, '''+@TableID+''',@DelEmployeeID, @Status OUTPUT
			IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon != 1)
									Begin
										UPDATE @AT1103temp set Params = ISNULL(Params,'''')  + @DelEmployeeID+'','' where MessageID = ''00ML000050''
									End
			IF(@DelEmployeeID=''ASOFTADMIN'')
									Begin
										UPDATE @AT1103temp set Params = ISNULL(Params,'''')  + @DelEmployeeID+'','' where MessageID = ''00ML000091''
									End
		   else 
				BEGIN
					IF (Select @Status) = 1
						UPDATE @AT1103temp set Params = ISNULL(Params,'''') +  @DelEmployeeID+'',''  where MessageID = ''00ML000052''
					Else
						BEGIN
							UPDATE AT1103 SET [Disabled] = 1, 
							LastModifyUserID = '''+@UserID+''', 
							LastModifyDate = GETDATE()
							WHERE  EmployeeID = @DelEmployeeID
						END
				End 
					
		FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelEmployeeID, @DelIsCommon	
		Set @Status = 0
	END
	CLOSE @Cur
	SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @AT1103temp where Params is not null'

EXEC (@sSQL)
End
Else IF @Mode=2
Begin
SET @sSQL = ' 
	DECLARE @Status TINYINT,
			@Message NVARCHAR(1000),
			@Cur CURSOR,
			@DelDivisionID VARCHAR(50),
			@DelEmployeeID VARCHAR(50),
			@DelIsCommon tinyint
		Declare @AT1103temp table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
	SET @Status = 0
	SET @Message = ''''
	Insert into @AT1103temp (	Status, MessageID, Params) 
								Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''00ML000052'' as MessageID, Null as Params	
	SET @Cur = CURSOR SCROLL KEYSET FOR
	SELECT DivisionID, EmployeeID, IsCommon FROM AT1103 With (NOLOCK) WHERE EmployeeID IN ('''+@EmployeeIDList+''')

	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelEmployeeID, @DelIsCommon
	WHILE @@FETCH_STATUS = 0
	BEGIN
			EXEC CIP90000 @DelDivisionID, NULL, '''+@TableID+''',@DelEmployeeID, @Status OUTPUT
			IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon != 1)
									Begin
										UPDATE @AT1103temp set Params = ISNULL(Params,'''')  + @DelEmployeeID+'','' where MessageID = ''00ML000050''
									End
			IF(@DelEmployeeID=''ASOFTADMIN'')
									Begin
										UPDATE @AT1103temp set Params = ISNULL(Params,'''')  + @DelEmployeeID+'','' where MessageID = ''00ML000091''
									End
		    else
				BEGIN
						UPDATE AT1103 SET [Disabled] = 0,
						LastModifyUserID = '''+@UserID+''',
						LastModifyDate = GETDATE()
						WHERE EmployeeID = @DelEmployeeID
				End 
					
		FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelEmployeeID, @DelIsCommon	
	END
	CLOSE @Cur
	SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @AT1103temp where Params is not null'

EXEC (@sSQL)

END
Else IF @Mode=3
begin
SET @sSQL = ' 
	DECLARE @Status TINYINT,
			@Message NVARCHAR(1000),
			@Cur CURSOR,
			@DelDivisionID VARCHAR(50),
			@DelEmployeeID VARCHAR(50),
			@DelIsCommon tinyint
		Declare @AT1103temp table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
	SET @Status = 0
	SET @Message = ''''
	Insert into @AT1103temp (	Status, MessageID, Params) 
								Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
								union all
								Select 2 as Status, ''00ML000052'' as MessageID, Null as Params	
	SET @Cur = CURSOR SCROLL KEYSET FOR
	SELECT DivisionID, EmployeeID, IsCommon FROM AT1103 With (NOLOCK) WHERE EmployeeID IN ('''+@EmployeeIDList+''')

	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelEmployeeID, @DelIsCommon
	WHILE @@FETCH_STATUS = 0
	BEGIN
			EXEC CIP90000 @DelDivisionID, NULL, '''+@TableID+''',@DelEmployeeID, @Status OUTPUT
			IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon != 1)
									Begin
										UPDATE @AT1103temp set Params = ISNULL(Params,'''')  + @DelEmployeeID+'','' where MessageID = ''00ML000050''
									End
			IF(@DelEmployeeID=''ASOFTADMIN'')
									Begin
										UPDATE @AT1103temp set Params = ISNULL(Params,'''')  + @DelEmployeeID+'','' where MessageID = ''00ML000091''
									End
		   else
				BEGIN
					IF (Select @Status) = 1
						UPDATE @AT1103temp set Params = ISNULL(Params,'''') +  @DelEmployeeID+'',''  where MessageID = ''00ML000052''
					Else
						begin 
							DELETE FROM AT1103  WHERE EmployeeID = @DelEmployeeID
							---Delete From AT1405 Where UserID =@DelEmployeeID
							EXEC SP10004 @DelDivisionID, @DelEmployeeID, 3
						end
				End 
					
		FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelEmployeeID, @DelIsCommon	
	END
	CLOSE @Cur
	SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @AT1103temp where Params is not null'

EXEC (@sSQL)

end
Else IF @Mode =0
Begin
SET @sSQL = ' 
			DECLARE @Status TINYINT,
			@Message NVARCHAR(1000),
			@Cur CURSOR,
			@DelDivisionID VARCHAR(50),
			@DelEmployeeID VARCHAR(50),
			@DelIsCommon tinyint
		Declare @AT1103temp table 
							(
							Status tinyint,
							MessageID varchar(100),
							Params varchar(4000)
							)
	SET @Status = 0
	SET @Message = ''''
	Insert into @AT1103temp (	Status, MessageID, Params) 
								Select 2 as Status, ''00ML000050'' as MessageID, Null as Params
								
	SET @Cur = CURSOR SCROLL KEYSET FOR
	SELECT DivisionID, EmployeeID, IsCommon FROM AT1103 With (NOLOCK) WHERE EmployeeID IN ('''+@EmployeeIDList+''')

	OPEN @Cur
	FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelEmployeeID, @DelIsCommon
	WHILE @@FETCH_STATUS = 0
	BEGIN
			IF (@DelDivisionID != '''+@DivisionID+''' and @DelIsCommon != 1)
									Begin
										UPDATE @AT1103temp set Params = ISNULL(Params,'''')  + @DelEmployeeID+'','' where MessageID = ''00ML000050''
									End
			IF(@DelEmployeeID=''ASOFTADMIN'')
									Begin
										UPDATE @AT1103temp set Params = ISNULL(Params,'''')  + @DelEmployeeID+'','' where MessageID = ''00ML000091''
									End
		
		FETCH NEXT FROM @Cur INTO @DelDivisionID, @DelEmployeeID, @DelIsCommon	
	END
	CLOSE @Cur
	SELECT Status, MessageID, LEFT(Params,LEN(Params) - 1) AS Params From  @AT1103temp where Params is not null'

EXEC (@sSQL)
END
End 
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO