/****** Object:  Table [jos_assets]    Script Date: 11/08/2010 18:41:22 ******/


SET QUOTED_IDENTIFIER ON;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_assets]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_assets](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[parent_id] [int] NOT NULL,
	[lft] [int] NOT NULL,
	[rgt] [int] NOT NULL,
	[level] [bigint] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[rules] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_jos_assets_id] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF),
 CONSTRAINT [jos_assets$idx_asset_name] UNIQUE NONCLUSTERED
(
	[name] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_assets]') AND name = N'idx_lft_rgt')
CREATE NONCLUSTERED INDEX [idx_lft_rgt] ON [jos_assets]
(
	[lft] ASC,
	[rgt] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_assets]') AND name = N'idx_parent_id')
CREATE NONCLUSTERED INDEX [idx_parent_id] ON [jos_assets]
(
	[parent_id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);


/****** Object:  Default [DF__jos_asset__paren__7E6CC920]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_asset__paren__7E6CC920]') AND parent_object_id = OBJECT_ID(N'[jos_assets]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_asset__paren__7E6CC920]') AND type = 'D')
BEGIN
ALTER TABLE [jos_assets] ADD  DEFAULT ((0)) FOR [parent_id]
END


End;

/****** Object:  Default [DF__jos_assets__lft__7F60ED59]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_assets__lft__7F60ED59]') AND parent_object_id = OBJECT_ID(N'[jos_assets]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_assets__lft__7F60ED59]') AND type = 'D')
BEGIN
ALTER TABLE [jos_assets] ADD  DEFAULT ((0)) FOR [lft]
END


End;

/****** Object:  Default [DF__jos_assets__rgt__00551192]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_assets__rgt__00551192]') AND parent_object_id = OBJECT_ID(N'[jos_assets]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_assets__rgt__00551192]') AND type = 'D')
BEGIN
ALTER TABLE [jos_assets] ADD  DEFAULT ((0)) FOR [rgt]
END


End;

/****** Object:  Table [jos_categories]    Script Date: 11/08/2010 18:41:22 ******/


SET QUOTED_IDENTIFIER ON;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[asset_id] [bigint] NOT NULL,
	[parent_id] [bigint] NOT NULL,
	[lft] [int] NOT NULL,
	[rgt] [int] NOT NULL,
	[level] [bigint] NOT NULL,
	[path] [nvarchar](255) NOT NULL,
	[extension] [nvarchar](50) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
	[note] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[published] [smallint] NOT NULL,
	[checked_out] [bigint] NOT NULL,
	[checked_out_time] [datetime] NOT NULL,
	[access] [int] NOT NULL,
	[params] [nvarchar](max) NOT NULL,
	[metadesc] [nvarchar](1024) NOT NULL,
	[metakey] [nvarchar](1024) NOT NULL,
	[metadata] [nvarchar](2048) NOT NULL,
	[created_user_id] [bigint] NOT NULL,
	[created_time] [datetime] NOT NULL,
	[modified_user_id] [bigint] NOT NULL,
	[modified_time] [datetime] NOT NULL,
	[hits] [bigint] NOT NULL,
	[language] [nvarchar](7) NOT NULL,
 CONSTRAINT [PK_jos_categories_id] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_categories]') AND name = N'cat_idx')
CREATE NONCLUSTERED INDEX [cat_idx] ON [jos_categories]
(
	[extension] ASC,
	[published] ASC,
	[access] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_categories]') AND name = N'idx_access')
CREATE NONCLUSTERED INDEX [idx_access] ON [jos_categories]
(
	[access] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_categories]') AND name = N'idx_alias')
CREATE NONCLUSTERED INDEX [idx_alias] ON [jos_categories]
(
	[alias] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_categories]') AND name = N'idx_checkout')
CREATE NONCLUSTERED INDEX [idx_checkout] ON [jos_categories]
(
	[checked_out] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_categories]') AND name = N'idx_language')
CREATE NONCLUSTERED INDEX [idx_language] ON [jos_categories]
(
	[language] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_categories]') AND name = N'idx_left_right')
CREATE NONCLUSTERED INDEX [idx_left_right] ON [jos_categories]
(
	[lft] ASC,
	[rgt] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_categories]') AND name = N'idx_path')
CREATE NONCLUSTERED INDEX [idx_path] ON [jos_categories]
(
	[path] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);


/****** Object:  Default [DF__jos_categ__asset__276EDEB3]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_categ__asset__276EDEB3]') AND parent_object_id = OBJECT_ID(N'[jos_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_categ__asset__276EDEB3]') AND type = 'D')
BEGIN
ALTER TABLE [jos_categories] ADD  DEFAULT ((0)) FOR [asset_id]
END


End;

/****** Object:  Default [DF__jos_categ__paren__286302EC]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_categ__paren__286302EC]') AND parent_object_id = OBJECT_ID(N'[jos_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_categ__paren__286302EC]') AND type = 'D')
BEGIN
ALTER TABLE [jos_categories] ADD  DEFAULT ((0)) FOR [parent_id]
END


End;

/****** Object:  Default [DF__jos_cater__lft__29572725]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_cater__lft__29572725]') AND parent_object_id = OBJECT_ID(N'[jos_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_cater__lft__29572725]') AND type = 'D')
BEGIN
ALTER TABLE [jos_categories] ADD  DEFAULT ((0)) FOR [lft]
END


End;

/****** Object:  Default [DF__jos_cater__rgt__2A4B4B5E]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_cater__rgt__2A4B4B5E]') AND parent_object_id = OBJECT_ID(N'[jos_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_cater__rgt__2A4B4B5E]') AND type = 'D')
BEGIN
ALTER TABLE [jos_categories] ADD  DEFAULT ((0)) FOR [rgt]
END


End;

/****** Object:  Default [DF__jos_categ__level__2B3F6F97]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_categ__level__2B3F6F97]') AND parent_object_id = OBJECT_ID(N'[jos_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_categ__level__2B3F6F97]') AND type = 'D')
BEGIN
ALTER TABLE [jos_categories] ADD  DEFAULT ((0)) FOR [level]
END


End;

/****** Object:  Default [DF__jos_cate__path__2C3393D0]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_cate__path__2C3393D0]') AND parent_object_id = OBJECT_ID(N'[jos_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_cate__path__2C3393D0]') AND type = 'D')
BEGIN
ALTER TABLE [jos_categories] ADD  DEFAULT (N'') FOR [path]
END


End;

/****** Object:  Default [DF__jos_categ__exten__2D27B809]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_categ__exten__2D27B809]') AND parent_object_id = OBJECT_ID(N'[jos_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_categ__exten__2D27B809]') AND type = 'D')
BEGIN
ALTER TABLE [jos_categories] ADD  DEFAULT (N'') FOR [extension]
END


End;

/****** Object:  Default [DF__jos_categ__alias__2E1BDC42]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_categ__alias__2E1BDC42]') AND parent_object_id = OBJECT_ID(N'[jos_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_categ__alias__2E1BDC42]') AND type = 'D')
BEGIN
ALTER TABLE [jos_categories] ADD  DEFAULT (N'') FOR [alias]
END


End;

/****** Object:  Default [DF__jos_cate__note__2F10007B]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_cate__note__2F10007B]') AND parent_object_id = OBJECT_ID(N'[jos_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_cate__note__2F10007B]') AND type = 'D')
BEGIN
ALTER TABLE [jos_categories] ADD  DEFAULT (N'') FOR [note]
END


End;

/****** Object:  Default [DF__jos_categ__descr__300424B4]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_categ__descr__300424B4]') AND parent_object_id = OBJECT_ID(N'[jos_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_categ__descr__300424B4]') AND type = 'D')
BEGIN
ALTER TABLE [jos_categories] ADD  DEFAULT (N'') FOR [description]
END


End;

/****** Object:  Default [DF__jos_categ__publi__30F848ED]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_categ__publi__30F848ED]') AND parent_object_id = OBJECT_ID(N'[jos_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_categ__publi__30F848ED]') AND type = 'D')
BEGIN
ALTER TABLE [jos_categories] ADD  DEFAULT ((0)) FOR [published]
END


End;

/****** Object:  Default [DF__jos_categ__check__31EC6D26]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_categ__check__31EC6D26]') AND parent_object_id = OBJECT_ID(N'[jos_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_categ__check__31EC6D26]') AND type = 'D')
BEGIN
ALTER TABLE [jos_categories] ADD  DEFAULT ((0)) FOR [checked_out]
END


End;

/****** Object:  Default [DF__jos_categ__check__32E0915F]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_categ__check__32E0915F]') AND parent_object_id = OBJECT_ID(N'[jos_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_categ__check__32E0915F]') AND type = 'D')
BEGIN
ALTER TABLE [jos_categories] ADD  DEFAULT ('1900-01-01 00:00:00') FOR [checked_out_time]
END


End;

/****** Object:  Default [DF__jos_categ__acces__33D4B598]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_categ__acces__33D4B598]') AND parent_object_id = OBJECT_ID(N'[jos_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_categ__acces__33D4B598]') AND type = 'D')
BEGIN
ALTER TABLE [jos_categories] ADD  DEFAULT ((0)) FOR [access]
END


End;

/****** Object:  Default [DF__jos_categ__param__34C8D9D1]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_categ__param__34C8D9D1]') AND parent_object_id = OBJECT_ID(N'[jos_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_categ__param__34C8D9D1]') AND type = 'D')
BEGIN
ALTER TABLE [jos_categories] ADD  DEFAULT (N'') FOR [params]
END


End;

/****** Object:  Default [DF__jos_categ__creat__35BCFE0A]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_categ__creat__35BCFE0A]') AND parent_object_id = OBJECT_ID(N'[jos_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_categ__creat__35BCFE0A]') AND type = 'D')
BEGIN
ALTER TABLE [jos_categories] ADD  DEFAULT ((0)) FOR [created_user_id]
END


End;

/****** Object:  Default [DF__jos_categ__creat__36B12243]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_categ__creat__36B12243]') AND parent_object_id = OBJECT_ID(N'[jos_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_categ__creat__36B12243]') AND type = 'D')
BEGIN
ALTER TABLE [jos_categories] ADD  DEFAULT ('1900-01-01 00:00:00') FOR [created_time]
END


End;

/****** Object:  Default [DF__jos_categ__modif__37A5467C]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_categ__modif__37A5467C]') AND parent_object_id = OBJECT_ID(N'[jos_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_categ__modif__37A5467C]') AND type = 'D')
BEGIN
ALTER TABLE [jos_categories] ADD  DEFAULT ((0)) FOR [modified_user_id]
END


End;

/****** Object:  Default [DF__jos_categ__modif__38996AB5]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_categ__modif__38996AB5]') AND parent_object_id = OBJECT_ID(N'[jos_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_categ__modif__38996AB5]') AND type = 'D')
BEGIN
ALTER TABLE [jos_categories] ADD  DEFAULT ('1900-01-01 00:00:00') FOR [modified_time]
END


End;

/****** Object:  Default [DF__jos_cate__hits__398D8EEE]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_cate__hits__398D8EEE]') AND parent_object_id = OBJECT_ID(N'[jos_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_cate__hits__398D8EEE]') AND type = 'D')
BEGIN
ALTER TABLE [jos_categories] ADD  DEFAULT ((0)) FOR [hits]
END


End;


/****** Object:  Table [jos_content]    Script Date: 11/08/2010 18:41:22 ******/


