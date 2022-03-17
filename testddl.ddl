
CREATE TABLE [Auth]
( 
	[Auth_Id]            char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Auth_Lst_Nam]       varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Auth_Frst_Nam]      varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Auth_Phn_Nbr]       int  NULL ,
	[Auth_Addr]          varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Auth_Cty]           varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Auth_St]            varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Auth_Zip_Cd]        varchar(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Cntrct]             smallint  NULL 
)
go

CREATE TABLE [Bk_Ordr]
( 
	[Reschd_Ship_Dt]     datetime  NULL ,
	[Ordr_Ship_Id]       char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL 
	CONSTRAINT [DF__Bk_Ordr__Ordr_Sh__25869641]
		 DEFAULT  212,
	[Ordr_Nbr]           int  NOT NULL ,
	[Itm_Seq_Nbr]        int  NOT NULL 
)
go

ALTER TABLE [Bk_Ordr]
	 WITH CHECK ADD CONSTRAINT [area_codes_1160276702] CHECK  ( [Ordr_Ship_Id]=201 OR [Ordr_Ship_Id]=212 OR [Ordr_Ship_Id]=215 OR [Ordr_Ship_Id]=732 OR [Ordr_Ship_Id]=908 )
go

CREATE TABLE [Book]
( 
	[Book_Id]            char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Book_Nam]           varchar(80) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Book_Typ]           char(12) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL 
	CONSTRAINT [DF__Book__Book_Typ__2B3F6F97]
		 DEFAULT  'UNDECIDED',
	[Publshr_Id]         char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[MRSP_Prc]           money  NULL ,
	[Advnc]              money  NULL ,
	[Rylty_Trm]          int  NULL ,
	[Book_Note]          varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Publctn_Dt]         datetime  NULL 
)
go

CREATE TABLE [Book_Retrun]
( 
	[Book_Rtrn_Id]       char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Ordr_Nbr]           int  NULL ,
	[Itm_Seq_Nbr]        int  NULL ,
	[Book_Rtrn_Dt]       datetime  NULL 
)
go

CREATE TABLE [Book_YTD_Sls]
( 
	[Book_Id]            char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Yr_To_Dt_Sls_Amt]   decimal(10,2)  NULL ,
	[Yr_To_Dt_Sls_Dt]    datetime  NULL 
)
go

CREATE TABLE [BookAuth]
( 
	[Auth_Id]            char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Book_Id]            char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL 
)
go

CREATE TABLE [Crd_Card]
( 
	[Card_Nbr]           int  NULL ,
	[Card_Exp_Dt]        datetime  NULL ,
	[Crd_Card_Typ]       char(4) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Card_Vndr_Nam]      varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Crd_Card_Amt]       numeric(7,2)  NULL ,
	[Pmt_Nbr]            int  NOT NULL 
)
go

CREATE TABLE [Crd_Chk]
( 
	[Crd_Chk_Evnt]       char(12) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Crd_Chk_Dt]         datetime  NULL ,
	[Crd_Stat]           char(12) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Pmt_Nbr]            int  NOT NULL 
)
go

CREATE TABLE [Cust]
( 
	[Cust_Id]            char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Cust_Frst_Nam]      varchar(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Cust_Lst_Nam]       varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Cust_Stret_Addr]    varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Cust_Cmpy_Nam]      varchar(90) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Cust_Cty]           varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Cust_St]            varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL 
	CONSTRAINT [DF__Cust__Cust_St__35BCFE0A]
		 DEFAULT  'NJ',
	[Cust_Zip_Cd]        varchar(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Cust_Phn_Area_Cd]   int  NULL 
	CONSTRAINT [DF__Cust__Cust_Phn_A__36B12243]
		 DEFAULT  212,
	[Cust_Phn_Nbr]       int  NULL ,
	[Cust_Fax_Area_Cd]   int  NULL 
	CONSTRAINT [DF__Cust__Cust_Fax_A__37A5467C]
		 DEFAULT  212,
	[Cust_Fax_Nbr]       int  NULL 
)
go

ALTER TABLE [Cust]
	 WITH CHECK ADD CONSTRAINT [CK__Cust__Cust_Fax_A__38996AB5] CHECK  ( [Cust_Fax_Area_Cd]=201 OR [Cust_Fax_Area_Cd]=212 OR [Cust_Fax_Area_Cd]=215 OR [Cust_Fax_Area_Cd]=732 OR [Cust_Fax_Area_Cd]=908 )
go

CREATE TABLE [Disc]
( 
	[Disc_Typ]           varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Lo_Qty]             smallint  NULL ,
	[Hi_Qty]             smallint  NULL ,
	[Disc_Pct]           decimal(4,2)  NULL 
)
go

CREATE TABLE [Emp]
( 
	[Emp_Id]             char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Emp_Frst_Nam]       varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Emp_Mid_Init]       char(1) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Emp_Lst_Nam]        varchar(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Job_Id]             char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL 
	CONSTRAINT [DF__Emp__Job_Id__3D5E1FD2]
		 DEFAULT  1,
	[Curr_Emp_Job_Ttle]  tinyint  NULL 
	CONSTRAINT [DF__Emp__Curr_Emp_Jo__3F466844]
		 DEFAULT  10,
	[Emp_Hire_Dt]        datetime  NULL 
)
go

ALTER TABLE [Emp]
	 WITH CHECK ADD CONSTRAINT [CK__Emp__Job_Id__3E52440B] CHECK  ( [Job_Id]=201 OR [Job_Id]=212 OR [Job_Id]=215 OR [Job_Id]=732 OR [Job_Id]=908 )
go

CREATE TABLE [Job]
( 
	[Job_Id]             char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Job_Desc]           varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL 
	CONSTRAINT [DF__Job__Job_Desc__4222D4EF]
		 DEFAULT  'New Position - title not formalized yet',
	[Min_LvL]            tinyint  NULL ,
	[Max_LvL]            tinyint  NULL 
)
go

ALTER TABLE [Job]
	 WITH CHECK ADD CONSTRAINT [CK__Job__Min_LvL__4316F928] CHECK  ( Min_LvL >= 10 )
go

ALTER TABLE [Job]
	 WITH CHECK ADD CONSTRAINT [CK__Job__Max_LvL__440B1D61] CHECK  ( Max_LvL <= 250 )
go

CREATE TABLE [Mony_Ordr]
( 
	[Mony_Ordr_Nbr]      int  NULL ,
	[Mony_Ordr_Amt]      numeric(7,2)  NULL ,
	[Pmt_Nbr]            int  NOT NULL 
)
go

CREATE TABLE [Ordr_Itm]
( 
	[Ordr_Qty]           smallint  NULL ,
	[Ordr_Nbr]           int  NOT NULL ,
	[Book_Id]            char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Itm_Seq_Nbr]        int  NOT NULL ,
	[Disc_Typ]           varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Ordr_Disc_Amt]      decimal(7,2)  NULL ,
	[Ordr_Prc]           decimal(7,2)  NULL 
)
go

CREATE TABLE [Ordr_Ship]
( 
	[Ordr_Ship_Id]       char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Blng_Addr]          varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Ship_Addr]          varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Ship_Stat]          char(7) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Shed_Ship_Dt]       datetime  NULL ,
	[Ordr_Nbr]           int  NOT NULL ,
	[Itm_Seq_Nbr]        int  NOT NULL 
)
go

CREATE TABLE [Personal_Chk]
( 
	[Chk_Nbr]            int  NULL ,
	[Chk_Acct_Nbr]       int  NULL ,
	[Chk_Bnk_Nbr]        int  NULL ,
	[Chk_Dvr_Lic_Nbr]    char(15) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Chk_Amt]            numeric(7,2)  NULL ,
	[Pmt_Nbr]            int  NOT NULL 
)
go

CREATE TABLE [Pmt]
( 
	[Pmt_Nbr]            int  NOT NULL ,
	[Pmt_Dt]             datetime  NULL ,
	[Pmt_Amt]            decimal(7,2)  NULL ,
	[Pmt_Typ]            char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL 
)
go

CREATE TABLE [Publshr]
( 
	[Publshr_Id]         char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Publshr_Nam]        varchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Publshr_Addr]       varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Publshr_Cty]        varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Publshr_St]         varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL 
	CONSTRAINT [DF__Publshr__Publshr__5CD6CB2B]
		 DEFAULT  'USA',
	[Publshr_Zip_Cd]     varchar(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL 
)
go

CREATE TABLE [Publshr_Logo]
( 
	[Publshr_Id]         char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Publshr_Logo]       char(500) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Publshr_Publc_Rel_Inf] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL 
)
go

CREATE TABLE [Purchase_Ordr]
( 
	[Stor_Id]            char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Ordr_Nbr]           int  NOT NULL ,
	[Ordr_Dt]            datetime  NULL ,
	[Pmt_Trm]            varchar(12) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Cust_Id]            char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL 
)
go

CREATE TABLE [Reporting_Structure]
( 
	[Mngr]               char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Rpt_To]             char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Strt_Dt]            datetime  NULL ,
	[End_Dt]             datetime  NULL 
)
go

CREATE TABLE [Rgn]
( 
	[Rgn_Id]             char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Rgn_Area]           char(7) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Rgn_Desc]           varchar(75) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL 
)
go

CREATE TABLE [Rylty]
( 
	[Lo_Rnge]            int  NULL ,
	[Hi_Rnge]            int  NULL ,
	[Rylty_Amt]          numeric(5,2)  NULL ,
	[Rylty_Id]           char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL 
)
go

CREATE TABLE [Rylty_Hist]
( 
	[Ordr_Nbr]           int  NULL ,
	[Itm_Seq_Nbr]        int  NULL ,
	[Rylty_Hist_Id]      char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Rylty_Pmt_Dt]       datetime  NULL ,
	[Rylty_Pmt_Amt]      decimal(6,2)  NULL ,
	[Rylty_Payee]        char(30) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL 
)
go

CREATE TABLE [Rylty_Pmt]
( 
	[Auth_Id]            char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Book_Id]            char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Rylty_Id]           char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL 
	CONSTRAINT [DF__Rylty_Pmt__Rylty__6B24EA82]
		 DEFAULT  212,
	[Pmt_Dt]             datetime  NULL ,
	[Pmt_Amt]            decimal(7,2)  NULL 
)
go

ALTER TABLE [Rylty_Pmt]
	 WITH CHECK ADD CONSTRAINT [CK__Rylty_Pmt__Rylty__6C190EBB] CHECK  ( [Rylty_Id]=201 OR [Rylty_Id]=212 OR [Rylty_Id]=215 OR [Rylty_Id]=732 OR [Rylty_Id]=908 )
go

CREATE TABLE [Stor_Nam]
( 
	[Stor_Id]            char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Stor_Nam]           varchar(40) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Stor_Addr]          varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Stor_Cty]           varchar(25) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Stor_St]            varchar(4) COLLATE SQL_Latin1_General_CP1_CI_AS  NOT NULL ,
	[Stor_Zip_Cd]        varchar(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL ,
	[Rgn_Id]             char(9) COLLATE SQL_Latin1_General_CP1_CI_AS  NULL 
)
go

ALTER TABLE [Auth]
	ADD CONSTRAINT [UPKCL_auidind] PRIMARY KEY  NONCLUSTERED ([Auth_Id] ASC)
go

CREATE NONCLUSTERED INDEX [aunmind] ON [Auth]
( 
	[Auth_Lst_Nam]        ASC,
	[Auth_Frst_Nam]       ASC
)
go

ALTER TABLE [Bk_Ordr]
	ADD CONSTRAINT [PK__Bk_Ordr__6BCBAB92C4053D88] PRIMARY KEY  NONCLUSTERED ([Ordr_Ship_Id] ASC,[Ordr_Nbr] ASC,[Itm_Seq_Nbr] ASC)
go

ALTER TABLE [Book]
	ADD CONSTRAINT [PK__Book__C223F3B50F90692D] PRIMARY KEY  NONCLUSTERED ([Book_Id] ASC)
go

CREATE NONCLUSTERED INDEX [titleind] ON [Book]
( 
	[Book_Nam]            ASC
)
go

ALTER TABLE [Book_Retrun]
	ADD CONSTRAINT [PK__Book_Ret__6ED33A40EA064C00] PRIMARY KEY  NONCLUSTERED ([Book_Rtrn_Id] ASC)
go

ALTER TABLE [Book_YTD_Sls]
	ADD CONSTRAINT [PK__Book_YTD__C223F3B598E3D592] PRIMARY KEY  NONCLUSTERED ([Book_Id] ASC)
go

ALTER TABLE [BookAuth]
	ADD CONSTRAINT [PK__BookAuth__8155C09CDFFBF44C] PRIMARY KEY  NONCLUSTERED ([Auth_Id] ASC,[Book_Id] ASC)
go

ALTER TABLE [Crd_Card]
	ADD CONSTRAINT [PK__Crd_Card__E0247AF2C08F8328] PRIMARY KEY  NONCLUSTERED ([Pmt_Nbr] ASC)
