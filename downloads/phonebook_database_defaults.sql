/*
This script was created by Visual Studio on 11/14/2016 at 6:33 PM.
Run this script on DESKTOP-DR25J5E.Phonebook_Base (DESKTOP-DR25J5E\Brett) to make it the same as DESKTOP-DR25J5E.Phonebook_Data (DESKTOP-DR25J5E\Brett).
This script performs its actions in the following order:
1. Disable foreign-key constraints.
2. Perform DELETE commands. 
3. Perform UPDATE commands.
4. Perform INSERT commands.
5. Re-enable foreign-key constraints.
Please back up your target database before running this script.
*/
SET NUMERIC_ROUNDABORT OFF
GO
SET XACT_ABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
/*Pointer used for text / image updates. This might not be needed, but is declared here just in case*/
DECLARE @pv binary(16)
BEGIN TRANSACTION
ALTER TABLE [bcms_blog].[BlogPostContents] DROP CONSTRAINT [FK_Cms_BlogPostContents_Cms_HtmlContents]
ALTER TABLE [bcms_pages].[PageTags] DROP CONSTRAINT [FK_Cms_PageTags_Cms_Pages]
ALTER TABLE [bcms_pages].[PageTags] DROP CONSTRAINT [FK_Cms_PageTags_Cms_Tags]
ALTER TABLE [bcms_blog].[Authors] DROP CONSTRAINT [FK_Cms_Authors_ImageId_MediaImages_Id]
ALTER TABLE [bcms_blog].[BlogPosts] DROP CONSTRAINT [FK_Cms_BlogPosts_Cms_PagesPages]
ALTER TABLE [bcms_blog].[BlogPosts] DROP CONSTRAINT [FK_Cms_BlogPosts_Cms_Authors]
ALTER TABLE [bcms_pages].[SitemapNodeTranslations] DROP CONSTRAINT [FK_Cms_SitemapNodeTranslations_Cms_Sitemaps]
ALTER TABLE [bcms_pages].[ServerControlWidgets] DROP CONSTRAINT [FK_Cms_ServerControlWidgets_Id_Widgets_Id]
ALTER TABLE [bcms_root].[MasterPages] DROP CONSTRAINT [FK_Cms_MasterPages_PageId_Cms_Pages]
ALTER TABLE [bcms_root].[MasterPages] DROP CONSTRAINT [FK_Cms_MasterPages_MasterPageId_Cms_Pages]
ALTER TABLE [bcms_root].[PageAccessRules] DROP CONSTRAINT [FK_Cms_PageAccessRules_PageId_Cms_Page_Id]
ALTER TABLE [bcms_root].[PageAccessRules] DROP CONSTRAINT [FK_Cms_PageAccessRules_AccessRuleId_Cms_AccessRules_Id]
ALTER TABLE [bcms_root].[ContentOptionTranslations] DROP CONSTRAINT [FK_Cms_ContentOptionTranslations_ContentOptionId_Cms_ContentOptions_Id]
ALTER TABLE [bcms_root].[ContentOptionTranslations] DROP CONSTRAINT [FK_Cms_ContentOptionTranslations_LanguageId_Cms_Languages_Id]
ALTER TABLE [bcms_pages].[PageCategories] DROP CONSTRAINT [FK_Cms_PageCategories_PageId_Cms_Page_Id]
ALTER TABLE [bcms_pages].[PageCategories] DROP CONSTRAINT [FK_Cms_PageCategories_CategoryId_Cms_Category_Id]
ALTER TABLE [bcms_blog].[Options] DROP CONSTRAINT [FK_Cms_BlogOptions_Cms_Layouts]
ALTER TABLE [bcms_blog].[Options] DROP CONSTRAINT [FK_Cms_BlogOptions_Cms_Pages]
ALTER TABLE [bcms_blog].[Options] DROP CONSTRAINT [FK_Cms_Blog_Options_DefaultContentTextMode_Pages_ContentTextModes_Id]
ALTER TABLE [bcms_users].[Users] DROP CONSTRAINT [FK_Cms_Users_ImageId_Cms_MediaFiles_Id]
ALTER TABLE [bcms_pages].[Pages] DROP CONSTRAINT [FK_Cms_PagesPages_Cms_RootPages]
ALTER TABLE [bcms_pages].[Pages] DROP CONSTRAINT [FK_Cms_Pages_CategoryId_Categories_Id]
ALTER TABLE [bcms_pages].[Pages] DROP CONSTRAINT [FK_Cms_Pages_ImageId_MediaImages_Id]
ALTER TABLE [bcms_root].[ChildContentOptionTranslations] DROP CONSTRAINT [FK_Cms_ChildContentOptionTranslations_ChildContentOptionId_Cms_ChildContentOptions_Id]
ALTER TABLE [bcms_root].[ChildContentOptionTranslations] DROP CONSTRAINT [FK_Cms_ChildContentOptionTranslations_LanguageId_Cms_Languages_Id]
ALTER TABLE [bcms_pages].[HtmlContentWidgets] DROP CONSTRAINT [FK_Cms_HtmlContentWidgets_Id_Widgets_Id]
ALTER TABLE [bcms_pages].[SitemapArchives] DROP CONSTRAINT [FK_Cms_SitemapArchives_Cms_Sitemaps]
ALTER TABLE [bcms_media].[MediaCategories] DROP CONSTRAINT [FK_Cms_MediaCategories_MediaId_Cms_Mdedia_Id]
ALTER TABLE [bcms_media].[MediaCategories] DROP CONSTRAINT [FK_Cms_MediaCategories_CategoryId_Cms_Category_Id]
ALTER TABLE [bcms_root].[CategoryTreeCategorizableItems] DROP CONSTRAINT [FK_Cms_CategoryTreeCategorizableItems_Cms_CategoryTrees]
ALTER TABLE [bcms_root].[CategoryTreeCategorizableItems] DROP CONSTRAINT [FK_Cms_CategoryTreeCategorizableItems_Cms_CategorizableItems]
ALTER TABLE [bcms_root].[ContentOptions] DROP CONSTRAINT [FK_Cms_ContentOptions_CustomOptionId_Cms_CustomOptions_Id]
ALTER TABLE [bcms_root].[ContentOptions] DROP CONSTRAINT [FK_Cms_ContentOptions_ContentId_Cms_Contents_Id]
ALTER TABLE [bcms_root].[ContentOptions] DROP CONSTRAINT [FK_Cms_ContentOptions_Type_Cms_OptionTypes_Id]
ALTER TABLE [bcms_root].[ContentRegions] DROP CONSTRAINT [FK_Cms_ContentRegions_Cms_Contents]
ALTER TABLE [bcms_root].[ContentRegions] DROP CONSTRAINT [FK_Cms_ContentRegions_Cms_Regions]
ALTER TABLE [bcms_pages].[SitemapNodes] DROP CONSTRAINT [FK_Cms_SitemapNodes_ParentNodeId_SitemapNodes_Id]
ALTER TABLE [bcms_pages].[SitemapNodes] DROP CONSTRAINT [FK_Cms_SitemapNodes_SitemapId_Cms_Sitemap_Id]
ALTER TABLE [bcms_pages].[SitemapNodes] DROP CONSTRAINT [FK_Cms_SitemapNodes_SitemapId_Cms_Page_Id]
ALTER TABLE [bcms_media].[MediaFolders] DROP CONSTRAINT [FK_Cms_MediaFolders_Id_Medias_Id]
ALTER TABLE [bcms_pages].[HtmlContents] DROP CONSTRAINT [FK_Cms_HtmlContents_Id_Contents_Id]
ALTER TABLE [bcms_pages].[HtmlContents] DROP CONSTRAINT [FK_Cms_HtmlContents_ContentTextMode_ContentTextModes_Id]
ALTER TABLE [bcms_root].[Contents] DROP CONSTRAINT [FK_Cms_Contents_Cms_ContentStatuses]
ALTER TABLE [bcms_root].[Contents] DROP CONSTRAINT [FK_Cms_Contents_Cms_Contents_OriginalId]
ALTER TABLE [bcms_root].[LayoutRegions] DROP CONSTRAINT [FK_Cms_LayoutRegions_Cms_Layouts]
ALTER TABLE [bcms_root].[LayoutRegions] DROP CONSTRAINT [FK_Cms_LayoutRegions_Cms_Regions]
ALTER TABLE [bcms_root].[PageOptions] DROP CONSTRAINT [FK_Cms_PageOptions_CustomOptionId_Cms_CustomOptions_Id]
ALTER TABLE [bcms_root].[PageOptions] DROP CONSTRAINT [FK_Cms_PageOptions_PageId_Cms_Pages_Id]
ALTER TABLE [bcms_root].[PageOptions] DROP CONSTRAINT [FK_Cms_PageOptions_Type_Cms_OptionTypes_Id]
ALTER TABLE [bcms_media].[MediaFiles] DROP CONSTRAINT [FK_MediaFiles_Id_Medias_Id]
ALTER TABLE [bcms_media].[Medias] DROP CONSTRAINT [FK_Cms_Medias_FolderId_MediaFolders_Id]
ALTER TABLE [bcms_media].[Medias] DROP CONSTRAINT [FK_Cms_Medias_Type_MediaTypes_Id]
ALTER TABLE [bcms_users].[UserRoles] DROP CONSTRAINT [FK_Cms_UserRoles_Role_Cms_Role_Id]
ALTER TABLE [bcms_users].[UserRoles] DROP CONSTRAINT [FK_Cms_UserRoles_User_Cms_Users_Id]
ALTER TABLE [bcms_root].[PageContentOptions] DROP CONSTRAINT [FK_Cms_PageContentOptions_CustomOptionId_Cms_CustomOptions_Id]
ALTER TABLE [bcms_root].[PageContentOptions] DROP CONSTRAINT [FK_Cms_PageContentOptions_PageContentId_Cms_PageContents_Id]
ALTER TABLE [bcms_root].[PageContentOptions] DROP CONSTRAINT [FK_Cms_PageContentOptions_Type_Cms_OptionTypes_Id]
ALTER TABLE [bcms_root].[PageContents] DROP CONSTRAINT [Fk__PageContents_ParentPageContentId__ParentPageContentId_Id]
ALTER TABLE [bcms_root].[PageContents] DROP CONSTRAINT [FK_Cms_PageContents_PageId_Pages_Id]
ALTER TABLE [bcms_root].[PageContents] DROP CONSTRAINT [FK_Cms_PageContents_ContentId_Contents_Id]
ALTER TABLE [bcms_root].[PageContents] DROP CONSTRAINT [FK_Cms_PageContents_RegionId_Regions_Id]
ALTER TABLE [bcms_media].[MediaFileAccessRules] DROP CONSTRAINT [FK_Cms_MediaFileAccessRules_MediaFileId_Cms_MediaFile_Id]
ALTER TABLE [bcms_media].[MediaFileAccessRules] DROP CONSTRAINT [FK_Cms_MediaFileAccessRules_AccessRuleId_Cms_AccessRules_Id]
ALTER TABLE [bcms_root].[Categories] DROP CONSTRAINT [Fk_Cms_Categories_ParentCategoryId__Categories_Id]
ALTER TABLE [bcms_root].[Categories] DROP CONSTRAINT [FK_Cms_Categories_CategoryTreeId_Cms_CategoryTree_Id]
ALTER TABLE [bcms_media].[MediaImages] DROP CONSTRAINT [FK_MediaImages_Id_MediaFiles_Id]
ALTER TABLE [bcms_media].[MediaImages] DROP CONSTRAINT [FK_MediaImages_ImageAlign_MediaImageAlignTypes_Id]
ALTER TABLE [bcms_root].[LayoutOptions] DROP CONSTRAINT [FK_Cms_LayoutOptions_CustomOptionId_Cms_CustomOptions_Id]
ALTER TABLE [bcms_root].[LayoutOptions] DROP CONSTRAINT [FK_Cms_LayoutOptions_Type_Cms_OptionTypes_Id]
ALTER TABLE [bcms_root].[LayoutOptions] DROP CONSTRAINT [FK_Cms_LayoutOptions_LayoutId_Cms_Layouts_Id]
ALTER TABLE [bcms_root].[Layouts] DROP CONSTRAINT [FK_Cms_Layouts_Cms_Modules]
ALTER TABLE [bcms_root].[WidgetCategories] DROP CONSTRAINT [FK_Cms_WidgetCategories_WidgetId_Cms_Widget_Id]
ALTER TABLE [bcms_root].[WidgetCategories] DROP CONSTRAINT [FK_Cms_WidgetCategories_CategoryId_Cms_Category_Id]
ALTER TABLE [bcms_root].[Widgets] DROP CONSTRAINT [FK_Cms_Widgets_Id_Content_Id]
ALTER TABLE [bcms_root].[Widgets] DROP CONSTRAINT [FK_Cms_Widgets_Id_Category_Id]
ALTER TABLE [bcms_root].[ChildContentOptions] DROP CONSTRAINT [FK_Cms_ChildContentOptions_ChildContentId_Cms_ChildContents_Id]
ALTER TABLE [bcms_root].[ChildContentOptions] DROP CONSTRAINT [FK_Cms_ChildContentOptions_Type_Cms_OptionTypes_Id]
ALTER TABLE [bcms_root].[ChildContentOptions] DROP CONSTRAINT [FK_Cms_ChildContentOptions_CustomOptionId_Cms_CustomOptions_Id]
ALTER TABLE [bcms_root].[ChildContents] DROP CONSTRAINT [FK_Cms_ChildContents_ParentContentId_Contents_Id]
ALTER TABLE [bcms_root].[ChildContents] DROP CONSTRAINT [FK_Cms_ChildContents_ChildContentId_Contents_Id]
ALTER TABLE [bcms_pages].[SitemapAccessRules] DROP CONSTRAINT [FK_Cms_SitemapAccessRules_SitemapId_Cms_Sitemap_Id]
ALTER TABLE [bcms_pages].[SitemapAccessRules] DROP CONSTRAINT [FK_Cms_SitemapAccessRules_AccessRuleId_Cms_AccessRules_Id]
ALTER TABLE [bcms_pages].[SitemapTags] DROP CONSTRAINT [FK_Cms_SitemapTags_Cms_Sitemaps]
ALTER TABLE [bcms_pages].[SitemapTags] DROP CONSTRAINT [FK_Cms_SitemapTags_Cms_Tags]
ALTER TABLE [bcms_root].[Pages] DROP CONSTRAINT [FK_Cms_RootPages_Cms_ProtocolForcingTypes]
ALTER TABLE [bcms_root].[Pages] DROP CONSTRAINT [FK_Cms_Pages_Cms_Pages]
ALTER TABLE [bcms_root].[Pages] DROP CONSTRAINT [FK_Cms_RootPages_Cms_PageStatuses]
ALTER TABLE [bcms_root].[Pages] DROP CONSTRAINT [FK_Cms_Pages_Cms_Layouts]
ALTER TABLE [bcms_root].[Pages] DROP CONSTRAINT [FK_Cms_Pages_Cms_Languages]
ALTER TABLE [bcms_media].[MediaTags] DROP CONSTRAINT [FK_Cms_MediaTags_Cms_Medias]
ALTER TABLE [bcms_media].[MediaTags] DROP CONSTRAINT [FK_Cms_MediaTags_Cms_Tags]
DELETE FROM [bcms_root].[CategoryTreeCategorizableItems] WHERE [Id]=N'0ac94e07-05cc-471b-9d5f-f2871ab96fbd'
DELETE FROM [bcms_root].[CategoryTreeCategorizableItems] WHERE [Id]=N'6ede1b45-cf85-4bc8-bf24-fb69b61a4972'
DELETE FROM [bcms_root].[CategoryTreeCategorizableItems] WHERE [Id]=N'8fd203f0-2679-4678-bec2-04e63523dd66'
DELETE FROM [bcms_root].[CategoryTreeCategorizableItems] WHERE [Id]=N'f13b7ae7-b892-4511-974c-d0e5162b0e54'
DELETE FROM [bcms_root].[CategoryTreeCategorizableItems] WHERE [Id]=N'f3569a83-f160-4257-913f-69aa20fe1133'
DELETE FROM [bcms_users].[Roles] WHERE [Id]=N'4b3d7629-3468-4afe-8f77-9236e320c940'
DELETE FROM [bcms_users].[Roles] WHERE [Id]=N'4eca1fc1-7cea-4755-b27f-f33e9a88e774'
DELETE FROM [bcms_users].[Roles] WHERE [Id]=N'591edae1-0bbc-40fd-9195-e6e0ee59e46e'
DELETE FROM [bcms_users].[Roles] WHERE [Id]=N'a0bb9f50-8d15-4b3e-a076-3284c61ef37d'
DELETE FROM [bcms_users].[Roles] WHERE [Id]=N'b5ef71be-cd4a-4550-9e05-2da63643e6c6'
UPDATE [bcms_blog].[VersionInfo] SET [AppliedOn]='20161114 23:30:32.000' WHERE [Version]=201301151922
UPDATE [bcms_blog].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201305271234
UPDATE [bcms_blog].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201305271258
UPDATE [bcms_blog].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201312051034
UPDATE [bcms_blog].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201502101139
UPDATE [bcms_blog].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201510131100
UPDATE [bcms_blog].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201510131346
UPDATE [bcms_blog].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201510141500
UPDATE [bcms_installation].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201305221458
UPDATE [bcms_installation].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201309101320
UPDATE [bcms_installation].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201311181011
UPDATE [bcms_installation].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201510261332
UPDATE [bcms_installation].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201510280946
UPDATE [bcms_installation].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201510281110
UPDATE [bcms_installation].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201510291304
UPDATE [bcms_installation].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201511041142
UPDATE [bcms_installation].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201511041154
UPDATE [bcms_media].[VersionInfo] SET [AppliedOn]='20161114 23:30:32.000' WHERE [Version]=201301151845
UPDATE [bcms_media].[VersionInfo] SET [AppliedOn]='20161114 23:30:32.000' WHERE [Version]=201303081430
UPDATE [bcms_media].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201306071100
UPDATE [bcms_media].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201306071105
UPDATE [bcms_media].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201306111530
UPDATE [bcms_media].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201306171041
UPDATE [bcms_media].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201306201215
UPDATE [bcms_media].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201306201216
UPDATE [bcms_media].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201306211140
UPDATE [bcms_media].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201306271317
UPDATE [bcms_media].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201306271601
UPDATE [bcms_media].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201306281001
UPDATE [bcms_media].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201308252350
UPDATE [bcms_media].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201308272154
UPDATE [bcms_media].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201310081420
UPDATE [bcms_media].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201310211500
UPDATE [bcms_media].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201409241658
UPDATE [bcms_media].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201502031000
UPDATE [bcms_media].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201502101137
UPDATE [bcms_media].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201511231705
UPDATE [bcms_users].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201308200000
UPDATE [bcms_users].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201309060825
UPDATE [bcms_users].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201309091554
UPDATE [bcms_users].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201309101400
UPDATE [bcms_users].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201403141036
UPDATE [bcms_users].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201407230730
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:32.000' WHERE [Version]=201301151829
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:32.000' WHERE [Version]=201302211227
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201303261100
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201305230800
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201306101421
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201307191431
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201308021130
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201308021300
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201308051530
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201308060930
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201308121549
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201308211600
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201308252344
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201308272137
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201308292125
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201308300049
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201309040830
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201309221100
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201310160818
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201310170919
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201310180900
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201310221445
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201310241500
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201312101400
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201312111700
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201312171300
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201312301700
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201404171400
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201406101600
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201406191600
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201407231054
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201408131530
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201501131230
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201501281145
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201502041430
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201502061445
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201502101035
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201502101136
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201509241740
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201509281017
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201510061845
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201510141900
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201510231700
UPDATE [bcms_root].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201511051430
UPDATE [bcms_pages].[VersionInfo] SET [AppliedOn]='20161114 23:30:32.000' WHERE [Version]=201301151849
UPDATE [bcms_pages].[VersionInfo] SET [AppliedOn]='20161114 23:30:32.000' WHERE [Version]=201302050830
UPDATE [bcms_pages].[VersionInfo] SET [AppliedOn]='20161114 23:30:32.000' WHERE [Version]=201303041556
UPDATE [bcms_pages].[VersionInfo] SET [AppliedOn]='20161114 23:30:32.000' WHERE [Version]=201303050900
UPDATE [bcms_pages].[VersionInfo] SET [AppliedOn]='20161114 23:30:32.000' WHERE [Version]=201303051146
UPDATE [bcms_pages].[VersionInfo] SET [AppliedOn]='20161114 23:30:32.000' WHERE [Version]=201303201815
UPDATE [bcms_pages].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201305281700
UPDATE [bcms_pages].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201306140841
UPDATE [bcms_pages].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201306260946
UPDATE [bcms_pages].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201307220940
UPDATE [bcms_pages].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201307301145
UPDATE [bcms_pages].[VersionInfo] SET [AppliedOn]='20161114 23:30:33.000' WHERE [Version]=201312121313
UPDATE [bcms_pages].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201401061130
UPDATE [bcms_pages].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201401091655
UPDATE [bcms_pages].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201401211353
UPDATE [bcms_pages].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201501290930
UPDATE [bcms_pages].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201502021540
UPDATE [bcms_pages].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201502101138
UPDATE [bcms_pages].[VersionInfo] SET [AppliedOn]='20161114 23:30:34.000' WHERE [Version]=201509291600
UPDATE [bcms_root].[CategorizableItems] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000' WHERE [Id]=N'11f2c2cf-bf7c-467c-b424-e8c368f88183'
UPDATE [bcms_root].[CategorizableItems] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000' WHERE [Id]=N'75e6c021-1d1f-459e-a416-d18477bf2020'
UPDATE [bcms_root].[CategorizableItems] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000' WHERE [Id]=N'90ee1a64-a469-4f7a-a056-ae7bdc6c2d06'
UPDATE [bcms_root].[CategorizableItems] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000' WHERE [Id]=N'b2f05159-74af-4b67-aeb9-36b9cc9eed57'
UPDATE [bcms_root].[CategorizableItems] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000' WHERE [Id]=N'dc861498-fcd1-4f19-9c75-ae71916ef7bf'
UPDATE [bcms_root].[CustomOptions] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000' WHERE [Id]=N'd88604ee-d3d5-4e0c-b071-984143a9ed74'
UPDATE [bcms_root].[CustomOptions] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000' WHERE [Id]=N'fb118858-cd1f-4cc6-8c22-177652eeb2a7'
UPDATE [bcms_root].[ContentOptions] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000' WHERE [Id]=N'111cd45e-1ceb-4ad7-96f6-d00d68ea25cc'
UPDATE [bcms_root].[ContentOptions] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000' WHERE [Id]=N'45bd4a45-9f2e-4fa1-9e2f-0dd99a7de343'
UPDATE [bcms_root].[ContentOptions] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000' WHERE [Id]=N'4742cdbc-54aa-4c38-9738-a42bde1ffe95'
UPDATE [bcms_root].[ContentOptions] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000' WHERE [Id]=N'4ae831e6-71a7-4280-9fb9-32a37f397035'
UPDATE [bcms_root].[ContentOptions] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000' WHERE [Id]=N'586b9316-4ba0-4c5d-b568-55e99e8c4e3f'
UPDATE [bcms_root].[ContentOptions] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000' WHERE [Id]=N'8fced5bd-de4d-492e-b04a-fa3ba83caeec'
UPDATE [bcms_root].[ContentOptions] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000' WHERE [Id]=N'9d888b08-604e-4e7d-a9e9-4b4a5c9e5514'
UPDATE [bcms_root].[ContentOptions] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000' WHERE [Id]=N'ba516b96-b389-4376-8b1c-cb152ddccafc'
UPDATE [bcms_root].[ContentOptions] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000' WHERE [Id]=N'd1960653-1abb-41fd-8370-baa5ca243499'
UPDATE [bcms_root].[ContentOptions] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000' WHERE [Id]=N'e39392c8-37b9-4506-b810-b3d38a0f022f'
UPDATE [bcms_pages].[Sitemaps] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000' WHERE [Id]=N'17abfee9-5ae6-470c-92e1-c2905036574b'
UPDATE [bcms_pages].[HtmlContents] SET [ActivationDate]='20161114 15:30:33.000' WHERE [Id]=N'0c8fb3fe-58e9-4d49-975c-2da934661961'
UPDATE [bcms_pages].[HtmlContents] SET [ActivationDate]='20161114 00:00:00.000', [Html]=N'' WHERE [Id]=N'8243974f-a0e6-4aa6-80e6-ab914821e724'
UPDATE [bcms_pages].[HtmlContents] SET [ActivationDate]='20161114 15:30:33.000' WHERE [Id]=N'a9c86ab6-df05-459c-8b28-86814cad1d47'
UPDATE [bcms_root].[Contents] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000', [PublishedOn]='20161114 15:30:33.000' WHERE [Id]=N'0c8fb3fe-58e9-4d49-975c-2da934661961'
UPDATE [bcms_root].[Contents] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000', [PublishedOn]='20161114 15:30:34.000' WHERE [Id]=N'2dfa000c-5ffe-45ff-98c9-320a942d86ef'
UPDATE [bcms_root].[Contents] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000', [PublishedOn]='20161114 15:30:34.000' WHERE [Id]=N'4110b9aa-8598-4a97-8eb6-a5830f6a43d1'
UPDATE [bcms_root].[Contents] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000', [PublishedOn]='20161114 15:30:34.000' WHERE [Id]=N'7218f62a-6c38-49ea-af65-d610e4b3ae0a'
UPDATE [bcms_root].[Contents] SET [Version]=2, [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 17:59:16.000', [ModifiedByUser]=N'admin', [PublishedOn]='20161114 17:59:16.000', [PublishedByUser]=N'admin' WHERE [Id]=N'8243974f-a0e6-4aa6-80e6-ab914821e724'
UPDATE [bcms_root].[Contents] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000', [PublishedOn]='20161114 15:30:33.000' WHERE [Id]=N'a9c86ab6-df05-459c-8b28-86814cad1d47'
UPDATE [bcms_root].[Contents] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000', [PublishedOn]='20161114 15:30:33.000' WHERE [Id]=N'afa0afef-6d71-4962-9ef4-324bb9344f92'
UPDATE [bcms_root].[Contents] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000', [PublishedOn]='20161114 15:30:33.000' WHERE [Id]=N'f4a92939-61c1-4e83-9576-42753b8fc15e'
UPDATE [bcms_root].[LayoutRegions] SET [CreatedOn]='20161114 15:30:33.887', [ModifiedOn]='20161114 15:30:33.887' WHERE [Id]=N'26ce115f-2be0-4b11-8495-af3e0a9fbdaf'
UPDATE [bcms_root].[LayoutRegions] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000' WHERE [Id]=N'2e7bebd1-a92e-4d26-b728-239f007f5685'
UPDATE [bcms_root].[LayoutRegions] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000' WHERE [Id]=N'3da91ad5-d1ec-43d1-b663-7b367c04cdfe'
UPDATE [bcms_root].[LayoutRegions] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000' WHERE [Id]=N'40f27280-057e-48db-8787-3facf67b98b0'
UPDATE [bcms_root].[Regions] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000' WHERE [Id]=N'9e1601e4-efcd-4ebb-ae67-b2ff10e372ba'
UPDATE [bcms_root].[Regions] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000' WHERE [Id]=N'd840205e-9580-4906-b6b7-b9a48cbf8aaa'
UPDATE [bcms_root].[Regions] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000' WHERE [Id]=N'e3e2e7fe-62df-4ba6-8321-6fdcc1691d8a'
UPDATE [bcms_root].[PageContents] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000' WHERE [Id]=N'07283a5b-8964-400c-9191-89ff982abeef'
UPDATE [bcms_root].[PageContents] SET [Version]=2, [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 17:59:36.000', [ModifiedByUser]=N'admin', [Order]=1 WHERE [Id]=N'12a286b8-3545-4d5d-ad60-efe2f4475807'
UPDATE [bcms_root].[PageContents] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000' WHERE [Id]=N'1471fc94-d8cc-4fdb-b5d2-0806a91f0b7e'
UPDATE [bcms_root].[PageContents] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000' WHERE [Id]=N'1786715d-b46e-4f57-a67f-9a77bb0e835b'
UPDATE [bcms_root].[PageContents] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000' WHERE [Id]=N'51ac147a-c915-46d3-abc9-08d9d215a1b0'
UPDATE [bcms_root].[PageContents] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000' WHERE [Id]=N'52381e7f-8aac-4035-aca6-76f2baad4c74'
UPDATE [bcms_root].[PageContents] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000' WHERE [Id]=N'6f303e34-2ef8-4da6-9816-ef46df6e7a49'
UPDATE [bcms_root].[PageContents] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000' WHERE [Id]=N'7337ec22-5465-4792-ad8c-8ca1f18f5842'
UPDATE [bcms_root].[PageContents] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000' WHERE [Id]=N'97700e1f-5b7a-4eac-be9a-efa3faac6e9f'
UPDATE [bcms_root].[Categories] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000' WHERE [Id]=N'973b0fa7-4633-4154-ba5d-49bce5591cc0'
UPDATE [bcms_root].[CategoryTrees] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000' WHERE [Id]=N'98fd87b4-a25c-4dde-933c-83826b6a94d7'
UPDATE [bcms_root].[Layouts] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000' WHERE [Id]=N'0e991684-003a-43de-b40f-0ffeccddc6eb'
UPDATE [bcms_root].[Layouts] SET [CreatedOn]='20161114 15:30:33.883', [ModifiedOn]='20161114 15:30:33.883' WHERE [Id]=N'24a9fdbc-7a9b-4c02-aff5-a0b09f2ca9e7'
UPDATE [bcms_root].[WidgetCategories] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000' WHERE [Id]=N'650ec2e9-052e-4a79-85b9-852cb7c14115'
UPDATE [bcms_root].[WidgetCategories] SET [CreatedOn]='20161114 15:30:34.000', [ModifiedOn]='20161114 15:30:34.000' WHERE [Id]=N'e22a6ffd-95a7-42a6-beb5-5b85b03ab446'
UPDATE [bcms_root].[Pages] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000', [PublishedOn]='20161114 15:30:33.000' WHERE [Id]=N'468cb682-e1c4-4876-84a5-6a355a92dc55'
UPDATE [bcms_root].[Pages] SET [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 15:30:33.000', [PublishedOn]='20161114 15:30:33.000' WHERE [Id]=N'7329b110-4e6f-4a1e-b89d-0cb0c1299b73'
UPDATE [bcms_root].[Pages] SET [Version]=3, [CreatedOn]='20161114 15:30:33.000', [ModifiedOn]='20161114 18:31:43.000', [ModifiedByUser]=N'admin', [Title]=N'Home', [LayoutId]=NULL, [PublishedOn]='20161114 15:30:33.000', [MetaTitle]=N'Cairs Phonebook', [MetaKeywords]=N'Cairs Phonebook, Telephone Directory, Phonebook', [MetaDescription]=N'Cairs Phonebook, Telephone Directory', [MasterPageId]=N'e27cde30-24d6-44f9-9bb8-a6be012743ba' WHERE [Id]=N'7a1867d8-e8d1-4c95-a9f2-fddf02277c3a'
INSERT INTO [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlHash], [MasterPageId], [IsMasterPage], [LanguageId], [LanguageGroupIdentifier], [ForceAccessProtocol]) VALUES (N'1139df14-e6e9-4a60-bc5a-a6be01295d45', 3, 0, '20161114 18:02:40.000', N'admin', '20161114 18:03:56.000', N'admin', NULL, NULL, N'/search-hints/', N'Search Hints', NULL, '20161114 18:03:56.000', N'Search Hints', NULL, NULL, 3, N'520f73a703f7c8940c64daad052f18cd', N'e27cde30-24d6-44f9-9bb8-a6be012743ba', 0, NULL, NULL, 0)
INSERT INTO [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlHash], [MasterPageId], [IsMasterPage], [LanguageId], [LanguageGroupIdentifier], [ForceAccessProtocol]) VALUES (N'1c252580-203f-488e-ae4d-a6be0128cf8f', 3, 0, '20161114 18:00:39.000', N'admin', '20161114 18:03:15.000', N'admin', NULL, NULL, N'/emergency-numbers/', N'Emergency Numbers', NULL, '20161114 18:03:15.000', N'Emergency Numbers', NULL, NULL, 3, N'5ee8b4f727262c94f31586671c9ccd3f', N'e27cde30-24d6-44f9-9bb8-a6be012743ba', 0, NULL, NULL, 0)
INSERT INTO [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlHash], [MasterPageId], [IsMasterPage], [LanguageId], [LanguageGroupIdentifier], [ForceAccessProtocol]) VALUES (N'21890ed1-370c-4457-b410-a6be01295049', 3, 0, '20161114 18:02:29.000', N'admin', '20161114 18:03:50.000', N'admin', NULL, NULL, N'/update-requests/', N'Update Requests', NULL, '20161114 18:03:50.000', N'Update Requests', NULL, NULL, 3, N'5feac2c1d6e6ffc31cdeecbb13a1b530', N'e27cde30-24d6-44f9-9bb8-a6be012743ba', 0, NULL, NULL, 0)
INSERT INTO [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlHash], [MasterPageId], [IsMasterPage], [LanguageId], [LanguageGroupIdentifier], [ForceAccessProtocol]) VALUES (N'41380b54-3b44-48e9-aa17-a6be01291d54', 3, 0, '20161114 18:01:45.000', N'admin', '20161114 18:03:32.000', N'admin', NULL, NULL, N'/prefixes/international/', N'International', NULL, '20161114 18:03:32.000', N'International', NULL, NULL, 3, N'4dca39bd1cbc574e29a2a97888c7723a', N'e27cde30-24d6-44f9-9bb8-a6be012743ba', 0, NULL, NULL, 0)
INSERT INTO [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlHash], [MasterPageId], [IsMasterPage], [LanguageId], [LanguageGroupIdentifier], [ForceAccessProtocol]) VALUES (N'be7109a2-7e8a-4b3f-a29c-a6be01290855', 3, 0, '20161114 18:01:27.000', N'admin', '20161114 18:03:26.000', N'admin', NULL, NULL, N'/prefixes/civilian-to-military/', N'Civilian to Military', NULL, '20161114 18:03:26.000', N'Civilian to Military', NULL, NULL, 3, N'58488220948bdee1fc7a4d90f8174832', N'e27cde30-24d6-44f9-9bb8-a6be012743ba', 0, NULL, NULL, 0)
INSERT INTO [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlHash], [MasterPageId], [IsMasterPage], [LanguageId], [LanguageGroupIdentifier], [ForceAccessProtocol]) VALUES (N'd9899b6d-69e6-4ac6-898d-a6be01293469', 3, 0, '20161114 18:02:05.000', N'admin', '20161114 18:03:38.000', N'admin', NULL, NULL, N'/help/', N'Help', NULL, '20161114 18:03:38.000', N'Help', NULL, NULL, 3, N'bfc6dd78ca67adc4c765a1c974a66885', N'e27cde30-24d6-44f9-9bb8-a6be012743ba', 0, NULL, NULL, 0)
INSERT INTO [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlHash], [MasterPageId], [IsMasterPage], [LanguageId], [LanguageGroupIdentifier], [ForceAccessProtocol]) VALUES (N'e27cde30-24d6-44f9-9bb8-a6be012743ba', 2, 0, '20161114 17:55:01.000', N'admin', '20161114 17:55:01.000', N'admin', NULL, NULL, N'/phonebook-page/', N'Phonebook Page', N'91e4d7ac-4e70-428c-a42f-a6be0127123f', NULL, N'Phonebook Page', NULL, NULL, 3, N'63e54b1e92b31bfbee762004da7c7aa9', NULL, 1, NULL, NULL, 0)
INSERT INTO [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlHash], [MasterPageId], [IsMasterPage], [LanguageId], [LanguageGroupIdentifier], [ForceAccessProtocol]) VALUES (N'e504f5dc-1f68-43e8-b724-a6be0129420a', 3, 0, '20161114 18:02:16.000', N'admin', '20161114 18:03:43.000', N'admin', NULL, NULL, N'/contact-webmaster/', N'Contact Webmaster', NULL, '20161114 18:03:43.000', N'Contact Webmaster', NULL, NULL, 3, N'08737c6b26e34dd7509d26563b82fb6a', N'e27cde30-24d6-44f9-9bb8-a6be012743ba', 0, NULL, NULL, 0)
INSERT INTO [bcms_root].[Pages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageUrl], [Title], [LayoutId], [PublishedOn], [MetaTitle], [MetaKeywords], [MetaDescription], [Status], [PageUrlHash], [MasterPageId], [IsMasterPage], [LanguageId], [LanguageGroupIdentifier], [ForceAccessProtocol]) VALUES (N'eb196f31-3796-4f00-9d91-a6be0128a0c5', 3, 0, '20161114 17:59:59.000', N'admin', '20161114 18:02:58.000', N'admin', NULL, NULL, N'/prefixes/', N'Prefixes', NULL, '20161114 18:02:58.000', N'Prefixes', NULL, NULL, 3, N'5857d7f7520a492891a969ce8f71617a', N'e27cde30-24d6-44f9-9bb8-a6be012743ba', 0, NULL, NULL, 0)
INSERT INTO [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'2c8c9575-0281-4957-9b77-a6be0129420a', 1, 0, '20161114 18:02:16.000', N'admin', '20161114 18:02:16.000', N'admin', NULL, NULL, N'Everyone', 2, 1)
INSERT INTO [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'35b01903-5878-4f4e-94aa-a6be01290856', 1, 0, '20161114 18:01:27.000', N'admin', '20161114 18:01:27.000', N'admin', NULL, NULL, N'Everyone', 2, 1)
INSERT INTO [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'37b3375c-7fb3-4597-94d4-a6be0128cf8f', 1, 0, '20161114 18:00:39.000', N'admin', '20161114 18:00:39.000', N'admin', NULL, NULL, N'Everyone', 2, 1)
INSERT INTO [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'3eaf99eb-756c-4ca7-b5f6-a6be01291d55', 1, 0, '20161114 18:01:45.000', N'admin', '20161114 18:01:45.000', N'admin', NULL, NULL, N'Everyone', 2, 1)
INSERT INTO [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'4b00671d-e090-4505-9646-a6be01295049', 1, 0, '20161114 18:02:29.000', N'admin', '20161114 18:02:29.000', N'admin', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT INTO [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'4cb1a04c-e0de-4996-bfd8-a6be012743bc', 1, 0, '20161114 17:55:01.000', N'admin', '20161114 17:55:01.000', N'admin', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT INTO [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'4d07f15b-4586-429d-90b5-a6be01291d55', 1, 0, '20161114 18:01:45.000', N'admin', '20161114 18:01:45.000', N'admin', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT INTO [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'5b000a7d-6e74-4074-8876-a6be0128a0c6', 1, 0, '20161114 17:59:59.000', N'admin', '20161114 17:59:59.000', N'admin', NULL, NULL, N'Everyone', 2, 1)
INSERT INTO [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'5cd9702b-5ebe-4d99-9819-a6be0129420a', 1, 0, '20161114 18:02:16.000', N'admin', '20161114 18:02:16.000', N'admin', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT INTO [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'74263552-aa86-4e4b-9d41-a6be01295d45', 1, 0, '20161114 18:02:40.000', N'admin', '20161114 18:02:40.000', N'admin', NULL, NULL, N'Everyone', 2, 1)
INSERT INTO [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'74eb9541-9a71-46f0-b7db-a6be0128cf8f', 1, 0, '20161114 18:00:39.000', N'admin', '20161114 18:00:39.000', N'admin', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT INTO [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'77f948eb-dac0-42ae-ac16-a6be01295049', 1, 0, '20161114 18:02:29.000', N'admin', '20161114 18:02:29.000', N'admin', NULL, NULL, N'Everyone', 2, 1)
INSERT INTO [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'824ef7fe-afb6-47c4-be8b-a6be01290856', 1, 0, '20161114 18:01:27.000', N'admin', '20161114 18:01:27.000', N'admin', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT INTO [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'910c225a-6308-40b6-86c6-a6be01293469', 1, 0, '20161114 18:02:05.000', N'admin', '20161114 18:02:05.000', N'admin', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT INTO [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'9dcce549-ae58-4dd5-b806-a6be0128a0c6', 1, 0, '20161114 17:59:59.000', N'admin', '20161114 17:59:59.000', N'admin', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT INTO [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'ab2efe36-cb70-4b62-9cb7-a6be01293469', 1, 0, '20161114 18:02:05.000', N'admin', '20161114 18:02:05.000', N'admin', NULL, NULL, N'Everyone', 2, 1)
INSERT INTO [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'd1f3310b-50f8-4e79-a205-a6be012743bc', 1, 0, '20161114 17:55:01.000', N'admin', '20161114 17:55:01.000', N'admin', NULL, NULL, N'Everyone', 2, 1)
INSERT INTO [bcms_root].[AccessRules] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Identity], [AccessLevel], [IsForRole]) VALUES (N'eb8db09c-a118-44aa-8ca9-a6be01295d45', 1, 0, '20161114 18:02:40.000', N'admin', '20161114 18:02:40.000', N'admin', NULL, NULL, N'Authenticated Users', 3, 1)
INSERT INTO [bcms_root].[Widgets] ([Id], [CategoryId]) VALUES (N'528a9601-c8ed-4dd6-9bb8-a6be0127e17f', NULL)
INSERT INTO [bcms_root].[Widgets] ([Id], [CategoryId]) VALUES (N'5640f939-016b-4ea4-aaeb-a6be0127c9dc', NULL)
INSERT INTO [bcms_root].[Layouts] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [LayoutPath], [ModuleId], [PreviewUrl]) VALUES (N'91e4d7ac-4e70-428c-a42f-a6be0127123f', 1, 0, '20161114 17:54:19.000', N'admin', '20161114 17:54:19.000', N'admin', NULL, NULL, N'Root Template', N'~/Views/Shared/Root.cshtml', NULL, NULL)
INSERT INTO [bcms_root].[LayoutOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [LayoutId], [Key], [Type], [DefaultValue], [IsDeletable], [CustomOptionId]) VALUES (N'aac1de56-7479-4893-a8c4-a6be01271240', 1, 0, '20161114 17:54:19.000', N'admin', '20161114 17:54:19.000', N'admin', NULL, NULL, N'91e4d7ac-4e70-428c-a42f-a6be0127123f', N'PageTitle', 1, N'Cairs Phonebook', 1, NULL)
INSERT INTO [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order], [ParentPageContentId]) VALUES (N'36087c36-4149-47e7-800f-a6be01280ae6', 1, 0, '20161114 17:57:51.000', N'admin', '20161114 17:57:51.000', N'admin', NULL, NULL, N'e27cde30-24d6-44f9-9bb8-a6be012743ba', N'528a9601-c8ed-4dd6-9bb8-a6be0127e17f', N'cccce5f0-c926-4b97-85e5-a6be0127123c', 0, NULL)
INSERT INTO [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order], [ParentPageContentId]) VALUES (N'a925af5a-27b0-432c-bdb8-a6be01281cc5', 2, 1, '20161114 17:58:06.000', N'admin', '20161114 17:58:26.000', N'admin', '20161114 17:58:26.000', N'admin', N'e27cde30-24d6-44f9-9bb8-a6be012743ba', N'5640f939-016b-4ea4-aaeb-a6be0127c9dc', N'cccce5f0-c926-4b97-85e5-a6be0127123c', 1, NULL)
INSERT INTO [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order], [ParentPageContentId]) VALUES (N'b2ed13d7-2e8b-4d68-848b-a6be0128797b', 2, 0, '20161114 17:59:25.000', N'admin', '20161114 17:59:36.000', N'admin', NULL, NULL, N'7a1867d8-e8d1-4c95-a9f2-fddf02277c3a', N'5640f939-016b-4ea4-aaeb-a6be0127c9dc', N'e3e2e7fe-62df-4ba6-8321-6fdcc1691d8a', 0, NULL)
INSERT INTO [bcms_root].[PageContents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [ContentId], [RegionId], [Order], [ParentPageContentId]) VALUES (N'b55f31b9-b04e-400c-a476-a6be0128280e', 1, 0, '20161114 17:58:16.000', N'admin', '20161114 17:58:16.000', N'admin', NULL, NULL, N'e27cde30-24d6-44f9-9bb8-a6be012743ba', N'f5553f60-7686-48d9-9807-a6be0128280c', N'cccce5f0-c926-4b97-85e5-a6be0127123c', 2, NULL)
INSERT INTO [bcms_users].[Roles] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [Description], [IsSystematic]) VALUES (N'142e6e0c-5d74-43ed-ab01-2b86f593868a', 1, 0, '20161114 15:30:33.000', N'Better CMS', '20161114 15:30:33.000', N'Admin', NULL, NULL, N'BcmsDeleteContent', N'Can delete Better CMS resources.', 1)
INSERT INTO [bcms_users].[Roles] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [Description], [IsSystematic]) VALUES (N'48b6e8b7-bf94-4127-ab0c-9221e26bf4e9', 1, 0, '20161114 15:30:33.000', N'Better CMS', '20161114 15:30:33.000', N'Admin', NULL, NULL, N'BcmsEditContent', N'Can create and edit Better CMS pages and page contents.', 1)
INSERT INTO [bcms_users].[Roles] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [Description], [IsSystematic]) VALUES (N'50219fc7-9d06-4410-903b-ac99e3ade2b0', 1, 0, '20161114 15:30:33.000', N'Better CMS', '20161114 15:30:33.000', N'Admin', NULL, NULL, N'BcmsAdministration', N'Can manage Better CMS settings.', 1)
INSERT INTO [bcms_users].[Roles] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [Description], [IsSystematic]) VALUES (N'b04f3a91-05ea-4212-b56c-ce8b6f5fe68d', 1, 0, '20161114 15:30:34.080', N'Better CMS', '20161114 15:30:34.080', N'Better CMS', NULL, NULL, N'BcmsManageUsers', N'Can manage Better CMS users.', 1)
INSERT INTO [bcms_users].[Roles] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [Description], [IsSystematic]) VALUES (N'df327249-bc2a-4eb6-8598-9824e872d321', 1, 0, '20161114 15:30:33.000', N'Better CMS', '20161114 15:30:34.000', N'Admin', NULL, NULL, N'BcmsPublishContent', N'Can publish Better CMS pages and page contents.', 1)
INSERT INTO [bcms_users].[UserRoles] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RoleId], [UserId]) VALUES (N'365fee31-0382-4ca6-8071-a6be0126821a', 1, 0, '20161114 17:52:16.000', N'Anonymous', '20161114 17:52:16.000', N'Anonymous', NULL, NULL, N'b04f3a91-05ea-4212-b56c-ce8b6f5fe68d', N'63646c19-ad8f-4d3a-a64d-a6be01268211')
INSERT INTO [bcms_users].[UserRoles] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RoleId], [UserId]) VALUES (N'77b44d4a-e33d-4a3e-a1a4-a6be0126821a', 1, 0, '20161114 17:52:16.000', N'Anonymous', '20161114 17:52:16.000', N'Anonymous', NULL, NULL, N'df327249-bc2a-4eb6-8598-9824e872d321', N'63646c19-ad8f-4d3a-a64d-a6be01268211')
INSERT INTO [bcms_users].[UserRoles] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RoleId], [UserId]) VALUES (N'c185fb4d-b084-4f28-b481-a6be0126821a', 1, 0, '20161114 17:52:16.000', N'Anonymous', '20161114 17:52:16.000', N'Anonymous', NULL, NULL, N'48b6e8b7-bf94-4127-ab0c-9221e26bf4e9', N'63646c19-ad8f-4d3a-a64d-a6be01268211')
INSERT INTO [bcms_users].[UserRoles] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RoleId], [UserId]) VALUES (N'dfcf7d31-a447-4047-af20-a6be0126821a', 1, 0, '20161114 17:52:16.000', N'Anonymous', '20161114 17:52:16.000', N'Anonymous', NULL, NULL, N'50219fc7-9d06-4410-903b-ac99e3ade2b0', N'63646c19-ad8f-4d3a-a64d-a6be01268211')
INSERT INTO [bcms_users].[UserRoles] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RoleId], [UserId]) VALUES (N'ed382038-021b-4171-9265-a6be01268217', 1, 0, '20161114 17:52:16.000', N'Anonymous', '20161114 17:52:16.000', N'Anonymous', NULL, NULL, N'142e6e0c-5d74-43ed-ab01-2b86f593868a', N'63646c19-ad8f-4d3a-a64d-a6be01268211')
INSERT INTO [bcms_root].[Regions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RegionIdentifier]) VALUES (N'cccce5f0-c926-4b97-85e5-a6be0127123c', 1, 0, '20161114 17:54:19.000', N'admin', '20161114 17:54:19.000', N'admin', NULL, NULL, N'Content')
INSERT INTO [bcms_root].[LayoutRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Description], [LayoutId], [RegionId]) VALUES (N'14cd12c8-2d17-4f6f-9a13-a6be0127123f', 1, 0, '20161114 17:54:19.000', N'admin', '20161114 17:54:19.000', N'admin', NULL, NULL, N'Main Content Area', N'91e4d7ac-4e70-428c-a42f-a6be0127123f', N'cccce5f0-c926-4b97-85e5-a6be0127123c')
INSERT INTO [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'528a9601-c8ed-4dd6-9bb8-a6be0127e17f', 1, 0, '20161114 17:57:16.000', N'admin', '20161114 17:57:16.000', N'admin', NULL, NULL, N'Phonebook Menu', NULL, 3, '20161114 17:57:16.000', N'admin', NULL)
INSERT INTO [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'5640f939-016b-4ea4-aaeb-a6be0127c9dc', 1, 0, '20161114 17:56:55.000', N'admin', '20161114 17:56:55.000', N'admin', NULL, NULL, N'Phonebook Widget', NULL, 3, '20161114 17:56:55.000', N'admin', NULL)
INSERT INTO [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'85f14696-4dec-46c6-af2f-a6be01286ee0', 1, 0, '20161114 17:59:16.000', N'admin', '20161114 17:59:16.000', N'admin', NULL, NULL, N'Content', NULL, 4, '20161114 15:30:33.000', N'Better CMS', N'8243974f-a0e6-4aa6-80e6-ab914821e724')
INSERT INTO [bcms_root].[Contents] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Name], [PreviewUrl], [Status], [PublishedOn], [PublishedByUser], [OriginalId]) VALUES (N'f5553f60-7686-48d9-9807-a6be0128280c', 1, 0, '20161114 17:58:16.000', N'admin', '20161114 17:58:16.000', N'admin', NULL, NULL, N'Content', NULL, 3, '20161114 17:58:16.000', N'admin', NULL)
INSERT INTO [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode], [OriginalText], [ContentTextMode]) VALUES (N'85f14696-4dec-46c6-af2f-a6be01286ee0', '20161114 15:30:33.000', NULL, NULL, 0, NULL, 0, N'<p>Hello world!</p>', 0, NULL, 1)
INSERT INTO [bcms_pages].[HtmlContents] ([Id], [ActivationDate], [ExpirationDate], [CustomCss], [UseCustomCss], [CustomJs], [UseCustomJs], [Html], [EditInSourceMode], [OriginalText], [ContentTextMode]) VALUES (N'f5553f60-7686-48d9-9807-a6be0128280c', '20161114 00:00:00.000', NULL, NULL, 0, NULL, 0, N'<div>{{DYNAMIC_REGION:CMSMainContent}}</div>', 1, NULL, 1)
INSERT INTO [bcms_pages].[SitemapNodes] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Title], [Url], [DisplayOrder], [ParentNodeId], [SitemapId], [UsePageTitleAsNodeTitle], [PageId], [UrlHash], [Macro]) VALUES (N'1ace48a9-b9a4-4ac7-bc31-a6be0128a634', 1, 0, '20161114 18:00:04.000', N'admin', '20161114 18:00:04.000', N'admin', NULL, NULL, N'Prefixes', NULL, 5000, NULL, N'17abfee9-5ae6-470c-92e1-c2905036574b', 1, N'eb196f31-3796-4f00-9d91-a6be0128a0c5', NULL, NULL)
INSERT INTO [bcms_pages].[SitemapNodes] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Title], [Url], [DisplayOrder], [ParentNodeId], [SitemapId], [UsePageTitleAsNodeTitle], [PageId], [UrlHash], [Macro]) VALUES (N'285e5fd8-c7d9-426d-ae97-a6be0129487b', 1, 0, '20161114 18:02:22.000', N'admin', '20161114 18:02:22.000', N'admin', NULL, NULL, N'Contact Webmaster', NULL, 5000, N'd513e064-a455-4cb5-b7d1-a6be012938b0', N'17abfee9-5ae6-470c-92e1-c2905036574b', 1, N'e504f5dc-1f68-43e8-b724-a6be0129420a', NULL, NULL)
INSERT INTO [bcms_pages].[SitemapNodes] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Title], [Url], [DisplayOrder], [ParentNodeId], [SitemapId], [UsePageTitleAsNodeTitle], [PageId], [UrlHash], [Macro]) VALUES (N'3e5282dc-c0a5-4243-9496-a6be0129563d', 1, 0, '20161114 18:02:34.000', N'admin', '20161114 18:02:34.000', N'admin', NULL, NULL, N'Update Requests', NULL, 4950, N'd513e064-a455-4cb5-b7d1-a6be012938b0', N'17abfee9-5ae6-470c-92e1-c2905036574b', 1, N'21890ed1-370c-4457-b410-a6be01295049', NULL, NULL)
INSERT INTO [bcms_pages].[SitemapNodes] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Title], [Url], [DisplayOrder], [ParentNodeId], [SitemapId], [UsePageTitleAsNodeTitle], [PageId], [UrlHash], [Macro]) VALUES (N'43b5040f-8cfb-4a13-b3a9-a6be0129259a', 1, 0, '20161114 18:01:52.000', N'admin', '20161114 18:01:52.000', N'admin', NULL, NULL, N'International', NULL, 4950, N'1ace48a9-b9a4-4ac7-bc31-a6be0128a634', N'17abfee9-5ae6-470c-92e1-c2905036574b', 1, N'41380b54-3b44-48e9-aa17-a6be01291d54', NULL, NULL)
INSERT INTO [bcms_pages].[SitemapNodes] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Title], [Url], [DisplayOrder], [ParentNodeId], [SitemapId], [UsePageTitleAsNodeTitle], [PageId], [UrlHash], [Macro]) VALUES (N'51c2e67f-592f-4ea8-8388-a6be0128e9f6', 1, 0, '20161114 18:01:01.000', N'admin', '20161114 18:01:01.000', N'admin', NULL, NULL, N'Emergency Numbers', NULL, 4975, NULL, N'17abfee9-5ae6-470c-92e1-c2905036574b', 1, N'1c252580-203f-488e-ae4d-a6be0128cf8f', NULL, NULL)
INSERT INTO [bcms_pages].[SitemapNodes] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Title], [Url], [DisplayOrder], [ParentNodeId], [SitemapId], [UsePageTitleAsNodeTitle], [PageId], [UrlHash], [Macro]) VALUES (N'7170793a-0ff4-4141-8545-a6be0128b178', 1, 0, '20161114 18:00:13.000', N'admin', '20161114 18:00:13.000', N'admin', NULL, NULL, N'Home', NULL, 4950, NULL, N'17abfee9-5ae6-470c-92e1-c2905036574b', 1, N'7a1867d8-e8d1-4c95-a9f2-fddf02277c3a', NULL, NULL)
INSERT INTO [bcms_pages].[SitemapNodes] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Title], [Url], [DisplayOrder], [ParentNodeId], [SitemapId], [UsePageTitleAsNodeTitle], [PageId], [UrlHash], [Macro]) VALUES (N'8844a960-d4c7-4cca-aade-a6be012964be', 1, 0, '20161114 18:02:46.000', N'admin', '20161114 18:02:46.000', N'admin', NULL, NULL, N'Search Hints', NULL, 4900, N'd513e064-a455-4cb5-b7d1-a6be012938b0', N'17abfee9-5ae6-470c-92e1-c2905036574b', 1, N'1139df14-e6e9-4a60-bc5a-a6be01295d45', NULL, NULL)
INSERT INTO [bcms_pages].[SitemapNodes] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Title], [Url], [DisplayOrder], [ParentNodeId], [SitemapId], [UsePageTitleAsNodeTitle], [PageId], [UrlHash], [Macro]) VALUES (N'd513e064-a455-4cb5-b7d1-a6be012938b0', 1, 0, '20161114 18:02:09.000', N'admin', '20161114 18:02:09.000', N'admin', NULL, NULL, N'Help', NULL, 5050, NULL, N'17abfee9-5ae6-470c-92e1-c2905036574b', 1, N'd9899b6d-69e6-4ac6-898d-a6be01293469', NULL, NULL)
INSERT INTO [bcms_pages].[SitemapNodes] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [Title], [Url], [DisplayOrder], [ParentNodeId], [SitemapId], [UsePageTitleAsNodeTitle], [PageId], [UrlHash], [Macro]) VALUES (N'ecb4cd57-b10c-4674-a386-a6be01290d12', 1, 0, '20161114 18:01:31.000', N'admin', '20161114 18:01:31.000', N'admin', NULL, NULL, N'Civilian to Military', NULL, 5000, N'1ace48a9-b9a4-4ac7-bc31-a6be0128a634', N'17abfee9-5ae6-470c-92e1-c2905036574b', 1, N'be7109a2-7e8a-4b3f-a29c-a6be01290855', NULL, NULL)
INSERT INTO [bcms_root].[ContentRegions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [RegionId], [ContentId]) VALUES (N'1cb34594-97cd-458c-8a76-a6be0128280d', 1, 0, '20161114 17:58:16.000', N'admin', '20161114 17:58:16.000', N'admin', NULL, NULL, N'e3e2e7fe-62df-4ba6-8321-6fdcc1691d8a', N'f5553f60-7686-48d9-9807-a6be0128280c')
INSERT INTO [bcms_root].[ContentOptions] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [ContentId], [Key], [Type], [DefaultValue], [IsDeletable], [CustomOptionId]) VALUES (N'1e22324f-d075-4cb9-aea9-a6be0127c9dc', 1, 0, '20161114 17:56:55.000', N'admin', '20161114 17:56:55.000', N'admin', NULL, NULL, N'5640f939-016b-4ea4-aaeb-a6be0127c9dc', N'Title', 1, N'Telephone Directory', 1, NULL)
INSERT INTO [bcms_root].[CategoryTreeCategorizableItems] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [CategoryTreeId], [CategorizableItemId]) VALUES (N'56b989f8-4524-4d3c-8900-42a97b0ee314', 1, 0, '20161114 15:30:34.467', N'Better CMS', '20161114 15:30:34.467', N'Better CMS', NULL, NULL, N'98fd87b4-a25c-4dde-933c-83826b6a94d7', N'90ee1a64-a469-4f7a-a056-ae7bdc6c2d06')
INSERT INTO [bcms_root].[CategoryTreeCategorizableItems] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [CategoryTreeId], [CategorizableItemId]) VALUES (N'a16d8a9a-fede-466b-98a5-d33be274f120', 1, 0, '20161114 15:30:34.510', N'Better CMS', '20161114 15:30:34.510', N'Better CMS', NULL, NULL, N'98fd87b4-a25c-4dde-933c-83826b6a94d7', N'75e6c021-1d1f-459e-a416-d18477bf2020')
INSERT INTO [bcms_root].[CategoryTreeCategorizableItems] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [CategoryTreeId], [CategorizableItemId]) VALUES (N'abf2eed4-20f3-4563-8501-260141262fa0', 1, 0, '20161114 15:30:34.443', N'Better CMS', '20161114 15:30:34.443', N'Better CMS', NULL, NULL, N'98fd87b4-a25c-4dde-933c-83826b6a94d7', N'b2f05159-74af-4b67-aeb9-36b9cc9eed57')
INSERT INTO [bcms_root].[CategoryTreeCategorizableItems] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [CategoryTreeId], [CategorizableItemId]) VALUES (N'f43067bb-baf8-4ae9-93d8-bb40a4ce5d03', 1, 0, '20161114 15:30:34.467', N'Better CMS', '20161114 15:30:34.467', N'Better CMS', NULL, NULL, N'98fd87b4-a25c-4dde-933c-83826b6a94d7', N'11f2c2cf-bf7c-467c-b424-e8c368f88183')
INSERT INTO [bcms_root].[CategoryTreeCategorizableItems] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [CategoryTreeId], [CategorizableItemId]) VALUES (N'fbace651-c869-47f8-b6ca-35215c26463d', 1, 0, '20161114 15:30:34.483', N'Better CMS', '20161114 15:30:34.483', N'Better CMS', NULL, NULL, N'98fd87b4-a25c-4dde-933c-83826b6a94d7', N'dc861498-fcd1-4f19-9c75-ae71916ef7bf')
INSERT INTO [bcms_pages].[SitemapArchives] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [SitemapId], [Title], [ArchivedVersion]) VALUES (N'f67bc9d1-5876-4e69-9b48-a6be0128b175', 1, 0, '20161114 18:00:13.000', N'admin', '20161114 18:00:13.000', N'admin', NULL, NULL, N'17abfee9-5ae6-470c-92e1-c2905036574b', N'Default Site Map', N'{"Title":"Default Site Map","RootNodes":[{"Title":"Prefixes","Url":"/prefixes/","PageId":"eb196f31-3796-4f00-9d91-a6be0128a0c5","UsePageTitleAsNodeTitle":true,"DisplayOrder":5000,"Macro":null,"Nodes":[],"Translations":[]}]}')
INSERT INTO [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'1139df14-e6e9-4a60-bc5a-a6be01295d45', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, 0)
INSERT INTO [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'1c252580-203f-488e-ae4d-a6be0128cf8f', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, 0)
INSERT INTO [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'21890ed1-370c-4457-b410-a6be01295049', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, 0)
INSERT INTO [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'41380b54-3b44-48e9-aa17-a6be01291d54', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, 0)
INSERT INTO [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'be7109a2-7e8a-4b3f-a29c-a6be01290855', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, 0)
INSERT INTO [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'd9899b6d-69e6-4ac6-898d-a6be01293469', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, 0)
INSERT INTO [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'e27cde30-24d6-44f9-9bb8-a6be012743ba', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, 0)
INSERT INTO [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'e504f5dc-1f68-43e8-b724-a6be0129420a', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, 0)
INSERT INTO [bcms_pages].[Pages] ([Id], [Description], [ImageId], [CustomCss], [CustomJS], [UseCanonicalUrl], [UseNoFollow], [UseNoIndex], [CategoryId], [SecondaryImageId], [FeaturedImageId], [IsArchived]) VALUES (N'eb196f31-3796-4f00-9d91-a6be0128a0c5', NULL, NULL, NULL, NULL, 1, 0, 0, NULL, NULL, NULL, 0)
INSERT INTO [bcms_users].[Users] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [UserName], [FirstName], [LastName], [Email], [Password], [Salt], [ImageId]) VALUES (N'63646c19-ad8f-4d3a-a64d-a6be01268211', 1, 0, '20161114 17:52:16.000', N'Anonymous', '20161114 17:52:16.000', N'Anonymous', NULL, NULL, N'admin', N'Admin', N'Admin', N'admin@cairsphonebook.com', N'hhTBx0RgI6l7zKaUkf65lycpbH8=', N'OZQhOmob8rU=', NULL)
INSERT INTO [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'1139df14-e6e9-4a60-bc5a-a6be01295d45', N'74263552-aa86-4e4b-9d41-a6be01295d45')
INSERT INTO [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'1139df14-e6e9-4a60-bc5a-a6be01295d45', N'eb8db09c-a118-44aa-8ca9-a6be01295d45')
INSERT INTO [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'1c252580-203f-488e-ae4d-a6be0128cf8f', N'37b3375c-7fb3-4597-94d4-a6be0128cf8f')
INSERT INTO [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'1c252580-203f-488e-ae4d-a6be0128cf8f', N'74eb9541-9a71-46f0-b7db-a6be0128cf8f')
INSERT INTO [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'21890ed1-370c-4457-b410-a6be01295049', N'4b00671d-e090-4505-9646-a6be01295049')
INSERT INTO [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'21890ed1-370c-4457-b410-a6be01295049', N'77f948eb-dac0-42ae-ac16-a6be01295049')
INSERT INTO [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'41380b54-3b44-48e9-aa17-a6be01291d54', N'3eaf99eb-756c-4ca7-b5f6-a6be01291d55')
INSERT INTO [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'41380b54-3b44-48e9-aa17-a6be01291d54', N'4d07f15b-4586-429d-90b5-a6be01291d55')
INSERT INTO [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'be7109a2-7e8a-4b3f-a29c-a6be01290855', N'35b01903-5878-4f4e-94aa-a6be01290856')
INSERT INTO [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'be7109a2-7e8a-4b3f-a29c-a6be01290855', N'824ef7fe-afb6-47c4-be8b-a6be01290856')
INSERT INTO [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'd9899b6d-69e6-4ac6-898d-a6be01293469', N'910c225a-6308-40b6-86c6-a6be01293469')
INSERT INTO [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'd9899b6d-69e6-4ac6-898d-a6be01293469', N'ab2efe36-cb70-4b62-9cb7-a6be01293469')
INSERT INTO [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'e27cde30-24d6-44f9-9bb8-a6be012743ba', N'4cb1a04c-e0de-4996-bfd8-a6be012743bc')
INSERT INTO [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'e27cde30-24d6-44f9-9bb8-a6be012743ba', N'd1f3310b-50f8-4e79-a205-a6be012743bc')
INSERT INTO [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'e504f5dc-1f68-43e8-b724-a6be0129420a', N'2c8c9575-0281-4957-9b77-a6be0129420a')
INSERT INTO [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'e504f5dc-1f68-43e8-b724-a6be0129420a', N'5cd9702b-5ebe-4d99-9819-a6be0129420a')
INSERT INTO [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'eb196f31-3796-4f00-9d91-a6be0128a0c5', N'5b000a7d-6e74-4074-8876-a6be0128a0c6')
INSERT INTO [bcms_root].[PageAccessRules] ([PageId], [AccessRuleId]) VALUES (N'eb196f31-3796-4f00-9d91-a6be0128a0c5', N'9dcce549-ae58-4dd5-b806-a6be0128a0c6')
INSERT INTO [bcms_root].[MasterPages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [MasterPageId]) VALUES (N'046fd8de-abd8-4d52-b6c1-a6be01290855', 1, 0, '20161114 18:01:27.000', N'admin', '20161114 18:01:27.000', N'admin', NULL, NULL, N'be7109a2-7e8a-4b3f-a29c-a6be01290855', N'e27cde30-24d6-44f9-9bb8-a6be012743ba')
INSERT INTO [bcms_root].[MasterPages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [MasterPageId]) VALUES (N'638506e9-da7c-46a6-99ad-a6be0128cf8f', 1, 0, '20161114 18:00:39.000', N'admin', '20161114 18:00:39.000', N'admin', NULL, NULL, N'1c252580-203f-488e-ae4d-a6be0128cf8f', N'e27cde30-24d6-44f9-9bb8-a6be012743ba')
INSERT INTO [bcms_root].[MasterPages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [MasterPageId]) VALUES (N'7c6dc87f-97e2-4f5d-93da-a6be01295d45', 1, 0, '20161114 18:02:40.000', N'admin', '20161114 18:02:40.000', N'admin', NULL, NULL, N'1139df14-e6e9-4a60-bc5a-a6be01295d45', N'e27cde30-24d6-44f9-9bb8-a6be012743ba')
INSERT INTO [bcms_root].[MasterPages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [MasterPageId]) VALUES (N'809036b1-7539-4b5f-b557-a6be0129420a', 1, 0, '20161114 18:02:16.000', N'admin', '20161114 18:02:16.000', N'admin', NULL, NULL, N'e504f5dc-1f68-43e8-b724-a6be0129420a', N'e27cde30-24d6-44f9-9bb8-a6be012743ba')
INSERT INTO [bcms_root].[MasterPages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [MasterPageId]) VALUES (N'af5f3666-2ee8-49e0-9ea4-a6be01295049', 1, 0, '20161114 18:02:29.000', N'admin', '20161114 18:02:29.000', N'admin', NULL, NULL, N'21890ed1-370c-4457-b410-a6be01295049', N'e27cde30-24d6-44f9-9bb8-a6be012743ba')
INSERT INTO [bcms_root].[MasterPages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [MasterPageId]) VALUES (N'b3bb23d5-6a88-47a2-a19d-a6be01293469', 1, 0, '20161114 18:02:05.000', N'admin', '20161114 18:02:05.000', N'admin', NULL, NULL, N'd9899b6d-69e6-4ac6-898d-a6be01293469', N'e27cde30-24d6-44f9-9bb8-a6be012743ba')
INSERT INTO [bcms_root].[MasterPages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [MasterPageId]) VALUES (N'c86ecc5a-e95a-4dde-b6a4-a6be01285cc0', 1, 0, '20161114 17:59:01.000', N'admin', '20161114 17:59:01.000', N'admin', NULL, NULL, N'7a1867d8-e8d1-4c95-a9f2-fddf02277c3a', N'e27cde30-24d6-44f9-9bb8-a6be012743ba')
INSERT INTO [bcms_root].[MasterPages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [MasterPageId]) VALUES (N'da1695ed-b813-47f2-a615-a6be01291d54', 1, 0, '20161114 18:01:45.000', N'admin', '20161114 18:01:45.000', N'admin', NULL, NULL, N'41380b54-3b44-48e9-aa17-a6be01291d54', N'e27cde30-24d6-44f9-9bb8-a6be012743ba')
INSERT INTO [bcms_root].[MasterPages] ([Id], [Version], [IsDeleted], [CreatedOn], [CreatedByUser], [ModifiedOn], [ModifiedByUser], [DeletedOn], [DeletedByUser], [PageId], [MasterPageId]) VALUES (N'fda39e68-79e2-48dc-9fc4-a6be0128a0c6', 1, 0, '20161114 17:59:59.000', N'admin', '20161114 17:59:59.000', N'admin', NULL, NULL, N'eb196f31-3796-4f00-9d91-a6be0128a0c5', N'e27cde30-24d6-44f9-9bb8-a6be012743ba')
INSERT INTO [bcms_pages].[ServerControlWidgets] ([Id], [Url]) VALUES (N'528a9601-c8ed-4dd6-9bb8-a6be0127e17f', N'~/Views/Widgets/DefaultMenu.cshtml')
INSERT INTO [bcms_pages].[ServerControlWidgets] ([Id], [Url]) VALUES (N'5640f939-016b-4ea4-aaeb-a6be0127c9dc', N'~/Views/Widgets/PhonebookWidget.cshtml')
ALTER TABLE [bcms_blog].[BlogPostContents]
    ADD CONSTRAINT [FK_Cms_BlogPostContents_Cms_HtmlContents] FOREIGN KEY ([Id]) REFERENCES [bcms_pages].[HtmlContents] ([Id])
