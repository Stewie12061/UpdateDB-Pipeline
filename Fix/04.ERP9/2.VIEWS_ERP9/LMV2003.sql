IF EXISTS (SELECT TOP 1 1 FROM DBO.SYSOBJECTS WHERE ID = OBJECT_ID(N'[DBO].[LMV2003]') AND OBJECTPROPERTY(ID, N'IsView') = 1)
DROP VIEW [DBO].[LMV2003]
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

--- Created on 03/07/2017 by Bảo Anh
--- View chứa dữ liệu tài sản đảm bảo (Asoft-LM)

CREATE VIEW [dbo].[LMV2003] 
AS
	Select AT1503.DivisionID, 1 as SourceID, N'Tài sản cố định' as SourceName, AT1503.AssetID as ItemID, AT1503.AssetName as ItemName
	FROM AT1503 WITH (NOLOCK)
	
	UNION ALL
	Select AT1302.DivisionID, 2 as SourceID, N'Hàng hóa' as SourceName, AT1302.InventoryID as ItemID, AT1302.InventoryName as ItemName
	FROM AT1302 WITH (NOLOCK)
	WHERE AT1302.[Disabled] = 0

	UNION ALL
	Select AT1020.DivisionID, 3 as SourceID, N'Hợp đồng bán' as SourceName, AT1020.ContractID as ItemID, AT1020.ContractName as ItemName
	FROM AT1020 WITH (NOLOCK)
	WHERE AT1020.ContractType = 1

	UNION ALL
	Select AT1016.DivisionID, 4 as SourceID, N'Tài khoản tiền gửi' as SourceName, AT1016.BankAccountID as ItemID, AT1016.BankAccountNo as ItemName
	FROM AT1016 WITH (NOLOCK)
	WHERE AT1016.[Disabled] = 0
	
GO
SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS ON
GO