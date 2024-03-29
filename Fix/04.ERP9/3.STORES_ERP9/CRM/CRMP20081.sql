IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[CRMP20081]') AND OBJECTPROPERTY(ID, N'IsProcedure') = 1)
DROP PROCEDURE [DBO].[CRMP20081]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Lấy công nợ phải thu và công nợ coc, vỏ (CustomizeIndex = 51 Hoàng Trần)
---- 
---- 
----
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
----Created by: Phan thanh hoang vu, Date: 06/12/2016
----Edit by	  : Thị Phượng date 02/02/2017 fix bug cải tiến tộc độ

-- <Example> exec CRMP20081 @DivisionID=N'HT',@ObjectID=N'HV_KH001', @VoucherDate='2016-12-20'

CREATE PROCEDURE CRMP20081 (
			@DivisionID AS nvarchar(50) ,
			@ObjectID as Nvarchar(50),
			@VoucherDate AS datetime
			)
AS
BEGIN
	
	--DECLARE @SQL AS Nvarchar(max)

	----Lấy công nợ phải thu cọc, vỏ
	--exec AP7409 @DivisionID=@DivisionID,@FromMonth=01,@FromYear=1900,@ToMonth=11,@ToYear=2016,@TypeD=2,
	--			@FromDate='1900-01-01 00:00:00',@ToDate=@VoucherDate,@CurrencyID=N'VND',@FromAccountID=N'344101',
	--			@ToAccountID=N'34416',@FromObjectID=@ObjectID,@ToObjectID=@ObjectID,@Groupby=0,@StrDivisionID=N'',@DatabaseName=N''
	----Lấy công nợ phải thu
	--exec AP7403 @DivisionID=@DivisionID,@FromMonth=01,@FromYear=1900,@ToMonth=11,@ToYear=2016,@TypeD=2,
	--			@FromDate='1900-01-01 00:00:00',@ToDate=@VoucherDate,@CurrencyID=N'VND',@FromAccountID=N'131',@ToAccountID=N'2449',
	--			@FromObjectID=@ObjectID,@ToObjectID=@ObjectID,@Groupby=0,@StrDivisionID=N'',@DatabaseName=N''

	--Declare @Temp table (	DivisionID varchar(50),
	--						ObjectID varchar(50),
	--						ObjectName nvarchar(250),
	--						O01ID varchar(50),
	--						O01Name nvarchar(250),
	--						ConvertedDebitAmount decimal(28,8),
	--						ConvertedCreditAmount decimal(28,8),
	--						DepositDebitAmount decimal(28,8),
	--						DepositCreditAmount decimal(28,8)
	--						)
	--Insert into @Temp (DivisionID, ObjectID, ObjectName, O01ID, O01Name, ConvertedDebitAmount, ConvertedCreditAmount
	--					, DepositDebitAmount, DepositCreditAmount)
				
	--Select  A.DivisionID, A.ObjectID, A.ObjectName, A.O01ID, O1.AnaName, M.ConvertedClosing, 0, 0, 0
	--from AT1202 A WITH (NOLOCK) Left join AV7403 M on M.DivisionID = A.DivisionID and M.ObjectID = A.ObjectID 
	--			  Left join AT1015 AS O1 WITH (NOLOCK) ON 	O1.AnaTypeID = 'O01' AND O1.AnaID = A.O01ID AND O1.DivisionID = A.DivisionID
	--Where A.DivisionID = @DivisionID and A.ObjectID = @ObjectID
	--Union all
	--Select  A.DivisionID, A.ObjectID, A.ObjectName, A.O01ID, O1.AnaName, 0, 0, D.ConvertedClosing, 0
	--from AT1202 A WITH (NOLOCK) Left join AV7409 D on D.DivisionID = A.DivisionID and D.ObjectID = A.ObjectID 
	--			  Left join AT1015 AS O1 WITH (NOLOCK) ON 	O1.AnaTypeID = 'O01' AND O1.AnaID = A.O01ID AND O1.DivisionID = A.DivisionID
	--Where A.DivisionID = @DivisionID and A.ObjectID = @ObjectID
	
	--Select A.DivisionID, A.ObjectID, A.ObjectName, A.O01ID, A.O01Name
	--	, Sum(ConvertedDebitAmount)-Sum(ConvertedCreditAmount) as ConvertedAmount
	--	, Sum(DepositDebitAmount)- Sum(DepositCreditAmount) as DepositAmount 
	--from @Temp A
	--Group by A.DivisionID, A.ObjectID, A.ObjectName, A.O01ID, A.O01Name