ALTER TABLE [bcms_pages].[PageTags]
    ADD CONSTRAINT [FK_Cms_PageTags_Cms_Pages] FOREIGN KEY ([PageId]) REFERENCES [bcms_pages].[Pages] ([Id])
ALTER TABLE [bcms_pages].[PageTags]
    ADD CONSTRAINT [FK_Cms_PageTags_Cms_Tags] FOREIGN KEY ([TagId]) REFERENCES [bcms_root].[Tags] ([Id])
ALTER TABLE [bcms_blog].[Authors]
    ADD CONSTRAINT [FK_Cms_Authors_ImageId_MediaImages_Id] FOREIGN KEY ([ImageId]) REFERENCES [bcms_media].[MediaImages] ([Id])
ALTER TABLE [bcms_blog].[BlogPosts]
    ADD CONSTRAINT [FK_Cms_BlogPosts_Cms_PagesPages] FOREIGN KEY ([Id]) REFERENCES [bcms_pages].[Pages] ([Id])
ALTER TABLE [bcms_blog].[BlogPosts]
    ADD CONSTRAINT [FK_Cms_BlogPosts_Cms_Authors] FOREIGN KEY ([AuthorId]) REFERENCES [bcms_blog].[Authors] ([Id])
ALTER TABLE [bcms_pages].[SitemapNodeTranslations]
    ADD CONSTRAINT [FK_Cms_SitemapNodeTranslations_Cms_Sitemaps] FOREIGN KEY ([NodeId]) REFERENCES [bcms_pages].[SitemapNodes] ([Id])
