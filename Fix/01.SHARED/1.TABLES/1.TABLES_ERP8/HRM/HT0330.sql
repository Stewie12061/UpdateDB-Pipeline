-- <Summary>
---- 
-- <History>
---- Create on 05/12/2013 by Thanh Sơn
---- Modified on ... by ...
---- <Example>
IF NOT EXISTS (SELECT * FROM sys.objects WHERE OBJECT_ID = OBJECT_ID(N'[dbo].[HT0330]') AND TYPE IN (N'U'))
BEGIN
     CREATE TABLE [dbo].[HT0330]
     (
      [APK] UNIQUEIDENTIFIER DEFAULT NEWID() NOT NULL,
      [DivisionID] VARCHAR (50) NOT NULL,
      [TranMonth] INT NOT NULL,
      [TranYear] INT NOT NULL,
      [VoucherDate] DATETIME NULL,
      [Notes] NVARCHAR (1000) NULL,
      [FromDepartmentID] VARCHAR (50) NULL,
      [ToDepartmentID] VARCHAR (50) NULL,
      [FromTeamID] VARCHAR (50) NULL,
      [ToTeamID] VARCHAR (50) NULL,
      [FromEmployeeID] VARCHAR (50) NULL,
      [ToEmployeeID] VARCHAR (50) NULL,
      [IsJobWage] TINYINT NULL,
      [IsPiecework] TINYINT NULL,
      [IsEmployeeRecord] TINYINT NULL,
      [IsSalaryRecord] TINYINT NULL,
      [SuggestSalary] DECIMAL (28,8) NULL,
      [BaseSalary] DECIMAL (28,8) NULL,
      [InsuranceSalary] DECIMAL (28,8) NULL,
      [Salary01] DECIMAL (28,8) NULL,
      [Salary02] DECIMAL (28,8) NULL,
      [Salary03] DECIMAL (28,8) NULL,
      [SalaryCoefficient] DECIMAL (28,8) NULL,
      [TaxObjectID] VARCHAR (50) NULL,
      [LoaCondID] VARCHAR (50) NULL,
      [DutyID] VARCHAR (50) NULL,
      [DutyCoefficient] DECIMAL (28,8) NULL,
      [TimeCoefficient] DECIMAL (28,8) NULL,
      [C01] DECIMAL (28,8) NULL,
      [C02] DECIMAL (28,8) NULL,
      [C03] DECIMAL (28,8) NULL,
      [C04] DECIMAL (28,8) NULL,
      [C05] DECIMAL (28,8) NULL,
      [C06] DECIMAL (28,8) NULL,
      [C07] DECIMAL (28,8) NULL,
      [C08] DECIMAL (28,8) NULL,
      [C09] DECIMAL (28,8) NULL,
      [C10] DECIMAL (28,8) NULL,
      [C11] DECIMAL (28,8) NULL,
      [C12] DECIMAL (28,8) NULL,
      [C13] DECIMAL (28,8) NULL,
      [C14] DECIMAL (28,8) NULL,
      [C15] DECIMAL (28,8) NULL,
      [C16] DECIMAL (28,8) NULL,
      [C17] DECIMAL (28,8) NULL,
      [C18] DECIMAL (28,8) NULL,
      [C19] DECIMAL (28,8) NULL,
      [C20] DECIMAL (28,8) NULL,
      [C21] DECIMAL (28,8) NULL,
      [C22] DECIMAL (28,8) NULL,
      [C23] DECIMAL (28,8) NULL,
      [C24] DECIMAL (28,8) NULL,
      [C25] DECIMAL (28,8) NULL,
      [Target01ID] VARCHAR (50) NULL,
      [TargetAmount01] DECIMAL (28,8) NULL,
      [Target02ID] VARCHAR (50) NULL,
      [TargetAmount02] DECIMAL (28,8) NULL,
      [Target03ID] VARCHAR (50) NULL,
      [TargetAmount03] DECIMAL (28,8) NULL,
      [Target04ID] VARCHAR (50) NULL,
      [TargetAmount04] DECIMAL (28,8) NULL,
      [Target05ID] VARCHAR (50) NULL,
      [TargetAmount05] DECIMAL (28,8) NULL,
      [Target06ID] VARCHAR (50) NULL,
      [TargetAmount06] DECIMAL (28,8) NULL,
      [Target07ID] VARCHAR (50) NULL,
      [TargetAmount07] DECIMAL (28,8) NULL,
      [Target08ID] VARCHAR (50) NULL,
      [TargetAmount08] DECIMAL (28,8) NULL,
      [Target09ID] VARCHAR (50) NULL,
      [TargetAmount09] DECIMAL (28,8) NULL,
      [Target10ID] VARCHAR (50) NULL,
      [TargetAmount10] DECIMAL (28,8) NULL,
      [DeleteFlag] TINYINT DEFAULT (0) NOT NULL,
      [CreateUserID] VARCHAR (50) NULL,
      [CreateDate] DATETIME NULL,
      [LastModifyUserID] VARCHAR (50) NULL,
      [LastModifyDate] DATETIME NULL
    CONSTRAINT [PK_HT0330] PRIMARY KEY CLUSTERED
      (
      [APK]
      )
WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
     )
 ON [PRIMARY]
END
