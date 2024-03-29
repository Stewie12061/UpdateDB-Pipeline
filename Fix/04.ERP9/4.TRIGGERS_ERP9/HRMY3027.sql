IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[HRMY3027]') AND OBJECTPROPERTY(ID, N'IsTrigger') = 1)
DROP TRIGGER [DBO].[HRMY3027]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----- Created by Nguyen Nhat Thanh, Date 27/07/2022.


CREATE TRIGGER [dbo].[HRMY3027] ON [dbo].[HRMT3027] 
FOR INSERT
AS
DECLARE @Mode int,
		@APK NVARCHAR(50),
		@Date NVARCHAR(50),
		@EmployeeID NVARCHAR(50) ,
		@DepartmentID NVARCHAR(50) ,  
		@MachineID NVARCHAR(50) ,  
		@ShiftID NVARCHAR(50) ,  
		@FromDate NVARCHAR(50) ,  
		@ToDate NVARCHAR(50) 
BEGIN
	Select @APK=APK, @Mode = ReportTypeID, @Date= Date, @EmployeeID=EmployeeID, @DepartmentID=DepartmentID, @MachineID=MachineID, @ShiftID=ShiftID, @FromDate=FromDate, @ToDate=ToDate
	FROM INSERTED

	IF @Mode=1
	BEGIN
		Delete HRMT3027 where ReportTypeID=1 and EmployeeID=@EmployeeID and Date=@Date and APK != @APK
	END
	ELSE IF @Mode=2
	BEGIN
		Delete HRMT3027 where ReportTypeID=2 and EmployeeID=@EmployeeID and CONVERT(datetime, @FromDate, 101)=CONVERT(datetime, FromDate, 101) and CONVERT(datetime, @ToDate, 101)=CONVERT(datetime, ToDate, 101) and APK != @APK
	END
	ELSE IF @Mode=3
	BEGIN
		Delete HRMT3027 where ReportTypeID=3 and @DepartmentID=DepartmentID and Date=@Date and APK != @APK
	END
	ELSE
	BEGIN 
		Delete HRMT3027 where ReportTypeID=3 and @MachineID=MachineID and @ShiftID=ShiftID and Date=@Date and APK != @APK
	END
END