ALTER TABLE [bcms_pages].[ServerControlWidgets]
    ADD CONSTRAINT [FK_Cms_ServerControlWidgets_Id_Widgets_Id] FOREIGN KEY ([Id]) REFERENCES [bcms_root].[Widgets] ([Id])
ALTER TABLE [bcms_root].[MasterPages]
    ADD CONSTRAINT [FK_Cms_MasterPages_PageId_Cms_Pages] FOREIGN KEY ([PageId]) REFERENCES [bcms_root].[Pages] ([Id])
ALTER TABLE [bcms_root].[MasterPages]
    ADD CONSTRAINT [FK_Cms_MasterPages_MasterPageId_Cms_Pages] FOREIGN KEY ([MasterPageId]) REFERENCES [bcms_root].[Pages] ([Id])
ALTER TABLE [bcms_root].[PageAccessRules]
    ADD CONSTRAINT [FK_Cms_PageAccessRules_PageId_Cms_Page_Id] FOREIGN KEY ([PageId]) REFERENCES [bcms_root].[Pages] ([Id])
ALTER TABLE [bcms_root].[PageAccessRules]
    ADD CONSTRAINT [FK_Cms_PageAccessRules_AccessRuleId_Cms_AccessRules_Id] FOREIGN KEY ([AccessRuleId]) REFERENCES [bcms_root].[AccessRules] ([Id])