SET QUOTED_IDENTIFIER ON;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_content]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_content](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[asset_id] [bigint] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
	[title_alias] [nvarchar](255) NOT NULL,
	[introtext] [nvarchar](max) NOT NULL,
	[fulltext] [nvarchar](max) NOT NULL,
	[state] [smallint] NOT NULL,
	[sectionid] [bigint] NOT NULL,
	[mask] [bigint] NOT NULL,
	[catid] [bigint] NOT NULL,
	[created] [datetime] NOT NULL,
	[created_by] [bigint] NOT NULL,
	[created_by_alias] [nvarchar](255) NOT NULL,
	[modified] [datetime] NOT NULL,
	[modified_by] [bigint] NOT NULL,
	[checked_out] [bigint] NOT NULL,
	[checked_out_time] [datetime] NOT NULL,
	[publish_up] [datetime] NOT NULL,
	[publish_down] [datetime] NOT NULL,
	[images] [nvarchar](max) NOT NULL,
	[urls] [nvarchar](max) NOT NULL,
	[attribs] [nvarchar](max) NOT NULL,
	[version] [bigint] NOT NULL,
	[parentid] [bigint] NOT NULL,
	[ordering] [int] NOT NULL,
	[metakey] [nvarchar](max) NOT NULL,
	[metadesc] [nvarchar](max) NOT NULL,
	[access] [bigint] NOT NULL,
	[hits] [bigint] NOT NULL,
	[metadata] [nvarchar](max) NOT NULL,
	[featured] [tinyint] NOT NULL,
	[language] [nvarchar](7) NOT NULL,
	[xreference] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_jos_content_id] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_content]') AND name = N'idx_access')
CREATE NONCLUSTERED INDEX [idx_access] ON [jos_content]
(
	[access] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_content]') AND name = N'idx_catid')
CREATE NONCLUSTERED INDEX [idx_catid] ON [jos_content]
(
	[catid] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_content]') AND name = N'idx_checkout')
CREATE NONCLUSTERED INDEX [idx_checkout] ON [jos_content]
(
	[checked_out] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_content]') AND name = N'idx_createdby')
CREATE NONCLUSTERED INDEX [idx_createdby] ON [jos_content]
(
	[created_by] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_content]') AND name = N'idx_featured_catid')
CREATE NONCLUSTERED INDEX [idx_featured_catid] ON [jos_content]
(
	[featured] ASC,
	[catid] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_content]') AND name = N'idx_language')
CREATE NONCLUSTERED INDEX [idx_language] ON [jos_content]
(
	[language] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_content]') AND name = N'idx_state')
CREATE NONCLUSTERED INDEX [idx_state] ON [jos_content]
(
	[state] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_content]') AND name = N'idx_xreference')
CREATE NONCLUSTERED INDEX [idx_xreference] ON [jos_content]
(
	[xreference] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);


/****** Object:  Default [DF__jos_conte__asset__59063A47]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conte__asset__59063A47]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conte__asset__59063A47]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT ((0)) FOR [asset_id]
END


End;

/****** Object:  Default [DF__jos_conte__title__59FA5E80]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conte__title__59FA5E80]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conte__title__59FA5E80]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT (N'') FOR [title]
END


End;

/****** Object:  Default [DF__jos_conte__alias__5AEE82B9]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conte__alias__5AEE82B9]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conte__alias__5AEE82B9]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT (N'') FOR [alias]
END


End;

/****** Object:  Default [DF__jos_conte__title__5BE2A6F2]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conte__title__5BE2A6F2]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conte__title__5BE2A6F2]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT (N'') FOR [title_alias]
END


End;

/****** Object:  Default [DF__jos_conte__state__5CD6CB2B]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conte__state__5CD6CB2B]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conte__state__5CD6CB2B]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT ((0)) FOR [state]
END


End;

/****** Object:  Default [DF__jos_conte__secti__5DCAEF64]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conte__secti__5DCAEF64]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conte__secti__5DCAEF64]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT ((0)) FOR [sectionid]
END


End;

/****** Object:  Default [DF__jos_conten__mask__5EBF139D]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conten__mask__5EBF139D]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conten__mask__5EBF139D]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT ((0)) FOR [mask]
END


End;

/****** Object:  Default [DF__jos_conte__catid__5FB337D6]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conte__catid__5FB337D6]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conte__catid__5FB337D6]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT ((0)) FOR [catid]
END


End;

/****** Object:  Default [DF__jos_conte__creat__60A75C0F]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conte__creat__60A75C0F]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conte__creat__60A75C0F]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT ('1900-01-01 00:00:00') FOR [created]
END


End;

/****** Object:  Default [DF__jos_conte__creat__619B8048]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conte__creat__619B8048]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conte__creat__619B8048]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT ((0)) FOR [created_by]
END


End;

/****** Object:  Default [DF__jos_conte__creat__628FA481]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conte__creat__628FA481]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conte__creat__628FA481]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT (N'') FOR [created_by_alias]
END


End;

/****** Object:  Default [DF__jos_conte__modif__6383C8BA]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conte__modif__6383C8BA]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conte__modif__6383C8BA]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT ('1900-01-01 00:00:00') FOR [modified]
END


End;

/****** Object:  Default [DF__jos_conte__modif__6477ECF3]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conte__modif__6477ECF3]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conte__modif__6477ECF3]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT ((0)) FOR [modified_by]
END


End;

/****** Object:  Default [DF__jos_conte__check__656C112C]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conte__check__656C112C]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conte__check__656C112C]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT ((0)) FOR [checked_out]
END


End;

/****** Object:  Default [DF__jos_conte__check__66603565]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conte__check__66603565]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conte__check__66603565]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT ('1900-01-01 00:00:00') FOR [checked_out_time]
END


End;

/****** Object:  Default [DF__jos_conte__publi__6754599E]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conte__publi__6754599E]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conte__publi__6754599E]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT ('1900-01-01 00:00:00') FOR [publish_up]
END


End;

/****** Object:  Default [DF__jos_conte__publi__68487DD7]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conte__publi__68487DD7]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conte__publi__68487DD7]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT ('1900-01-01 00:00:00') FOR [publish_down]
END


End;

/****** Object:  Default [DF__jos_conte__versi__693CA210]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conte__versi__693CA210]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conte__versi__693CA210]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT ((1)) FOR [version]
END


End;

/****** Object:  Default [DF__jos_conte__paren__6A30C649]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conte__paren__6A30C649]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conte__paren__6A30C649]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT ((0)) FOR [parentid]
END


End;

/****** Object:  Default [DF__jos_conte__order__6B24EA82]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conte__order__6B24EA82]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conte__order__6B24EA82]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT ((0)) FOR [ordering]
END


End;

/****** Object:  Default [DF__jos_conte__acces__6C190EBB]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conte__acces__6C190EBB]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conte__acces__6C190EBB]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT ((0)) FOR [access]
END


End;

/****** Object:  Default [DF__jos_conten__hits__6D0D32F4]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conten__hits__6D0D32F4]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conten__hits__6D0D32F4]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT ((0)) FOR [hits]
END


End;

/****** Object:  Default [DF__jos_conte__featu__6E01572D]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_conte__featu__6E01572D]') AND parent_object_id = OBJECT_ID(N'[jos_content]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_conte__featu__6E01572D]') AND type = 'D')
BEGIN
ALTER TABLE [jos_content] ADD  DEFAULT ((0)) FOR [featured]
END

ALTER TABLE [jos_content] ADD tags nvarchar(MAX) NULL;

End;


/****** Object:  Table [jos_core_log_searches]    Script Date: 11/08/2010 18:41:22 ******/


