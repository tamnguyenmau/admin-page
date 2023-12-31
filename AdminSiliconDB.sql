USE [AdminSiliconZDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/10/2023 10:31:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[FullName] [nvarchar](255) NULL,
	[Email] [nvarchar](50) NULL,
	[Mobile] [nvarchar](15) NULL,
	[Address] [nvarchar](255) NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[AccountCategoryID] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Article]    Script Date: 12/10/2023 10:31:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[ArticleID] [int] IDENTITY(1,1) NOT NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](4000) NULL,
	[Content] [ntext] NULL,
	[Position] [int] NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[ArticleCategoryID] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Article] PRIMARY KEY CLUSTERED 
(
	[ArticleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ArticleCategory]    Script Date: 12/10/2023 10:31:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleCategory](
	[ArticleCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](4000) NULL,
	[Position] [int] NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_ArticleCategory] PRIMARY KEY CLUSTERED 
(
	[ArticleCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Contact]    Script Date: 12/10/2023 10:31:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ContactID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Mobile] [nvarchar](15) NULL,
	[Email] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Content] [ntext] NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[ContactCategoryID] [int] NULL,
	[ApproveBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContactCategory]    Script Date: 12/10/2023 10:31:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactCategory](
	[ContactCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](4000) NULL,
	[Position] [int] NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_ContactCategory] PRIMARY KEY CLUSTERED 
(
	[ContactCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Gallery]    Script Date: 12/10/2023 10:31:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gallery](
	[GalleryID] [int] IDENTITY(1,1) NOT NULL,
	[Avatar] [nvarchar](255) NULL,
	[Posittion] [int] NULL,
	[Status] [bit] NULL,
	[CreateBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Gallery] PRIMARY KEY CLUSTERED 
(
	[GalleryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/10/2023 10:31:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](4000) NULL,
	[Price] [int] NULL,
	[Quantity] [int] NULL,
	[Content] [ntext] NULL,
	[Position] [int] NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[ProductCategoryID] [int] NULL,
	[CreateBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductCategory]    Script Date: 12/10/2023 10:31:41 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCategory](
	[ProductCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Avatar] [nvarchar](255) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Description] [nvarchar](4000) NULL,
	[Position] [int] NULL,
	[Status] [bit] NULL,
	[CreateTime] [datetime] NULL,
	[CreateBy] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Account] ([Username], [Password], [Avatar], [Thumb], [FullName], [Email], [Mobile], [Address], [Status], [CreateTime], [AccountCategoryID]) VALUES (N'admin', N'12', N'/content/images/nmtam3005_pixar_boy_happy_66f64036-2541-4962-9cfa-77bf080f4358.png', N'/content/images/nmtam3005_pixar_boy_happy_66f64036-2541-4962-9cfa-77bf080f4358.png', N'Nguyễn Mậu Tâm', N'tammau3005@gmail.com', N'0979876678', N'Bình Dương', 1, CAST(N'2020-10-09 19:19:57.783' AS DateTime), N'SupperAdmin')
INSERT [dbo].[Account] ([Username], [Password], [Avatar], [Thumb], [FullName], [Email], [Mobile], [Address], [Status], [CreateTime], [AccountCategoryID]) VALUES (N'lyhai', N'123456', N'/content/images/icons/account-icon.png', N'/content/images/avatar.png', N'Lý Hải', N'haily@gmail.com', N'0977877678', N'Bình Dương', 1, CAST(N'2020-10-09 19:19:57.797' AS DateTime), N'BasicAdmin')
INSERT [dbo].[Account] ([Username], [Password], [Avatar], [Thumb], [FullName], [Email], [Mobile], [Address], [Status], [CreateTime], [AccountCategoryID]) VALUES (N'nmtam', N'123', N'/content/images/icons/account-icon.png', N'/content/images/icons/account-icon.png', N'Nguyễn Mậu Tâm', N'nmtam3005@gmail.com', N'0977877678', N'Đăk Nông', 1, CAST(N'2020-10-09 19:19:57.000' AS DateTime), N'BasicAdmin')
SET IDENTITY_INSERT [dbo].[Article] ON 