ALTER TABLE [bcms_root].[ContentOptionTranslations]
    ADD CONSTRAINT [FK_Cms_ContentOptionTranslations_ContentOptionId_Cms_ContentOptions_Id] FOREIGN KEY ([ContentOptionId]) REFERENCES [bcms_root].[ContentOptions] ([Id])
ALTER TABLE [bcms_root].[ContentOptionTranslations]
    ADD CONSTRAINT [FK_Cms_ContentOptionTranslations_LanguageId_Cms_Languages_Id] FOREIGN KEY ([LanguageId]) REFERENCES [bcms_root].[Languages] ([Id])
ALTER TABLE [bcms_pages].[PageCategories]
    ADD CONSTRAINT [FK_Cms_PageCategories_PageId_Cms_Page_Id] FOREIGN KEY ([PageId]) REFERENCES [bcms_pages].[Pages] ([Id])
ALTER TABLE [bcms_pages].[PageCategories]
    ADD CONSTRAINT [FK_Cms_PageCategories_CategoryId_Cms_Category_Id] FOREIGN KEY ([CategoryId]) REFERENCES [bcms_root].[Categories] ([Id])
ALTER TABLE [bcms_blog].[Options]
    ADD CONSTRAINT [FK_Cms_BlogOptions_Cms_Layouts] FOREIGN KEY ([DefaultLayoutId]) REFERENCES [bcms_root].[Layouts] ([Id])
