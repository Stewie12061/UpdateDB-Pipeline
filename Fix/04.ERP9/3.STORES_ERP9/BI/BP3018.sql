IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[BP3018]') AND  OBJECTPROPERTY(ID, N'IsProcedure') = 1)			
DROP PROCEDURE [DBO].[BP3018]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
-- <Summary>
---- Báo cáo số dư tiền mặt, tiền gửi ngân hàng mẫu 1--BF3018
---- Dùng TypeID để phần nội dung báo cáo thành 2 phần [Tiền mặt] và [Tiền gửi ngân hàng]
---- Nếu trả ra TypeID = {111} thì dữ liệu này sẽ group 1 cấp: theo TypeID = {111}
---- Nếu trả ra TypeID = {112} thì dữ liệu này sẽ group 3 cấp: theo Group cấp 1 là TypeID = {112}, Group cấp 2 là BankID, Group cấp 3: BankAccountID+BankAccountNo
-- <Param>
---- 
-- <Return>
---- 
-- <Reference>
---- 
-- <History>
---- Create on 17/06/2019 by Hoàng vũ
---- exec BP3018 @DivisionID=N'BE',@BankID=N'',@AccountID=N'', @CurrencyID=N'',@FromMonth=6,@FromYear=2019,@ToMonth=6,@ToYear=2019,@FromDate='2019-06-01 00:00:00',@ToDate='2019-06-30 00:00:00',@IsDate=1,@StrDivisionID=N'VP'',''CDX'',''HTX'',''BE'',''CG'',''HA'',''HP'',''LE'',''LU'',''MR'',''NC'',''OR'',''PH'',''SU'',''TS'',''KT'',''OG'',''OP', @UserID = ''

CREATE PROCEDURE [dbo].[BP3018]  	
					@DivisionID AS nvarchar(50),	--Biến môi trường
					@StrDivisionID AS NVARCHAR(4000),	--Nếu có chọn từ DropdownChecklist ngược lại thì là NULL
					@IsDate tinyint,		--1=ngày; 0=Kỳ
					@FromDate AS datetime,
					@ToDate AS datetime,
					@FromMonth int,
					@FromYear int,
					@ToMonth int,
					@ToYear int,
					@AccountID AS nvarchar(50),			
					@BankID AS nvarchar(50),
					@CurrencyID AS nvarchar(50),
					@UserID AS nvarchar(50)			--Biến môi trường, UserID (đăng nhập)
					