go

ALTER TABLE [Crd_Chk]
	ADD CONSTRAINT [PK__Crd_Chk__093D0BB39F6F4AC1] PRIMARY KEY  NONCLUSTERED ([Crd_Chk_Evnt] ASC)
go

ALTER TABLE [Cust]
	ADD CONSTRAINT [PK__Cust__7B895116649BA9B7] PRIMARY KEY  NONCLUSTERED ([Cust_Id] ASC)
go

CREATE NONCLUSTERED INDEX [XIE1Customer] ON [Cust]
( 
	[Cust_Lst_Nam]        ASC,
	[Cust_Frst_Nam]       ASC
)
go

ALTER TABLE [Disc]
	ADD CONSTRAINT [PK__Disc__CFD23D955AECD3F0] PRIMARY KEY  NONCLUSTERED ([Disc_Typ] ASC)
go

ALTER TABLE [Emp]
	ADD CONSTRAINT [PK__Emp__262359AAB22D5CC5] PRIMARY KEY  NONCLUSTERED ([Emp_Id] ASC)
go

CREATE NONCLUSTERED INDEX [employee_ind] ON [Emp]
( 
	[Emp_Lst_Nam]         ASC,
	[Emp_Frst_Nam]        ASC,
	[Emp_Mid_Init]        ASC
)
go

ALTER TABLE [Job]
	ADD CONSTRAINT [PK__Job__E76A76A707FFFDD0] PRIMARY KEY  NONCLUSTERED ([Job_Id] ASC)
go

ALTER TABLE [Ordr_Itm]
	ADD CONSTRAINT [PK__Ordr_Itm__86B11EC031D2B52E] PRIMARY KEY  NONCLUSTERED ([Ordr_Nbr] ASC,[Itm_Seq_Nbr] ASC)
go

ALTER TABLE [Ordr_Ship]
	ADD CONSTRAINT [PK__Ordr_Shi__6BCBAB929A70D58F] PRIMARY KEY  NONCLUSTERED ([Ordr_Ship_Id] ASC,[Ordr_Nbr] ASC,[Itm_Seq_Nbr] ASC)
go

ALTER TABLE [Pmt]
	ADD CONSTRAINT [PK__Pmt__E0247AF23D390169] PRIMARY KEY  NONCLUSTERED ([Pmt_Nbr] ASC)
go

ALTER TABLE [Publshr]
	ADD CONSTRAINT [PK__Publshr__0DB97A1F36E7E59D] PRIMARY KEY  NONCLUSTERED ([Publshr_Id] ASC)
go

ALTER TABLE [Publshr_Logo]
	ADD CONSTRAINT [PK__Publshr___0DB97A1FF5785073] PRIMARY KEY  NONCLUSTERED ([Publshr_Id] ASC)
go

ALTER TABLE [Purchase_Ordr]
	ADD CONSTRAINT [PK__Purchase__21166C71952EE273] PRIMARY KEY  NONCLUSTERED ([Ordr_Nbr] ASC)
go

ALTER TABLE [Reporting_Structure]
	ADD CONSTRAINT [PK__Reportin__B19CCE0E2267948B] PRIMARY KEY  NONCLUSTERED ([Mngr] ASC,[Rpt_To] ASC)
go

ALTER TABLE [Rgn]
	ADD CONSTRAINT [PK__Rgn__486E59D785131505] PRIMARY KEY  NONCLUSTERED ([Rgn_Id] ASC)
go

ALTER TABLE [Rylty]
	ADD CONSTRAINT [PK__Rylty__483E391A4EBA0D05] PRIMARY KEY  NONCLUSTERED ([Rylty_Id] ASC)
go

ALTER TABLE [Rylty_Hist]
	ADD CONSTRAINT [PK__Rylty_Hi__702FC1236230F103] PRIMARY KEY  NONCLUSTERED ([Rylty_Hist_Id] ASC)
go

ALTER TABLE [Rylty_Pmt]
	ADD CONSTRAINT [PK__Rylty_Pm__9B1DFEA59153EC42] PRIMARY KEY  NONCLUSTERED ([Auth_Id] ASC,[Book_Id] ASC,[Rylty_Id] ASC)
go

ALTER TABLE [Stor_Nam]
	ADD CONSTRAINT [PK__Stor_Nam__347B83C5E1B9D8EC] PRIMARY KEY  NONCLUSTERED ([Stor_Id] ASC)
go

CREATE VIEW [titleview]([Book_Nam],[Auth_Id],[Auth_Lst_Nam],[MRSP_Prc],[Publshr_Id])
AS
SELECT [Book].[Book_Nam],[Auth].[Auth_Id],[Auth].[Auth_Lst_Nam],[Book].[MRSP_Prc],[Book].[Publshr_Id]
	FROM [BookAuth],[Auth],[Book]
go

CREATE VIEW [Order_View]([Stor_Nam],[Ordr_Nbr],[Ordr_Dt],[Book_Nam],[Ordr_Qty],[Ordr_Disc_Amt],[Ordr_Prc])
AS
SELECT [Stor_Nam].[Stor_Nam],[Purchase_Ordr].[Ordr_Nbr],[Purchase_Ordr].[Ordr_Dt],[Book].[Book_Nam],[Ordr_Itm].[Ordr_Qty],[Ordr_Itm].[Ordr_Disc_Amt],[Ordr_Itm].[Ordr_Prc]
	FROM [Stor_Nam],[Purchase_Ordr],[Book],[Ordr_Itm]
go

CREATE VIEW [Publisher_View]([Emp_Frst_Nam],[Emp_Lst_Nam],[Publshr_Nam],[Book_Nam],[Yr_To_Dt_Sls_Amt])
AS
SELECT [Emp].[Emp_Frst_Nam],[Emp].[Emp_Lst_Nam],[Publshr].[Publshr_Nam],[Book].[Book_Nam],[Book_YTD_Sls].[Yr_To_Dt_Sls_Amt]
	FROM [Emp],[Book_YTD_Sls],[Book],[Publshr]
go

CREATE VIEW [Payment_View]([Card_Nbr],[Crd_Card_Amt],[Mony_Ordr_Nbr],[Mony_Ordr_Amt],[Chk_Nbr],[Chk_Amt],[Cust_Frst_Nam],[Cust_Lst_Nam],[Ordr_Nbr],[Ordr_Dt])
AS
SELECT [Crd_Card].[Card_Nbr],[Crd_Card].[Crd_Card_Amt],[Mony_Ordr].[Mony_Ordr_Nbr],[Mony_Ordr].[Mony_Ordr_Amt],[Personal_Chk].[Chk_Nbr],[Personal_Chk].[Chk_Amt],[Cust].[Cust_Frst_Nam],[Cust].[Cust_Lst_Nam],[Purchase_Ordr].[Ordr_Nbr],[Purchase_Ordr].[Ordr_Dt]
	FROM [Purchase_Ordr],[Cust],[Personal_Chk],[Crd_Card],[Pmt],[Mony_Ordr]
go


ALTER TABLE [Bk_Ordr] WITH CHECK 
	ADD CONSTRAINT [FK__Bk_Ordr__73BA3083] FOREIGN KEY ([Ordr_Ship_Id],[Ordr_Nbr],[Itm_Seq_Nbr]) REFERENCES [Ordr_Ship]([Ordr_Ship_Id],[Ordr_Nbr],[Itm_Seq_Nbr])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Bk_Ordr]
	  WITH CHECK CHECK CONSTRAINT [FK__Bk_Ordr__73BA3083]
go


ALTER TABLE [Book] WITH CHECK 
	ADD CONSTRAINT [FK__Book__Publshr_Id__74AE54BC] FOREIGN KEY ([Publshr_Id]) REFERENCES [Publshr]([Publshr_Id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Book]
	  WITH CHECK CHECK CONSTRAINT [FK__Book__Publshr_Id__74AE54BC]
go


ALTER TABLE [Book_Retrun] WITH CHECK 
	ADD CONSTRAINT [FK__Book_Retrun__75A278F5] FOREIGN KEY ([Ordr_Nbr],[Itm_Seq_Nbr]) REFERENCES [Ordr_Itm]([Ordr_Nbr],[Itm_Seq_Nbr])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Book_Retrun]
	  WITH CHECK CHECK CONSTRAINT [FK__Book_Retrun__75A278F5]
go