ALTER TABLE [bcms_blog].[Options]
    ADD CONSTRAINT [FK_Cms_BlogOptions_Cms_Pages] FOREIGN KEY ([DefaultMasterPageId]) REFERENCES [bcms_root].[Pages] ([Id])
ALTER TABLE [bcms_blog].[Options]
    ADD CONSTRAINT [FK_Cms_Blog_Options_DefaultContentTextMode_Pages_ContentTextModes_Id] FOREIGN KEY ([DefaultContentTextMode]) REFERENCES [bcms_pages].[ContentTextModes] ([Id])
ALTER TABLE [bcms_users].[Users]
    ADD CONSTRAINT [FK_Cms_Users_ImageId_Cms_MediaFiles_Id] FOREIGN KEY ([ImageId]) REFERENCES [bcms_media].[MediaFiles] ([Id])
ALTER TABLE [bcms_pages].[Pages]
    ADD CONSTRAINT [FK_Cms_PagesPages_Cms_RootPages] FOREIGN KEY ([Id]) REFERENCES [bcms_root].[Pages] ([Id])
ALTER TABLE [bcms_pages].[Pages]
    ADD CONSTRAINT [FK_Cms_Pages_CategoryId_Categories_Id] FOREIGN KEY ([CategoryId]) REFERENCES [bcms_root].[Categories] ([Id])