INSERT [dbo].[Article] ([ArticleID], [Avatar], [Thumb], [Title], [Description], [Content], [Position], [Status], [CreateTime], [ArticleCategoryID], [CreateBy]) VALUES (1, N'/FileUploads/Article/Avatar/b2ed6eb00e89413ca65e8d56d8cf3f8e.png', N'/FileUploads/Article/Avatar/b2ed6eb00e89413ca65e8d56d8cf3f8e.png', N'Samsung ra mắt Galaxy M31 Prime: Pin 6.000 mAh, camera chính 64 MP, 8 GB RAM với mức giá 5.3 triệu đồng', N'Hôm nay (10/10), Samsung chính thức giới thiệu một mẫu smartphone mới cho dòng Galaxy M với tên gọi là Galaxy M31 Prime. Chiếc điện thoại này có thiết kế cùng thông số cấu hình tương tự với Galaxy M31 được ra mắt trước đây.', N'<article></h2><p>Samsung Galaxy M31 Prime sở hữu màn hình Super AMOLED sử dụng thiết kế giọt nước. Cung cấp sức mạnh cho điện thoại là bộ vi xử lý Exynos 9611 tám nhân, GPU Mali-G72 cùng với 8 GB RAM và bộ nhớ trong lên đến 128 GB.</p><div><img src="/FileUploads/Article/Content/26ae48e0eced4219b5f348179bcc1156.png"></div><p>Mặt sau của Galaxy M31 Prime là sự xuất hiện của cụm camera gồm 4 ống kính: Camera chính 64 MP, ống kính góc siêu rộng 8 MP với góc chụp 123 độ, camera macro 5 MP và cảm biến đo độ sâu 5 MP. Thiết bị sở hữu camera selfie 32 MP ở mặt trước.</p><p>Điện thoại được trang bị viên pin dung lượng lớn 6.000 mAh với hỗ trợ sạc nhanh 15W. Máy sẽ cài sẵn giao diện OneUI dựa trên nền Android 10. Thiết bị sẽ được bán qua trang thương mại điện tử Amazon với phiên bản màu Ocean Blue.</p><p>Galaxy M31 Prime có mức giá 16.499 INR (khoảng 5.3 triệu đồng) tại thị trường Ấn Độ cho bản 6 GB RAM + 64 GB bộ nhớ trong. Ngoài ra, sản phẩm cũng có thêm phiên bản 128 GB bộ nhớ trong nhưng hiện tại Samsung vẫn chưa công bố giá bán chính thức.</p><p>Bạn nghĩ Samsung Galaxy M31 Prime có được bán chính thức tại Việt Nam hay không?</p></article>', NULL, 1, CAST(N'2020-10-23 15:03:14.130' AS DateTime), 1, N'admin')
INSERT [dbo].[Article] ([ArticleID], [Avatar], [Thumb], [Title], [Description], [Content], [Position], [Status], [CreateTime], [ArticleCategoryID], [CreateBy]) VALUES (2, N'/FileUploads/Article/Avatar/75169d8d366a4ecf92bf74df7d3167c3.jpg', N'/FileUploads/Article/Avatar/75169d8d366a4ecf92bf74df7d3167c3.jpg', N'Vòng tay thông minh Honor Band 5i ưu đãi giảm sốc lên đến 20%, đã r', N'Nhân ngày 20/10 sắp tới đây, vòng tay thông minh Honor Band 5i ưu đãi giảm sốc lên đến 20%, giá chỉ còn 520 ngàn. Giá rẻ hết hồn, cơ hội để các bạn sở hữu cho mình một chiếc vòng tay thông minh cực chất với giá tốt nhất, đừng bỏ lỡ các bạn nhé.', N'<!DOCTYPE html>
<html>
<head>
</head>
<body>
<article>
<p>Thời gian khuyến m&atilde;i sẽ k&eacute;o d&agrave;i đến <strong>hết ng&agrave;y 20/10/2020.</strong></p>
<p>Vậy Honor Band 5i c&oacute; những điểm g&igrave; nổi bật?</p>
<div><img /></div>
<p>M&aacute;y c&oacute; thiết kế nhỏ gọn v&agrave; d&acirc;y đeo l&agrave;m bằng chất liệu silicon, t&iacute;ch hợp đầu nối sạc trong d&acirc;y đeo kh&aacute; ấn tượng. M&agrave;n h&igrave;nh LCD với k&iacute;ch thước 0,96 inch hiện thị r&otilde; r&agrave;ng, sắc n&eacute;t.</p>
<p>Ngo&agrave;i ra, v&ograve;ng tay th&ocirc;n minh n&agrave;y c&ograve;n được t&iacute;ch hợp đầy đủ c&aacute;c t&iacute;nh năng như cảm biến SpO2 để đo nồng độ oxy m&aacute;u, theo d&otilde;i nhịp tim TruSeen 3.5, theo d&otilde;i giấc ngủ,....Trang bị vi&ecirc;n pin 90 mAh, thời lượng sử dụng c&oacute; thể l&ecirc;n tới 7- 9 ng&agrave;y n&ecirc;n bạn c&oacute; thể y&ecirc;n t&acirc;m, thoải m&aacute;i đồng h&agrave;nh c&ugrave;ng m&igrave;nh khắp nơi.</p>
<div>
<div><a> <img src="../../FileUploads/Article/Content/e6ae18dd9bd64e648088e5b104d8df5a.jpg" /> </a></div>
<div>
<h3>V&ograve;ng đeo tay th&ocirc;ng minh Honor Band 5i</h3>
<div><strong>650.000₫</strong></div>
<figure>M&agrave;n h&igrave;nh: LCD, 0.96 inchTương th&iacute;ch: Android 4.4 trở l&ecirc;n, iOS 9 trở l&ecirc;nThời gian sử dụng pin: Khoảng 5 ng&agrave;yĐo nhịp tim, T&iacute;nh lượng calories ti&ecirc;u thụ, Đếm số bước ch&acirc;n</figure>
<a>Xem chi tiết</a></div>
</div>
<p>Bạn sẽ kh&ocirc;ng bỏ qua cơ hội n&agrave;y chứ?</p>
<p>Xem th&ecirc;m:&nbsp;<a>Mừng 20/10, đồng hồ thời trang nữ đồng giảm 40%, smartwatch ưu đ&atilde;i hấp dẫn đến 20%, gh&eacute; v&agrave;o xem ngay nhiều m&oacute;n hời chờ bạn sắm</a></p>
<div>&nbsp;</div>
</article>
</body>
</html>', NULL, 1, CAST(N'2023-10-23 00:00:00.000' AS DateTime), 1, N'admin')
INSERT [dbo].[Article] ([ArticleID], [Avatar], [Thumb], [Title], [Description], [Content], [Position], [Status], [CreateTime], [ArticleCategoryID], [CreateBy]) VALUES (3, N'/FileUploads/Article/Avatar/41dbd00a-292a-4060-b61e-efe8f6b74c3d.jpg', NULL, N'ád', N'ádá', N'<!DOCTYPE html>
<html>
<head>
</head>
<body>
<p>&aacute;đ&aacute;</p>
</body>
</html>', NULL, 1, CAST(N'2023-10-11 16:48:05.373' AS DateTime), 3, N'admin')
INSERT [dbo].[Article] ([ArticleID], [Avatar], [Thumb], [Title], [Description], [Content], [Position], [Status], [CreateTime], [ArticleCategoryID], [CreateBy]) VALUES (4, N'/FileUploads/Article/Avatar/ddb67f25-4fa2-45d9-a776-0039a636f7ad.jpg', NULL, N'12123', N'21231', N'<!DOCTYPE html>
<html>
<head>
</head>
<body>
<p>zxczxc</p>
</body>
</html>', NULL, 1, CAST(N'2023-10-12 10:21:17.287' AS DateTime), 2, N'admin')
SET IDENTITY_INSERT [dbo].[Article] OFF
SET IDENTITY_INSERT [dbo].[ArticleCategory] ON 

INSERT [dbo].[ArticleCategory] ([ArticleCategoryID], [Avatar], [Thumb], [Title], [Description], [Position], [Status], [CreateTime], [CreateBy]) VALUES (1, NULL, NULL, N'Tin tức công nghệ', NULL, 1, 1, CAST(N'2020-01-01 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[ArticleCategory] ([ArticleCategoryID], [Avatar], [Thumb], [Title], [Description], [Position], [Status], [CreateTime], [CreateBy]) VALUES (2, NULL, NULL, N'Công thái học', NULL, 2, 1, CAST(N'2020-01-01 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[ArticleCategory] ([ArticleCategoryID], [Avatar], [Thumb], [Title], [Description], [Position], [Status], [CreateTime], [CreateBy]) VALUES (3, NULL, NULL, N'Lifestyle', NULL, 3, 1, CAST(N'2020-01-01 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[ArticleCategory] ([ArticleCategoryID], [Avatar], [Thumb], [Title], [Description], [Position], [Status], [CreateTime], [CreateBy]) VALUES (5, NULL, NULL, N'công nghệ', NULL, 4, 1, CAST(N'2023-10-09 00:52:23.287' AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[ArticleCategory] OFF
SET IDENTITY_INSERT [dbo].[Gallery] ON 

INSERT [dbo].[Gallery] ([GalleryID], [Avatar], [Posittion], [Status], [CreateBy]) VALUES (1, N'/FileUploads/Product/1.jpg', NULL, 1, N'admin')
INSERT [dbo].[Gallery] ([GalleryID], [Avatar], [Posittion], [Status], [CreateBy]) VALUES (2, N'/FileUploads/Product/2.jpg', NULL, 1, N'admin')
INSERT [dbo].[Gallery] ([GalleryID], [Avatar], [Posittion], [Status], [CreateBy]) VALUES (3, N'/FileUploads/Product/3.jpg', NULL, 1, N'admin')
INSERT [dbo].[Gallery] ([GalleryID], [Avatar], [Posittion], [Status], [CreateBy]) VALUES (4, N'/FileUploads/Product/4.jpg', NULL, 1, N'admin')
INSERT [dbo].[Gallery] ([GalleryID], [Avatar], [Posittion], [Status], [CreateBy]) VALUES (7, N'/FileUploads/Product/5d680d1d-27b5-4cf5-b339-bd910bf7934d.jpg', NULL, 1, N'admin')
INSERT [dbo].[Gallery] ([GalleryID], [Avatar], [Posittion], [Status], [CreateBy]) VALUES (8, N'/FileUploads/Product/c25c8526-4f89-4f3f-bab3-c4ca1874973c.jpg', NULL, 1, N'admin')
INSERT [dbo].[Gallery] ([GalleryID], [Avatar], [Posittion], [Status], [CreateBy]) VALUES (9, N'/FileUploads/Product/531e2825-d970-447e-af6f-01308f6e7fe0.jpg', NULL, 1, N'admin')
INSERT [dbo].[Gallery] ([GalleryID], [Avatar], [Posittion], [Status], [CreateBy]) VALUES (10, N'/FileUploads/Product/424008a8-375b-44f6-829a-887aa040a9fe.jpg', NULL, 1, N'admin')
INSERT [dbo].[Gallery] ([GalleryID], [Avatar], [Posittion], [Status], [CreateBy]) VALUES (11, N'/FileUploads/Product/345f5896-1db5-4c18-a0de-e1d63a08373a.jpg', NULL, 1, N'admin')
INSERT [dbo].[Gallery] ([GalleryID], [Avatar], [Posittion], [Status], [CreateBy]) VALUES (12, N'/FileUploads/Product/1e33aaa7-ba68-4d95-8a9d-15a37808cb14.jpg', NULL, 1, N'admin')
INSERT [dbo].[Gallery] ([GalleryID], [Avatar], [Posittion], [Status], [CreateBy]) VALUES (13, N'/FileUploads/Product/fb455cf1-eaeb-463d-ba1e-112db6385f33.jpg', NULL, 1, N'admin')
INSERT [dbo].[Gallery] ([GalleryID], [Avatar], [Posittion], [Status], [CreateBy]) VALUES (14, N'/FileUploads/Product/756b4931-39c2-49d9-88d3-f077f8663d83.jpg', NULL, 1, N'admin')
INSERT [dbo].[Gallery] ([GalleryID], [Avatar], [Posittion], [Status], [CreateBy]) VALUES (15, N'/FileUploads/Product/7983a435-cad2-4502-9ac1-44910cbdbe63.jpg', NULL, 1, N'admin')
INSERT [dbo].[Gallery] ([GalleryID], [Avatar], [Posittion], [Status], [CreateBy]) VALUES (16, N'/FileUploads/Product/39b07862-2ab4-48f7-a511-2eaf5abc13a9.jpg', NULL, 1, N'admin')
INSERT [dbo].[Gallery] ([GalleryID], [Avatar], [Posittion], [Status], [CreateBy]) VALUES (17, N'/FileUploads/Product/88b1a30e-42bd-44a3-8005-b9ea0b0e0dda.jpg', NULL, 1, N'admin')
INSERT [dbo].[Gallery] ([GalleryID], [Avatar], [Posittion], [Status], [CreateBy]) VALUES (18, N'/FileUploads/Product/986e5ef1-9eed-4b05-b229-343b95874b30.jpg', NULL, 1, N'admin')
INSERT [dbo].[Gallery] ([GalleryID], [Avatar], [Posittion], [Status], [CreateBy]) VALUES (19, N'/FileUploads/Product/29cefd15-5b3d-4c73-b3c6-5a3023191079.jpg', NULL, 1, N'admin')
SET IDENTITY_INSERT [dbo].[Gallery] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductID], [Avatar], [Thumb], [Title], [Description], [Price], [Quantity], [Content], [Position], [Status], [CreateTime], [ProductCategoryID], [CreateBy]) VALUES (1, N'/FileUploads/Product/1.jpg', N'/FileUploads/Product/1.jpg', N'Keychron Q0 Plus - Bàn phím số Custom ', N'
                        Nhôm nguyên khối CNC | Hot-Swap | Núm điều chỉnh đa
                        năng | Tuỳ biến với QMK/VIA
                    ', 1000000, 10, N'<!DOCTYPE html>
<html>
<head>
</head>
<body>
<h3><strong>Keychron Q0 Plus - B&agrave;n ph&iacute;m số Custom QMK</strong></h3>
<p>Q0 Plus l&agrave; một b&agrave;n ph&iacute;m số custom c&oacute; hỗ trợ h&agrave;ng ph&iacute;m macro v&agrave; n&uacute;m xoay điều chỉnh đa năng ở b&ecirc;n tr&aacute;i. Q0 Plus đ&oacute;ng vai tr&ograve; l&agrave; b&agrave;n ph&iacute;m số ri&ecirc;ng biệt hoặc một bộ ph&iacute;m t&ugrave;y chỉnh đa năng cao cấp ho&agrave;n thiện từ nh&ocirc;m nguy&ecirc;n khối CNC v&agrave; c&oacute; hỗ trợ QMK/VIA.</p>
<p><img src="https://siliconz.vn/storage/images/ban-phim-so-q0-plus-carbon-black.jpg" alt="B&agrave;n ph&iacute;m số Custom Keychron Q0 Plus" /></p>
<p><img src="https://siliconz.vn/storage/images/tinh-nang-ban-phim-so-q0-plus.jpg" alt="T&iacute;nh năng nổi bật tr&ecirc;n Keychron Q0 Plus" /></p>
<h3><strong>Ho&agrave;n thiện từ kim loại cao cấp</strong></h3>
<p>Q0 Plus sở hữu phần th&acirc;n kim loại mini được ho&agrave;n thiện từ nh&ocirc;m 6063 được xử l&yacute; qua m&aacute;y CNC, đ&aacute;nh b&oacute;ng, anode h&oacute;a v&agrave; trải qua 24 c&ocirc;ng đoạn chế t&aacute;c kỹ lưỡng kh&aacute;c. V&igrave; vậy Q0 Plus l&agrave; một kiệt t&aacute;c được ho&agrave;n thiện tinh xảo n&ecirc;n c&oacute; tr&ecirc;n b&agrave;n l&agrave;m việc của bạn.</p>
<p><img src="https://siliconz.vn/storage/images/ban-phim-so-q0-plus-silver-grey-tren-ban.jpg" alt="Phi&ecirc;n bản m&agrave;u Silver Grey của Q0 Plus" /></p>
<h3><strong>B&agrave;n ph&iacute;m số Custom to&agrave;n diện</strong></h3>
<p>Để mang đến khả năng custom mọi thứ theo sở th&iacute;ch của bạn, mọi th&agrave;nh phần tr&ecirc;n Q0 Plus đều c&oacute; thể dễ d&agrave;ng thay thế cũng như tinh chỉnh theo mong muốn của bạn.</p>
<p><img src="https://siliconz.vn/storage/images/cau-tao-ban-phim-so-q0-plus.jpg" alt="Khả năng mod dễ d&agrave;ng mọi bộ phận với Q0 Plus" /></p>
<h3><strong>Thiết kế Double Gasket</strong></h3>
<p>Q0 Plus sử dụng thiết kế Double Gasket l&agrave; một cấu tr&uacute;c cải tiến trong thế giới b&agrave;n ph&iacute;m cơ. Ngo&agrave;i c&aacute;c miếng đệm silicon tr&ecirc;n phần plate, Q0 Plus c&ograve;n được th&ecirc;m v&agrave;o c&aacute;c miếng đệm silicon giữa hai phần case nh&ocirc;m.</p>
<p><img src="https://siliconz.vn/storage/images/thiet-ke-double-gasket-ban-phim-so-q0-plus.gif" alt="Thiết kế Double Gasket cải tiến" /></p>
<p>Điều n&agrave;y gi&uacute;p giảm đ&aacute;ng kể độ vang của ph&iacute;m v&agrave; giảm tiếng ồn khi c&aacute;c chi tiết kim loại va chạm với nhau cũng như duy tr&igrave; t&iacute;nh linh hoạt của cấu tr&uacute;c đệm v&agrave; cải thiện &acirc;m thanh g&otilde; tổng thể.</p>
<h3><strong>Hơn cả một b&agrave;n ph&iacute;m số. Lập tr&igrave;nh Q0 Plus với QMK /VIA</strong></h3>
<p>Với sự hỗ trợ đầy đủ của QMK v&agrave; VIA, bạn c&oacute; thể lập tr&igrave;nh tinh chỉnh lại chức năng cho&nbsp; từng ph&iacute;m tr&ecirc;n Q0 Plus n&agrave;y một c&aacute;ch dễ d&agrave;ng. Mang đến cho bạn khả năng s&aacute;ng tạo v&ocirc; tận tr&ecirc;n Q0 Plus cho layout, lối tắt, hiệu ứng đ&egrave;n nền, t&iacute;nh năng,...</p>
<p><img src="https://siliconz.vn/storage/images/qmk-via-ban-phim-so-q0-plus.jpg" alt="Tuỳ chỉnh t&iacute;nh năng dễ d&agrave;ng với QMK/VIA" /></p>
<h3><strong>Keycaps OSA PBT Double-shot</strong></h3>
<p>Q0 Plus sử dụng keycaps với OSA profile( sự kết hợp giữa chiều cao dễ l&agrave;m quen của profile OEM v&agrave; bề mặt l&otilde;m thoải m&aacute;i của profile SA) độc đ&aacute;o.</p>
<p><img src="https://siliconz.vn/storage/images/ban-phim-so-custom-q0-plus-navy-blue.jpg" alt="Keycap OSA PBT Double-shot cho cảm gi&aacute;c g&otilde; tốt" /></p>
<p>Keycap tr&ecirc;n Q0 Plus được ho&agrave;n thiện Double-shot với chất liệu nhựa PBT bền bỉ, chống b&aacute;m dầu tuyệt vời mang đến cảm gi&aacute;c g&otilde; tuyệt vời trong thời gian d&agrave;i sử dụng.</p>
<h3><strong>Stabilizer Screw-In PCB</strong></h3>
<p>Ngay cả một phần nhỏ cũng quan trọng đối với cảm gi&aacute;c đầu ng&oacute;n tay của bạn. V&igrave; vậy Q0 Plus đ&atilde; t&iacute;ch hợp bộ Stabilizers gắn trực tiếp v&agrave;o PCB (v&agrave; dễ d&agrave;ng thay thế bởi c&aacute;c bộ PCB b&ecirc;n thứ ba) để mang lại trải nghiệm g&otilde; mượt m&agrave; c&ugrave;ng sự ổn định, chắc chắn tr&ecirc;n c&aacute;c ph&iacute;m d&agrave;i như space, shift, enter,...</p>
<p><img src="https://siliconz.vn/storage/images/stabilizer-ban-phim-so-q0-plus.jpg" alt="Bộ c&acirc;n b&agrave;ng Stabilizer cải tiến " /></p>
<h3><strong>Hot-swap</strong></h3>
<p>Mạch hot-swap tr&ecirc;n Q0 Plus hỗ trợ hầu hết c&aacute;c switch 3 pin v&agrave; 5 pin tr&ecirc;n thị trường, n&ecirc;n bạn c&oacute; thể dễ d&agrave;ng thay nhanh mọi switch m&agrave; bạn mong muốn chỉ trong v&agrave;i gi&acirc;y m&agrave; kh&ocirc;ng cần thao t&aacute;c r&atilde; h&agrave;n phức tạp.</p>
<p><img src="https://siliconz.vn/storage/images/mach-hot-swap-ban-phim-so-q0-plus.jpg" alt="Mạch Hot-Swap hỗ trợ cả switch 3 pin v&agrave; 5 pin" /></p>
<h3><strong>Đ&egrave;n LED RGB South-facing mạch xu&ocirc;i</strong></h3>
<p>Đ&egrave;n LED tr&ecirc;n Q0 Plus được bố tr&iacute; ở dạng mạch xu&ocirc;i, mang đến khả năng chiếu s&aacute;ng tốt hơn từ g&oacute;c của người đ&aacute;nh m&aacute;y. Thiết kế mạch xu&ocirc;i cũng gi&uacute;p cho &aacute;nh s&aacute;ng tỏa ra kh&ocirc;ng bị nhiễu v&agrave; đều hơn với bất k&igrave; profile keycap n&agrave;o.</p>
<h3><strong>Switch Gateron G Pro lubed sẵn</strong></h3>
<p>Bằng c&aacute;ch tối ưu h&oacute;a c&aacute;c bộ phận cấu tạo n&ecirc;n một chiếc switch, Gateron Pro mang đến sự ổn định v&agrave; mượt m&agrave; hơn so với c&aacute;c switch cơ học phổ th&ocirc;ng tr&ecirc;n thị trường.</p>
<p><img src="https://siliconz.vn/storage/images/switch-gateron-g-pro-ban-phim-so-q0-plus.png" alt="Switch Gateron G-Pro lube sẵn tr&ecirc;n Keychron Q0 Plus" /></p>
<p>Ngo&agrave;i ra, tất cả c&aacute;c switch Gateron G Pro đều đ&atilde; được lube sẵn, mang đến cảm gi&aacute;c mượt m&agrave; tr&ecirc;n mỗi lần g&otilde; ph&iacute;m.</p>
</body>
</html>', NULL, 1, CAST(N'2023-11-11 00:00:00.000' AS DateTime), 1, N'admin')
INSERT [dbo].[Product] ([ProductID], [Avatar], [Thumb], [Title], [Description], [Price], [Quantity], [Content], [Position], [Status], [CreateTime], [ProductCategoryID], [CreateBy]) VALUES (2, N'/FileUploads/Product/2.jpg', N'/FileUploads/Product/2.jpg', N'Keychron Q1 Pro - Bàn phím cơ custom không dây QMK/VIA', N'
                        Wireless | Nhôm nguyên khối CNC | Hot-Swap | Kết nối đến 3 thiết bị | Tương thích Mac, Windows, Linux | QMK/VIA
                    ', 1000000, 12, N'
	  <p>Dự kiến trả h&agrave;ng (Kh&ocirc;ng cam kết chắc chắn) v&agrave;o ng&agrave;y&nbsp;15/05/2023</p>
<hr />
<h3><strong>Keychron Q1 Pro - B&agrave;n ph&iacute;m cơ custom kh&ocirc;ng d&acirc;y QMK/VIA</strong></h3>
<p><img src="https://lh4.googleusercontent.com/htkYr45vl9fOf5zuRsN_nwtUnJrr7NbptWNgs3H-DBxqkbOF392lpfGov3qdxG35psoGXje8Zr7SaY9uY0CyfoPIO65ay5u3dHhmxUxyMMCuqGuSQGh4oh7C4sDEaYhmqOwSAML550m9lfmk5P3udViIzRNrANQRLetEndWprqhTmu9jXProXVPq2wzY9g" /></p>
<p>Keychron Q1 Pro l&agrave; b&agrave;n ph&iacute;m cơ custom nh&ocirc;m nguy&ecirc;n khối CNC kh&ocirc;ng d&acirc;y. Bạn ho&agrave;n to&agrave;n c&oacute; thể t&ugrave;y chỉnh bất kỳ ph&iacute;m n&agrave;o hoặc tạo c&aacute;c lệnh macro th&ocirc;ng qua phần mềm VIA v&agrave; kết nối Q1 Pro với tối đa 3 thiết bị th&ocirc;ng qua Bluetooth, gi&uacute;p cho trải nghiệm&nbsp;l&agrave;m việc đa nhiệm được&nbsp;liền mạch tr&ecirc;n c&aacute;c thiết bị kh&aacute;c nhau như Mac, Windows v&agrave; Linux.</p>
<p><img src="https://lh5.googleusercontent.com/sPP9C5jmXTPyow8N4ZEGDmXQWQVFY8r3ZRlfmGqdxs_PDfQCnROmjuIdC9tJFBTOweXOH84nIfsv8-FxICoidVnZL5so9vAWLhDR06mtI7fHitN8ia4-yJ-pe6vR_ikp9uPahYGKDViNafBZm4o5dHPKE3cqhcqUNrCojLycz4nspeX-cTYgGE_yx8ej3Q" /></p>
<p><a href="https://siliconz.vn/storage/images/q1pp1w-1681267872233.jpg"><img alt="" src="https://siliconz.vn/storage/images/q1pp1w-1681267872233.jpg" /></a></p>
<p><img alt="" src="https://siliconz.vn/storage/images/q1pp1b1-1681207929090.jpg" /></p>
<h3><strong>Kết nối kh&ocirc;ng d&acirc;y với thiết kế full kim loại</strong></h3>
<p><strong>L&agrave;m việc đa nhiệm tối đa 3 thiết bị</strong></p>
<hr />
<p><img src="https://lh3.googleusercontent.com/2ButSVGh0uBEBTe-NgEo425Rr79ZCgbQ1EW-8RDvwIkBJ3biIgB6sSaF6_dJ9kW7-HduYHSGa2HzK3ncdnDSBoqR2CCPLLeJrRx0_uhMx_BkRTpHlErIdCs5-tD9dz3tdwjQLssNVM1HRweJ0Iil58QKtCnVvnc4F4c34JCjxctS444Oj83GY_JvNsMZ1A" /></p>
<p>Keychron Q1 Pro c&oacute; kết nối Bluetooth v&ocirc; c&ugrave;ng ổn định. Sự ổn định của kết nối Bluetooth vốn l&agrave; trở ngại từ l&acirc;u tr&ecirc;n những chiếc ph&iacute;m cơ kim loại nguy&ecirc;n khối.Tuy nhi&ecirc;n với sự s&aacute;ng tạo&nbsp; trong thiết kế, Q1 Pro ho&agrave;n to&agrave;n c&oacute; thể đảm bảo hiệu suất của kết nối Bluetooth được ổn định với phần case nh&ocirc;m được ho&agrave;n thiện tỉ mĩ.</p>
<p><img src="https://lh3.googleusercontent.com/f02AzGkBIxokkJaBZpfZhiX_WTA3gIo9QfueZbwKRztZOKk138xx2AMHLY7h0h1COOGx8hE9P3ZST3XMORUKBjiJz4psAbKSTO0YuAtTs8KaUpmjxG4yF0-ohCQZ98ftHwlDhnw6Q9S1r0y77IP54iP8tgfbovI-o4-bTVmWAuNnQGJsLy5j3TiLjgatcw" /></p>
<p>Q1 Pro l&agrave; bản n&acirc;ng cấp ho&agrave;n hảo, kế thừa tất cả c&aacute;c t&iacute;nh năng tuyệt vời nhất tr&ecirc;n Keychron&nbsp; Q1. Giờ đ&acirc;y, được bổ sung th&ecirc;m khả năng kết nối kh&ocirc;ng d&acirc;y tiện lợi với tối đa 3 thiết bị th&ocirc;ng qua c&ocirc;ng nghệ Bluetooth 5.1 của Broadcom, Q1 Pro ho&agrave;n to&agrave;n c&oacute; thể khiến cho trải nghiệm l&agrave;m việc đa nhiệm của bạn được mượt m&agrave; hơn với những n&acirc;ng cấp đ&aacute;ng ch&uacute; &yacute; sau:</p>
<p><img src="https://lh6.googleusercontent.com/Er6EzQBQwhSmM2UEsR0YtTIF8soKRNjS1-QXNMCy3r03YgaFK8FaqzLNqXqBH0Nawdcb7QT9nOvsZgKTqrUqD5lFOMrhB3eY0oQGOS-q5YUR-BQdNjaDGXAYBSQyZNG_YbLUVVkuD061KHjHUJdXOIRw7ymbv_fEJ68iBFeIAJp846cFRbCWE9Jgx54TmA" /></p>
<h3><strong>QMK/VIA</strong></h3>
<p><strong>Tinh chỉnh mọi ph&iacute;m v&agrave; macro</strong></p>
<hr />
<p>QMK/VIA mang đến khả năng tối ưu v&ocirc; tận để tối ưu những chiếc b&agrave;n ph&iacute;m cơ, gi&uacute;p cho luồng c&ocirc;ng việc của bạn được giải quyết một c&aacute;ch tr&ocirc;i chảy thuận lợi.&nbsp;Chỉ cần kết nối Q1 Pro với thiết bị của bạn bằng c&aacute;p, k&eacute;o v&agrave; thả c&aacute;c ph&iacute;m hoặc lệnh macro y&ecirc;u th&iacute;ch của bạn v&agrave; tận hưởng sự thuận tiện trong c&ocirc;ng việc tr&ecirc;n bất kỳ hệ điều h&agrave;nh n&agrave;o&nbsp;(macOS, Windows hoặc Linux).</p>
<p><img src="https://lh5.googleusercontent.com/TUU7QLiK66Qv2N6ZgTMkSPNJjetZpYcUr0qVOxMahz-Magtroq2O2nWSClPQPjen_m5j8Pj4dXp4Bof50hahtdiYSDWa_99ScNSaGkWc1fId-O-ZaveANcg8ZqBEnBT1_UCjPxlvB2b3JHDz_FWN0h5iFmRfysaqwHYm1UsiJYLdkuP-AZsMQ5lHUnbnJQ" /></p>
<p>Việc tối ưu h&oacute;a trải nghiệm sử dụng b&agrave;n ph&iacute;m của ri&ecirc;ng bạn chưa bao giờ trực quan v&agrave; linh hoạt đến thế. V&iacute; dụ thao t&aacute;c keymap lại ph&iacute;m Home th&agrave;nh ph&iacute;m Eject bằng phần mềm VIA, từ đ&oacute; gi&uacute;p bạn c&oacute; thể c&oacute; một ph&iacute;m tắt để sleep m&aacute;y Mac nhanh ch&oacute;ng.</p>
<h3><strong>Knob tuỳ chỉnh đa năng</strong></h3>
<p><img src="https://lh3.googleusercontent.com/L3q1lVSTix1wPqTvga8e-qmYfBKINV6pFwhpRyeE30qZWh5q8WwNKyhOvv0vD4R89KNXbqcAm0sPbIxbxERgPtaHJTp1H43vq45IdsquxyFjemBoKM_7Z38H3ClmjMrI44MUfv0LcUHJ5HUsYGpPsIc4INkaEpevs2LEU-cHlWKooHeZoFhARY5VYWQtDA" /></p>
<p>Được thiết kế để tối ưu cho luồng c&ocirc;ng việc của bạn, Q1 Pro đ&atilde; trang bị n&uacute;m điều khiển đa&nbsp; bằng nh&ocirc;m cho ph&eacute;p bạn dễ d&agrave;ng t&ugrave;y chỉnh t&iacute;nh năng ri&ecirc;ng biệt hoặc tạo c&aacute;c tổ hợp macro mong muốn như ph&oacute;ng to/thu nhỏ, điều chỉnh độ s&aacute;ng m&agrave;n h&igrave;nh, k&iacute;ch thước b&uacute;t vẽ, &acirc;m lượng, chọn video clip hoặc ảnh hoặc m&agrave;u sắc của đ&egrave;n nền.</p>
<h3><strong>Tương thich với mọi thiết bị</strong></h3>
<p><strong>Mac, Windows, Linux</strong></p>
<hr />
<p><img src="https://lh4.googleusercontent.com/DQeNP9GbpZPUtxBx2XwvNx2tTIqreDd3fKd1qOJUvU_NLbxDFmAxRfdHLAeBnoGPch-pkgvJtfxX5aZsqtibycvgXsv1rbo83n1fUUKECA7gjoNJVE5T0KwRr18aQwBFtGaWDbHOW8YyuMisdhzVj_OOxUVzNWB1Elo-XDtjAGooeK6seREEFynHD0aB0g" /></p>
<p>Q1 Pro c&oacute; layout d&agrave;nh cho c&aacute;c thiết bị Mac trong khi vẫn tương th&iacute;ch với Windows, đ&acirc;y l&agrave; một trong số &iacute;t tr&ecirc;n thị trường c&oacute; h&agrave;ng ph&iacute;m chức năng v&agrave; đa phương tiện giống như b&agrave;n ph&iacute;m Apple d&agrave;nh cho người d&ugrave;ng Mac, nhưng mang đến trải nghiệm g&otilde; xuất sắc hơn.</p>
<p><img src="https://lh5.googleusercontent.com/AHQmgn3X9jj_P4tNBMugvOSzHGtnZ0o4Kp3orCXnfvKrInAEgZ3MQXLYhhpJr35iqBg7ekVqcDDoGvINHODdjyfbTOQ6cYkLQr0zynCz8IqK7Mlrd3mufLxkAHCi4ycvsRWtPlCQTgJXjW8m7QPfG089yjjwHvHF_J8xxo6HIUJPCLNmoxl6CLlJ9bNy3g" /></p>
<p>Với phần mềm VIA linh hoạt, bạn thậm ch&iacute; c&oacute; thể định cấu h&igrave;nh c&aacute;c sơ đồ b&agrave;n ph&iacute;m kh&aacute;c nhau cho c&aacute;c c&agrave;i đặt t&ugrave;y chỉnh kh&aacute;c nhau tr&ecirc;n hệ thống Mac v&agrave; Windows.<img src="https://lh3.googleusercontent.com/ewwoY2bTuAldGcAmrYxWhpEbsfjonS3d1LK3yEf1qlEtobGaEN8UOA-6tNGypdQEHetaIjjY7rf6pzolqdYWGmTfiD_lh-_QdCIUosYDNL4mGx7Y2i-74k8BzK_RbRjCcOEsNfo9TFtviTmBexh1yYRCADFUVZWKe227NRnK5fA2A2ZI30QfvMmF3_Ih5Q" /></p>
<p>Q1 Pro c&ograve;n c&oacute; sẵn bộ keycaps cho cả macOS v&agrave; Windows (v&agrave; c&aacute;c ph&iacute;m Esc v&agrave; Enter bổ sung) để cho ph&eacute;p bạn chuyển đổi giữa c&aacute;c hệ điều h&agrave;nh một c&aacute;ch dễ d&agrave;ng.</p>
 ', NULL, 1, CAST(N'2023-11-11 00:00:00.000' AS DateTime), 1, N'admin')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductCategory] ON 

INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Avatar], [Thumb], [Title], [Description], [Position], [Status], [CreateTime], [CreateBy]) VALUES (1, NULL, NULL, N'Bàn phím', NULL, 1, 1, CAST(N'2023-10-08 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Avatar], [Thumb], [Title], [Description], [Position], [Status], [CreateTime], [CreateBy]) VALUES (2, NULL, NULL, N'Bàn nâng hạ', NULL, 2, 1, CAST(N'2023-10-08 00:00:00.000' AS DateTime), N'admin')
INSERT [dbo].[ProductCategory] ([ProductCategoryID], [Avatar], [Thumb], [Title], [Description], [Position], [Status], [CreateTime], [CreateBy]) VALUES (3, NULL, NULL, N'Ghế Công thái học', NULL, 3, 1, CAST(N'2023-10-08 00:00:00.000' AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[ProductCategory] OFF
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_Account] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_Account]
GO
ALTER TABLE [dbo].[Article]  WITH CHECK ADD  CONSTRAINT [FK_Article_ArticleCategory] FOREIGN KEY([ArticleCategoryID])
REFERENCES [dbo].[ArticleCategory] ([ArticleCategoryID])
GO
ALTER TABLE [dbo].[Article] CHECK CONSTRAINT [FK_Article_ArticleCategory]
GO
ALTER TABLE [dbo].[ArticleCategory]  WITH CHECK ADD  CONSTRAINT [FK_ArticleCategory_Account] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[ArticleCategory] CHECK CONSTRAINT [FK_ArticleCategory_Account]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Account] FOREIGN KEY([ApproveBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_Account]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_ContactCategory] FOREIGN KEY([ContactCategoryID])
REFERENCES [dbo].[ContactCategory] ([ContactCategoryID])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_ContactCategory]
GO
ALTER TABLE [dbo].[ContactCategory]  WITH CHECK ADD  CONSTRAINT [FK_ContactCategory_Account] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[ContactCategory] CHECK CONSTRAINT [FK_ContactCategory_Account]
GO
ALTER TABLE [dbo].[Gallery]  WITH CHECK ADD  CONSTRAINT [FK_Gallery_Account] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Gallery] CHECK CONSTRAINT [FK_Gallery_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Account] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Account]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([ProductCategoryID])
REFERENCES [dbo].[ProductCategory] ([ProductCategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
ALTER TABLE [dbo].[ProductCategory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCategory_Account] FOREIGN KEY([CreateBy])
REFERENCES [dbo].[Account] ([Username])
GO
ALTER TABLE [dbo].[ProductCategory] CHECK CONSTRAINT [FK_ProductCategory_Account]
GO
