DECLARE @DivisionID NVARCHAR(50), @Cur CURSOR

SET @Cur = CURSOR SCROLL KEYSET FOR
	SELECT DivisionID FROM AT1101 
OPEN @Cur
FETCH NEXT FROM @Cur INTO @DivisionID
WHILE @@FETCH_STATUS = 0
BEGIN

	IF NOT EXISTS (SELECT TOP 1 1 FROM HT1027 WHERE DivisionID = @DivisionID AND SeniorityID = 'P.TNBT')
	BEGIN 
		INSERT [dbo].[HT1027] ([DivisionID], [SeniorityID], [DescriptionID], [Disabled], [CreateDate], [CreateUserID], [LastModifyDate], [LastModifyUserID]) VALUES (@DivisionID, N'P.TNBT', N'Phép thâm niên điều kiện bình thường', 0, CAST(0x0000A6EB00B92522 AS DateTime), N'ASOFTADMIN', CAST(0x0000A6EB00F8386C AS DateTime), N'ASOFTADMIN')
		INSERT [dbo].[HT1028] ([DivisionID], [SeniorityID], [FromValues], [ToValues], [VacSeniorDays], [VacSeniorPrevDays], [Orders]) VALUES (@DivisionID, N'P.TNBT', CAST(0.00000000 AS Decimal(28, 8)), CAST(3.00000000 AS Decimal(28, 8)), CAST(0.00000000 AS Decimal(28, 8)), CAST(12.00000000 AS Decimal(28, 8)), 1)
		INSERT [dbo].[HT1028] ([DivisionID], [SeniorityID], [FromValues], [ToValues], [VacSeniorDays], [VacSeniorPrevDays], [Orders]) VALUES (@DivisionID, N'P.TNBT', CAST(3.00000000 AS Decimal(28, 8)), CAST(5.00000000 AS Decimal(28, 8)), CAST(1.00000000 AS Decimal(28, 8)), CAST(13.00000000 AS Decimal(28, 8)), 2)
		INSERT [dbo].[HT1028] ([DivisionID], [SeniorityID], [FromValues], [ToValues], [VacSeniorDays], [VacSeniorPrevDays], [Orders]) VALUES (@DivisionID, N'P.TNBT', CAST(5.00000000 AS Decimal(28, 8)), CAST(10.00000000 AS Decimal(28, 8)), CAST(2.00000000 AS Decimal(28, 8)), CAST(15.00000000 AS Decimal(28, 8)), 3)
	END 

	IF NOT EXISTS (SELECT TOP 1 1 FROM HT1027 WHERE DivisionID = @DivisionID AND SeniorityID = 'P.TNDH')
	BEGIN 
		INSERT [dbo].[HT1027] ([DivisionID], [SeniorityID], [DescriptionID], [Disabled], [CreateDate], [CreateUserID], [LastModifyDate], [LastModifyUserID]) VALUES (@DivisionID, N'P.TNDH', N'Phép thâm niên điều kiện độc hại', 0, CAST(0x0000A6EB00B9AF67 AS DateTime), N'ASOFTADMIN', CAST(0x0000A6EB00B9AF67 AS DateTime), N'ASOFTADMIN')
		INSERT [dbo].[HT1028] ([DivisionID], [SeniorityID], [FromValues], [ToValues], [VacSeniorDays], [VacSeniorPrevDays], [Orders]) VALUES (@DivisionID, N'P.TNDH', CAST(2.00000000 AS Decimal(28, 8)), CAST(3.00000000 AS Decimal(28, 8)), CAST(1.00000000 AS Decimal(28, 8)), CAST(15.00000000 AS Decimal(28, 8)), 1)
		INSERT [dbo].[HT1028] ([DivisionID], [SeniorityID], [FromValues], [ToValues], [VacSeniorDays], [VacSeniorPrevDays], [Orders]) VALUES (@DivisionID, N'P.TNDH', CAST(3.00000000 AS Decimal(28, 8)), CAST(5.00000000 AS Decimal(28, 8)), CAST(2.00000000 AS Decimal(28, 8)), CAST(16.00000000 AS Decimal(28, 8)), 2)
		INSERT [dbo].[HT1028] ([DivisionID], [SeniorityID], [FromValues], [ToValues], [VacSeniorDays], [VacSeniorPrevDays], [Orders]) VALUES (@DivisionID, N'P.TNDH', CAST(5.00000000 AS Decimal(28, 8)), CAST(10.00000000 AS Decimal(28, 8)), CAST(5.00000000 AS Decimal(28, 8)), CAST(20.00000000 AS Decimal(28, 8)), 3)
	END 
	IF NOT EXISTS (SELECT TOP 1 1 FROM HT1029 WHERE DivisionID = @DivisionID AND MethodVacationID = 'PP.BT001')
		INSERT [dbo].[HT1029] ([DivisionID], [MethodVacationID], [MethodVacationName], [VacationDay], [Disabled], [SeniorityID], [IsWorkDate], [IsManagaVacation], [IsToMonthPlus], [ToMonthPlus], [IsPrevVacationDay], [MaxPrevVacationDay], [CreateDate], [CreateUserID], [LastModifyDate], [LastModifyUserID]) 
		VALUES (@DivisionID, N'PP.BT001', N'Phương pháp tính phép cho điều kiện làm việc bình thường', CAST(12.00000000 AS Decimal(28, 8)), 0, N'P.TNBT', 1, 0, 1, 4, 1, NULL, CAST(0x0000A6EB00BA1CB3 AS DateTime), N'ASOFTADMIN', CAST(0x0000A6EB00F90298 AS DateTime), N'ASOFTADMIN')

	IF NOT EXISTS (SELECT TOP 1 1 FROM HT1029 WHERE DivisionID = @DivisionID AND MethodVacationID = 'PP.DH001')
		INSERT [dbo].[HT1029] ([DivisionID], [MethodVacationID], [MethodVacationName], [VacationDay], [Disabled], [SeniorityID], [IsWorkDate], [IsManagaVacation], [IsToMonthPlus], [ToMonthPlus], [IsPrevVacationDay], [MaxPrevVacationDay], [CreateDate], [CreateUserID], [LastModifyDate], [LastModifyUserID]) 
		VALUES (@DivisionID, N'PP.DH001', N'Phương pháp tính phép điều kiện làm việc độc hại', CAST(14.00000000 AS Decimal(28, 8)), 0, N'P.TNDH', 1, 1, 1, 4, 1, NULL, CAST(0x0000A6EB00BA581C AS DateTime), N'ASOFTADMIN', CAST(0x0000A6EB00FEA5D7 AS DateTime), N'ASOFTADMIN')
		
FETCH NEXT FROM @Cur INTO @DivisionID
 END

CLOSE @Cur
DEALLOCATE @Cur