ALTER TABLE [bcms_pages].[Pages]
    ADD CONSTRAINT [FK_Cms_Pages_ImageId_MediaImages_Id] FOREIGN KEY ([ImageId]) REFERENCES [bcms_media].[MediaImages] ([Id])
ALTER TABLE [bcms_root].[ChildContentOptionTranslations]
    ADD CONSTRAINT [FK_Cms_ChildContentOptionTranslations_ChildContentOptionId_Cms_ChildContentOptions_Id] FOREIGN KEY ([ChildContentOptionId]) REFERENCES [bcms_root].[ChildContentOptions] ([Id])
ALTER TABLE [bcms_root].[ChildContentOptionTranslations]
    ADD CONSTRAINT [FK_Cms_ChildContentOptionTranslations_LanguageId_Cms_Languages_Id] FOREIGN KEY ([LanguageId]) REFERENCES [bcms_root].[Languages] ([Id])
ALTER TABLE [bcms_pages].[HtmlContentWidgets]
    ADD CONSTRAINT [FK_Cms_HtmlContentWidgets_Id_Widgets_Id] FOREIGN KEY ([Id]) REFERENCES [bcms_root].[Widgets] ([Id])
ALTER TABLE [bcms_pages].[SitemapArchives]
    ADD CONSTRAINT [FK_Cms_SitemapArchives_Cms_Sitemaps] FOREIGN KEY ([SitemapId]) REFERENCES [bcms_pages].[Sitemaps] ([Id])
ALTER TABLE [bcms_media].[MediaCategories]
    ADD CONSTRAINT [FK_Cms_MediaCategories_MediaId_Cms_Mdedia_Id] FOREIGN KEY ([MediaId]) REFERENCES [bcms_media].[Medias] ([Id])
ALTER TABLE [bcms_media].[MediaCategories]
    ADD CONSTRAINT [FK_Cms_MediaCategories_CategoryId_Cms_Category_Id] FOREIGN KEY ([CategoryId]) REFERENCES [bcms_root].[Categories] ([Id])
ALTER TABLE [bcms_root].[CategoryTreeCategorizableItems]
    ADD CONSTRAINT [FK_Cms_CategoryTreeCategorizableItems_Cms_CategoryTrees] FOREIGN KEY ([CategoryTreeId]) REFERENCES [bcms_root].[CategoryTrees] ([Id])
ALTER TABLE [bcms_root].[CategoryTreeCategorizableItems]
    ADD CONSTRAINT [FK_Cms_CategoryTreeCategorizableItems_Cms_CategorizableItems] FOREIGN KEY ([CategorizableItemId]) REFERENCES [bcms_root].[CategorizableItems] ([Id])
ALTER TABLE [bcms_root].[ContentOptions]
    ADD CONSTRAINT [FK_Cms_ContentOptions_CustomOptionId_Cms_CustomOptions_Id] FOREIGN KEY ([CustomOptionId]) REFERENCES [bcms_root].[CustomOptions] ([Id])
ALTER TABLE [bcms_root].[ContentOptions]
    ADD CONSTRAINT [FK_Cms_ContentOptions_ContentId_Cms_Contents_Id] FOREIGN KEY ([ContentId]) REFERENCES [bcms_root].[Contents] ([Id])
ALTER TABLE [bcms_root].[ContentOptions]
    ADD CONSTRAINT [FK_Cms_ContentOptions_Type_Cms_OptionTypes_Id] FOREIGN KEY ([Type]) REFERENCES [bcms_root].[OptionTypes] ([Id])
ALTER TABLE [bcms_root].[ContentRegions]
    ADD CONSTRAINT [FK_Cms_ContentRegions_Cms_Contents] FOREIGN KEY ([ContentId]) REFERENCES [bcms_root].[Contents] ([Id])
ALTER TABLE [bcms_root].[ContentRegions]
    ADD CONSTRAINT [FK_Cms_ContentRegions_Cms_Regions] FOREIGN KEY ([RegionId]) REFERENCES [bcms_root].[Regions] ([Id])
ALTER TABLE [bcms_pages].[SitemapNodes]
    ADD CONSTRAINT [FK_Cms_SitemapNodes_ParentNodeId_SitemapNodes_Id] FOREIGN KEY ([ParentNodeId]) REFERENCES [bcms_pages].[SitemapNodes] ([Id])
ALTER TABLE [bcms_pages].[SitemapNodes]
    ADD CONSTRAINT [FK_Cms_SitemapNodes_SitemapId_Cms_Sitemap_Id] FOREIGN KEY ([SitemapId]) REFERENCES [bcms_pages].[Sitemaps] ([Id])
ALTER TABLE [bcms_pages].[SitemapNodes]
    ADD CONSTRAINT [FK_Cms_SitemapNodes_SitemapId_Cms_Page_Id] FOREIGN KEY ([PageId]) REFERENCES [bcms_pages].[Pages] ([Id])
ALTER TABLE [bcms_media].[MediaFolders]
    ADD CONSTRAINT [FK_Cms_MediaFolders_Id_Medias_Id] FOREIGN KEY ([Id]) REFERENCES [bcms_media].[Medias] ([Id])
ALTER TABLE [bcms_pages].[HtmlContents]
    ADD CONSTRAINT [FK_Cms_HtmlContents_Id_Contents_Id] FOREIGN KEY ([Id]) REFERENCES [bcms_root].[Contents] ([Id])
ALTER TABLE [bcms_pages].[HtmlContents]
    ADD CONSTRAINT [FK_Cms_HtmlContents_ContentTextMode_ContentTextModes_Id] FOREIGN KEY ([ContentTextMode]) REFERENCES [bcms_pages].[ContentTextModes] ([Id])
ALTER TABLE [bcms_root].[Contents]
    ADD CONSTRAINT [FK_Cms_Contents_Cms_ContentStatuses] FOREIGN KEY ([Status]) REFERENCES [bcms_root].[ContentStatuses] ([Id])
ALTER TABLE [bcms_root].[Contents]
    ADD CONSTRAINT [FK_Cms_Contents_Cms_Contents_OriginalId] FOREIGN KEY ([OriginalId]) REFERENCES [bcms_root].[Contents] ([Id])
ALTER TABLE [bcms_root].[LayoutRegions]
    ADD CONSTRAINT [FK_Cms_LayoutRegions_Cms_Layouts] FOREIGN KEY ([LayoutId]) REFERENCES [bcms_root].[Layouts] ([Id])
ALTER TABLE [bcms_root].[LayoutRegions]
    ADD CONSTRAINT [FK_Cms_LayoutRegions_Cms_Regions] FOREIGN KEY ([RegionId]) REFERENCES [bcms_root].[Regions] ([Id])
ALTER TABLE [bcms_root].[PageOptions]
    ADD CONSTRAINT [FK_Cms_PageOptions_CustomOptionId_Cms_CustomOptions_Id] FOREIGN KEY ([CustomOptionId]) REFERENCES [bcms_root].[CustomOptions] ([Id])
ALTER TABLE [bcms_root].[PageOptions]
    ADD CONSTRAINT [FK_Cms_PageOptions_PageId_Cms_Pages_Id] FOREIGN KEY ([PageId]) REFERENCES [bcms_root].[Pages] ([Id])
ALTER TABLE [bcms_root].[PageOptions]
    ADD CONSTRAINT [FK_Cms_PageOptions_Type_Cms_OptionTypes_Id] FOREIGN KEY ([Type]) REFERENCES [bcms_root].[OptionTypes] ([Id])
ALTER TABLE [bcms_media].[MediaFiles]
    ADD CONSTRAINT [FK_MediaFiles_Id_Medias_Id] FOREIGN KEY ([Id]) REFERENCES [bcms_media].[Medias] ([Id])
ALTER TABLE [bcms_media].[Medias]
    ADD CONSTRAINT [FK_Cms_Medias_FolderId_MediaFolders_Id] FOREIGN KEY ([FolderId]) REFERENCES [bcms_media].[MediaFolders] ([Id])
ALTER TABLE [bcms_media].[Medias]
    ADD CONSTRAINT [FK_Cms_Medias_Type_MediaTypes_Id] FOREIGN KEY ([Type]) REFERENCES [bcms_media].[MediaTypes] ([Id])
ALTER TABLE [bcms_users].[UserRoles]
    ADD CONSTRAINT [FK_Cms_UserRoles_Role_Cms_Role_Id] FOREIGN KEY ([RoleId]) REFERENCES [bcms_users].[Roles] ([Id])
ALTER TABLE [bcms_users].[UserRoles]
    ADD CONSTRAINT [FK_Cms_UserRoles_User_Cms_Users_Id] FOREIGN KEY ([UserId]) REFERENCES [bcms_users].[Users] ([Id])
ALTER TABLE [bcms_root].[PageContentOptions]
    ADD CONSTRAINT [FK_Cms_PageContentOptions_CustomOptionId_Cms_CustomOptions_Id] FOREIGN KEY ([CustomOptionId]) REFERENCES [bcms_root].[CustomOptions] ([Id])
ALTER TABLE [bcms_root].[PageContentOptions]
    ADD CONSTRAINT [FK_Cms_PageContentOptions_PageContentId_Cms_PageContents_Id] FOREIGN KEY ([PageContentId]) REFERENCES [bcms_root].[PageContents] ([Id])
ALTER TABLE [bcms_root].[PageContentOptions]
    ADD CONSTRAINT [FK_Cms_PageContentOptions_Type_Cms_OptionTypes_Id] FOREIGN KEY ([Type]) REFERENCES [bcms_root].[OptionTypes] ([Id])
ALTER TABLE [bcms_root].[PageContents]
    ADD CONSTRAINT [Fk__PageContents_ParentPageContentId__ParentPageContentId_Id] FOREIGN KEY ([ParentPageContentId]) REFERENCES [bcms_root].[PageContents] ([Id])
ALTER TABLE [bcms_root].[PageContents]
    ADD CONSTRAINT [FK_Cms_PageContents_PageId_Pages_Id] FOREIGN KEY ([PageId]) REFERENCES [bcms_root].[Pages] ([Id])
ALTER TABLE [bcms_root].[PageContents]
    ADD CONSTRAINT [FK_Cms_PageContents_ContentId_Contents_Id] FOREIGN KEY ([ContentId]) REFERENCES [bcms_root].[Contents] ([Id])
ALTER TABLE [bcms_root].[PageContents]
    ADD CONSTRAINT [FK_Cms_PageContents_RegionId_Regions_Id] FOREIGN KEY ([RegionId]) REFERENCES [bcms_root].[Regions] ([Id])
ALTER TABLE [bcms_media].[MediaFileAccessRules]
    ADD CONSTRAINT [FK_Cms_MediaFileAccessRules_MediaFileId_Cms_MediaFile_Id] FOREIGN KEY ([MediaFileId]) REFERENCES [bcms_media].[MediaFiles] ([Id])
ALTER TABLE [bcms_media].[MediaFileAccessRules]
    ADD CONSTRAINT [FK_Cms_MediaFileAccessRules_AccessRuleId_Cms_AccessRules_Id] FOREIGN KEY ([AccessRuleId]) REFERENCES [bcms_root].[AccessRules] ([Id])
ALTER TABLE [bcms_root].[Categories]
    ADD CONSTRAINT [Fk_Cms_Categories_ParentCategoryId__Categories_Id] FOREIGN KEY ([ParentCategoryId]) REFERENCES [bcms_root].[Categories] ([Id])
ALTER TABLE [bcms_root].[Categories]
    ADD CONSTRAINT [FK_Cms_Categories_CategoryTreeId_Cms_CategoryTree_Id] FOREIGN KEY ([CategoryTreeId]) REFERENCES [bcms_root].[CategoryTrees] ([Id])
ALTER TABLE [bcms_media].[MediaImages]
    ADD CONSTRAINT [FK_MediaImages_Id_MediaFiles_Id] FOREIGN KEY ([Id]) REFERENCES [bcms_media].[MediaFiles] ([Id])
ALTER TABLE [bcms_media].[MediaImages]
    ADD CONSTRAINT [FK_MediaImages_ImageAlign_MediaImageAlignTypes_Id] FOREIGN KEY ([ImageAlign]) REFERENCES [bcms_media].[MediaImageAlignTypes] ([Id])
ALTER TABLE [bcms_root].[LayoutOptions]
    ADD CONSTRAINT [FK_Cms_LayoutOptions_CustomOptionId_Cms_CustomOptions_Id] FOREIGN KEY ([CustomOptionId]) REFERENCES [bcms_root].[CustomOptions] ([Id])
ALTER TABLE [bcms_root].[LayoutOptions]
    ADD CONSTRAINT [FK_Cms_LayoutOptions_Type_Cms_OptionTypes_Id] FOREIGN KEY ([Type]) REFERENCES [bcms_root].[OptionTypes] ([Id])
ALTER TABLE [bcms_root].[LayoutOptions]
    ADD CONSTRAINT [FK_Cms_LayoutOptions_LayoutId_Cms_Layouts_Id] FOREIGN KEY ([LayoutId]) REFERENCES [bcms_root].[Layouts] ([Id])
ALTER TABLE [bcms_root].[Layouts]
    ADD CONSTRAINT [FK_Cms_Layouts_Cms_Modules] FOREIGN KEY ([ModuleId]) REFERENCES [bcms_root].[Modules] ([Id])
ALTER TABLE [bcms_root].[WidgetCategories]
    ADD CONSTRAINT [FK_Cms_WidgetCategories_WidgetId_Cms_Widget_Id] FOREIGN KEY ([WidgetId]) REFERENCES [bcms_root].[Widgets] ([Id])
ALTER TABLE [bcms_root].[WidgetCategories]
    ADD CONSTRAINT [FK_Cms_WidgetCategories_CategoryId_Cms_Category_Id] FOREIGN KEY ([CategoryId]) REFERENCES [bcms_root].[Categories] ([Id])
ALTER TABLE [bcms_root].[Widgets]
    ADD CONSTRAINT [FK_Cms_Widgets_Id_Content_Id] FOREIGN KEY ([Id]) REFERENCES [bcms_root].[Contents] ([Id])
ALTER TABLE [bcms_root].[Widgets]
    ADD CONSTRAINT [FK_Cms_Widgets_Id_Category_Id] FOREIGN KEY ([CategoryId]) REFERENCES [bcms_root].[Categories] ([Id])
ALTER TABLE [bcms_root].[ChildContentOptions]
    ADD CONSTRAINT [FK_Cms_ChildContentOptions_ChildContentId_Cms_ChildContents_Id] FOREIGN KEY ([ChildContentId]) REFERENCES [bcms_root].[ChildContents] ([Id])
ALTER TABLE [bcms_root].[ChildContentOptions]
    ADD CONSTRAINT [FK_Cms_ChildContentOptions_Type_Cms_OptionTypes_Id] FOREIGN KEY ([Type]) REFERENCES [bcms_root].[OptionTypes] ([Id])
ALTER TABLE [bcms_root].[ChildContentOptions]
    ADD CONSTRAINT [FK_Cms_ChildContentOptions_CustomOptionId_Cms_CustomOptions_Id] FOREIGN KEY ([CustomOptionId]) REFERENCES [bcms_root].[CustomOptions] ([Id])
ALTER TABLE [bcms_root].[ChildContents]
    ADD CONSTRAINT [FK_Cms_ChildContents_ParentContentId_Contents_Id] FOREIGN KEY ([ParentContentId]) REFERENCES [bcms_root].[Contents] ([Id])
ALTER TABLE [bcms_root].[ChildContents]
    ADD CONSTRAINT [FK_Cms_ChildContents_ChildContentId_Contents_Id] FOREIGN KEY ([ChildContentId]) REFERENCES [bcms_root].[Contents] ([Id])
ALTER TABLE [bcms_pages].[SitemapAccessRules]
    ADD CONSTRAINT [FK_Cms_SitemapAccessRules_SitemapId_Cms_Sitemap_Id] FOREIGN KEY ([SitemapId]) REFERENCES [bcms_pages].[Sitemaps] ([Id])
ALTER TABLE [bcms_pages].[SitemapAccessRules]
    ADD CONSTRAINT [FK_Cms_SitemapAccessRules_AccessRuleId_Cms_AccessRules_Id] FOREIGN KEY ([AccessRuleId]) REFERENCES [bcms_root].[AccessRules] ([Id])
ALTER TABLE [bcms_pages].[SitemapTags]
    ADD CONSTRAINT [FK_Cms_SitemapTags_Cms_Sitemaps] FOREIGN KEY ([SitemapId]) REFERENCES [bcms_pages].[Sitemaps] ([Id])
ALTER TABLE [bcms_pages].[SitemapTags]
    ADD CONSTRAINT [FK_Cms_SitemapTags_Cms_Tags] FOREIGN KEY ([TagId]) REFERENCES [bcms_root].[Tags] ([Id])
ALTER TABLE [bcms_root].[Pages]
    ADD CONSTRAINT [FK_Cms_RootPages_Cms_ProtocolForcingTypes] FOREIGN KEY ([ForceAccessProtocol]) REFERENCES [bcms_root].[ProtocolForcingTypes] ([Id])
ALTER TABLE [bcms_root].[Pages]
    ADD CONSTRAINT [FK_Cms_Pages_Cms_Pages] FOREIGN KEY ([MasterPageId]) REFERENCES [bcms_root].[Pages] ([Id])
ALTER TABLE [bcms_root].[Pages]
    ADD CONSTRAINT [FK_Cms_RootPages_Cms_PageStatuses] FOREIGN KEY ([Status]) REFERENCES [bcms_root].[PageStatuses] ([Id])
ALTER TABLE [bcms_root].[Pages]
    ADD CONSTRAINT [FK_Cms_Pages_Cms_Layouts] FOREIGN KEY ([LayoutId]) REFERENCES [bcms_root].[Layouts] ([Id])
ALTER TABLE [bcms_root].[Pages]
    ADD CONSTRAINT [FK_Cms_Pages_Cms_Languages] FOREIGN KEY ([LanguageId]) REFERENCES [bcms_root].[Languages] ([Id])
ALTER TABLE [bcms_media].[MediaTags]
    ADD CONSTRAINT [FK_Cms_MediaTags_Cms_Medias] FOREIGN KEY ([MediaId]) REFERENCES [bcms_media].[Medias] ([Id])
ALTER TABLE [bcms_media].[MediaTags]
    ADD CONSTRAINT [FK_Cms_MediaTags_Cms_Tags] FOREIGN KEY ([TagId]) REFERENCES [bcms_root].[Tags] ([Id])
COMMIT TRANSACTION