Declare @Temp table 
	(
		DivisionID varchar(50), 
		ObjectID varchar(500), 
		DOriginalAmount decimal(28,8),
		DConvertedAmount decimal(28,8)
	)
	Insert into @Temp (DivisionID, ObjectID, DOriginalAmount, DConvertedAmount)
	select  x.DivisionID, x.ObjectID
		, sum(COriginalAmount) - sum(DOriginalAmount) as DOriginalAmount
		, sum(DConvertedAmount) - sum(CConvertedAmount) as DConvertedAmount
	From
	(		--Lọc công nợ cọc vỏ
		select x.DivisionID , x.ObjectID, isnull(x.OriginalAmount,0) as DOriginalAmount , 0 as COriginalAmount 
				, 0 as DConvertedAmount , 0 as CConvertedAmount
		from  AT9000 x With (Nolock)
		where x.DivisionID = @DivisionID and x.ObjectID = @ObjectID 
			and convert(varchar(10),x.VoucherDate,112) <= CONVERT(VARCHAR(10),@VoucherDate,112)
			and x.DebitAccountID between N'3441' and N'3442'
		Union all
		select x.DivisionID, (Case When x.TransactionTypeID = 'T99' then x.CreditObjectID else x.ObjectID End) as ObjectID
				, 0 as DOriginalAmount, isnull(x.OriginalAmount,0) as COriginalAmount, 0 as DConvertedAmount 
				, 0 as CConvertedAmount
		from  AT9000 x With (Nolock)
		where x.DivisionID = @DivisionID and x.ObjectID = @ObjectID
			and convert(varchar(10),x.VoucherDate,112) <= CONVERT(VARCHAR(10),@VoucherDate,112)
			and x.CreditAccountID between N'3441' and N'3442' 
		Union all
		---Lọc công nợ phải thu
		select x.DivisionID, x.ObjectID, 0 as DOriginalAmount , 0 as COriginalAmount
			, isnull(x.OriginalAmount,0) as DConvertedAmount , 0 as CConvertedAmount
		from  AT9000 x With (Nolock) inner join AT1005 on AT1005.AccountID = x.DebitAccountID and AT1005.DivisionID = x.DivisionID
		where x.DivisionID = @DivisionID and x.ObjectID = @ObjectID 
			and convert(varchar(10),x.VoucherDate,112) <= CONVERT(VARCHAR(10),@VoucherDate,112)
			and x.DebitAccountID is not null and AT1005.GroupID in ('G03', 'G04')
			and x.DebitAccountID between '131' and '2449'
		Union all
		select x.DivisionID, (Case When x.TransactionTypeID = 'T99' then x.CreditObjectID else x.ObjectID End) as ObjectID
				, 0 as DOriginalAmount , 0 as COriginalAmount, 0 as DConvertedAmount
				, isnull(x.OriginalAmount,0) as CConvertedAmount 
		from  AT9000 x With (Nolock)  inner join AT1005 on AT1005.AccountID = x.CreditAccountID and AT1005.DivisionID = x.DivisionID
		where x.DivisionID = @DivisionID and x.ObjectID = @ObjectID 
			and convert(varchar(10),x.VoucherDate,112) <= CONVERT(VARCHAR(10),@VoucherDate,112)
			and x.CreditAccountID is not null and AT1005.GroupID in ('G03', 'G04')
			and x.CreditAccountID between '131' and '2449' )x
		Group by x.DivisionID, x.ObjectID
	Select A.DivisionID, A.ObjectID, B.ObjectName, B.O01ID, O1.AnaName as O01Name
		, sum(DOriginalAmount) as DepositAmount, sum(DConvertedAmount) as ConvertedAmount
	from @Temp A
	inner join AT1202 B WITH (NOLOCK) on B.DivisionID = A.DivisionID and B.ObjectID = A.ObjectID 
	left join AT1015 AS O1 WITH (NOLOCK) ON O1.AnaTypeID = 'O01' AND O1.AnaID = B.O01ID AND O1.DivisionID = A.DivisionID
	group by A.DivisionID, A.ObjectID, B.ObjectName, B.O01ID, O1.AnaName
END
GO