AS
		Declare @sSQL01 AS nvarchar(max),
				@sSQL02 AS nvarchar(max),
				@sSQL03 AS nvarchar(max),
				@sSQL04 AS nvarchar(4000),
				@sSQL05 AS nvarchar(4000),
				@sSQL06 AS nvarchar(4000),
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

		--Search theo tài khoản
		IF Isnull(@AccountID, '') != ''
		BEGIN
			SET @sWHERE1 = @sWHERE1 + ' AND	AT9000.CreditAccountID like N'''+@AccountID+'%'''
			SET @sWHERE2 = @sWHERE2 + ' AND AT9000.DebitAccountID Like N'''+@AccountID+'%'''
		END

		--Search theo ngân hàng
		IF Isnull(@BankID, '') != ''
			SET @strBankID = @strBankID + ' AND Isnull(AV1111.BankID, '''') LIKE '''+@BankID+''''

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
							TDescription,BDescription,TransactionTypeID,D_C,Ana01ID,Ana02ID,Ana03ID,Ana04ID,Ana05ID,Ana06ID,Ana07ID,Ana08ID,Ana09ID,Ana10ID
					Into #BV301801 '
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
								Ana01ID, Ana02ID, Ana03ID, Ana04ID,	Ana05ID,AT9000.Ana06ID,	AT9000.Ana07ID,	AT9000.Ana08ID,AT9000.Ana09ID,AT9000.Ana10ID, AT1016.BankID, AT1016.BankName, AT1016.BankAccountNo	 
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
								Ana01ID, Ana02ID, Ana03ID, Ana04ID,	Ana05ID,AT9000.Ana06ID,	AT9000.Ana07ID,	AT9000.Ana08ID,AT9000.Ana09ID,AT9000.Ana10ID, AT1016.BankID, AT1016.BankName, AT1016.BankAccountNo 
						FROM	AT9000 WITH (NOLOCK) 	
								LEFT JOIN AT1016 WITH (NOLOCK) on AT1016.BankAccountID = AT9000.DebitBankAccountID AND AT9000.DebitAccountID = ISNULL(AT1016.AccountID,'''') 
								LEFT JOIN AT1101 WITH (NOLOCK) ON AT1101.DivisionID= AT9000.DivisionID
								LEFT JOIN AT1005 WITH (NOLOCK) ON AT1005.AccountID= AT9000.DebitAccountID
						WHERE 1 = 1 ' + @strTodate + @StrDivisionID_New+ ' AND AT1005.SubGroupID in (''G0101'', ''G0102'') '+@sWHERE2+'
								
					 )A '
		SET @sSQL03='
					-- Buoc 1a, So du dau ky/cuoi ky của tien mat, tien gui ngan hang
					SELECT	TypeID, Isnull(Sum(SignOriginalAmount),0) as BegOriginalAmount, Isnull(sum(SignConvertedAmount),0)as BegConvertedAmount
					Into #BV301802
					FROM	#BV301801 AV1111
					WHERE 1 = 1	' + @strFromdate + @strBankID + ' 
					Group by TypeID
					SELECT	TypeID, Isnull(Sum(SignOriginalAmount),0) as EndOriginalAmount, Isnull(sum(SignConvertedAmount),0) as EndConvertedAmount
					Into #BV301803 
					FROM	#BV301801 AV1111
					WHERE 1 = 1	' + @strTodate + @strBankID + ' 
					Group  by TypeID

					-- Buoc 1b, So du dau ky theo tai khoan ngan hang
					SELECT	AV1111.TypeID, AV1111.BankID, AV1111.BankName, AV1111.BankAccountID, AV1111.BankAccountNo
							, SUM(ISNULL(SignOriginalAmount,0)) AS  BegOriginalAmountBankAccountNo ,SUM(ISNULL(SignConvertedAmount,0)) AS BegConvertedAmountBankAccountNo
					Into #BV301804		
					FROM	#BV301801 AV1111 
					WHERE 1 = 1 ' + @strFromdate + @strBankID + ' 
					GROUP BY AV1111.TypeID, AV1111.BankID, AV1111.BankName, AV1111.BankAccountID, AV1111.BankAccountNo '
		SET @sSQL04 ='
					-- Buoc 2,  Xac dinh so phat sinh
					SELECT	AV1111.TypeID, AV1111.DivisionID, AV1111.DivisionName, TranMonth, TranYear,  CreditAccountID, DebitAccountID, AV1111.AccountID, 
							(CASE WHEN CreditAccountID <> AV1111.AccountID then CreditAccountID else DebitAccountID End ) AS CorAccountID,
							AV1111.BankName, 
							(Select BegOriginalAmount from #BV301802 A where A.TypeID = AV1111.TypeID) as BegOriginalAmount,
							(Select BegConvertedAmount from #BV301802 A where A.TypeID = AV1111.TypeID) as BegConvertedAmount,					 
							
							(Select EndOriginalAmount from #BV301803 B where B.TypeID = AV1111.TypeID) as EndOriginalAmount,
							(Select EndConvertedAmount from #BV301803 B where B.TypeID = AV1111.TypeID) as EndConvertedAmount,	
							
							ISNULL(BV301804.BegOriginalAmountBankAccountNo,0) AS BegOriginalAmountBankAccountNo,
							ISNULL(BV301804.BegConvertedAmountBankAccountNo,	0) AS BegConvertedAmountBankAccountNo,	
						 	CASE WHEN D_C = ''D'' then OriginalAmount else 0 End AS ReOriginalAmount, 
							CASE WHEN D_C = ''D'' then ConvertedAmount else 0 End AS ReConvertedAmount,
							CASE WHEN D_C = ''C'' then OriginalAmount else 0 End AS DeOriginalAmount, 
							CASE WHEN D_C = ''C'' then ConvertedAmount else 0 End AS DeConvertedAmount, 
							VoucherDate, VoucherNo, 
							CASE WHEN D_C = ''D'' then VoucherNo else NULL end AS ReVoucherNo, CASE WHEN D_C = ''C'' then VoucherNo else NULL end AS DeVoucherNo, 
							VDescription, TDescription, BDescription, AV1111.ObjectID, 
							CASE WHEN TransactionTypeID = ''T16'' AND D_C = ''C''  THEN ''T26'' ELSE TransactionTypeID  END AS TransactionTypeID , 
							D_C, Ana01ID,	Ana02ID,	Ana03ID,	Ana04ID,	Ana05ID,Ana06ID,	Ana07ID,	Ana08ID,	Ana09ID,	Ana10ID,
							AV1111.BankAccountID,  AV1111.CurrencyID, AV1111.BankAccountNo, AV1111.BankID
					Into #BV301805
					FROM	#BV301801 AV1111 	LEFT JOIN #BV301804 BV301804 on BV301804.BankID = AV1111.BankID AND BV301804.BankAccountID = AV1111.BankAccountID 
					WHERE 1 = 1 ' + @strFromdateAndTodate + @strBankID + ''
		SET @sSQL05 ='					 
					If Exists (Select top 1  1 From #BV301805) 
					Begin
						SELECT BV301805.DivisionID, BV301805.DivisionName, 
								BV301805.TranMonth, BV301805.TranYear, BV301805.VoucherDate, BV301805.VoucherNo, BV301805.TypeID, AT1005.AccountName as TypeName,
								BV301805.CreditAccountID, BV301805.DebitAccountID, BV301805.AccountID, BV301805.CorAccountID, 
								BV301805.BankID, BV301805.BankName, BV301805.BankAccountID,  BV301805.BankAccountNo, BV301805.CurrencyID,	
								BV301805.BegOriginalAmount, BV301805.BegConvertedAmount, 
								BV301805.EndOriginalAmount, BV301805.EndConvertedAmount, 
								BV301805.BegOriginalAmountBankAccountNo, BV301805.BegConvertedAmountBankAccountNo, BV301805.ReOriginalAmount, BV301805.ReConvertedAmount, BV301805.DeOriginalAmount, BV301805.DeConvertedAmount, 
								BV301805.ReVoucherNo, BV301805.DeVoucherNo, BV301805.VDescription, BV301805.TDescription, BV301805.BDescription, BV301805.ObjectID, BV301805.TransactionTypeID, BV301805.D_C, 
								BV301805.Ana01ID, BV301805.Ana02ID, BV301805.Ana03ID, BV301805.Ana04ID,	BV301805.Ana05ID, BV301805.Ana06ID, BV301805.Ana07ID, BV301805.Ana08ID, BV301805.Ana09ID, BV301805.Ana10ID
						FROM #BV301805 BV301805 LEFT JOIN AT1005 WITH (NOLOCK) on BV301805.TypeID = AT1005.AccountID
						UNION ALL
						SELECT	NULL as DivisionID, NULL as DivisionName, 
								NULL AS TranMonth, NULL AS TranYear, Convert(DateTime, NULL) AS VoucherDate, NULL as VoucherNo, BV301804.TypeID, AT1005.AccountName as TypeName,
								NULL AS CreditAccountID, NULL AS DebitAccountID, NULL AS AccountID, NULL AS CorAccountID, 
								BV301804.BankID, BV301804.BankName, BV301804.BankAccountID, BV301804.BankAccountNo, NULL AS CurrencyID,
								(Select BegOriginalAmount from #BV301802 A where A.TypeID = BV301804.TypeID) as BegOriginalAmount, (Select BegConvertedAmount from #BV301802 A where A.TypeID = BV301804.TypeID)as BegConvertedAmount,
								(Select EndOriginalAmount from #BV301803 B where B.TypeID = BV301804.TypeID) as EndOriginalAmount, (Select EndConvertedAmount from #BV301803 B where B.TypeID = BV301804.TypeID)as EndConvertedAmount,	
					 			BV301804.BegOriginalAmountBankAccountNo, BV301804.BegConvertedAmountBankAccountNo, 0 AS ReOriginalAmount, 0 AS ReConvertedAmount, 0 AS DeOriginalAmount, 0 AS DeConvertedAmount, 
								NULL AS ReVoucherNo, NULL AS DeVoucherNo, NULL AS VDescription, NULL AS TDescription, NULL AS BDescription, NULL AS ObjectID, ''TZZ'' AS TransactionTypeID,NULL AS D_C, 
								Null as	Ana01ID, Null as Ana02ID, Null as Ana03ID, Null as Ana04ID, Null as	Ana05ID, Null as Ana06ID, Null as Ana07ID, Null as Ana08ID, Null as	Ana09ID, Null as Ana10ID
						FROM	#BV301804 BV301804 LEFT JOIN AT1005 WITH (NOLOCK) on BV301804.TypeID = AT1005.AccountID
						WHERE	Isnull(BV301804.TypeID, '''') + Isnull(BV301804.BankAccountID, '''') + Isnull(BV301804.BankAccountNo, '''') 
								NOT IN (SELECT Isnull(TypeID, '''') +ISNULL(BankAccountID,'''') + ISNULL(BankAccountNo,'''') FROM #BV301805 ) 
						Order by TypeID, VoucherDate, BankID, BankAccountID
					End'
		SET @sSQL06 ='					 
					Else 
					Begin
						SELECT	NULL as DivisionID, NULL as DivisionName, 
									NULL AS TranMonth, NULL AS TranYear, NULL as VoucherNo, Convert(DateTime, NULL) AS VoucherDate, BV301804.TypeID, AT1005.AccountName as TypeName,
									NULL AS CreditAccountID, NULL AS DebitAccountID, NULL AS AccountID, NULL AS CorAccountID, 
									BV301804.BankID, BV301804.BankName, BV301804.BankAccountID, BV301804.BankAccountNo, NULL AS CurrencyID,
									(Select BegOriginalAmount from #BV301802 A where A.TypeID = BV301804.TypeID) as BegOriginalAmount, (Select BegConvertedAmount from #BV301802 A where A.TypeID = BV301804.TypeID)as BegConvertedAmount,					 
									(Select EndOriginalAmount from #BV301803 B where B.TypeID = BV301804.TypeID) as EndOriginalAmount, (Select EndConvertedAmount from #BV301803 B where B.TypeID = BV301804.TypeID)as EndConvertedAmount,	
					 				BV301804.BegOriginalAmountBankAccountNo, BV301804.BegConvertedAmountBankAccountNo, 0 AS ReOriginalAmount, 0 AS ReConvertedAmount, 0 AS DeOriginalAmount, 0 AS DeConvertedAmount, 
									NULL AS ReVoucherNo, NULL AS DeVoucherNo, NULL AS VDescription, NULL AS TDescription, NULL AS BDescription, NULL AS ObjectID, ''TZZ'' AS TransactionTypeID,NULL AS D_C, 
									Null as	Ana01ID, Null as Ana02ID, Null as Ana03ID, Null as Ana04ID, Null as	Ana05ID, Null as Ana06ID, Null as Ana07ID, Null as Ana08ID, Null as	Ana09ID, Null as Ana10ID
						FROM	#BV301804 BV301804 LEFT JOIN AT1005 WITH (NOLOCK) on BV301804.TypeID = AT1005.AccountID
						Order by TypeID, VoucherDate, BankID, BankAccountID
					End'

		EXEC (@sSQL01+@sSQL02+@sSQL03+@sSQL04+@sSQL05+@sSQL06)

GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO
