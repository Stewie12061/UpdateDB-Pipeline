IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[BP3020]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[BP3020]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Báo cáo số dư tài khoản--BF3020
---- Dùng để thống kê tiền mặt và tiền gửi ngân hàng theo Division
---- <Param>
---- 
---- <Return>
---- 
---- <Reference>
---- 
---- <History>
---- Create on 25/06/2019 by Hoàng vũ
---- exec BP3020 @DivisionID=N'HH',@BankID=N'',@AccountID=N'',@CurrencyID=N'',@FromMonth=6,@FromYear=2019,@ToMonth=6,@ToYear=2019,@FromDate='2019-06-01 00:00:00',@ToDate='2019-06-30 00:00:00',@IsDate=1,@StrDivisionID=N'HH'',''HC'',''HP'',''HP'',''HTX'',''KT'',''LE'',''LU'',''MR'',''NC'',''OR'',''PH'',''SU'',''VP', @UserID = ''


CREATE PROCEDURE [dbo].[BP3020]  	
					@DivisionID AS nvarchar(50),		--Biến môi trường
					@StrDivisionID AS NVARCHAR(4000),	--Nếu có chọn từ DropdownChecklist ngược lại thì là NULL
					@IsDate tinyint,					--1=ngày; 0=Kỳ
					@FromDate AS datetime,
					@ToDate AS datetime,
					@FromMonth int,
					@FromYear int,
					@ToMonth int,
					@ToYear int,
					@AccountID AS nvarchar(50),			
					@BankID AS nvarchar(50),
					@CurrencyID AS nvarchar(50),
					@UserID AS nvarchar(50)				--Biến môi trường, UserID (đăng nhập)