ALTER TABLE [Book_YTD_Sls] WITH CHECK 
	ADD CONSTRAINT [FK__Book_YTD___Book___76969D2E] FOREIGN KEY ([Book_Id]) REFERENCES [Book]([Book_Id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Book_YTD_Sls]
	  WITH CHECK CHECK CONSTRAINT [FK__Book_YTD___Book___76969D2E]
go


ALTER TABLE [BookAuth] WITH CHECK 
	ADD CONSTRAINT [FK__BookAuth__Auth_I__778AC167] FOREIGN KEY ([Auth_Id]) REFERENCES [Auth]([Auth_Id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [BookAuth]
	  WITH CHECK CHECK CONSTRAINT [FK__BookAuth__Auth_I__778AC167]
go

ALTER TABLE [BookAuth] WITH CHECK 
	ADD CONSTRAINT [FK__BookAuth__Book_I__787EE5A0] FOREIGN KEY ([Book_Id]) REFERENCES [Book]([Book_Id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [BookAuth]
	  WITH CHECK CHECK CONSTRAINT [FK__BookAuth__Book_I__787EE5A0]
go


ALTER TABLE [Crd_Chk] WITH CHECK 
	ADD CONSTRAINT [FK__Crd_Chk__Pmt_Nbr__797309D9] FOREIGN KEY ([Pmt_Nbr]) REFERENCES [Crd_Card]([Pmt_Nbr])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Crd_Chk]
	  WITH CHECK CHECK CONSTRAINT [FK__Crd_Chk__Pmt_Nbr__797309D9]
go


ALTER TABLE [Emp] WITH CHECK 
	ADD CONSTRAINT [FK__Emp__Job_Id__7A672E12] FOREIGN KEY ([Job_Id]) REFERENCES [Job]([Job_Id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Emp]
	  WITH CHECK CHECK CONSTRAINT [FK__Emp__Job_Id__7A672E12]
go


ALTER TABLE [Mony_Ordr] WITH CHECK 
	ADD CONSTRAINT [FK__Mony_Ordr__Pmt_N__7B5B524B] FOREIGN KEY ([Pmt_Nbr]) REFERENCES [Pmt]([Pmt_Nbr])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [Mony_Ordr]
	  WITH CHECK CHECK CONSTRAINT [FK__Mony_Ordr__Pmt_N__7B5B524B]
go


ALTER TABLE [Ordr_Itm] WITH CHECK 
	ADD CONSTRAINT [FK__Ordr_Itm__Disc_T__7C4F7684] FOREIGN KEY ([Disc_Typ]) REFERENCES [Disc]([Disc_Typ])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Ordr_Itm]
	  WITH CHECK CHECK CONSTRAINT [FK__Ordr_Itm__Disc_T__7C4F7684]
go

ALTER TABLE [Ordr_Itm] WITH CHECK 
	ADD CONSTRAINT [FK__Ordr_Itm__Ordr_N__7D439ABD] FOREIGN KEY ([Ordr_Nbr]) REFERENCES [Purchase_Ordr]([Ordr_Nbr])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Ordr_Itm]
	  WITH CHECK CHECK CONSTRAINT [FK__Ordr_Itm__Ordr_N__7D439ABD]
go

ALTER TABLE [Ordr_Itm] WITH CHECK 
	ADD CONSTRAINT [FK__Ordr_Itm__Book_I__7E37BEF6] FOREIGN KEY ([Book_Id]) REFERENCES [Book]([Book_Id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Ordr_Itm]
	  WITH CHECK CHECK CONSTRAINT [FK__Ordr_Itm__Book_I__7E37BEF6]
go


ALTER TABLE [Ordr_Ship] WITH CHECK 
	ADD CONSTRAINT [FK__Ordr_Ship__7F2BE32F] FOREIGN KEY ([Ordr_Nbr],[Itm_Seq_Nbr]) REFERENCES [Ordr_Itm]([Ordr_Nbr],[Itm_Seq_Nbr])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Ordr_Ship]
	  WITH CHECK CHECK CONSTRAINT [FK__Ordr_Ship__7F2BE32F]
go


ALTER TABLE [Personal_Chk] WITH CHECK 
	ADD CONSTRAINT [FK__Personal___Pmt_N__00200768] FOREIGN KEY ([Pmt_Nbr]) REFERENCES [Pmt]([Pmt_Nbr])
		ON DELETE CASCADE
		ON UPDATE CASCADE
go

ALTER TABLE [Personal_Chk]
	  WITH CHECK CHECK CONSTRAINT [FK__Personal___Pmt_N__00200768]
go


ALTER TABLE [Publshr_Logo] WITH CHECK 
	ADD CONSTRAINT [FK__Publshr_L__Publs__01142BA1] FOREIGN KEY ([Publshr_Id]) REFERENCES [Publshr]([Publshr_Id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Publshr_Logo]
	  WITH CHECK CHECK CONSTRAINT [FK__Publshr_L__Publs__01142BA1]
go


ALTER TABLE [Purchase_Ordr] WITH CHECK 
	ADD CONSTRAINT [FK__Purchase___Cust___02084FDA] FOREIGN KEY ([Cust_Id]) REFERENCES [Cust]([Cust_Id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Purchase_Ordr]
	  WITH CHECK CHECK CONSTRAINT [FK__Purchase___Cust___02084FDA]
go

ALTER TABLE [Purchase_Ordr] WITH CHECK 
	ADD CONSTRAINT [FK__Purchase___Stor___02FC7413] FOREIGN KEY ([Stor_Id]) REFERENCES [Stor_Nam]([Stor_Id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Purchase_Ordr]
	  WITH CHECK CHECK CONSTRAINT [FK__Purchase___Stor___02FC7413]
go


ALTER TABLE [Reporting_Structure] WITH CHECK 
	ADD CONSTRAINT [FK__Reporting___Mngr__03F0984C] FOREIGN KEY ([Mngr]) REFERENCES [Emp]([Emp_Id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Reporting_Structure]
	  WITH CHECK CHECK CONSTRAINT [FK__Reporting___Mngr__03F0984C]
go

ALTER TABLE [Reporting_Structure] WITH CHECK 
	ADD CONSTRAINT [FK__Reporting__Rpt_T__04E4BC85] FOREIGN KEY ([Rpt_To]) REFERENCES [Emp]([Emp_Id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Reporting_Structure]
	  WITH CHECK CHECK CONSTRAINT [FK__Reporting__Rpt_T__04E4BC85]
go


ALTER TABLE [Rylty_Hist] WITH CHECK 
	ADD CONSTRAINT [FK__Rylty_Hist__05D8E0BE] FOREIGN KEY ([Ordr_Nbr],[Itm_Seq_Nbr]) REFERENCES [Ordr_Itm]([Ordr_Nbr],[Itm_Seq_Nbr])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Rylty_Hist]
	  WITH CHECK CHECK CONSTRAINT [FK__Rylty_Hist__05D8E0BE]
go


ALTER TABLE [Rylty_Pmt] WITH CHECK 
	ADD CONSTRAINT [FK__Rylty_Pmt__Rylty__06CD04F7] FOREIGN KEY ([Rylty_Id]) REFERENCES [Rylty]([Rylty_Id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Rylty_Pmt]
	  WITH CHECK CHECK CONSTRAINT [FK__Rylty_Pmt__Rylty__06CD04F7]
go

ALTER TABLE [Rylty_Pmt] WITH CHECK 
	ADD CONSTRAINT [FK__Rylty_Pmt__07C12930] FOREIGN KEY ([Auth_Id],[Book_Id]) REFERENCES [BookAuth]([Auth_Id],[Book_Id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Rylty_Pmt]
	  WITH CHECK CHECK CONSTRAINT [FK__Rylty_Pmt__07C12930]
go


ALTER TABLE [Stor_Nam] WITH CHECK 
	ADD CONSTRAINT [FK__Stor_Nam__Rgn_Id__08B54D69] FOREIGN KEY ([Rgn_Id]) REFERENCES [Rgn]([Rgn_Id])
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
go

ALTER TABLE [Stor_Nam]
	  WITH CHECK CHECK CONSTRAINT [FK__Stor_Nam__Rgn_Id__08B54D69]
go

CREATE PROCEDURE [reptq1]   
   
 AS BEGIN
   select 
	case when grouping(pub_id) = 1 then 'ALL' 
             else pub_id end as pub_id, avg(price) as avg_price
   from titles
   where price is NOT NULL
   group by pub_id with rollup
   order by pub_id;
END;
go

CREATE PROCEDURE [reptq2]   
   
 AS BEGIN
   select 
      case when grouping(type) = 1 then 'ALL' 
      else type end as type, 
      case when grouping(pub_id) = 1 then 'ALL' 
      else pub_id end as pub_id, avg(ytd_sales) as avg_ytd_sales
   from titles
   where pub_id is NOT NULL
   group by pub_id, type with rollup;
END;
go

CREATE TRIGGER dbo.tD_Auth ON dbo.Auth FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Auth */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Auth  dbo.BookAuth on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00011a05", PARENT_OWNER="dbo", PARENT_TABLE="Auth"
    CHILD_OWNER="dbo", CHILD_TABLE="BookAuth"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__BookAuth__Auth_I__778AC167", FK_COLUMNS="Auth_Id" */
    IF EXISTS (
      SELECT * FROM deleted,dbo.BookAuth
      WHERE
        /*  %JoinFKPK(dbo.BookAuth,deleted," = "," AND") */
        dbo.BookAuth.Auth_Id = deleted.Auth_Id
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete dbo.Auth because dbo.BookAuth exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Auth ON dbo.Auth FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Auth */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insAuth_Id char(9),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Auth  dbo.BookAuth on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00013288", PARENT_OWNER="dbo", PARENT_TABLE="Auth"
    CHILD_OWNER="dbo", CHILD_TABLE="BookAuth"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__BookAuth__Auth_I__778AC167", FK_COLUMNS="Auth_Id" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Auth_Id)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,dbo.BookAuth
      WHERE
        /*  %JoinFKPK(dbo.BookAuth,deleted," = "," AND") */
        dbo.BookAuth.Auth_Id = deleted.Auth_Id
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update dbo.Auth because dbo.BookAuth exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Bk_Ordr ON dbo.Bk_Ordr FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Bk_Ordr */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Ordr_Ship  dbo.Bk_Ordr on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001e015", PARENT_OWNER="dbo", PARENT_TABLE="Ordr_Ship"
    CHILD_OWNER="dbo", CHILD_TABLE="Bk_Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Bk_Ordr__73BA3083", FK_COLUMNS="Ordr_Ship_Id""Ordr_Nbr""Itm_Seq_Nbr" */
    IF EXISTS (SELECT * FROM deleted,dbo.Ordr_Ship
      WHERE
        /* %JoinFKPK(deleted,dbo.Ordr_Ship," = "," AND") */
        deleted.Ordr_Ship_Id = dbo.Ordr_Ship.Ordr_Ship_Id AND
        deleted.Ordr_Nbr = dbo.Ordr_Ship.Ordr_Nbr AND
        deleted.Itm_Seq_Nbr = dbo.Ordr_Ship.Itm_Seq_Nbr AND
        NOT EXISTS (
          SELECT * FROM dbo.Bk_Ordr
          WHERE
            /* %JoinFKPK(dbo.Bk_Ordr,dbo.Ordr_Ship," = "," AND") */
            dbo.Bk_Ordr.Ordr_Ship_Id = dbo.Ordr_Ship.Ordr_Ship_Id AND
            dbo.Bk_Ordr.Ordr_Nbr = dbo.Ordr_Ship.Ordr_Nbr AND
            dbo.Bk_Ordr.Itm_Seq_Nbr = dbo.Ordr_Ship.Itm_Seq_Nbr
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.Bk_Ordr because dbo.Ordr_Ship exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Bk_Ordr ON dbo.Bk_Ordr FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Bk_Ordr */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insOrdr_Ship_Id char(9), 
           @insOrdr_Nbr int, 
           @insItm_Seq_Nbr int,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Ordr_Ship  dbo.Bk_Ordr on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001d93b", PARENT_OWNER="dbo", PARENT_TABLE="Ordr_Ship"
    CHILD_OWNER="dbo", CHILD_TABLE="Bk_Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Bk_Ordr__73BA3083", FK_COLUMNS="Ordr_Ship_Id""Ordr_Nbr""Itm_Seq_Nbr" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Ordr_Ship_Id) OR
    UPDATE(Ordr_Nbr) OR
    UPDATE(Itm_Seq_Nbr)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Ordr_Ship
        WHERE
          /* %JoinFKPK(inserted,dbo.Ordr_Ship) */
          inserted.Ordr_Ship_Id = dbo.Ordr_Ship.Ordr_Ship_Id and
          inserted.Ordr_Nbr = dbo.Ordr_Ship.Ordr_Nbr and
          inserted.Itm_Seq_Nbr = dbo.Ordr_Ship.Itm_Seq_Nbr
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.Bk_Ordr because dbo.Ordr_Ship does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Book ON dbo.Book FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Book */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Book  dbo.Ordr_Itm on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00047730", PARENT_OWNER="dbo", PARENT_TABLE="Book"
    CHILD_OWNER="dbo", CHILD_TABLE="Ordr_Itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Ordr_Itm__Book_I__7E37BEF6", FK_COLUMNS="Book_Id" */
    IF EXISTS (
      SELECT * FROM deleted,dbo.Ordr_Itm
      WHERE
        /*  %JoinFKPK(dbo.Ordr_Itm,deleted," = "," AND") */
        dbo.Ordr_Itm.Book_Id = deleted.Book_Id
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete dbo.Book because dbo.Ordr_Itm exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* dbo.Book  dbo.BookAuth on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Book"
    CHILD_OWNER="dbo", CHILD_TABLE="BookAuth"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__BookAuth__Book_I__787EE5A0", FK_COLUMNS="Book_Id" */
    IF EXISTS (
      SELECT * FROM deleted,dbo.BookAuth
      WHERE
        /*  %JoinFKPK(dbo.BookAuth,deleted," = "," AND") */
        dbo.BookAuth.Book_Id = deleted.Book_Id
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete dbo.Book because dbo.BookAuth exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* dbo.Book  dbo.Book_YTD_Sls on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Book"
    CHILD_OWNER="dbo", CHILD_TABLE="Book_YTD_Sls"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Book_YTD___Book___76969D2E", FK_COLUMNS="Book_Id" */
    IF EXISTS (
      SELECT * FROM deleted,dbo.Book_YTD_Sls
      WHERE
        /*  %JoinFKPK(dbo.Book_YTD_Sls,deleted," = "," AND") */
        dbo.Book_YTD_Sls.Book_Id = deleted.Book_Id
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete dbo.Book because dbo.Book_YTD_Sls exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* dbo.Publshr  dbo.Book on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Publshr"
    CHILD_OWNER="dbo", CHILD_TABLE="Book"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Book__Publshr_Id__74AE54BC", FK_COLUMNS="Publshr_Id" */
    IF EXISTS (SELECT * FROM deleted,dbo.Publshr
      WHERE
        /* %JoinFKPK(deleted,dbo.Publshr," = "," AND") */
        deleted.Publshr_Id = dbo.Publshr.Publshr_Id AND
        NOT EXISTS (
          SELECT * FROM dbo.Book
          WHERE
            /* %JoinFKPK(dbo.Book,dbo.Publshr," = "," AND") */
            dbo.Book.Publshr_Id = dbo.Publshr.Publshr_Id
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.Book because dbo.Publshr exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Book ON dbo.Book FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Book */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insBook_Id char(9),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Book  dbo.Ordr_Itm on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0004ea38", PARENT_OWNER="dbo", PARENT_TABLE="Book"
    CHILD_OWNER="dbo", CHILD_TABLE="Ordr_Itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Ordr_Itm__Book_I__7E37BEF6", FK_COLUMNS="Book_Id" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Book_Id)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,dbo.Ordr_Itm
      WHERE
        /*  %JoinFKPK(dbo.Ordr_Itm,deleted," = "," AND") */
        dbo.Ordr_Itm.Book_Id = deleted.Book_Id
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update dbo.Book because dbo.Ordr_Itm exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* dbo.Book  dbo.BookAuth on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Book"
    CHILD_OWNER="dbo", CHILD_TABLE="BookAuth"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__BookAuth__Book_I__787EE5A0", FK_COLUMNS="Book_Id" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Book_Id)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,dbo.BookAuth
      WHERE
        /*  %JoinFKPK(dbo.BookAuth,deleted," = "," AND") */
        dbo.BookAuth.Book_Id = deleted.Book_Id
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update dbo.Book because dbo.BookAuth exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* dbo.Book  dbo.Book_YTD_Sls on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Book"
    CHILD_OWNER="dbo", CHILD_TABLE="Book_YTD_Sls"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Book_YTD___Book___76969D2E", FK_COLUMNS="Book_Id" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Book_Id)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,dbo.Book_YTD_Sls
      WHERE
        /*  %JoinFKPK(dbo.Book_YTD_Sls,deleted," = "," AND") */
        dbo.Book_YTD_Sls.Book_Id = deleted.Book_Id
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update dbo.Book because dbo.Book_YTD_Sls exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* dbo.Publshr  dbo.Book on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Publshr"
    CHILD_OWNER="dbo", CHILD_TABLE="Book"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Book__Publshr_Id__74AE54BC", FK_COLUMNS="Publshr_Id" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Publshr_Id)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Publshr
        WHERE
          /* %JoinFKPK(inserted,dbo.Publshr) */
          inserted.Publshr_Id = dbo.Publshr.Publshr_Id
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Publshr_Id IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.Book because dbo.Publshr does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Book_Retrun ON dbo.Book_Retrun FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Book_Retrun */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Ordr_Itm  dbo.Book_Retrun on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001a9a9", PARENT_OWNER="dbo", PARENT_TABLE="Ordr_Itm"
    CHILD_OWNER="dbo", CHILD_TABLE="Book_Retrun"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Book_Retrun__75A278F5", FK_COLUMNS="Ordr_Nbr""Itm_Seq_Nbr" */
    IF EXISTS (SELECT * FROM deleted,dbo.Ordr_Itm
      WHERE
        /* %JoinFKPK(deleted,dbo.Ordr_Itm," = "," AND") */
        deleted.Ordr_Nbr = dbo.Ordr_Itm.Ordr_Nbr AND
        deleted.Itm_Seq_Nbr = dbo.Ordr_Itm.Itm_Seq_Nbr AND
        NOT EXISTS (
          SELECT * FROM dbo.Book_Retrun
          WHERE
            /* %JoinFKPK(dbo.Book_Retrun,dbo.Ordr_Itm," = "," AND") */
            dbo.Book_Retrun.Ordr_Nbr = dbo.Ordr_Itm.Ordr_Nbr AND
            dbo.Book_Retrun.Itm_Seq_Nbr = dbo.Ordr_Itm.Itm_Seq_Nbr
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.Book_Retrun because dbo.Ordr_Itm exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Book_Retrun ON dbo.Book_Retrun FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Book_Retrun */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insBook_Rtrn_Id char(9),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Ordr_Itm  dbo.Book_Retrun on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001d341", PARENT_OWNER="dbo", PARENT_TABLE="Ordr_Itm"
    CHILD_OWNER="dbo", CHILD_TABLE="Book_Retrun"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Book_Retrun__75A278F5", FK_COLUMNS="Ordr_Nbr""Itm_Seq_Nbr" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Ordr_Nbr) OR
    UPDATE(Itm_Seq_Nbr)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Ordr_Itm
        WHERE
          /* %JoinFKPK(inserted,dbo.Ordr_Itm) */
          inserted.Ordr_Nbr = dbo.Ordr_Itm.Ordr_Nbr and
          inserted.Itm_Seq_Nbr = dbo.Ordr_Itm.Itm_Seq_Nbr
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Ordr_Nbr IS NULL AND
      inserted.Itm_Seq_Nbr IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.Book_Retrun because dbo.Ordr_Itm does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Book_YTD_Sls ON dbo.Book_YTD_Sls FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Book_YTD_Sls */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Book  dbo.Book_YTD_Sls on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00016ed0", PARENT_OWNER="dbo", PARENT_TABLE="Book"
    CHILD_OWNER="dbo", CHILD_TABLE="Book_YTD_Sls"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Book_YTD___Book___76969D2E", FK_COLUMNS="Book_Id" */
    IF EXISTS (SELECT * FROM deleted,dbo.Book
      WHERE
        /* %JoinFKPK(deleted,dbo.Book," = "," AND") */
        deleted.Book_Id = dbo.Book.Book_Id AND
        NOT EXISTS (
          SELECT * FROM dbo.Book_YTD_Sls
          WHERE
            /* %JoinFKPK(dbo.Book_YTD_Sls,dbo.Book," = "," AND") */
            dbo.Book_YTD_Sls.Book_Id = dbo.Book.Book_Id
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.Book_YTD_Sls because dbo.Book exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Book_YTD_Sls ON dbo.Book_YTD_Sls FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Book_YTD_Sls */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insBook_Id char(9),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Book  dbo.Book_YTD_Sls on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000187d1", PARENT_OWNER="dbo", PARENT_TABLE="Book"
    CHILD_OWNER="dbo", CHILD_TABLE="Book_YTD_Sls"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Book_YTD___Book___76969D2E", FK_COLUMNS="Book_Id" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Book_Id)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Book
        WHERE
          /* %JoinFKPK(inserted,dbo.Book) */
          inserted.Book_Id = dbo.Book.Book_Id
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.Book_YTD_Sls because dbo.Book does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_BookAuth ON dbo.BookAuth FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on BookAuth */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.BookAuth  dbo.Rylty_Pmt on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003b4da", PARENT_OWNER="dbo", PARENT_TABLE="BookAuth"
    CHILD_OWNER="dbo", CHILD_TABLE="Rylty_Pmt"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Rylty_Pmt__07C12930", FK_COLUMNS="Auth_Id""Book_Id" */
    IF EXISTS (
      SELECT * FROM deleted,dbo.Rylty_Pmt
      WHERE
        /*  %JoinFKPK(dbo.Rylty_Pmt,deleted," = "," AND") */
        dbo.Rylty_Pmt.Auth_Id = deleted.Auth_Id AND
        dbo.Rylty_Pmt.Book_Id = deleted.Book_Id
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete dbo.BookAuth because dbo.Rylty_Pmt exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* dbo.Book  dbo.BookAuth on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Book"
    CHILD_OWNER="dbo", CHILD_TABLE="BookAuth"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__BookAuth__Book_I__787EE5A0", FK_COLUMNS="Book_Id" */
    IF EXISTS (SELECT * FROM deleted,dbo.Book
      WHERE
        /* %JoinFKPK(deleted,dbo.Book," = "," AND") */
        deleted.Book_Id = dbo.Book.Book_Id AND
        NOT EXISTS (
          SELECT * FROM dbo.BookAuth
          WHERE
            /* %JoinFKPK(dbo.BookAuth,dbo.Book," = "," AND") */
            dbo.BookAuth.Book_Id = dbo.Book.Book_Id
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.BookAuth because dbo.Book exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* dbo.Auth  dbo.BookAuth on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Auth"
    CHILD_OWNER="dbo", CHILD_TABLE="BookAuth"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__BookAuth__Auth_I__778AC167", FK_COLUMNS="Auth_Id" */
    IF EXISTS (SELECT * FROM deleted,dbo.Auth
      WHERE
        /* %JoinFKPK(deleted,dbo.Auth," = "," AND") */
        deleted.Auth_Id = dbo.Auth.Auth_Id AND
        NOT EXISTS (
          SELECT * FROM dbo.BookAuth
          WHERE
            /* %JoinFKPK(dbo.BookAuth,dbo.Auth," = "," AND") */
            dbo.BookAuth.Auth_Id = dbo.Auth.Auth_Id
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.BookAuth because dbo.Auth exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_BookAuth ON dbo.BookAuth FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on BookAuth */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insAuth_Id char(9), 
           @insBook_Id char(9),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.BookAuth  dbo.Rylty_Pmt on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000409e2", PARENT_OWNER="dbo", PARENT_TABLE="BookAuth"
    CHILD_OWNER="dbo", CHILD_TABLE="Rylty_Pmt"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Rylty_Pmt__07C12930", FK_COLUMNS="Auth_Id""Book_Id" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Auth_Id) OR
    UPDATE(Book_Id)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,dbo.Rylty_Pmt
      WHERE
        /*  %JoinFKPK(dbo.Rylty_Pmt,deleted," = "," AND") */
        dbo.Rylty_Pmt.Auth_Id = deleted.Auth_Id AND
        dbo.Rylty_Pmt.Book_Id = deleted.Book_Id
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update dbo.BookAuth because dbo.Rylty_Pmt exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* dbo.Book  dbo.BookAuth on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Book"
    CHILD_OWNER="dbo", CHILD_TABLE="BookAuth"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__BookAuth__Book_I__787EE5A0", FK_COLUMNS="Book_Id" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Book_Id)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Book
        WHERE
          /* %JoinFKPK(inserted,dbo.Book) */
          inserted.Book_Id = dbo.Book.Book_Id
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.BookAuth because dbo.Book does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* dbo.Auth  dbo.BookAuth on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Auth"
    CHILD_OWNER="dbo", CHILD_TABLE="BookAuth"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__BookAuth__Auth_I__778AC167", FK_COLUMNS="Auth_Id" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Auth_Id)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Auth
        WHERE
          /* %JoinFKPK(inserted,dbo.Auth) */
          inserted.Auth_Id = dbo.Auth.Auth_Id
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.BookAuth because dbo.Auth does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Crd_Card ON dbo.Crd_Card FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Crd_Card */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Crd_Card  dbo.Crd_Chk on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000126e0", PARENT_OWNER="dbo", PARENT_TABLE="Crd_Card"
    CHILD_OWNER="dbo", CHILD_TABLE="Crd_Chk"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Crd_Chk__Pmt_Nbr__797309D9", FK_COLUMNS="Pmt_Nbr" */
    IF EXISTS (
      SELECT * FROM deleted,dbo.Crd_Chk
      WHERE
        /*  %JoinFKPK(dbo.Crd_Chk,deleted," = "," AND") */
        dbo.Crd_Chk.Pmt_Nbr = deleted.Pmt_Nbr
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete dbo.Crd_Card because dbo.Crd_Chk exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Crd_Card ON dbo.Crd_Card FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Crd_Card */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPmt_Nbr int,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Crd_Card  dbo.Crd_Chk on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00013000", PARENT_OWNER="dbo", PARENT_TABLE="Crd_Card"
    CHILD_OWNER="dbo", CHILD_TABLE="Crd_Chk"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Crd_Chk__Pmt_Nbr__797309D9", FK_COLUMNS="Pmt_Nbr" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Pmt_Nbr)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,dbo.Crd_Chk
      WHERE
        /*  %JoinFKPK(dbo.Crd_Chk,deleted," = "," AND") */
        dbo.Crd_Chk.Pmt_Nbr = deleted.Pmt_Nbr
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update dbo.Crd_Card because dbo.Crd_Chk exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Crd_Chk ON dbo.Crd_Chk FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Crd_Chk */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Crd_Card  dbo.Crd_Chk on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00016a14", PARENT_OWNER="dbo", PARENT_TABLE="Crd_Card"
    CHILD_OWNER="dbo", CHILD_TABLE="Crd_Chk"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Crd_Chk__Pmt_Nbr__797309D9", FK_COLUMNS="Pmt_Nbr" */
    IF EXISTS (SELECT * FROM deleted,dbo.Crd_Card
      WHERE
        /* %JoinFKPK(deleted,dbo.Crd_Card," = "," AND") */
        deleted.Pmt_Nbr = dbo.Crd_Card.Pmt_Nbr AND
        NOT EXISTS (
          SELECT * FROM dbo.Crd_Chk
          WHERE
            /* %JoinFKPK(dbo.Crd_Chk,dbo.Crd_Card," = "," AND") */
            dbo.Crd_Chk.Pmt_Nbr = dbo.Crd_Card.Pmt_Nbr
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.Crd_Chk because dbo.Crd_Card exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Crd_Chk ON dbo.Crd_Chk FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Crd_Chk */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCrd_Chk_Evnt char(12),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Crd_Card  dbo.Crd_Chk on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001728b", PARENT_OWNER="dbo", PARENT_TABLE="Crd_Card"
    CHILD_OWNER="dbo", CHILD_TABLE="Crd_Chk"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Crd_Chk__Pmt_Nbr__797309D9", FK_COLUMNS="Pmt_Nbr" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Pmt_Nbr)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Crd_Card
        WHERE
          /* %JoinFKPK(inserted,dbo.Crd_Card) */
          inserted.Pmt_Nbr = dbo.Crd_Card.Pmt_Nbr
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.Crd_Chk because dbo.Crd_Card does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Cust ON dbo.Cust FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Cust */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Cust  dbo.Purchase_Ordr on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001267d", PARENT_OWNER="dbo", PARENT_TABLE="Cust"
    CHILD_OWNER="dbo", CHILD_TABLE="Purchase_Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Purchase___Cust___02084FDA", FK_COLUMNS="Cust_Id" */
    IF EXISTS (
      SELECT * FROM deleted,dbo.Purchase_Ordr
      WHERE
        /*  %JoinFKPK(dbo.Purchase_Ordr,deleted," = "," AND") */
        dbo.Purchase_Ordr.Cust_Id = deleted.Cust_Id
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete dbo.Cust because dbo.Purchase_Ordr exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Cust ON dbo.Cust FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Cust */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insCust_Id char(9),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Cust  dbo.Purchase_Ordr on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00014586", PARENT_OWNER="dbo", PARENT_TABLE="Cust"
    CHILD_OWNER="dbo", CHILD_TABLE="Purchase_Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Purchase___Cust___02084FDA", FK_COLUMNS="Cust_Id" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Cust_Id)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,dbo.Purchase_Ordr
      WHERE
        /*  %JoinFKPK(dbo.Purchase_Ordr,deleted," = "," AND") */
        dbo.Purchase_Ordr.Cust_Id = deleted.Cust_Id
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update dbo.Cust because dbo.Purchase_Ordr exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Disc ON dbo.Disc FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Disc */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Disc  dbo.Ordr_Itm on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00011995", PARENT_OWNER="dbo", PARENT_TABLE="Disc"
    CHILD_OWNER="dbo", CHILD_TABLE="Ordr_Itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Ordr_Itm__Disc_T__7C4F7684", FK_COLUMNS="Disc_Typ" */
    IF EXISTS (
      SELECT * FROM deleted,dbo.Ordr_Itm
      WHERE
        /*  %JoinFKPK(dbo.Ordr_Itm,deleted," = "," AND") */
        dbo.Ordr_Itm.Disc_Typ = deleted.Disc_Typ
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete dbo.Disc because dbo.Ordr_Itm exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Disc ON dbo.Disc FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Disc */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insDisc_Typ varchar(4),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Disc  dbo.Ordr_Itm on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000131fa", PARENT_OWNER="dbo", PARENT_TABLE="Disc"
    CHILD_OWNER="dbo", CHILD_TABLE="Ordr_Itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Ordr_Itm__Disc_T__7C4F7684", FK_COLUMNS="Disc_Typ" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Disc_Typ)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,dbo.Ordr_Itm
      WHERE
        /*  %JoinFKPK(dbo.Ordr_Itm,deleted," = "," AND") */
        dbo.Ordr_Itm.Disc_Typ = deleted.Disc_Typ
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update dbo.Disc because dbo.Ordr_Itm exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Emp ON dbo.Emp FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Emp */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Emp  dbo.Reporting_Structure on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00035903", PARENT_OWNER="dbo", PARENT_TABLE="Emp"
    CHILD_OWNER="dbo", CHILD_TABLE="Reporting_Structure"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Reporting__Rpt_T__04E4BC85", FK_COLUMNS="Rpt_To" */
    IF EXISTS (
      SELECT * FROM deleted,dbo.Reporting_Structure
      WHERE
        /*  %JoinFKPK(dbo.Reporting_Structure,deleted," = "," AND") */
        dbo.Reporting_Structure.Rpt_To = deleted.Emp_Id
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete dbo.Emp because dbo.Reporting_Structure exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* dbo.Emp  dbo.Reporting_Structure on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Emp"
    CHILD_OWNER="dbo", CHILD_TABLE="Reporting_Structure"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Reporting___Mngr__03F0984C", FK_COLUMNS="Mngr" */
    IF EXISTS (
      SELECT * FROM deleted,dbo.Reporting_Structure
      WHERE
        /*  %JoinFKPK(dbo.Reporting_Structure,deleted," = "," AND") */
        dbo.Reporting_Structure.Mngr = deleted.Emp_Id
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete dbo.Emp because dbo.Reporting_Structure exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* dbo.Job  dbo.Emp on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Job"
    CHILD_OWNER="dbo", CHILD_TABLE="Emp"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Emp__Job_Id__7A672E12", FK_COLUMNS="Job_Id" */
    IF EXISTS (SELECT * FROM deleted,dbo.Job
      WHERE
        /* %JoinFKPK(deleted,dbo.Job," = "," AND") */
        deleted.Job_Id = dbo.Job.Job_Id AND
        NOT EXISTS (
          SELECT * FROM dbo.Emp
          WHERE
            /* %JoinFKPK(dbo.Emp,dbo.Job," = "," AND") */
            dbo.Emp.Job_Id = dbo.Job.Job_Id
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.Emp because dbo.Job exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Emp ON dbo.Emp FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Emp */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insEmp_Id char(9),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Emp  dbo.Reporting_Structure on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0003bcd2", PARENT_OWNER="dbo", PARENT_TABLE="Emp"
    CHILD_OWNER="dbo", CHILD_TABLE="Reporting_Structure"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Reporting__Rpt_T__04E4BC85", FK_COLUMNS="Rpt_To" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Emp_Id)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,dbo.Reporting_Structure
      WHERE
        /*  %JoinFKPK(dbo.Reporting_Structure,deleted," = "," AND") */
        dbo.Reporting_Structure.Rpt_To = deleted.Emp_Id
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update dbo.Emp because dbo.Reporting_Structure exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* dbo.Emp  dbo.Reporting_Structure on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Emp"
    CHILD_OWNER="dbo", CHILD_TABLE="Reporting_Structure"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Reporting___Mngr__03F0984C", FK_COLUMNS="Mngr" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Emp_Id)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,dbo.Reporting_Structure
      WHERE
        /*  %JoinFKPK(dbo.Reporting_Structure,deleted," = "," AND") */
        dbo.Reporting_Structure.Mngr = deleted.Emp_Id
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update dbo.Emp because dbo.Reporting_Structure exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* dbo.Job  dbo.Emp on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Job"
    CHILD_OWNER="dbo", CHILD_TABLE="Emp"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Emp__Job_Id__7A672E12", FK_COLUMNS="Job_Id" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Job_Id)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Job
        WHERE
          /* %JoinFKPK(inserted,dbo.Job) */
          inserted.Job_Id = dbo.Job.Job_Id
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.Emp because dbo.Job does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Job ON dbo.Job FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Job */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Job  dbo.Emp on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00011680", PARENT_OWNER="dbo", PARENT_TABLE="Job"
    CHILD_OWNER="dbo", CHILD_TABLE="Emp"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Emp__Job_Id__7A672E12", FK_COLUMNS="Job_Id" */
    IF EXISTS (
      SELECT * FROM deleted,dbo.Emp
      WHERE
        /*  %JoinFKPK(dbo.Emp,deleted," = "," AND") */
        dbo.Emp.Job_Id = deleted.Job_Id
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete dbo.Job because dbo.Emp exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Job ON dbo.Job FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Job */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insJob_Id char(9),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Job  dbo.Emp on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00011ea3", PARENT_OWNER="dbo", PARENT_TABLE="Job"
    CHILD_OWNER="dbo", CHILD_TABLE="Emp"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Emp__Job_Id__7A672E12", FK_COLUMNS="Job_Id" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Job_Id)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,dbo.Emp
      WHERE
        /*  %JoinFKPK(dbo.Emp,deleted," = "," AND") */
        dbo.Emp.Job_Id = deleted.Job_Id
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update dbo.Job because dbo.Emp exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Mony_Ordr ON dbo.Mony_Ordr FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Mony_Ordr */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Pmt  dbo.Mony_Ordr on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00015564", PARENT_OWNER="dbo", PARENT_TABLE="Pmt"
    CHILD_OWNER="dbo", CHILD_TABLE="Mony_Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Mony_Ordr__Pmt_N__7B5B524B", FK_COLUMNS="Pmt_Nbr" */
    IF EXISTS (SELECT * FROM deleted,dbo.Pmt
      WHERE
        /* %JoinFKPK(deleted,dbo.Pmt," = "," AND") */
        deleted.Pmt_Nbr = dbo.Pmt.Pmt_Nbr AND
        NOT EXISTS (
          SELECT * FROM dbo.Mony_Ordr
          WHERE
            /* %JoinFKPK(dbo.Mony_Ordr,dbo.Pmt," = "," AND") */
            dbo.Mony_Ordr.Pmt_Nbr = dbo.Pmt.Pmt_Nbr
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.Mony_Ordr because dbo.Pmt exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Mony_Ordr ON dbo.Mony_Ordr FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Mony_Ordr */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Pmt  dbo.Mony_Ordr on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00016be7", PARENT_OWNER="dbo", PARENT_TABLE="Pmt"
    CHILD_OWNER="dbo", CHILD_TABLE="Mony_Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Mony_Ordr__Pmt_N__7B5B524B", FK_COLUMNS="Pmt_Nbr" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Pmt_Nbr)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Pmt
        WHERE
          /* %JoinFKPK(inserted,dbo.Pmt) */
          inserted.Pmt_Nbr = dbo.Pmt.Pmt_Nbr
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.Mony_Ordr because dbo.Pmt does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Ordr_Itm ON dbo.Ordr_Itm FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Ordr_Itm */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Ordr_Itm  dbo.Rylty_Hist on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0007457f", PARENT_OWNER="dbo", PARENT_TABLE="Ordr_Itm"
    CHILD_OWNER="dbo", CHILD_TABLE="Rylty_Hist"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Rylty_Hist__05D8E0BE", FK_COLUMNS="Ordr_Nbr""Itm_Seq_Nbr" */
    IF EXISTS (
      SELECT * FROM deleted,dbo.Rylty_Hist
      WHERE
        /*  %JoinFKPK(dbo.Rylty_Hist,deleted," = "," AND") */
        dbo.Rylty_Hist.Ordr_Nbr = deleted.Ordr_Nbr AND
        dbo.Rylty_Hist.Itm_Seq_Nbr = deleted.Itm_Seq_Nbr
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete dbo.Ordr_Itm because dbo.Rylty_Hist exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* dbo.Ordr_Itm  dbo.Ordr_Ship on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Ordr_Itm"
    CHILD_OWNER="dbo", CHILD_TABLE="Ordr_Ship"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Ordr_Ship__7F2BE32F", FK_COLUMNS="Ordr_Nbr""Itm_Seq_Nbr" */
    IF EXISTS (
      SELECT * FROM deleted,dbo.Ordr_Ship
      WHERE
        /*  %JoinFKPK(dbo.Ordr_Ship,deleted," = "," AND") */
        dbo.Ordr_Ship.Ordr_Nbr = deleted.Ordr_Nbr AND
        dbo.Ordr_Ship.Itm_Seq_Nbr = deleted.Itm_Seq_Nbr
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete dbo.Ordr_Itm because dbo.Ordr_Ship exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* dbo.Ordr_Itm  dbo.Book_Retrun on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Ordr_Itm"
    CHILD_OWNER="dbo", CHILD_TABLE="Book_Retrun"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Book_Retrun__75A278F5", FK_COLUMNS="Ordr_Nbr""Itm_Seq_Nbr" */
    IF EXISTS (
      SELECT * FROM deleted,dbo.Book_Retrun
      WHERE
        /*  %JoinFKPK(dbo.Book_Retrun,deleted," = "," AND") */
        dbo.Book_Retrun.Ordr_Nbr = deleted.Ordr_Nbr AND
        dbo.Book_Retrun.Itm_Seq_Nbr = deleted.Itm_Seq_Nbr
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete dbo.Ordr_Itm because dbo.Book_Retrun exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* dbo.Book  dbo.Ordr_Itm on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Book"
    CHILD_OWNER="dbo", CHILD_TABLE="Ordr_Itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Ordr_Itm__Book_I__7E37BEF6", FK_COLUMNS="Book_Id" */
    IF EXISTS (SELECT * FROM deleted,dbo.Book
      WHERE
        /* %JoinFKPK(deleted,dbo.Book," = "," AND") */
        deleted.Book_Id = dbo.Book.Book_Id AND
        NOT EXISTS (
          SELECT * FROM dbo.Ordr_Itm
          WHERE
            /* %JoinFKPK(dbo.Ordr_Itm,dbo.Book," = "," AND") */
            dbo.Ordr_Itm.Book_Id = dbo.Book.Book_Id
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.Ordr_Itm because dbo.Book exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* dbo.Purchase_Ordr  dbo.Ordr_Itm on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Purchase_Ordr"
    CHILD_OWNER="dbo", CHILD_TABLE="Ordr_Itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Ordr_Itm__Ordr_N__7D439ABD", FK_COLUMNS="Ordr_Nbr" */
    IF EXISTS (SELECT * FROM deleted,dbo.Purchase_Ordr
      WHERE
        /* %JoinFKPK(deleted,dbo.Purchase_Ordr," = "," AND") */
        deleted.Ordr_Nbr = dbo.Purchase_Ordr.Ordr_Nbr AND
        NOT EXISTS (
          SELECT * FROM dbo.Ordr_Itm
          WHERE
            /* %JoinFKPK(dbo.Ordr_Itm,dbo.Purchase_Ordr," = "," AND") */
            dbo.Ordr_Itm.Ordr_Nbr = dbo.Purchase_Ordr.Ordr_Nbr
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.Ordr_Itm because dbo.Purchase_Ordr exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* dbo.Disc  dbo.Ordr_Itm on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Disc"
    CHILD_OWNER="dbo", CHILD_TABLE="Ordr_Itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Ordr_Itm__Disc_T__7C4F7684", FK_COLUMNS="Disc_Typ" */
    IF EXISTS (SELECT * FROM deleted,dbo.Disc
      WHERE
        /* %JoinFKPK(deleted,dbo.Disc," = "," AND") */
        deleted.Disc_Typ = dbo.Disc.Disc_Typ AND
        NOT EXISTS (
          SELECT * FROM dbo.Ordr_Itm
          WHERE
            /* %JoinFKPK(dbo.Ordr_Itm,dbo.Disc," = "," AND") */
            dbo.Ordr_Itm.Disc_Typ = dbo.Disc.Disc_Typ
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.Ordr_Itm because dbo.Disc exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Ordr_Itm ON dbo.Ordr_Itm FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Ordr_Itm */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insOrdr_Nbr int, 
           @insItm_Seq_Nbr int,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Ordr_Itm  dbo.Rylty_Hist on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00083d93", PARENT_OWNER="dbo", PARENT_TABLE="Ordr_Itm"
    CHILD_OWNER="dbo", CHILD_TABLE="Rylty_Hist"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Rylty_Hist__05D8E0BE", FK_COLUMNS="Ordr_Nbr""Itm_Seq_Nbr" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Ordr_Nbr) OR
    UPDATE(Itm_Seq_Nbr)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,dbo.Rylty_Hist
      WHERE
        /*  %JoinFKPK(dbo.Rylty_Hist,deleted," = "," AND") */
        dbo.Rylty_Hist.Ordr_Nbr = deleted.Ordr_Nbr AND
        dbo.Rylty_Hist.Itm_Seq_Nbr = deleted.Itm_Seq_Nbr
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update dbo.Ordr_Itm because dbo.Rylty_Hist exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* dbo.Ordr_Itm  dbo.Ordr_Ship on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Ordr_Itm"
    CHILD_OWNER="dbo", CHILD_TABLE="Ordr_Ship"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Ordr_Ship__7F2BE32F", FK_COLUMNS="Ordr_Nbr""Itm_Seq_Nbr" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Ordr_Nbr) OR
    UPDATE(Itm_Seq_Nbr)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,dbo.Ordr_Ship
      WHERE
        /*  %JoinFKPK(dbo.Ordr_Ship,deleted," = "," AND") */
        dbo.Ordr_Ship.Ordr_Nbr = deleted.Ordr_Nbr AND
        dbo.Ordr_Ship.Itm_Seq_Nbr = deleted.Itm_Seq_Nbr
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update dbo.Ordr_Itm because dbo.Ordr_Ship exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* dbo.Ordr_Itm  dbo.Book_Retrun on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Ordr_Itm"
    CHILD_OWNER="dbo", CHILD_TABLE="Book_Retrun"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Book_Retrun__75A278F5", FK_COLUMNS="Ordr_Nbr""Itm_Seq_Nbr" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Ordr_Nbr) OR
    UPDATE(Itm_Seq_Nbr)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,dbo.Book_Retrun
      WHERE
        /*  %JoinFKPK(dbo.Book_Retrun,deleted," = "," AND") */
        dbo.Book_Retrun.Ordr_Nbr = deleted.Ordr_Nbr AND
        dbo.Book_Retrun.Itm_Seq_Nbr = deleted.Itm_Seq_Nbr
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update dbo.Ordr_Itm because dbo.Book_Retrun exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* dbo.Book  dbo.Ordr_Itm on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Book"
    CHILD_OWNER="dbo", CHILD_TABLE="Ordr_Itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Ordr_Itm__Book_I__7E37BEF6", FK_COLUMNS="Book_Id" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Book_Id)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Book
        WHERE
          /* %JoinFKPK(inserted,dbo.Book) */
          inserted.Book_Id = dbo.Book.Book_Id
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.Ordr_Itm because dbo.Book does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* dbo.Purchase_Ordr  dbo.Ordr_Itm on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Purchase_Ordr"
    CHILD_OWNER="dbo", CHILD_TABLE="Ordr_Itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Ordr_Itm__Ordr_N__7D439ABD", FK_COLUMNS="Ordr_Nbr" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Ordr_Nbr)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Purchase_Ordr
        WHERE
          /* %JoinFKPK(inserted,dbo.Purchase_Ordr) */
          inserted.Ordr_Nbr = dbo.Purchase_Ordr.Ordr_Nbr
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.Ordr_Itm because dbo.Purchase_Ordr does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* dbo.Disc  dbo.Ordr_Itm on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Disc"
    CHILD_OWNER="dbo", CHILD_TABLE="Ordr_Itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Ordr_Itm__Disc_T__7C4F7684", FK_COLUMNS="Disc_Typ" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Disc_Typ)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Disc
        WHERE
          /* %JoinFKPK(inserted,dbo.Disc) */
          inserted.Disc_Typ = dbo.Disc.Disc_Typ
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Disc_Typ IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.Ordr_Itm because dbo.Disc does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Ordr_Ship ON dbo.Ordr_Ship FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Ordr_Ship */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Ordr_Ship  dbo.Bk_Ordr on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002e3cc", PARENT_OWNER="dbo", PARENT_TABLE="Ordr_Ship"
    CHILD_OWNER="dbo", CHILD_TABLE="Bk_Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Bk_Ordr__73BA3083", FK_COLUMNS="Ordr_Ship_Id""Ordr_Nbr""Itm_Seq_Nbr" */
    IF EXISTS (
      SELECT * FROM deleted,dbo.Bk_Ordr
      WHERE
        /*  %JoinFKPK(dbo.Bk_Ordr,deleted," = "," AND") */
        dbo.Bk_Ordr.Ordr_Ship_Id = deleted.Ordr_Ship_Id AND
        dbo.Bk_Ordr.Ordr_Nbr = deleted.Ordr_Nbr AND
        dbo.Bk_Ordr.Itm_Seq_Nbr = deleted.Itm_Seq_Nbr
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete dbo.Ordr_Ship because dbo.Bk_Ordr exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* dbo.Ordr_Itm  dbo.Ordr_Ship on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Ordr_Itm"
    CHILD_OWNER="dbo", CHILD_TABLE="Ordr_Ship"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Ordr_Ship__7F2BE32F", FK_COLUMNS="Ordr_Nbr""Itm_Seq_Nbr" */
    IF EXISTS (SELECT * FROM deleted,dbo.Ordr_Itm
      WHERE
        /* %JoinFKPK(deleted,dbo.Ordr_Itm," = "," AND") */
        deleted.Ordr_Nbr = dbo.Ordr_Itm.Ordr_Nbr AND
        deleted.Itm_Seq_Nbr = dbo.Ordr_Itm.Itm_Seq_Nbr AND
        NOT EXISTS (
          SELECT * FROM dbo.Ordr_Ship
          WHERE
            /* %JoinFKPK(dbo.Ordr_Ship,dbo.Ordr_Itm," = "," AND") */
            dbo.Ordr_Ship.Ordr_Nbr = dbo.Ordr_Itm.Ordr_Nbr AND
            dbo.Ordr_Ship.Itm_Seq_Nbr = dbo.Ordr_Itm.Itm_Seq_Nbr
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.Ordr_Ship because dbo.Ordr_Itm exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Ordr_Ship ON dbo.Ordr_Ship FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Ordr_Ship */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insOrdr_Ship_Id char(9), 
           @insOrdr_Nbr int, 
           @insItm_Seq_Nbr int,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Ordr_Ship  dbo.Bk_Ordr on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0003111b", PARENT_OWNER="dbo", PARENT_TABLE="Ordr_Ship"
    CHILD_OWNER="dbo", CHILD_TABLE="Bk_Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Bk_Ordr__73BA3083", FK_COLUMNS="Ordr_Ship_Id""Ordr_Nbr""Itm_Seq_Nbr" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Ordr_Ship_Id) OR
    UPDATE(Ordr_Nbr) OR
    UPDATE(Itm_Seq_Nbr)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,dbo.Bk_Ordr
      WHERE
        /*  %JoinFKPK(dbo.Bk_Ordr,deleted," = "," AND") */
        dbo.Bk_Ordr.Ordr_Ship_Id = deleted.Ordr_Ship_Id AND
        dbo.Bk_Ordr.Ordr_Nbr = deleted.Ordr_Nbr AND
        dbo.Bk_Ordr.Itm_Seq_Nbr = deleted.Itm_Seq_Nbr
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update dbo.Ordr_Ship because dbo.Bk_Ordr exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* dbo.Ordr_Itm  dbo.Ordr_Ship on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Ordr_Itm"
    CHILD_OWNER="dbo", CHILD_TABLE="Ordr_Ship"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Ordr_Ship__7F2BE32F", FK_COLUMNS="Ordr_Nbr""Itm_Seq_Nbr" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Ordr_Nbr) OR
    UPDATE(Itm_Seq_Nbr)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Ordr_Itm
        WHERE
          /* %JoinFKPK(inserted,dbo.Ordr_Itm) */
          inserted.Ordr_Nbr = dbo.Ordr_Itm.Ordr_Nbr and
          inserted.Itm_Seq_Nbr = dbo.Ordr_Itm.Itm_Seq_Nbr
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.Ordr_Ship because dbo.Ordr_Itm does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Personal_Chk ON dbo.Personal_Chk FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Personal_Chk */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Pmt  dbo.Personal_Chk on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00016e09", PARENT_OWNER="dbo", PARENT_TABLE="Pmt"
    CHILD_OWNER="dbo", CHILD_TABLE="Personal_Chk"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Personal___Pmt_N__00200768", FK_COLUMNS="Pmt_Nbr" */
    IF EXISTS (SELECT * FROM deleted,dbo.Pmt
      WHERE
        /* %JoinFKPK(deleted,dbo.Pmt," = "," AND") */
        deleted.Pmt_Nbr = dbo.Pmt.Pmt_Nbr AND
        NOT EXISTS (
          SELECT * FROM dbo.Personal_Chk
          WHERE
            /* %JoinFKPK(dbo.Personal_Chk,dbo.Pmt," = "," AND") */
            dbo.Personal_Chk.Pmt_Nbr = dbo.Pmt.Pmt_Nbr
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.Personal_Chk because dbo.Pmt exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Personal_Chk ON dbo.Personal_Chk FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Personal_Chk */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Pmt  dbo.Personal_Chk on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00017cfa", PARENT_OWNER="dbo", PARENT_TABLE="Pmt"
    CHILD_OWNER="dbo", CHILD_TABLE="Personal_Chk"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Personal___Pmt_N__00200768", FK_COLUMNS="Pmt_Nbr" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Pmt_Nbr)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Pmt
        WHERE
          /* %JoinFKPK(inserted,dbo.Pmt) */
          inserted.Pmt_Nbr = dbo.Pmt.Pmt_Nbr
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.Personal_Chk because dbo.Pmt does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Pmt ON dbo.Pmt FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Pmt */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Pmt  dbo.Personal_Chk on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="0001d39c", PARENT_OWNER="dbo", PARENT_TABLE="Pmt"
    CHILD_OWNER="dbo", CHILD_TABLE="Personal_Chk"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Personal___Pmt_N__00200768", FK_COLUMNS="Pmt_Nbr" */
    DELETE dbo.Personal_Chk
      FROM dbo.Personal_Chk,deleted
      WHERE
        /*  %JoinFKPK(dbo.Personal_Chk,deleted," = "," AND") */
        dbo.Personal_Chk.Pmt_Nbr = deleted.Pmt_Nbr

    /* erwin Builtin Trigger */
    /* dbo.Pmt  dbo.Mony_Ordr on parent delete cascade */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Pmt"
    CHILD_OWNER="dbo", CHILD_TABLE="Mony_Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Mony_Ordr__Pmt_N__7B5B524B", FK_COLUMNS="Pmt_Nbr" */
    DELETE dbo.Mony_Ordr
      FROM dbo.Mony_Ordr,deleted
      WHERE
        /*  %JoinFKPK(dbo.Mony_Ordr,deleted," = "," AND") */
        dbo.Mony_Ordr.Pmt_Nbr = deleted.Pmt_Nbr


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Pmt ON dbo.Pmt FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Pmt */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPmt_Nbr int,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Pmt  dbo.Personal_Chk on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="0002fb7c", PARENT_OWNER="dbo", PARENT_TABLE="Pmt"
    CHILD_OWNER="dbo", CHILD_TABLE="Personal_Chk"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Personal___Pmt_N__00200768", FK_COLUMNS="Pmt_Nbr" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Pmt_Nbr)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insPmt_Nbr = inserted.Pmt_Nbr
        FROM inserted
      UPDATE dbo.Personal_Chk
      SET
        /*  %JoinFKPK(dbo.Personal_Chk,@ins," = ",",") */
        dbo.Personal_Chk.Pmt_Nbr = @insPmt_Nbr
      FROM dbo.Personal_Chk,inserted,deleted
      WHERE
        /*  %JoinFKPK(dbo.Personal_Chk,deleted," = "," AND") */
        dbo.Personal_Chk.Pmt_Nbr = deleted.Pmt_Nbr
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade dbo.Pmt update because more than one row has been affected.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* dbo.Pmt  dbo.Mony_Ordr on parent update cascade */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Pmt"
    CHILD_OWNER="dbo", CHILD_TABLE="Mony_Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Mony_Ordr__Pmt_N__7B5B524B", FK_COLUMNS="Pmt_Nbr" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Pmt_Nbr)
  BEGIN
    IF @numrows = 1
    BEGIN
      SELECT @insPmt_Nbr = inserted.Pmt_Nbr
        FROM inserted
      UPDATE dbo.Mony_Ordr
      SET
        /*  %JoinFKPK(dbo.Mony_Ordr,@ins," = ",",") */
        dbo.Mony_Ordr.Pmt_Nbr = @insPmt_Nbr
      FROM dbo.Mony_Ordr,inserted,deleted
      WHERE
        /*  %JoinFKPK(dbo.Mony_Ordr,deleted," = "," AND") */
        dbo.Mony_Ordr.Pmt_Nbr = deleted.Pmt_Nbr
    END
    ELSE
    BEGIN
      SELECT @errno = 30006,
             @errmsg = 'Cannot cascade dbo.Pmt update because more than one row has been affected.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Publshr ON dbo.Publshr FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Publshr */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Publshr  dbo.Publshr_Logo on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00022804", PARENT_OWNER="dbo", PARENT_TABLE="Publshr"
    CHILD_OWNER="dbo", CHILD_TABLE="Publshr_Logo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Publshr_L__Publs__01142BA1", FK_COLUMNS="Publshr_Id" */
    IF EXISTS (
      SELECT * FROM deleted,dbo.Publshr_Logo
      WHERE
        /*  %JoinFKPK(dbo.Publshr_Logo,deleted," = "," AND") */
        dbo.Publshr_Logo.Publshr_Id = deleted.Publshr_Id
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete dbo.Publshr because dbo.Publshr_Logo exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* dbo.Publshr  dbo.Book on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Publshr"
    CHILD_OWNER="dbo", CHILD_TABLE="Book"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Book__Publshr_Id__74AE54BC", FK_COLUMNS="Publshr_Id" */
    IF EXISTS (
      SELECT * FROM deleted,dbo.Book
      WHERE
        /*  %JoinFKPK(dbo.Book,deleted," = "," AND") */
        dbo.Book.Publshr_Id = deleted.Publshr_Id
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete dbo.Publshr because dbo.Book exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Publshr ON dbo.Publshr FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Publshr */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPublshr_Id char(9),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Publshr  dbo.Publshr_Logo on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00025e17", PARENT_OWNER="dbo", PARENT_TABLE="Publshr"
    CHILD_OWNER="dbo", CHILD_TABLE="Publshr_Logo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Publshr_L__Publs__01142BA1", FK_COLUMNS="Publshr_Id" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Publshr_Id)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,dbo.Publshr_Logo
      WHERE
        /*  %JoinFKPK(dbo.Publshr_Logo,deleted," = "," AND") */
        dbo.Publshr_Logo.Publshr_Id = deleted.Publshr_Id
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update dbo.Publshr because dbo.Publshr_Logo exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* dbo.Publshr  dbo.Book on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Publshr"
    CHILD_OWNER="dbo", CHILD_TABLE="Book"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Book__Publshr_Id__74AE54BC", FK_COLUMNS="Publshr_Id" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Publshr_Id)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,dbo.Book
      WHERE
        /*  %JoinFKPK(dbo.Book,deleted," = "," AND") */
        dbo.Book.Publshr_Id = deleted.Publshr_Id
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update dbo.Publshr because dbo.Book exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Publshr_Logo ON dbo.Publshr_Logo FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Publshr_Logo */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Publshr  dbo.Publshr_Logo on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00016ecc", PARENT_OWNER="dbo", PARENT_TABLE="Publshr"
    CHILD_OWNER="dbo", CHILD_TABLE="Publshr_Logo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Publshr_L__Publs__01142BA1", FK_COLUMNS="Publshr_Id" */
    IF EXISTS (SELECT * FROM deleted,dbo.Publshr
      WHERE
        /* %JoinFKPK(deleted,dbo.Publshr," = "," AND") */
        deleted.Publshr_Id = dbo.Publshr.Publshr_Id AND
        NOT EXISTS (
          SELECT * FROM dbo.Publshr_Logo
          WHERE
            /* %JoinFKPK(dbo.Publshr_Logo,dbo.Publshr," = "," AND") */
            dbo.Publshr_Logo.Publshr_Id = dbo.Publshr.Publshr_Id
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.Publshr_Logo because dbo.Publshr exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Publshr_Logo ON dbo.Publshr_Logo FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Publshr_Logo */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insPublshr_Id char(9),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Publshr  dbo.Publshr_Logo on child update no action */
  /* ERWIN_RELATION:CHECKSUM="000193fc", PARENT_OWNER="dbo", PARENT_TABLE="Publshr"
    CHILD_OWNER="dbo", CHILD_TABLE="Publshr_Logo"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Publshr_L__Publs__01142BA1", FK_COLUMNS="Publshr_Id" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Publshr_Id)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Publshr
        WHERE
          /* %JoinFKPK(inserted,dbo.Publshr) */
          inserted.Publshr_Id = dbo.Publshr.Publshr_Id
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.Publshr_Logo because dbo.Publshr does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Purchase_Ordr ON dbo.Purchase_Ordr FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Purchase_Ordr */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Purchase_Ordr  dbo.Ordr_Itm on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="0003c2bc", PARENT_OWNER="dbo", PARENT_TABLE="Purchase_Ordr"
    CHILD_OWNER="dbo", CHILD_TABLE="Ordr_Itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Ordr_Itm__Ordr_N__7D439ABD", FK_COLUMNS="Ordr_Nbr" */
    IF EXISTS (
      SELECT * FROM deleted,dbo.Ordr_Itm
      WHERE
        /*  %JoinFKPK(dbo.Ordr_Itm,deleted," = "," AND") */
        dbo.Ordr_Itm.Ordr_Nbr = deleted.Ordr_Nbr
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete dbo.Purchase_Ordr because dbo.Ordr_Itm exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* dbo.Stor_Nam  dbo.Purchase_Ordr on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Stor_Nam"
    CHILD_OWNER="dbo", CHILD_TABLE="Purchase_Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Purchase___Stor___02FC7413", FK_COLUMNS="Stor_Id" */
    IF EXISTS (SELECT * FROM deleted,dbo.Stor_Nam
      WHERE
        /* %JoinFKPK(deleted,dbo.Stor_Nam," = "," AND") */
        deleted.Stor_Id = dbo.Stor_Nam.Stor_Id AND
        NOT EXISTS (
          SELECT * FROM dbo.Purchase_Ordr
          WHERE
            /* %JoinFKPK(dbo.Purchase_Ordr,dbo.Stor_Nam," = "," AND") */
            dbo.Purchase_Ordr.Stor_Id = dbo.Stor_Nam.Stor_Id
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.Purchase_Ordr because dbo.Stor_Nam exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* dbo.Cust  dbo.Purchase_Ordr on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Cust"
    CHILD_OWNER="dbo", CHILD_TABLE="Purchase_Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Purchase___Cust___02084FDA", FK_COLUMNS="Cust_Id" */
    IF EXISTS (SELECT * FROM deleted,dbo.Cust
      WHERE
        /* %JoinFKPK(deleted,dbo.Cust," = "," AND") */
        deleted.Cust_Id = dbo.Cust.Cust_Id AND
        NOT EXISTS (
          SELECT * FROM dbo.Purchase_Ordr
          WHERE
            /* %JoinFKPK(dbo.Purchase_Ordr,dbo.Cust," = "," AND") */
            dbo.Purchase_Ordr.Cust_Id = dbo.Cust.Cust_Id
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.Purchase_Ordr because dbo.Cust exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Purchase_Ordr ON dbo.Purchase_Ordr FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Purchase_Ordr */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insOrdr_Nbr int,
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Purchase_Ordr  dbo.Ordr_Itm on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0004151b", PARENT_OWNER="dbo", PARENT_TABLE="Purchase_Ordr"
    CHILD_OWNER="dbo", CHILD_TABLE="Ordr_Itm"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Ordr_Itm__Ordr_N__7D439ABD", FK_COLUMNS="Ordr_Nbr" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Ordr_Nbr)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,dbo.Ordr_Itm
      WHERE
        /*  %JoinFKPK(dbo.Ordr_Itm,deleted," = "," AND") */
        dbo.Ordr_Itm.Ordr_Nbr = deleted.Ordr_Nbr
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update dbo.Purchase_Ordr because dbo.Ordr_Itm exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* dbo.Stor_Nam  dbo.Purchase_Ordr on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Stor_Nam"
    CHILD_OWNER="dbo", CHILD_TABLE="Purchase_Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Purchase___Stor___02FC7413", FK_COLUMNS="Stor_Id" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Stor_Id)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Stor_Nam
        WHERE
          /* %JoinFKPK(inserted,dbo.Stor_Nam) */
          inserted.Stor_Id = dbo.Stor_Nam.Stor_Id
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.Purchase_Ordr because dbo.Stor_Nam does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* dbo.Cust  dbo.Purchase_Ordr on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Cust"
    CHILD_OWNER="dbo", CHILD_TABLE="Purchase_Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Purchase___Cust___02084FDA", FK_COLUMNS="Cust_Id" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Cust_Id)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Cust
        WHERE
          /* %JoinFKPK(inserted,dbo.Cust) */
          inserted.Cust_Id = dbo.Cust.Cust_Id
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Cust_Id IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.Purchase_Ordr because dbo.Cust does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Reporting_Structure ON dbo.Reporting_Structure FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Reporting_Structure */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Emp  dbo.Reporting_Structure on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002c0cd", PARENT_OWNER="dbo", PARENT_TABLE="Emp"
    CHILD_OWNER="dbo", CHILD_TABLE="Reporting_Structure"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Reporting__Rpt_T__04E4BC85", FK_COLUMNS="Rpt_To" */
    IF EXISTS (SELECT * FROM deleted,dbo.Emp
      WHERE
        /* %JoinFKPK(deleted,dbo.Emp," = "," AND") */
        deleted.Rpt_To = dbo.Emp.Emp_Id AND
        NOT EXISTS (
          SELECT * FROM dbo.Reporting_Structure
          WHERE
            /* %JoinFKPK(dbo.Reporting_Structure,dbo.Emp," = "," AND") */
            dbo.Reporting_Structure.Rpt_To = dbo.Emp.Emp_Id
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.Reporting_Structure because dbo.Emp exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* dbo.Emp  dbo.Reporting_Structure on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Emp"
    CHILD_OWNER="dbo", CHILD_TABLE="Reporting_Structure"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Reporting___Mngr__03F0984C", FK_COLUMNS="Mngr" */
    IF EXISTS (SELECT * FROM deleted,dbo.Emp
      WHERE
        /* %JoinFKPK(deleted,dbo.Emp," = "," AND") */
        deleted.Mngr = dbo.Emp.Emp_Id AND
        NOT EXISTS (
          SELECT * FROM dbo.Reporting_Structure
          WHERE
            /* %JoinFKPK(dbo.Reporting_Structure,dbo.Emp," = "," AND") */
            dbo.Reporting_Structure.Mngr = dbo.Emp.Emp_Id
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.Reporting_Structure because dbo.Emp exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Reporting_Structure ON dbo.Reporting_Structure FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Reporting_Structure */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insMngr char(9), 
           @insRpt_To char(9),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Emp  dbo.Reporting_Structure on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002d5ae", PARENT_OWNER="dbo", PARENT_TABLE="Emp"
    CHILD_OWNER="dbo", CHILD_TABLE="Reporting_Structure"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Reporting__Rpt_T__04E4BC85", FK_COLUMNS="Rpt_To" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Rpt_To)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Emp
        WHERE
          /* %JoinFKPK(inserted,dbo.Emp) */
          inserted.Rpt_To = dbo.Emp.Emp_Id
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.Reporting_Structure because dbo.Emp does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* dbo.Emp  dbo.Reporting_Structure on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Emp"
    CHILD_OWNER="dbo", CHILD_TABLE="Reporting_Structure"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Reporting___Mngr__03F0984C", FK_COLUMNS="Mngr" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Mngr)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Emp
        WHERE
          /* %JoinFKPK(inserted,dbo.Emp) */
          inserted.Mngr = dbo.Emp.Emp_Id
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.Reporting_Structure because dbo.Emp does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Rgn ON dbo.Rgn FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Rgn */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Rgn  dbo.Stor_Nam on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="000126cd", PARENT_OWNER="dbo", PARENT_TABLE="Rgn"
    CHILD_OWNER="dbo", CHILD_TABLE="Stor_Nam"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Stor_Nam__Rgn_Id__08B54D69", FK_COLUMNS="Rgn_Id" */
    IF EXISTS (
      SELECT * FROM deleted,dbo.Stor_Nam
      WHERE
        /*  %JoinFKPK(dbo.Stor_Nam,deleted," = "," AND") */
        dbo.Stor_Nam.Rgn_Id = deleted.Rgn_Id
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete dbo.Rgn because dbo.Stor_Nam exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Rgn ON dbo.Rgn FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Rgn */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insRgn_Id char(9),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Rgn  dbo.Stor_Nam on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="000132c4", PARENT_OWNER="dbo", PARENT_TABLE="Rgn"
    CHILD_OWNER="dbo", CHILD_TABLE="Stor_Nam"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Stor_Nam__Rgn_Id__08B54D69", FK_COLUMNS="Rgn_Id" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Rgn_Id)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,dbo.Stor_Nam
      WHERE
        /*  %JoinFKPK(dbo.Stor_Nam,deleted," = "," AND") */
        dbo.Stor_Nam.Rgn_Id = deleted.Rgn_Id
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update dbo.Rgn because dbo.Stor_Nam exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Rylty ON dbo.Rylty FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Rylty */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Rylty  dbo.Rylty_Pmt on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00012d25", PARENT_OWNER="dbo", PARENT_TABLE="Rylty"
    CHILD_OWNER="dbo", CHILD_TABLE="Rylty_Pmt"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Rylty_Pmt__Rylty__06CD04F7", FK_COLUMNS="Rylty_Id" */
    IF EXISTS (
      SELECT * FROM deleted,dbo.Rylty_Pmt
      WHERE
        /*  %JoinFKPK(dbo.Rylty_Pmt,deleted," = "," AND") */
        dbo.Rylty_Pmt.Rylty_Id = deleted.Rylty_Id
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete dbo.Rylty because dbo.Rylty_Pmt exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Rylty ON dbo.Rylty FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Rylty */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insRylty_Id char(9),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Rylty  dbo.Rylty_Pmt on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0001391a", PARENT_OWNER="dbo", PARENT_TABLE="Rylty"
    CHILD_OWNER="dbo", CHILD_TABLE="Rylty_Pmt"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Rylty_Pmt__Rylty__06CD04F7", FK_COLUMNS="Rylty_Id" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Rylty_Id)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,dbo.Rylty_Pmt
      WHERE
        /*  %JoinFKPK(dbo.Rylty_Pmt,deleted," = "," AND") */
        dbo.Rylty_Pmt.Rylty_Id = deleted.Rylty_Id
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update dbo.Rylty because dbo.Rylty_Pmt exists.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Rylty_Hist ON dbo.Rylty_Hist FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Rylty_Hist */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Ordr_Itm  dbo.Rylty_Hist on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0001a95c", PARENT_OWNER="dbo", PARENT_TABLE="Ordr_Itm"
    CHILD_OWNER="dbo", CHILD_TABLE="Rylty_Hist"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Rylty_Hist__05D8E0BE", FK_COLUMNS="Ordr_Nbr""Itm_Seq_Nbr" */
    IF EXISTS (SELECT * FROM deleted,dbo.Ordr_Itm
      WHERE
        /* %JoinFKPK(deleted,dbo.Ordr_Itm," = "," AND") */
        deleted.Ordr_Nbr = dbo.Ordr_Itm.Ordr_Nbr AND
        deleted.Itm_Seq_Nbr = dbo.Ordr_Itm.Itm_Seq_Nbr AND
        NOT EXISTS (
          SELECT * FROM dbo.Rylty_Hist
          WHERE
            /* %JoinFKPK(dbo.Rylty_Hist,dbo.Ordr_Itm," = "," AND") */
            dbo.Rylty_Hist.Ordr_Nbr = dbo.Ordr_Itm.Ordr_Nbr AND
            dbo.Rylty_Hist.Itm_Seq_Nbr = dbo.Ordr_Itm.Itm_Seq_Nbr
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.Rylty_Hist because dbo.Ordr_Itm exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Rylty_Hist ON dbo.Rylty_Hist FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Rylty_Hist */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insRylty_Hist_Id char(9),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Ordr_Itm  dbo.Rylty_Hist on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0001e956", PARENT_OWNER="dbo", PARENT_TABLE="Ordr_Itm"
    CHILD_OWNER="dbo", CHILD_TABLE="Rylty_Hist"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Rylty_Hist__05D8E0BE", FK_COLUMNS="Ordr_Nbr""Itm_Seq_Nbr" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Ordr_Nbr) OR
    UPDATE(Itm_Seq_Nbr)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Ordr_Itm
        WHERE
          /* %JoinFKPK(inserted,dbo.Ordr_Itm) */
          inserted.Ordr_Nbr = dbo.Ordr_Itm.Ordr_Nbr and
          inserted.Itm_Seq_Nbr = dbo.Ordr_Itm.Itm_Seq_Nbr
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Ordr_Nbr IS NULL AND
      inserted.Itm_Seq_Nbr IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.Rylty_Hist because dbo.Ordr_Itm does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Rylty_Pmt ON dbo.Rylty_Pmt FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Rylty_Pmt */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.BookAuth  dbo.Rylty_Pmt on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="0002d959", PARENT_OWNER="dbo", PARENT_TABLE="BookAuth"
    CHILD_OWNER="dbo", CHILD_TABLE="Rylty_Pmt"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Rylty_Pmt__07C12930", FK_COLUMNS="Auth_Id""Book_Id" */
    IF EXISTS (SELECT * FROM deleted,dbo.BookAuth
      WHERE
        /* %JoinFKPK(deleted,dbo.BookAuth," = "," AND") */
        deleted.Auth_Id = dbo.BookAuth.Auth_Id AND
        deleted.Book_Id = dbo.BookAuth.Book_Id AND
        NOT EXISTS (
          SELECT * FROM dbo.Rylty_Pmt
          WHERE
            /* %JoinFKPK(dbo.Rylty_Pmt,dbo.BookAuth," = "," AND") */
            dbo.Rylty_Pmt.Auth_Id = dbo.BookAuth.Auth_Id AND
            dbo.Rylty_Pmt.Book_Id = dbo.BookAuth.Book_Id
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.Rylty_Pmt because dbo.BookAuth exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* dbo.Rylty  dbo.Rylty_Pmt on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Rylty"
    CHILD_OWNER="dbo", CHILD_TABLE="Rylty_Pmt"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Rylty_Pmt__Rylty__06CD04F7", FK_COLUMNS="Rylty_Id" */
    IF EXISTS (SELECT * FROM deleted,dbo.Rylty
      WHERE
        /* %JoinFKPK(deleted,dbo.Rylty," = "," AND") */
        deleted.Rylty_Id = dbo.Rylty.Rylty_Id AND
        NOT EXISTS (
          SELECT * FROM dbo.Rylty_Pmt
          WHERE
            /* %JoinFKPK(dbo.Rylty_Pmt,dbo.Rylty," = "," AND") */
            dbo.Rylty_Pmt.Rylty_Id = dbo.Rylty.Rylty_Id
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.Rylty_Pmt because dbo.Rylty exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Rylty_Pmt ON dbo.Rylty_Pmt FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Rylty_Pmt */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insAuth_Id char(9), 
           @insBook_Id char(9), 
           @insRylty_Id char(9),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.BookAuth  dbo.Rylty_Pmt on child update no action */
  /* ERWIN_RELATION:CHECKSUM="0002ed40", PARENT_OWNER="dbo", PARENT_TABLE="BookAuth"
    CHILD_OWNER="dbo", CHILD_TABLE="Rylty_Pmt"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Rylty_Pmt__07C12930", FK_COLUMNS="Auth_Id""Book_Id" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Auth_Id) OR
    UPDATE(Book_Id)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.BookAuth
        WHERE
          /* %JoinFKPK(inserted,dbo.BookAuth) */
          inserted.Auth_Id = dbo.BookAuth.Auth_Id and
          inserted.Book_Id = dbo.BookAuth.Book_Id
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.Rylty_Pmt because dbo.BookAuth does not exist.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* dbo.Rylty  dbo.Rylty_Pmt on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Rylty"
    CHILD_OWNER="dbo", CHILD_TABLE="Rylty_Pmt"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Rylty_Pmt__Rylty__06CD04F7", FK_COLUMNS="Rylty_Id" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Rylty_Id)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Rylty
        WHERE
          /* %JoinFKPK(inserted,dbo.Rylty) */
          inserted.Rylty_Id = dbo.Rylty.Rylty_Id
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.Rylty_Pmt because dbo.Rylty does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tD_Stor_Nam ON dbo.Stor_Nam FOR DELETE AS
/* erwin Builtin Trigger */
/* DELETE trigger on Stor_Nam */
BEGIN
  DECLARE  @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)
    /* erwin Builtin Trigger */
    /* dbo.Stor_Nam  dbo.Purchase_Ordr on parent delete no action */
    /* ERWIN_RELATION:CHECKSUM="00026e07", PARENT_OWNER="dbo", PARENT_TABLE="Stor_Nam"
    CHILD_OWNER="dbo", CHILD_TABLE="Purchase_Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Purchase___Stor___02FC7413", FK_COLUMNS="Stor_Id" */
    IF EXISTS (
      SELECT * FROM deleted,dbo.Purchase_Ordr
      WHERE
        /*  %JoinFKPK(dbo.Purchase_Ordr,deleted," = "," AND") */
        dbo.Purchase_Ordr.Stor_Id = deleted.Stor_Id
    )
    BEGIN
      SELECT @errno  = 30001,
             @errmsg = 'Cannot delete dbo.Stor_Nam because dbo.Purchase_Ordr exists.'
      GOTO error
    END

    /* erwin Builtin Trigger */
    /* dbo.Rgn  dbo.Stor_Nam on child delete no action */
    /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Rgn"
    CHILD_OWNER="dbo", CHILD_TABLE="Stor_Nam"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Stor_Nam__Rgn_Id__08B54D69", FK_COLUMNS="Rgn_Id" */
    IF EXISTS (SELECT * FROM deleted,dbo.Rgn
      WHERE
        /* %JoinFKPK(deleted,dbo.Rgn," = "," AND") */
        deleted.Rgn_Id = dbo.Rgn.Rgn_Id AND
        NOT EXISTS (
          SELECT * FROM dbo.Stor_Nam
          WHERE
            /* %JoinFKPK(dbo.Stor_Nam,dbo.Rgn," = "," AND") */
            dbo.Stor_Nam.Rgn_Id = dbo.Rgn.Rgn_Id
        )
    )
    BEGIN
      SELECT @errno  = 30010,
             @errmsg = 'Cannot delete last dbo.Stor_Nam because dbo.Rgn exists.'
      GOTO error
    END


    /* erwin Builtin Trigger */
    RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go




CREATE TRIGGER dbo.tU_Stor_Nam ON dbo.Stor_Nam FOR UPDATE AS
/* erwin Builtin Trigger */
/* UPDATE trigger on Stor_Nam */
BEGIN
  DECLARE  @numrows int,
           @nullcnt int,
           @validcnt int,
           @insStor_Id char(9),
           @errno   int,
           @severity int,
           @state    int,
           @errmsg  varchar(255)

  SELECT @numrows = @@rowcount
  /* erwin Builtin Trigger */
  /* dbo.Stor_Nam  dbo.Purchase_Ordr on parent update no action */
  /* ERWIN_RELATION:CHECKSUM="0002b835", PARENT_OWNER="dbo", PARENT_TABLE="Stor_Nam"
    CHILD_OWNER="dbo", CHILD_TABLE="Purchase_Ordr"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Purchase___Stor___02FC7413", FK_COLUMNS="Stor_Id" */
  IF
    /* %ParentPK(" OR",UPDATE) */
    UPDATE(Stor_Id)
  BEGIN
    IF EXISTS (
      SELECT * FROM deleted,dbo.Purchase_Ordr
      WHERE
        /*  %JoinFKPK(dbo.Purchase_Ordr,deleted," = "," AND") */
        dbo.Purchase_Ordr.Stor_Id = deleted.Stor_Id
    )
    BEGIN
      SELECT @errno  = 30005,
             @errmsg = 'Cannot update dbo.Stor_Nam because dbo.Purchase_Ordr exists.'
      GOTO error
    END
  END

  /* erwin Builtin Trigger */
  /* dbo.Rgn  dbo.Stor_Nam on child update no action */
  /* ERWIN_RELATION:CHECKSUM="00000000", PARENT_OWNER="dbo", PARENT_TABLE="Rgn"
    CHILD_OWNER="dbo", CHILD_TABLE="Stor_Nam"
    P2C_VERB_PHRASE="", C2P_VERB_PHRASE="", 
    FK_CONSTRAINT="FK__Stor_Nam__Rgn_Id__08B54D69", FK_COLUMNS="Rgn_Id" */
  IF
    /* %ChildFK(" OR",UPDATE) */
    UPDATE(Rgn_Id)
  BEGIN
    SELECT @nullcnt = 0
    SELECT @validcnt = count(*)
      FROM inserted,dbo.Rgn
        WHERE
          /* %JoinFKPK(inserted,dbo.Rgn) */
          inserted.Rgn_Id = dbo.Rgn.Rgn_Id
    /* %NotnullFK(inserted," IS NULL","select @nullcnt = count(*) from inserted where"," AND") */
    select @nullcnt = count(*) from inserted where
      inserted.Rgn_Id IS NULL
    IF @validcnt + @nullcnt != @numrows
    BEGIN
      SELECT @errno  = 30007,
             @errmsg = 'Cannot update dbo.Stor_Nam because dbo.Rgn does not exist.'
      GOTO error
    END
  END


  /* erwin Builtin Trigger */
  RETURN
error:
   RAISERROR (@errmsg, -- Message text.
              @severity, -- Severity (0~25).
              @state) -- State (0~255).
    rollback transaction
END

go