SET QUOTED_IDENTIFIER ON;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_core_log_searches]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_core_log_searches](
	[search_term] [nvarchar](128) NOT NULL,
	[hits] [bigint] NOT NULL
)
END;

/****** Object:  Default [DF__jos_core___searc__778AC167]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_core___searc__778AC167]') AND parent_object_id = OBJECT_ID(N'[jos_core_log_searches]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_core___searc__778AC167]') AND type = 'D')
BEGIN
ALTER TABLE [jos_core_log_searches] ADD  DEFAULT (N'') FOR [search_term]
END


End;

/****** Object:  Default [DF__jos_core_l__hits__787EE5A0]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_core_l__hits__787EE5A0]') AND parent_object_id = OBJECT_ID(N'[jos_core_log_searches]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_core_l__hits__787EE5A0]') AND type = 'D')
BEGIN
ALTER TABLE [jos_core_log_searches] ADD  DEFAULT ((0)) FOR [hits]
END


End;


/****** Object:  Table [jos_extensions]    Script Date: 11/08/2010 18:41:22 ******/


SET QUOTED_IDENTIFIER ON;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_extensions]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_extensions](
	[extension_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[type] [nvarchar](20) NOT NULL,
	[element] [nvarchar](100) NOT NULL,
	[folder] [nvarchar](100) NOT NULL,
	[client_id] [smallint] NOT NULL,
	[enabled] [smallint] NOT NULL,
	[access] [int] NOT NULL,
	[protected] [smallint] NOT NULL,
	[manifest_cache] [nvarchar](max) NOT NULL,
	[params] [nvarchar](max) NOT NULL,
	[custom_data] [nvarchar](max) NOT NULL,
	[system_data] [nvarchar](max) NOT NULL,
	[checked_out] [bigint] NOT NULL,
	[checked_out_time] [datetime] NOT NULL,
	[ordering] [int] NULL,
	[state] [int] NULL,
 CONSTRAINT [PK_jos_extensions_extension_id] PRIMARY KEY CLUSTERED
(
	[extension_id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_extensions]') AND name = N'element_clientid')
CREATE NONCLUSTERED INDEX [element_clientid] ON [jos_extensions]
(
	[element] ASC,
	[client_id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_extensions]') AND name = N'element_folder_clientid')
CREATE NONCLUSTERED INDEX [element_folder_clientid] ON [jos_extensions]
(
	[element] ASC,
	[folder] ASC,
	[client_id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_extensions]') AND name = N'extension')
CREATE NONCLUSTERED INDEX [extension] ON [jos_extensions]
(
	[type] ASC,
	[element] ASC,
	[folder] ASC,
	[client_id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

/****** Object:  Default [DF__jos_exten__enabl__7A672E12]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_exten__enabl__7A672E12]') AND parent_object_id = OBJECT_ID(N'[jos_extensions]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_exten__enabl__7A672E12]') AND type = 'D')
BEGIN
ALTER TABLE [jos_extensions] ADD  DEFAULT ((1)) FOR [enabled]
END


End;

/****** Object:  Default [DF__jos_exten__acces__7B5B524B]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_exten__acces__7B5B524B]') AND parent_object_id = OBJECT_ID(N'[jos_extensions]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_exten__acces__7B5B524B]') AND type = 'D')
BEGIN
ALTER TABLE [jos_extensions] ADD  DEFAULT ((1)) FOR [access]
END


End;

/****** Object:  Default [DF__jos_exten__prote__7C4F7684]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_exten__prote__7C4F7684]') AND parent_object_id = OBJECT_ID(N'[jos_extensions]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_exten__prote__7C4F7684]') AND type = 'D')
BEGIN
ALTER TABLE [jos_extensions] ADD  DEFAULT ((0)) FOR [protected]
END


End;

/****** Object:  Default [DF__jos_exten__check__7D439ABD]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_exten__check__7D439ABD]') AND parent_object_id = OBJECT_ID(N'[jos_extensions]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_exten__check__7D439ABD]') AND type = 'D')
BEGIN
ALTER TABLE [jos_extensions] ADD  DEFAULT ((0)) FOR [checked_out]
END


End;

/****** Object:  Default [DF__jos_exten__check__7E37BEF6]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_exten__check__7E37BEF6]') AND parent_object_id = OBJECT_ID(N'[jos_extensions]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_exten__check__7E37BEF6]') AND type = 'D')
BEGIN
ALTER TABLE [jos_extensions] ADD  DEFAULT ('1900-01-01 00:00:00') FOR [checked_out_time]
END


End;

/****** Object:  Default [DF__jos_exten__order__7F2BE32F]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_exten__order__7F2BE32F]') AND parent_object_id = OBJECT_ID(N'[jos_extensions]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_exten__order__7F2BE32F]') AND type = 'D')
BEGIN
ALTER TABLE [jos_extensions] ADD  DEFAULT ((0)) FOR [ordering]
END


End;

/****** Object:  Default [DF__jos_exten__state__00200768]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_exten__state__00200768]') AND parent_object_id = OBJECT_ID(N'[jos_extensions]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_exten__state__00200768]') AND type = 'D')
BEGIN
ALTER TABLE [jos_extensions] ADD  DEFAULT ((0)) FOR [state]
END


End;


/****** Object:  Table [jos_languages]    Script Date: 11/08/2010 18:41:22 ******/


SET QUOTED_IDENTIFIER ON;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_languages]') AND type in (N'U'))
BEGIN

CREATE TABLE [jos_languages](
	[lang_id] [bigint] IDENTITY(1,1) NOT NULL,
	[lang_code] [nvarchar](7) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[title_native] [nvarchar](50) NOT NULL,
	[sef] [nvarchar](50) NOT NULL,
	[image] [nvarchar](50) NOT NULL,
	[description] [nvarchar](512) NOT NULL,
	[metakey] [nvarchar](max) NOT NULL,
	[metadesc] [nvarchar](max) NOT NULL,
	[published] [int] NOT NULL,
	[ordering]  [int] NOT NULL,
	[sitename] [nvarchar] (1024) NOT NULL,
 CONSTRAINT [PK_jos_languages_lang_id] PRIMARY KEY CLUSTERED
(
	[lang_id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF),
 CONSTRAINT [jos_languages$idx_sef] UNIQUE NONCLUSTERED
(
	[sef] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;


/****** Object:  Default [DF__jos_langu__publi__02084FDA]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_langu__publi__02084FDA]') AND parent_object_id = OBJECT_ID(N'[jos_languages]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_langu__publi__02084FDA]') AND type = 'D')
BEGIN
ALTER TABLE [jos_languages] ADD  DEFAULT ((0)) FOR [published]
END


End;


/****** Object:  Table [jos_menu]    Script Date: 11/08/2010 18:41:22 ******/


SET QUOTED_IDENTIFIER ON;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_menu]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_menu](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[menutype] [nvarchar](24) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[alias] [nvarchar](255) NOT NULL,
	[note] [nvarchar](255) NOT NULL,
	[path] [nvarchar](1024) NOT NULL,
	[link] [nvarchar](1024) NOT NULL,
	[type] [nvarchar](16) NOT NULL,
	[published] [smallint] NOT NULL,
	[parent_id] [bigint] NOT NULL,
	[level] [bigint] NOT NULL,
	[component_id] [bigint] NOT NULL,
	[ordering] [int] NOT NULL,
	[checked_out] [bigint] NOT NULL,
	[checked_out_time] [datetime] NOT NULL,
	[browserNav] [smallint] NOT NULL,
	[access] [int] NOT NULL,
	[img] [nvarchar](255) NOT NULL,
	[template_style_id] [bigint] NOT NULL,
	[params] [nvarchar](max) NOT NULL,
	[lft] [int] NOT NULL,
	[rgt] [int] NOT NULL,
	[home] [tinyint] NOT NULL,
	[language] [nvarchar](7) NOT NULL,
	[client_id] [smallint] NOT NULL,
 CONSTRAINT [PK_jos_menu_id] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF),
 CONSTRAINT [jos_menu$idx_client_id_parent_id_alias] UNIQUE NONCLUSTERED
(
	[client_id] ASC,
	[parent_id] ASC,
	[alias] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_menu]') AND name = N'idx_alias')
CREATE NONCLUSTERED INDEX [idx_alias] ON [jos_menu]
(
	[alias] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_menu]') AND name = N'idx_componentid')
CREATE NONCLUSTERED INDEX [idx_componentid] ON [jos_menu]
(
	[component_id] ASC,
	[menutype] ASC,
	[published] ASC,
	[access] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_menu]') AND name = N'idx_language')
CREATE NONCLUSTERED INDEX [idx_language] ON [jos_menu]
(
	[language] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_menu]') AND name = N'idx_left_right')
CREATE NONCLUSTERED INDEX [idx_left_right] ON [jos_menu]
(
	[lft] ASC,
	[rgt] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_menu]') AND name = N'idx_menutype')
CREATE NONCLUSTERED INDEX [idx_menutype] ON [jos_menu]
(
	[menutype] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

/****** Object:  Default [DF__jos_menu__note__03F0984C]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_menu__note__03F0984C]') AND parent_object_id = OBJECT_ID(N'[jos_menu]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_menu__note__03F0984C]') AND type = 'D')
BEGIN
ALTER TABLE [jos_menu] ADD  DEFAULT (N'') FOR [note]
END


End;

/****** Object:  Default [DF__jos_menu__publis__04E4BC85]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_menu__publis__04E4BC85]') AND parent_object_id = OBJECT_ID(N'[jos_menu]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_menu__publis__04E4BC85]') AND type = 'D')
BEGIN
ALTER TABLE [jos_menu] ADD  DEFAULT ((0)) FOR [published]
END


End;

/****** Object:  Default [DF__jos_menu__parent__05D8E0BE]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_menu__parent__05D8E0BE]') AND parent_object_id = OBJECT_ID(N'[jos_menu]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_menu__parent__05D8E0BE]') AND type = 'D')
BEGIN
ALTER TABLE [jos_menu] ADD  DEFAULT ((1)) FOR [parent_id]
END


End;

/****** Object:  Default [DF__jos_menu__level__06CD04F7]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_menu__level__06CD04F7]') AND parent_object_id = OBJECT_ID(N'[jos_menu]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_menu__level__06CD04F7]') AND type = 'D')
BEGIN
ALTER TABLE [jos_menu] ADD  DEFAULT ((0)) FOR [level]
END


End;

/****** Object:  Default [DF__jos_menu__compon__07C12930]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_menu__compon__07C12930]') AND parent_object_id = OBJECT_ID(N'[jos_menu]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_menu__compon__07C12930]') AND type = 'D')
BEGIN
ALTER TABLE [jos_menu] ADD  DEFAULT ((0)) FOR [component_id]
END


End;

/****** Object:  Default [DF__jos_menu__orderi__08B54D69]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_menu__orderi__08B54D69]') AND parent_object_id = OBJECT_ID(N'[jos_menu]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_menu__orderi__08B54D69]') AND type = 'D')
BEGIN
ALTER TABLE [jos_menu] ADD  DEFAULT ((0)) FOR [ordering]
END


End;

/****** Object:  Default [DF__jos_menu__checke__09A971A2]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_menu__checke__09A971A2]') AND parent_object_id = OBJECT_ID(N'[jos_menu]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_menu__checke__09A971A2]') AND type = 'D')
BEGIN
ALTER TABLE [jos_menu] ADD  DEFAULT ((0)) FOR [checked_out]
END


End;

/****** Object:  Default [DF__jos_menu__checke__0A9D95DB]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_menu__checke__0A9D95DB]') AND parent_object_id = OBJECT_ID(N'[jos_menu]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_menu__checke__0A9D95DB]') AND type = 'D')
BEGIN
ALTER TABLE [jos_menu] ADD  DEFAULT ('1900-01-01 00:00:00') FOR [checked_out_time]
END


End;

/****** Object:  Default [DF__jos_menu__browse__0B91BA14]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_menu__browse__0B91BA14]') AND parent_object_id = OBJECT_ID(N'[jos_menu]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_menu__browse__0B91BA14]') AND type = 'D')
BEGIN
ALTER TABLE [jos_menu] ADD  DEFAULT ((0)) FOR [browserNav]
END


End;

/****** Object:  Default [DF__jos_menu__access__0C85DE4D]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_menu__access__0C85DE4D]') AND parent_object_id = OBJECT_ID(N'[jos_menu]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_menu__access__0C85DE4D]') AND type = 'D')
BEGIN
ALTER TABLE [jos_menu] ADD  DEFAULT ((0)) FOR [access]
END


End;

/****** Object:  Default [DF__jos_menu__templa__0D7A0286]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_menu__templa__0D7A0286]') AND parent_object_id = OBJECT_ID(N'[jos_menu]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_menu__templa__0D7A0286]') AND type = 'D')
BEGIN
ALTER TABLE [jos_menu] ADD  DEFAULT ((0)) FOR [template_style_id]
END


End;

/****** Object:  Default [DF__jos_menu__lft__0E6E26BF]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_menu__lft__0E6E26BF]') AND parent_object_id = OBJECT_ID(N'[jos_menu]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_menu__lft__0E6E26BF]') AND type = 'D')
BEGIN
ALTER TABLE [jos_menu] ADD  DEFAULT ((0)) FOR [lft]
END


End;

/****** Object:  Default [DF__jos_menu__rgt__0F624AF8]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_menu__rgt__0F624AF8]') AND parent_object_id = OBJECT_ID(N'[jos_menu]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_menu__rgt__0F624AF8]') AND type = 'D')
BEGIN
ALTER TABLE [jos_menu] ADD  DEFAULT ((0)) FOR [rgt]
END


End;

/****** Object:  Default [DF__jos_menu__home__10566F31]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_menu__home__10566F31]') AND parent_object_id = OBJECT_ID(N'[jos_menu]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_menu__home__10566F31]') AND type = 'D')
BEGIN
ALTER TABLE [jos_menu] ADD  DEFAULT ((0)) FOR [home]
END


End;

/****** Object:  Default [DF__jos_menu__langua__114A936A]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_menu__langua__114A936A]') AND parent_object_id = OBJECT_ID(N'[jos_menu]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_menu__langua__114A936A]') AND type = 'D')
BEGIN
ALTER TABLE [jos_menu] ADD  DEFAULT (N'') FOR [language]
END


End;

/****** Object:  Default [DF__jos_menu__client__123EB7A3]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_menu__client__123EB7A3]') AND parent_object_id = OBJECT_ID(N'[jos_menu]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_menu__client__123EB7A3]') AND type = 'D')
BEGIN
ALTER TABLE [jos_menu] ADD  DEFAULT ((0)) FOR [client_id]
END


End;


/****** Object:  Table [jos_menu_types]    Script Date: 11/08/2010 18:41:22 ******/


SET QUOTED_IDENTIFIER ON;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_menu_types]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_menu_types](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[menutype] [nvarchar](24) NOT NULL,
	[title] [nvarchar](48) NOT NULL,
	[description] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_jos_menu_types_id] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF),
 CONSTRAINT [jos_menu_types$idx_menutype] UNIQUE NONCLUSTERED
(
	[menutype] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;


/****** Object:  Default [DF__jos_menu___descr__14270015]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_menu___descr__14270015]') AND parent_object_id = OBJECT_ID(N'[jos_menu_types]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_menu___descr__14270015]') AND type = 'D')
BEGIN
ALTER TABLE [jos_menu_types] ADD  DEFAULT (N'') FOR [description]
END


End;


SET QUOTED_IDENTIFIER ON;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_modules]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_modules](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[note] [nvarchar](255) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[ordering] [int] NOT NULL,
	[position] [nvarchar](50) NULL ,
	[checked_out] [bigint] NOT NULL,
	[checked_out_time] [datetime] NOT NULL,
	[publish_up] [datetime] NOT NULL,
	[publish_down] [datetime] NOT NULL,
	[published] [smallint] NOT NULL,
	[module] [nvarchar](50) NULL,
	[access] [int] NOT NULL,
	[showtitle] [tinyint] NOT NULL,
	[params] [nvarchar](max) NOT NULL,
	[client_id] [smallint] NOT NULL,
	[language] [nvarchar](7) NOT NULL,
 CONSTRAINT [PK_jos_modules_id] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_modules]') AND name = N'idx_language')
CREATE NONCLUSTERED INDEX [idx_language] ON [jos_modules]
(
	[language] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_modules]') AND name = N'newsfeeds')
CREATE NONCLUSTERED INDEX [newsfeeds] ON [jos_modules]
(
	[module] ASC,
	[published] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_modules]') AND name = N'published')
CREATE NONCLUSTERED INDEX [published] ON [jos_modules]
(
	[published] ASC,
	[access] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);


/****** Object:  Default [DF__jos_modul__title__2180FB33]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_modul__title__2180FB33]') AND parent_object_id = OBJECT_ID(N'[jos_modules]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_modul__title__2180FB33]') AND type = 'D')
BEGIN
ALTER TABLE [jos_modules] ADD  DEFAULT (N'') FOR [title]
END


End;

/****** Object:  Default [DF__jos_module__note__22751F6C]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_module__note__22751F6C]') AND parent_object_id = OBJECT_ID(N'[jos_modules]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_module__note__22751F6C]') AND type = 'D')
BEGIN
ALTER TABLE [jos_modules] ADD  DEFAULT (N'') FOR [note]
END


End;

/****** Object:  Default [DF__jos_modul__order__236943A5]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_modul__order__236943A5]') AND parent_object_id = OBJECT_ID(N'[jos_modules]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_modul__order__236943A5]') AND type = 'D')
BEGIN
ALTER TABLE [jos_modules] ADD  DEFAULT ((0)) FOR [ordering]
END


End;

/****** Object:  Default [DF__jos_modul__posit__245D67DE]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_modul__posit__245D67DE]') AND parent_object_id = OBJECT_ID(N'[jos_modules]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_modul__posit__245D67DE]') AND type = 'D')
BEGIN
ALTER TABLE [jos_modules] ADD  DEFAULT (NULL) FOR [position]
END


End;

/****** Object:  Default [DF__jos_modul__check__25518C17]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_modul__check__25518C17]') AND parent_object_id = OBJECT_ID(N'[jos_modules]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_modul__check__25518C17]') AND type = 'D')
BEGIN
ALTER TABLE [jos_modules] ADD  DEFAULT ((0)) FOR [checked_out]
END


End;

/****** Object:  Default [DF__jos_modul__check__2645B050]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_modul__check__2645B050]') AND parent_object_id = OBJECT_ID(N'[jos_modules]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_modul__check__2645B050]') AND type = 'D')
BEGIN
ALTER TABLE [jos_modules] ADD  DEFAULT ('1900-01-01 00:00:00') FOR [checked_out_time]
END


End;

/****** Object:  Default [DF__jos_modul__publi__2739D489]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_modul__publi__2739D489]') AND parent_object_id = OBJECT_ID(N'[jos_modules]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_modul__publi__2739D489]') AND type = 'D')
BEGIN
ALTER TABLE [jos_modules] ADD  DEFAULT ('1900-01-01 00:00:00') FOR [publish_up]
END


End;

/****** Object:  Default [DF__jos_modul__publi__282DF8C2]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_modul__publi__282DF8C2]') AND parent_object_id = OBJECT_ID(N'[jos_modules]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_modul__publi__282DF8C2]') AND type = 'D')
BEGIN
ALTER TABLE [jos_modules] ADD  DEFAULT ('1900-01-01 00:00:00') FOR [publish_down]
END


End;

/****** Object:  Default [DF__jos_modul__publi__29221CFB]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_modul__publi__29221CFB]') AND parent_object_id = OBJECT_ID(N'[jos_modules]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_modul__publi__29221CFB]') AND type = 'D')
BEGIN
ALTER TABLE [jos_modules] ADD  DEFAULT ((0)) FOR [published]
END


End;

/****** Object:  Default [DF__jos_modul__modul__2A164134]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_modul__modul__2A164134]') AND parent_object_id = OBJECT_ID(N'[jos_modules]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_modul__modul__2A164134]') AND type = 'D')
BEGIN
ALTER TABLE [jos_modules] ADD  DEFAULT (NULL) FOR [module]
END


End;

/****** Object:  Default [DF__jos_modul__acces__2B0A656D]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_modul__acces__2B0A656D]') AND parent_object_id = OBJECT_ID(N'[jos_modules]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_modul__acces__2B0A656D]') AND type = 'D')
BEGIN
ALTER TABLE [jos_modules] ADD  DEFAULT ((0)) FOR [access]
END


End;

/****** Object:  Default [DF__jos_modul__showt__2BFE89A6]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_modul__showt__2BFE89A6]') AND parent_object_id = OBJECT_ID(N'[jos_modules]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_modul__showt__2BFE89A6]') AND type = 'D')
BEGIN
ALTER TABLE [jos_modules] ADD  DEFAULT ((1)) FOR [showtitle]
END


End;

/****** Object:  Default [DF__jos_modul__param__2CF2ADDF]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_modul__param__2CF2ADDF]') AND parent_object_id = OBJECT_ID(N'[jos_modules]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_modul__param__2CF2ADDF]') AND type = 'D')
BEGIN
ALTER TABLE [jos_modules] ADD  DEFAULT (N'') FOR [params]
END


End;

/****** Object:  Default [DF__jos_modul__clien__2DE6D218]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_modul__clien__2DE6D218]') AND parent_object_id = OBJECT_ID(N'[jos_modules]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_modul__clien__2DE6D218]') AND type = 'D')
BEGIN
ALTER TABLE [jos_modules] ADD  DEFAULT ((0)) FOR [client_id]
END


End;


/****** Object:  Table [jos_modules_menu]    Script Date: 11/08/2010 18:41:22 ******/


SET QUOTED_IDENTIFIER ON;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_modules_menu]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_modules_menu](
	[moduleid] [int] NOT NULL,
	[menuid] [int] NOT NULL,
 CONSTRAINT [PK_jos_modules_menu_moduleid] PRIMARY KEY CLUSTERED
(
	[moduleid] ASC,
	[menuid] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;


/****** Object:  Default [DF__jos_modul__modul__2FCF1A8A]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_modul__modul__2FCF1A8A]') AND parent_object_id = OBJECT_ID(N'[jos_modules_menu]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_modul__modul__2FCF1A8A]') AND type = 'D')
BEGIN
ALTER TABLE [jos_modules_menu] ADD  DEFAULT ((0)) FOR [moduleid]
END


End;

/****** Object:  Default [DF__jos_modul__menui__30C33EC3]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_modul__menui__30C33EC3]') AND parent_object_id = OBJECT_ID(N'[jos_modules_menu]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_modul__menui__30C33EC3]') AND type = 'D')
BEGIN
ALTER TABLE [jos_modules_menu] ADD  DEFAULT ((0)) FOR [menuid]
END


End;


/****** Object:  Table [jos_schemas]    Script Date: 11/08/2010 18:41:22 ******/


SET QUOTED_IDENTIFIER ON;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_schemas]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_schemas](
	[extension_id] [int] NOT NULL,
	[version_id] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_jos_schemas_extension_id] PRIMARY KEY CLUSTERED
(
	[extension_id] ASC,
	[version_id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;


SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_overrider]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_overrider] (
  [id] [int] IDENTITY(1,1) NOT NULL,
  [constant] [nvarchar](max) NOT NULL,
  [string] [nvarchar] NOT NULL,
  [file] [nvarchar](max) NOT NULL,
   CONSTRAINT [PK_jos_overrider_id] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;


/****** Object:  Table [jos_session]    Script Date: 11/08/2010 18:41:22 ******/


SET QUOTED_IDENTIFIER ON;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_session]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_session](
	[session_id] [nvarchar](32) NOT NULL,
	[client_id] [tinyint] NOT NULL,
	[guest] [tinyint] NULL,
	[time] [nvarchar](14) NULL,
	[data] [nvarchar](max) NULL,
	[userid] [int] NULL,
	[username] [nvarchar](150) NULL,
	[usertype] [nvarchar](50) NULL,
 CONSTRAINT [PK_jos_session_session_id] PRIMARY KEY CLUSTERED
(
	[session_id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_session]') AND name = N'time')
CREATE NONCLUSTERED INDEX [time] ON [jos_session]
(
	[time] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_session]') AND name = N'userid')
CREATE NONCLUSTERED INDEX [userid] ON [jos_session]
(
	[userid] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_session]') AND name = N'whosonline')
CREATE NONCLUSTERED INDEX [whosonline] ON [jos_session]
(
	[guest] ASC,
	[usertype] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);


/****** Object:  Default [DF__jos_sessi__sessi__4B7734FF]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_sessi__sessi__4B7734FF]') AND parent_object_id = OBJECT_ID(N'[jos_session]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_sessi__sessi__4B7734FF]') AND type = 'D')
BEGIN
ALTER TABLE [jos_session] ADD  DEFAULT (N'') FOR [session_id]
END


End;

/****** Object:  Default [DF__jos_sessi__clien__4C6B5938]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_sessi__clien__4C6B5938]') AND parent_object_id = OBJECT_ID(N'[jos_session]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_sessi__clien__4C6B5938]') AND type = 'D')
BEGIN
ALTER TABLE [jos_session] ADD  DEFAULT ((0)) FOR [client_id]
END


End;

/****** Object:  Default [DF__jos_sessi__guest__4D5F7D71]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_sessi__guest__4D5F7D71]') AND parent_object_id = OBJECT_ID(N'[jos_session]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_sessi__guest__4D5F7D71]') AND type = 'D')
BEGIN
ALTER TABLE [jos_session] ADD  DEFAULT ((1)) FOR [guest]
END


End;

/****** Object:  Default [DF__jos_sessio__time__4E53A1AA]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_sessio__time__4E53A1AA]') AND parent_object_id = OBJECT_ID(N'[jos_session]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_sessio__time__4E53A1AA]') AND type = 'D')
BEGIN
ALTER TABLE [jos_session] ADD  DEFAULT (N'') FOR [time]
END


End;

/****** Object:  Default [DF__jos_sessio__data__4F47C5E3]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_sessio__data__4F47C5E3]') AND parent_object_id = OBJECT_ID(N'[jos_session]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_sessio__data__4F47C5E3]') AND type = 'D')
BEGIN
ALTER TABLE [jos_session] ADD  DEFAULT (NULL) FOR [data]
END


End;

/****** Object:  Default [DF__jos_sessi__useri__503BEA1C]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_sessi__useri__503BEA1C]') AND parent_object_id = OBJECT_ID(N'[jos_session]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_sessi__useri__503BEA1C]') AND type = 'D')
BEGIN
ALTER TABLE [jos_session] ADD  DEFAULT ((0)) FOR [userid]
END


End;

/****** Object:  Default [DF__jos_sessi__usern__51300E55]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_sessi__usern__51300E55]') AND parent_object_id = OBJECT_ID(N'[jos_session]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_sessi__usern__51300E55]') AND type = 'D')
BEGIN
ALTER TABLE [jos_session] ADD  DEFAULT (N'') FOR [username]
END


End;

/****** Object:  Default [DF__jos_sessi__usert__5224328E]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_sessi__usert__5224328E]') AND parent_object_id = OBJECT_ID(N'[jos_session]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_sessi__usert__5224328E]') AND type = 'D')
BEGIN
ALTER TABLE [jos_session] ADD  DEFAULT (N'') FOR [usertype]
END


End;


/****** Object:  Table [jos_updates]    Script Date: 11/08/2010 18:41:22 ******/


SET QUOTED_IDENTIFIER ON;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_updates]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_updates](
	[update_id] [int] IDENTITY(1,1) NOT NULL,
	[update_site_id] [int] NULL,
	[extension_id] [int] NULL,
	[cateryid] [int] NULL,
	[name] [nvarchar](100) NULL,
	[description] [nvarchar](max) NOT NULL,
	[element] [nvarchar](100) NULL,
	[type] [nvarchar](20) NULL,
	[folder] [nvarchar](20) NULL,
	[client_id] [smallint] NULL,
	[version] [nvarchar](10) NULL,
	[data] [nvarchar](max) NOT NULL,
	[detailsurl] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_jos_updates_update_id] PRIMARY KEY CLUSTERED
(
	[update_id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;

/****** Object:  Default [DF__jos_updat__updat__6442E2C9]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_updat__updat__6442E2C9]') AND parent_object_id = OBJECT_ID(N'[jos_updates]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_updat__updat__6442E2C9]') AND type = 'D')
BEGIN
ALTER TABLE [jos_updates] ADD  DEFAULT ((0)) FOR [update_site_id]
END


End;

/****** Object:  Default [DF__jos_updat__exten__65370702]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_updat__exten__65370702]') AND parent_object_id = OBJECT_ID(N'[jos_updates]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_updat__exten__65370702]') AND type = 'D')
BEGIN
ALTER TABLE [jos_updates] ADD  DEFAULT ((0)) FOR [extension_id]
END


End;

/****** Object:  Default [DF__jos_updat__categ__662B2B3B]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_updat__categ__662B2B3B]') AND parent_object_id = OBJECT_ID(N'[jos_updates]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_updat__categ__662B2B3B]') AND type = 'D')
BEGIN
ALTER TABLE [jos_updates] ADD  DEFAULT ((0)) FOR [cateryid]
END


End;

/****** Object:  Default [DF__jos_update__name__671F4F74]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_update__name__671F4F74]') AND parent_object_id = OBJECT_ID(N'[jos_updates]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_update__name__671F4F74]') AND type = 'D')
BEGIN
ALTER TABLE [jos_updates] ADD  DEFAULT (N'') FOR [name]
END


End;

/****** Object:  Default [DF__jos_updat__eleme__681373AD]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_updat__eleme__681373AD]') AND parent_object_id = OBJECT_ID(N'[jos_updates]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_updat__eleme__681373AD]') AND type = 'D')
BEGIN
ALTER TABLE [jos_updates] ADD  DEFAULT (N'') FOR [element]
END


End;

/****** Object:  Default [DF__jos_update__type__690797E6]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_update__type__690797E6]') AND parent_object_id = OBJECT_ID(N'[jos_updates]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_update__type__690797E6]') AND type = 'D')
BEGIN
ALTER TABLE [jos_updates] ADD  DEFAULT (N'') FOR [type]
END


End;

/****** Object:  Default [DF__jos_updat__folde__69FBBC1F]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_updat__folde__69FBBC1F]') AND parent_object_id = OBJECT_ID(N'[jos_updates]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_updat__folde__69FBBC1F]') AND type = 'D')
BEGIN
ALTER TABLE [jos_updates] ADD  DEFAULT (N'') FOR [folder]
END


End;

/****** Object:  Default [DF__jos_updat__clien__6AEFE058]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_updat__clien__6AEFE058]') AND parent_object_id = OBJECT_ID(N'[jos_updates]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_updat__clien__6AEFE058]') AND type = 'D')
BEGIN
ALTER TABLE [jos_updates] ADD  DEFAULT ((0)) FOR [client_id]
END


End;

/****** Object:  Default [DF__jos_updat__versi__6BE40491]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_updat__versi__6BE40491]') AND parent_object_id = OBJECT_ID(N'[jos_updates]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_updat__versi__6BE40491]') AND type = 'D')
BEGIN
ALTER TABLE [jos_updates] ADD  DEFAULT (N'') FOR [version]
END


End;


/****** Object:  Table [jos_update_categories]    Script Date: 11/08/2010 18:41:22 ******/


SET QUOTED_IDENTIFIER ON;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_update_categories]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_update_categories](
	[cateryid] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](20) NULL,
	[description] [nvarchar](max) NOT NULL,
	[parent] [int] NULL,
	[updatesite] [int] NULL,
 CONSTRAINT [PK_jos_update_categories_cateryid] PRIMARY KEY CLUSTERED
(
	[cateryid] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;

/****** Object:  Default [DF__jos_update__name__59C55456]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_update__name__59C55456]') AND parent_object_id = OBJECT_ID(N'[jos_update_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_update__name__59C55456]') AND type = 'D')
BEGIN
ALTER TABLE [jos_update_categories] ADD  DEFAULT (N'') FOR [name]
END


End;

/****** Object:  Default [DF__jos_updat__paren__5AB9788F]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_updat__paren__5AB9788F]') AND parent_object_id = OBJECT_ID(N'[jos_update_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_updat__paren__5AB9788F]') AND type = 'D')
BEGIN
ALTER TABLE [jos_update_categories] ADD  DEFAULT ((0)) FOR [parent]
END


End;

/****** Object:  Default [DF__jos_updat__updat__5BAD9CC8]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_updat__updat__5BAD9CC8]') AND parent_object_id = OBJECT_ID(N'[jos_update_categories]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_updat__updat__5BAD9CC8]') AND type = 'D')
BEGIN
ALTER TABLE [jos_update_categories] ADD  DEFAULT ((0)) FOR [updatesite]
END


End;


/****** Object:  Table [jos_update_sites]    Script Date: 11/08/2010 18:41:22 ******/


SET QUOTED_IDENTIFIER ON;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_update_sites]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_update_sites](
	[update_site_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NULL,
	[type] [nvarchar](20) NULL,
	[location] [nvarchar](max) NOT NULL,
	[enabled] [int] NULL,
	[last_check_timestamp] [int] DEFAULT '0',
 CONSTRAINT [PK_jos_update_sites_update_site_id] PRIMARY KEY CLUSTERED
(
	[update_site_id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;

/****** Object:  Default [DF__jos_update__name__5D95E53A]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_update__name__5D95E53A]') AND parent_object_id = OBJECT_ID(N'[jos_update_sites]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_update__name__5D95E53A]') AND type = 'D')
BEGIN
ALTER TABLE [jos_update_sites] ADD  DEFAULT (N'') FOR [name]
END


End;
SET IDENTITY_INSERT jos_update_sites ON;

INSERT INTO jos_update_sites (update_site_id,name ,type,location,enabled,last_check_timestamp) VALUES (1, 'Joomla Core', 'collection', 'http://update.joomla.org/core/list.xml', 1, 0);


INSERT INTO jos_update_sites (update_site_id ,name ,type,location,enabled,last_check_timestamp) VALUES (2, 'Joomla Extension Directory', 'collection', 'http://update.joomla.org/jed/list.xml', 1, 0);

SET IDENTITY_INSERT jos_update_sites OFF;

/****** Object:  Default [DF__jos_update__type__5E8A0973]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_update__type__5E8A0973]') AND parent_object_id = OBJECT_ID(N'[jos_update_sites]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_update__type__5E8A0973]') AND type = 'D')
BEGIN
ALTER TABLE [jos_update_sites] ADD  DEFAULT (N'') FOR [type]
END


End;
/****** Object:  Default [DF__jos_updat__enabl__5F7E2DAC]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_updat__enabl__5F7E2DAC]') AND parent_object_id = OBJECT_ID(N'[jos_update_sites]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_updat__enabl__5F7E2DAC]') AND type = 'D')
BEGIN
ALTER TABLE [jos_update_sites] ADD  DEFAULT ((0)) FOR [enabled]
END


End;


/****** Object:  Table [jos_update_sites_extensions]    Script Date: 11/08/2010 18:41:22 ******/


SET QUOTED_IDENTIFIER ON;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_update_sites_extensions]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_update_sites_extensions](
	[update_site_id] [int] NOT NULL,
	[extension_id] [int] NOT NULL,
 CONSTRAINT [PK_jos_update_sites_extensions_update_site_id] PRIMARY KEY CLUSTERED
(
	[update_site_id] ASC,
	[extension_id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;

/****** Object:  Default [DF__jos_updat__updat__6166761E]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_updat__updat__6166761E]') AND parent_object_id = OBJECT_ID(N'[jos_update_sites_extensions]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_updat__updat__6166761E]') AND type = 'D')
BEGIN
ALTER TABLE [jos_update_sites_extensions] ADD  DEFAULT ((0)) FOR [update_site_id]
END


End;

/****** Object:  Default [DF__jos_updat__exten__625A9A57]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_updat__exten__625A9A57]') AND parent_object_id = OBJECT_ID(N'[jos_update_sites_extensions]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_updat__exten__625A9A57]') AND type = 'D')
BEGIN
ALTER TABLE [jos_update_sites_extensions] ADD  DEFAULT ((0)) FOR [extension_id]
END


End;

INSERT INTO jos_update_sites_extensions (update_site_id, extension_id)
SELECT 1, 700
UNION ALL
SELECT 2, 700;


/****** Object:  Table [jos_usergroups]    Script Date: 11/08/2010 18:41:22 ******/


SET QUOTED_IDENTIFIER ON;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_usergroups]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_usergroups](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[parent_id] [bigint] NOT NULL,
	[lft] [bigint] NOT NULL,
	[rgt] [bigint] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_jos_usergroups_id] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF),
 CONSTRAINT [jos_usergroups$idx_usergroup_parent_title_lookup] UNIQUE NONCLUSTERED
(
	[title] ASC,
	[parent_id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_usergroups]') AND name = N'idx_usergroup_title_lookup')
CREATE NONCLUSTERED INDEX [idx_usergroup_title_lookup] ON [jos_usergroups]
(
	[title] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_usergroups]') AND name = N'idx_usergroup_adjacency_lookup')
CREATE NONCLUSTERED INDEX [idx_usergroup_adjacency_lookup] ON [jos_usergroups]
(
	[parent_id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_usergroups]') AND name = N'idx_usergroup_nested_set_lookup')
CREATE NONCLUSTERED INDEX [idx_usergroup_nested_set_lookup] ON [jos_usergroups]
(
	[lft] ASC,
	[rgt] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);


/****** Object:  Default [DF__jos_userg__paren__72910220]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_userg__paren__72910220]') AND parent_object_id = OBJECT_ID(N'[jos_usergroups]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_userg__paren__72910220]') AND type = 'D')
BEGIN
ALTER TABLE [jos_usergroups] ADD  DEFAULT ((0)) FOR [parent_id]
END


End;

/****** Object:  Default [DF__jos_usergro__lft__73852659]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_usergro__lft__73852659]') AND parent_object_id = OBJECT_ID(N'[jos_usergroups]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_usergro__lft__73852659]') AND type = 'D')
BEGIN
ALTER TABLE [jos_usergroups] ADD  DEFAULT ((0)) FOR [lft]
END


End;

/****** Object:  Default [DF__jos_usergro__rgt__74794A92]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_usergro__rgt__74794A92]') AND parent_object_id = OBJECT_ID(N'[jos_usergroups]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_usergro__rgt__74794A92]') AND type = 'D')
BEGIN
ALTER TABLE [jos_usergroups] ADD  DEFAULT ((0)) FOR [rgt]
END


End;

/****** Object:  Default [DF__jos_userg__title__756D6ECB]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_userg__title__756D6ECB]') AND parent_object_id = OBJECT_ID(N'[jos_usergroups]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_userg__title__756D6ECB]') AND type = 'D')
BEGIN
ALTER TABLE [jos_usergroups] ADD  DEFAULT (N'') FOR [title]
END


End;


/****** Object:  Table [jos_users]    Script Date: 11/08/2010 18:41:22 ******/


SET QUOTED_IDENTIFIER ON;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_users]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_users](
	[id] [int] IDENTITY(42,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[username] [nvarchar](150) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[usertype] [nvarchar](25) NOT NULL,
	[block] [smallint] NOT NULL,
	[sendEmail] [smallint] NULL,
	[registerDate] [datetime] NOT NULL,
	[lastvisitDate] [datetime] NOT NULL,
	[activation] [nvarchar](100) NOT NULL,
	[params] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_jos_users_id] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_users]') AND name = N'email')
CREATE NONCLUSTERED INDEX [email] ON [jos_users]
(
	[email] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_users]') AND name = N'idx_block')
CREATE NONCLUSTERED INDEX [idx_block] ON [jos_users]
(
	[block] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_users]') AND name = N'idx_name')
CREATE NONCLUSTERED INDEX [idx_name] ON [jos_users]
(
	[name] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_users]') AND name = N'username')
CREATE NONCLUSTERED INDEX [username] ON [jos_users]
(
	[username] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[jos_users]') AND name = N'usertype')
CREATE NONCLUSTERED INDEX [usertype] ON [jos_users]
(
	[usertype] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF);

/****** Object:  Default [DF__jos_users__name__7755B73D]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_users__name__7755B73D]') AND parent_object_id = OBJECT_ID(N'[jos_users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_users__name__7755B73D]') AND type = 'D')
BEGIN
ALTER TABLE [jos_users] ADD  DEFAULT (N'') FOR [name]
END


End;

/****** Object:  Default [DF__jos_users__usern__7849DB76]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_users__usern__7849DB76]') AND parent_object_id = OBJECT_ID(N'[jos_users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_users__usern__7849DB76]') AND type = 'D')
BEGIN
ALTER TABLE [jos_users] ADD  DEFAULT (N'') FOR [username]
END


End;

/****** Object:  Default [DF__jos_users__email__793DFFAF]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_users__email__793DFFAF]') AND parent_object_id = OBJECT_ID(N'[jos_users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_users__email__793DFFAF]') AND type = 'D')
BEGIN
ALTER TABLE [jos_users] ADD  DEFAULT (N'') FOR [email]
END


End;

/****** Object:  Default [DF__jos_users__passw__7A3223E8]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_users__passw__7A3223E8]') AND parent_object_id = OBJECT_ID(N'[jos_users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_users__passw__7A3223E8]') AND type = 'D')
BEGIN
ALTER TABLE [jos_users] ADD  DEFAULT (N'') FOR [password]
END


End;

/****** Object:  Default [DF__jos_users__usert__7B264821]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_users__usert__7B264821]') AND parent_object_id = OBJECT_ID(N'[jos_users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_users__usert__7B264821]') AND type = 'D')
BEGIN
ALTER TABLE [jos_users] ADD  DEFAULT (N'') FOR [usertype]
END


End;

/****** Object:  Default [DF__jos_users__block__7C1A6C5A]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_users__block__7C1A6C5A]') AND parent_object_id = OBJECT_ID(N'[jos_users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_users__block__7C1A6C5A]') AND type = 'D')
BEGIN
ALTER TABLE [jos_users] ADD  DEFAULT ((0)) FOR [block]
END


End;

/****** Object:  Default [DF__jos_users__sendE__7D0E9093]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_users__sendE__7D0E9093]') AND parent_object_id = OBJECT_ID(N'[jos_users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_users__sendE__7D0E9093]') AND type = 'D')
BEGIN
ALTER TABLE [jos_users] ADD  DEFAULT ((0)) FOR [sendEmail]
END


End;

/****** Object:  Default [DF__jos_users__regis__7E02B4CC]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_users__regis__7E02B4CC]') AND parent_object_id = OBJECT_ID(N'[jos_users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_users__regis__7E02B4CC]') AND type = 'D')
BEGIN
ALTER TABLE [jos_users] ADD  DEFAULT ('1900-01-01 00:00:00') FOR [registerDate]
END


End;

/****** Object:  Default [DF__jos_users__lastv__7EF6D905]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_users__lastv__7EF6D905]') AND parent_object_id = OBJECT_ID(N'[jos_users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_users__lastv__7EF6D905]') AND type = 'D')
BEGIN
ALTER TABLE [jos_users] ADD  DEFAULT ('1900-01-01 00:00:00') FOR [lastvisitDate]
END


End;

/****** Object:  Default [DF__jos_users__activ__7FEAFD3E]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_users__activ__7FEAFD3E]') AND parent_object_id = OBJECT_ID(N'[jos_users]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_users__activ__7FEAFD3E]') AND type = 'D')
BEGIN
ALTER TABLE [jos_users] ADD  DEFAULT (N'') FOR [activation]
END


End;



SET QUOTED_IDENTIFIER ON;
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_user_profiles]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_user_profiles](
 [user_id] [int] NOT NULL,
 [profile_key] [nvarchar](100) NOT NULL,
 [profile_value] [nvarchar](255) NOT NULL,
 [ordering] [int] NOT NULL,
 CONSTRAINT [jos_user_profiles$idx_user_id_profile_key] UNIQUE CLUSTERED
(
 [user_id] ASC,
 [profile_key] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;
/****** Object:  Default [DF__bzncw_use__order__40C49C62]    Script Date: 01/18/2012 15:57:10 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_use__order__40C49C62]') AND parent_object_id = OBJECT_ID(N'[jos_user_profiles]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_use__order__40C49C62]') AND type = 'D')
BEGIN
ALTER TABLE [jos_user_profiles] ADD  DEFAULT ((0)) FOR [ordering]
END

End;


/****** Object:  Table [jos_user_usergroup_map]    Script Date: 11/08/2010 18:41:22 ******/


SET QUOTED_IDENTIFIER ON;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_user_usergroup_map]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_user_usergroup_map](
	[user_id] [bigint] NOT NULL,
	[group_id] [bigint] NOT NULL,
 CONSTRAINT [PK_jos_user_usergroup_map_user_id] PRIMARY KEY CLUSTERED
(
	[user_id] ASC,
	[group_id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;

/****** Object:  Default [DF__jos_user___user___6FB49575]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_user___user___6FB49575]') AND parent_object_id = OBJECT_ID(N'[jos_user_usergroup_map]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_user___user___6FB49575]') AND type = 'D')
BEGIN
ALTER TABLE [jos_user_usergroup_map] ADD  DEFAULT ((0)) FOR [user_id]
END


End;


IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_user___group__70A8B9AE]') AND parent_object_id = OBJECT_ID(N'[jos_user_usergroup_map]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_user___group__70A8B9AE]') AND type = 'D')
BEGIN
ALTER TABLE [jos_user_usergroup_map] ADD  DEFAULT ((0)) FOR [group_id]
END


End;


/****** Object:  Table [jos_viewlevels]    Script Date: 11/08/2010 18:41:22 ******/


SET QUOTED_IDENTIFIER ON;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_viewlevels]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_viewlevels](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](100) NOT NULL,
	[ordering] [int] NOT NULL,
	[rules] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_jos_viewlevels_id] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF),
 CONSTRAINT [jos_viewlevels$idx_assetgroup_title_lookup] UNIQUE NONCLUSTERED
(
	[title] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;


/****** Object:  Default [DF__jos_viewl__title__01D345B0]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_viewl__title__01D345B0]') AND parent_object_id = OBJECT_ID(N'[jos_viewlevels]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_viewl__title__01D345B0]') AND type = 'D')
BEGIN
ALTER TABLE [jos_viewlevels] ADD  DEFAULT (N'') FOR [title]
END


End;

/****** Object:  Default [DF__jos_viewl__order__02C769E9]    Script Date: 11/08/2010 18:41:22 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[DF__jos_viewl__order__02C769E9]') AND parent_object_id = OBJECT_ID(N'[jos_viewlevels]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__jos_viewl__order__02C769E9]') AND type = 'D')
BEGIN
ALTER TABLE [jos_viewlevels] ADD  DEFAULT ((0)) FOR [ordering]
END


End;


/****** Object:  Table [jos_dbtest]    Script Date: 1/22/2012 16:30:00 ******/


SET QUOTED_IDENTIFIER ON;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[jos_dbtest]') AND type in (N'U'))
BEGIN
CREATE TABLE [jos_dbtest](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](50) NOT NULL,
	[start_date] [datetime] NOT NULL,
	[description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_jos_dbtest_id] PRIMARY KEY CLUSTERED
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
END;