AS
		Declare @sSQL01 AS nvarchar(max),
				@sSQL02 AS nvarchar(max),
				@sSQL03 AS nvarchar(max),
				@sWHERE1 AS NVARCHAR(MAX),
				@sWHERE2 AS NVARCHAR(MAX),
				@StrDivisionID_New AS NVARCHAR(4000),
				@strBankID AS NVARCHAR(MAX),
				@strFromdate AS NVARCHAR(MAX),
				@strTodate AS NVARCHAR(MAX),
				@strFromdateAndTodate AS NVARCHAR(MAX)

		SET @sWHERE1 = ' '
		SET @sWHERE2 = ' '
		SET @StrDivisionID_New = ' '	
		SET @strBankID = ' '
		SET @strFromdate = ' '
		SEt @strTodate = ' '
		SET @strFromdateAndTodate = ' '
		
		--Search theo thời gian
		IF @IsDate = 1
		Begin
			SET @strTodate = @strTodate + ' AND CONVERT(DATETIME,CONVERT(VARCHAR(10), VoucherDate,101),101) <= ''' + CONVERT(NVARCHAR(10), @ToDate ,101) + ''' '
			SET @strFromdate = @strFromdate + ' AND ( CONVERT(DATETIME,CONVERT(VARCHAR(10),VoucherDate,101), 101) <  '''+Convert(varchar(10),@FromDate,101)+'''   
													  OR 
													  (CONVERT(DATETIME,CONVERT(VARCHAR(10),VoucherDate,101), 101) =  '''+Convert(varchar(10),@FromDate,101)+''' AND TransactionTypeID=''T00'')
												    ) '
			SET @strFromdateAndTodate = @strFromdateAndTodate + ' AND (CONVERT(DATETIME,CONVERT(VARCHAR(10),VoucherDate,101), 101) Between  '''+Convert(varchar(10),@FromDate,101)+''' AND '''+convert(varchar(10), @ToDate,101)+''' ) 
																	  AND TransactionTypeID<>''T00'''
		End
		Else
		Begin
			SET @strTodate = @strTodate + ' AND (TranMonth + TranYear *100 <= '+STR(@ToMonth)+'+ '+STR(@ToYear)+'*100)'
			SET @strFromdate = @strFromdate + ' AND ( TranMonth + TranYear *100 < '+STR(@FromMonth)+'+ '+STR(@FromYear)+'*100
													  OR 
													  (TranMonth + TranYear *100 = '+STR(@FromMonth)+'+ '+STR(@FromYear)+'*100 AND TransactionTypeID=''T00'')
												    ) '
			SET @strFromdateAndTodate = @strFromdateAndTodate + ' AND (TranMonth + TranYear *100 Between  '+STR(@FromMonth)+'+ '+STR(@FromYear)+ '*100 AND '+STR(@ToMonth)+'+ '+STR(@ToYear)+ '*100 ) 
																	  AND TransactionTypeID<>''T00'''
		End
		--Search theo đơn vị
		IF Isnull(@StrDivisionID, '') != ''
			SET @StrDivisionID_New = @StrDivisionID_New + ' AND AT9000.DivisionID in (''' + @StrDivisionID+ ''')'
		Else
			SET @StrDivisionID_New = @StrDivisionID_New + ' AND AT9000.DivisionID = N''' + @DivisionID+ ''''

		--Search theo loại tiền
		IF Isnull(@CurrencyID, '') != ''
		BEGIN
			SET @sWHERE1 = @sWHERE1 + ' AND	CASE WHEN TransactionTypeID=''T16'' then CurrencyIDCN else AT9000.CurrencyID END = '''+@CurrencyID+''' '	
			SET @sWHERE2 = @sWHERE2 + ' AND	AT1016.CurrencyID = '''+@CurrencyID+''' '
		END

		Set @sSQL01 = N'
					SELECT  DivisionID,DivisionName,TranMonth,TranYear, TypeID, 
							Case when TypeID = N''112'' and Isnull(BankID, '''') <> '''' then BankID 
								 when TypeID = N''112'' and Isnull(BankID, '''') = '''' then N''OTHER''
								 else NULL end BankID, 
							Case when TypeID = N''112'' and Isnull(BankID, '''') <> '''' then BankName 
								 when TypeID = N''112'' and Isnull(BankID, '''') = '''' then N''OTHER''
								 else NULL end BankName,
							Case when TypeID = N''112'' and Isnull(BankID, '''') <> '''' then BankAccountNo 
								 when TypeID = N''112'' and Isnull(BankID, '''') = '''' then N''OTHER''
								 else NULL end BankAccountNo, 
							Case when TypeID = N''112'' and Isnull(BankID, '''') <> '''' then BankAccountID 
								 when TypeID = N''112'' and Isnull(BankID, '''') = '''' then N''OTHER''
								 else NULL end BankAccountID, 
							AccountID, CreditAccountID,DebitAccountID,CurrencyID,ExchangeRate,
							OriginalAmount,	ConvertedAmount,SignOriginalAmount,	SignConvertedAmount,VoucherDate,VoucherNo,VoucherID,ObjectID,VDescription,
							TDescription,BDescription,TransactionTypeID,D_C
					Into #BV3020 '
		Set @sSQL02 ='
					FROM (
						SELECT  Case when AT1005.SubGroupID = N''G0101'' then N''111'' else N''112'' end as TypeID, 
								AT9000.DivisionID,AT1101.DivisionName,AT9000.TranMonth,AT9000.TranYear,CreditBankAccountID AS BankAccountID,CreditAccountID AS AccountID, 
								CreditAccountID,DebitAccountID,
								CASE WHEN TransactionTypeID=''T16'' then CurrencyIDCN else AT9000.CurrencyID END AS CurrencyID,
								CASE WHEN TransactionTypeID=''T16'' then ExchangeRateCN else AT9000.ExchangeRate End AS ExchangeRate,
								CASE WHEN TransactionTypeID=''T16'' then OriginalAmountCN else OriginalAmount End AS OriginalAmount,ConvertedAmount,
								-CASE WHEN TransactionTypeID=''T16'' then OriginalAmountCN else OriginalAmount End AS SignOriginalAmount,-ConvertedAmount AS SignConvertedAmount,
								VoucherDate,VoucherNo,VoucherID,AT9000.ObjectID,VoucherTypeID, VDescription,TDescription,BDescription,TransactionTypeID,''C'' AS D_C,
								AT1016.BankID, AT1016.BankName, AT1016.BankAccountNo	 
						FROM	AT9000  WITH (NOLOCK)	
								LEFT JOIN AT1016 WITH (NOLOCK) on AT1016.BankAccountID = AT9000.CreditBankAccountID AND AT9000.CreditAccountID = ISNULL(AT1016.AccountID,'''')
								LEFT JOIN AT1101 WITH (NOLOCK) ON AT1101.DivisionID= AT9000.DivisionID
								LEFT JOIN AT1005 WITH (NOLOCK) ON AT1005.AccountID= AT9000.CreditAccountID
						WHERE 1 = 1	' + @strTodate + @StrDivisionID_New + ' AND AT1005.SubGroupID in (''G0101'', ''G0102'') '+@sWHERE1+'
						UNION ALL
						SELECT  Case when AT1005.SubGroupID = N''G0101'' then N''111'' else N''112'' end as TypeID, 
								AT9000.DivisionID,AT1101.DivisionName,AT9000.TranMonth,AT9000.TranYear,DebitBankAccountID AS BankAccountID,DebitAccountID AS AccountID, 
								CreditAccountID,DebitAccountID,AT1016.CurrencyID,AT9000.ExchangeRate,
								CASE WHEN AT1016.CurrencyID = (SELECT   top 1 BasecurrencyID from AT1101 WITH (NOLOCK) where  1 = 1 '+@StrDivisionID_New +') then ConvertedAmount else OriginalAmount end AS OriginalAmount,
								ConvertedAmount,
								CASE WHEN AT1016.CurrencyID = (SELECT  top  1  BasecurrencyID from AT1101 WITH (NOLOCK) where 1 = 1 '+@StrDivisionID_New +')  then ConvertedAmount else OriginalAmount end AS SignOriginalAmount,
								ConvertedAmount AS SignConvertedAmount,
								VoucherDate,VoucherNo,VoucherID,AT9000.ObjectID,VoucherTypeID, VDescription,TDescription,BDescription,TransactionTypeID,''D'' AS D_C,
								AT1016.BankID, AT1016.BankName, AT1016.BankAccountNo '
		SET @sSQL03='
						FROM	AT9000 WITH (NOLOCK) 	
								LEFT JOIN AT1016 WITH (NOLOCK) on AT1016.BankAccountID = AT9000.DebitBankAccountID AND AT9000.DebitAccountID = ISNULL(AT1016.AccountID,'''') 
								LEFT JOIN AT1101 WITH (NOLOCK) ON AT1101.DivisionID= AT9000.DivisionID
								LEFT JOIN AT1005 WITH (NOLOCK) ON AT1005.AccountID= AT9000.DebitAccountID
						WHERE 1 = 1 ' + @strTodate + @StrDivisionID_New+ ' AND AT1005.SubGroupID in (''G0101'', ''G0102'') '+@sWHERE2+'
								
					 )A 

					SELECT	BV3020.DivisionID, AT1101.DivisionName
							, Sum(Case when TypeID = N''111'' then Isnull(BV3020.SignOriginalAmount,0) else 0.0 end) as EndOriginalAmount_111
							, Sum(Case when TypeID = N''112'' then Isnull(BV3020.SignOriginalAmount,0) else 0.0 end) as EndOriginalAmount_112
							, Sum(Case when TypeID = N''111'' then Isnull(BV3020.SignConvertedAmount,0) else 0.0 end) as EndConvertedAmount_111
							, Sum(Case when TypeID = N''112'' then Isnull(BV3020.SignConvertedAmount,0) else 0.0 end) as EndConvertedAmount_112
					FROM	#BV3020 BV3020 LEFT JOIN AT1101 WITH (NOLOCK) on BV3020.DivisionID = AT1101.DivisionID
					Group by BV3020.DivisionID, AT1101.DivisionName
					Order by BV3020.DivisionID, AT1101.DivisionName
					'
		
		EXEC (@sSQL01+@sSQL02+@sSQL03)
		PRINT @sSQL01
		PRINT @sSQL02
		PRINT @sSQL03
		
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
