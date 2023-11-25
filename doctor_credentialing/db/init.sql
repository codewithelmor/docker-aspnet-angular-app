CREATE DATABASE [DoctorCredentialingApp]
GO
USE [DoctorCredentialingApp]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/5/2023 10:52:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 11/5/2023 10:52:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/5/2023 10:52:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/5/2023 10:52:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/5/2023 10:52:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/5/2023 10:52:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/5/2023 10:52:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 11/5/2023 10:52:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceCodes]    Script Date: 11/5/2023 10:52:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceCodes](
	[UserCode] [nvarchar](200) NOT NULL,
	[DeviceCode] [nvarchar](200) NOT NULL,
	[SubjectId] [nvarchar](200) NULL,
	[SessionId] [nvarchar](100) NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[Expiration] [datetime2](7) NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_DeviceCodes] PRIMARY KEY CLUSTERED 
(
	[UserCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Keys]    Script Date: 11/5/2023 10:52:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Keys](
	[Id] [nvarchar](450) NOT NULL,
	[Version] [int] NOT NULL,
	[Created] [datetime2](7) NOT NULL,
	[Use] [nvarchar](450) NULL,
	[Algorithm] [nvarchar](100) NOT NULL,
	[IsX509Certificate] [bit] NOT NULL,
	[DataProtected] [bit] NOT NULL,
	[Data] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Keys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PersistedGrants]    Script Date: 11/5/2023 10:52:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersistedGrants](
	[Key] [nvarchar](200) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[SubjectId] [nvarchar](200) NULL,
	[SessionId] [nvarchar](100) NULL,
	[ClientId] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](200) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[Expiration] [datetime2](7) NULL,
	[ConsumedTime] [datetime2](7) NULL,
	[Data] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_PersistedGrants] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preference]    Script Date: 11/5/2023 10:52:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preference](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Locale] [nvarchar](5) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedByUserId] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetimeoffset](7) NOT NULL,
	[UpdatedByUserId] [nvarchar](450) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
	[DeletedByUserId] [nvarchar](450) NULL,
	[DeletedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Preference] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Relationship]    Script Date: 11/5/2023 10:52:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relationship](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedByUserId] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetimeoffset](7) NOT NULL,
	[UpdatedByUserId] [nvarchar](450) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
	[DeletedByUserId] [nvarchar](450) NULL,
	[DeletedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Relationship] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salutation]    Script Date: 11/5/2023 10:52:48 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salutation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](5) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedByUserId] [nvarchar](450) NOT NULL,
	[CreatedDate] [datetimeoffset](7) NOT NULL,
	[UpdatedByUserId] [nvarchar](450) NULL,
	[UpdatedDate] [datetimeoffset](7) NULL,
	[DeletedByUserId] [nvarchar](450) NULL,
	[DeletedDate] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Salutation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'6.0.23')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231102073435_CreatePreferenceTable', N'6.0.23')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231103084806_CreateSalutationTable', N'6.0.23')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231103092020_CreateRelationshipTable', N'6.0.23')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'0A4B3986-23EB-4B44-8265-D3F4B0DD7ECE', N'User', N'USER', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'10AE9BD9-07F0-4F8A-8546-7239C7E808CB', N'Applicant', N'APPLICANT', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'11CEF0C2-84B4-4B9B-A647-0D2B6615D1D5', N'Approver', N'APPROVER', NULL)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'ECA6167C-F837-44D3-A672-DDF4862439F0', N'Admin', N'ADMIN', NULL)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'114b59d3-4f58-46a3-9db0-fa7c2dbaeebe', N'0A4B3986-23EB-4B44-8265-D3F4B0DD7ECE')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9dc02186-3c26-43d7-a37c-36d4f3f0d3d7', N'0A4B3986-23EB-4B44-8265-D3F4B0DD7ECE')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'114b59d3-4f58-46a3-9db0-fa7c2dbaeebe', N'11CEF0C2-84B4-4B9B-A647-0D2B6615D1D5')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9dc02186-3c26-43d7-a37c-36d4f3f0d3d7', N'ECA6167C-F837-44D3-A672-DDF4862439F0')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'114b59d3-4f58-46a3-9db0-fa7c2dbaeebe', N'approver@email.com', N'APPROVER@EMAIL.COM', N'approver@email.com', N'APPROVER@EMAIL.COM', 1, N'AQAAAAEAACcQAAAAEOPq51GvszSbH7MwioBK2vSrOTDRITXDXZSxZD09eqNGOc/7k4sAU4rxowLM8Xz0Yg==', N'HDQ6WCBN3GZVGG6G2FUV4Z74G7UYSDZT', N'37ca8a65-901e-4ff9-b9b4-0ca7f4049f33', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9dc02186-3c26-43d7-a37c-36d4f3f0d3d7', N'admin@email.com', N'ADMIN@EMAIL.COM', N'admin@email.com', N'ADMIN@EMAIL.COM', 1, N'AQAAAAEAACcQAAAAEG4DBnHEsViDETgFeC6J0TEf8Ihk1wKqPf5zsISF8gunSw3+uRe/7Z2hdENlLiXSTQ==', N'CZZGTWJ7IVAAAGWGQ6GVHMCQJ3EBT3FA', N'c7d8208e-dd21-4222-87d3-4eb0f5d1a08b', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[Keys] ([Id], [Version], [Created], [Use], [Algorithm], [IsX509Certificate], [DataProtected], [Data]) VALUES (N'32C4570A793E77FE16B58F6B5059089C', 1, CAST(N'2023-11-02T05:50:33.5299419' AS DateTime2), N'signing', N'RS256', 0, 1, N'CfDJ8FAlJzRb60tHjaIWqnosXcMuJ6jT18etpVwTd9cXEhWHjvLWJv_Ie1GL9cAkpWFCC-CS050mnwq21_ZNb4s3CZvLMMqKA92oMUTIug0mphR-YrSuBFoELIXnp571HHjISDPOvFfbk7_bCr0Net28xSCFlI3kjDVEmprvtp_Dz-mjOMTdsumoN-foy8chegp03Iia72J2qPI_XqKLrkqAr3nOycr8I9_Ky6ULBrOfprdVc_SXWXzChh5agKbam_krpM980HiRBogLfRLQrnkbwg6KrufEHdZpy8fubWi5dQoktiNTYCPFIcn-tcI9cu3_OUyW54xePUPn0LdSFPW7edQisGE28__AHRd0zWBibdifyep0ZgfNPjVTdAq_fPfo8Dl6se1pznz3CnJdfU32fCt5rInLiY_vlM3n8L1CuOVjpxfbuLFK6DYJO94ffQCp8_xP7VLyYq43-DA_F0b3W8GKhvXHVtKAuXaHV4ksD_koe8tmS2O6V7ko5B5dAO07F7q6zgwmkZB0pZC3j5VuxbZkXnNpqUTcZ3qnRalvNp1W1VpRUBSmtZJooxKZdfhAlAbFI-etPeffJJG4KE0eXo76zlAo4fBGJadvBaT0vKYg0_pnATIB1skA1Sc7UV37LdPOF6BEElaWol-xT-PY6CY7iTWkt898AeR-uwYJgIFsEoaIIfyd593g3yEFdJWUcusVgTqV_17Rwj6b4J_Qc5pLUoBjv4zqSAZpgswJNqbHnnA3LpC6YJ_fEpKDx7qh1JYtRU7Lvn8inrTHMdp7ox-7jCuV6OsheDHHlb_v1-YglygBLJL2LiWpthDB2A-dn7G5pItVD-hsiJg5OeWTZP3pxmqvqTSJvZPfXProfyqEZ47WLA8JUI8JeTSxObgYwG6M2z9MeWXinCh8EeDjvzSxNy2g0rVgz86MkZ2TVBEPUmEBFJNw3mmh-ScOZGUmOtQ8Au7_zpMMvkSHth63A39c1m4oX_3URolZ5T2B3WTZWSdduKHo5s6dMW6VeDF3Q44_08O4pySy0Ru9NpoUyS6waLepi1UuobZu0Iip3M6tiAjfxzpq69R1Pn1RsyfRzHgiLDA3DNfZWr1vGYN14Qg2lusp1Wq_vxjLuSU1_Hvcc_7RVOjsGEXD_0TgyCZtP-g8mskAsK-vZmzmi0lO3lgagalrdfvJ7OE2mcIWZDKjr7hNdb3UHmxSnR-7VhjnqNfpaDUTnmvn8frEh_aLzJ6QqHv5wg6dCzkVTWRQ2Q2DknMU37BmDPm9Sl6vuvypTvaUnHQuZaLLDX5fXg9KiQ9I3Y5IBq-V8sobVbFAzqBCslkUyETYOvcoJmNQOjH9yChwJ3gS5H9g6tEeZYo4GmHuHQei5-J9fPHS0kRGXtreZ2Xp8D-yyulW4yVryMCxdtMhEV9DUtHUJddBEabHgXWBaenk6gj9aZv5CobJ5zCZc66NM6Afqyh11au2V6WZ0Hx9DLUZnlbr5tOM0bdIuAzHoOuBLj-X8cJc8cpjbiARu13kgx7did8nO9FW7F2UBJOVbbhxH0OiNFbt2wVSnBDEnNwZ6n5Fr59B7bIQWf4ccSURb2HmTyftlEmqVFD0hjOyCpRTg2lkshhv6fWAGMHvmqQivihbo0_4u2OjIpj5tFCtq-f94dy1kzHmDX9GCVQnzDgS0udUr9fRfNX56fiL1eHeaiK5DT87qcRG_8p8vvHYvqXqat9fBA89V_Dr3tFyZzZwNFC1jO2K2ynayclKo96se4BwWKgRx86XLWhxWEKM9bW8GpBZJ5k96KaJJrRNi_gaqO9OQ_HvPFWCZLYN2e6zcrnu8jYJuT6348soi0_7nCqhxAVGpVowQVUNh6d4VMcNJHUwPxW3J2K91o0Sllk-Q7NtOWLvBMImmhkAkFD1kOUw3jxH4kTU7rZYlF7pv91ymKzVT-Q1-_7g9svaZUSnCiPmEl4nP54Q6UGTXOypTNWkGWkkvlXn8xhK3W32jyoSGoxtPya0aKVeiQtqYcptWkjW3gn8KryIySUu4ZHsFv6FheRHcHQuexk4o80j_-MqW4ZCYMxkmbYyEJ1h46JKWPxTNL7bSWRJPE_1P6NWu9U3kw_etL9QpNkzXyc48qZB8Oy6xhlVa2z52QvSCgexKDImgTEkYnd76oPpFRmyzPUoYT24bi5oi9j6i9rLpB8NA9YCE4dke1-kiu6Z4hwjWomdw-GomRr6PsKMLCZlgeHebhuOB6q31Ts-b6nftoyyaRJj5Yp_OkZZEETsXarGcdBiKenPVYnIEXn-T2AQ14AvUGTAzLecLygDRH8bFVbDrBpa-klAFV9URNMIjMomWzLDZ5OuPI0MCviKK1IQE2emHxFB2ivP4VAO_AJHqoLigH0FkNABJu9vntR9aaabTkdQjAYXo5mirXeiX00BLrO1A0WtsNAsCbbI4p4xAsFL-R3mLRw0Tt1UagLVo2xciNjRD3CdEU5FQ5LR')
GO
SET IDENTITY_INSERT [dbo].[Relationship] ON 
GO
INSERT [dbo].[Relationship] ([Id], [Name], [IsActive], [IsDeleted], [CreatedByUserId], [CreatedDate], [UpdatedByUserId], [UpdatedDate], [DeletedByUserId], [DeletedDate]) VALUES (1, N'Spouse', 1, 0, N'9dc02186-3c26-43d7-a37c-36d4f3f0d3d7', CAST(N'2023-11-03T09:21:38.8300000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Relationship] ([Id], [Name], [IsActive], [IsDeleted], [CreatedByUserId], [CreatedDate], [UpdatedByUserId], [UpdatedDate], [DeletedByUserId], [DeletedDate]) VALUES (2, N'Partner', 1, 0, N'9dc02186-3c26-43d7-a37c-36d4f3f0d3d7', CAST(N'2023-11-03T09:21:44.4166667+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Relationship] ([Id], [Name], [IsActive], [IsDeleted], [CreatedByUserId], [CreatedDate], [UpdatedByUserId], [UpdatedDate], [DeletedByUserId], [DeletedDate]) VALUES (3, N'Husband', 1, 0, N'9dc02186-3c26-43d7-a37c-36d4f3f0d3d7', CAST(N'2023-11-03T09:21:51.0700000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Relationship] ([Id], [Name], [IsActive], [IsDeleted], [CreatedByUserId], [CreatedDate], [UpdatedByUserId], [UpdatedDate], [DeletedByUserId], [DeletedDate]) VALUES (4, N'Wife', 1, 0, N'9dc02186-3c26-43d7-a37c-36d4f3f0d3d7', CAST(N'2023-11-03T09:21:54.0066667+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Relationship] ([Id], [Name], [IsActive], [IsDeleted], [CreatedByUserId], [CreatedDate], [UpdatedByUserId], [UpdatedDate], [DeletedByUserId], [DeletedDate]) VALUES (5, N'Son', 1, 0, N'9dc02186-3c26-43d7-a37c-36d4f3f0d3d7', CAST(N'2023-11-03T09:21:59.2000000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Relationship] ([Id], [Name], [IsActive], [IsDeleted], [CreatedByUserId], [CreatedDate], [UpdatedByUserId], [UpdatedDate], [DeletedByUserId], [DeletedDate]) VALUES (6, N'Daughter', 1, 0, N'9dc02186-3c26-43d7-a37c-36d4f3f0d3d7', CAST(N'2023-11-03T09:22:03.0566667+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Relationship] ([Id], [Name], [IsActive], [IsDeleted], [CreatedByUserId], [CreatedDate], [UpdatedByUserId], [UpdatedDate], [DeletedByUserId], [DeletedDate]) VALUES (7, N'Father', 1, 0, N'9dc02186-3c26-43d7-a37c-36d4f3f0d3d7', CAST(N'2023-11-03T09:22:06.1566667+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Relationship] ([Id], [Name], [IsActive], [IsDeleted], [CreatedByUserId], [CreatedDate], [UpdatedByUserId], [UpdatedDate], [DeletedByUserId], [DeletedDate]) VALUES (8, N'Mother', 1, 0, N'9dc02186-3c26-43d7-a37c-36d4f3f0d3d7', CAST(N'2023-11-03T09:22:09.7200000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Relationship] ([Id], [Name], [IsActive], [IsDeleted], [CreatedByUserId], [CreatedDate], [UpdatedByUserId], [UpdatedDate], [DeletedByUserId], [DeletedDate]) VALUES (9, N'Brother', 1, 0, N'9dc02186-3c26-43d7-a37c-36d4f3f0d3d7', CAST(N'2023-11-03T09:22:13.1066667+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Relationship] ([Id], [Name], [IsActive], [IsDeleted], [CreatedByUserId], [CreatedDate], [UpdatedByUserId], [UpdatedDate], [DeletedByUserId], [DeletedDate]) VALUES (10, N'Sister', 1, 0, N'9dc02186-3c26-43d7-a37c-36d4f3f0d3d7', CAST(N'2023-11-03T09:22:16.4033333+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Relationship] OFF
GO
SET IDENTITY_INSERT [dbo].[Salutation] ON 
GO
INSERT [dbo].[Salutation] ([Id], [Title], [IsActive], [IsDeleted], [CreatedByUserId], [CreatedDate], [UpdatedByUserId], [UpdatedDate], [DeletedByUserId], [DeletedDate]) VALUES (1, N'Mr', 1, 0, N'9dc02186-3c26-43d7-a37c-36d4f3f0d3d7', CAST(N'2023-11-03T08:50:31.4600000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Salutation] ([Id], [Title], [IsActive], [IsDeleted], [CreatedByUserId], [CreatedDate], [UpdatedByUserId], [UpdatedDate], [DeletedByUserId], [DeletedDate]) VALUES (2, N'Ms', 1, 0, N'9dc02186-3c26-43d7-a37c-36d4f3f0d3d7', CAST(N'2023-11-03T08:50:37.7100000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Salutation] ([Id], [Title], [IsActive], [IsDeleted], [CreatedByUserId], [CreatedDate], [UpdatedByUserId], [UpdatedDate], [DeletedByUserId], [DeletedDate]) VALUES (3, N'Mrs', 1, 0, N'9dc02186-3c26-43d7-a37c-36d4f3f0d3d7', CAST(N'2023-11-03T08:50:39.7200000+00:00' AS DateTimeOffset), NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Salutation] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_DeviceCodes_DeviceCode]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DeviceCodes_DeviceCode] ON [dbo].[DeviceCodes]
(
	[DeviceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_DeviceCodes_Expiration]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_DeviceCodes_Expiration] ON [dbo].[DeviceCodes]
(
	[Expiration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Keys_Use]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_Keys_Use] ON [dbo].[Keys]
(
	[Use] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PersistedGrants_ConsumedTime]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_PersistedGrants_ConsumedTime] ON [dbo].[PersistedGrants]
(
	[ConsumedTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_PersistedGrants_Expiration]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_PersistedGrants_Expiration] ON [dbo].[PersistedGrants]
(
	[Expiration] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PersistedGrants_SubjectId_ClientId_Type]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_PersistedGrants_SubjectId_ClientId_Type] ON [dbo].[PersistedGrants]
(
	[SubjectId] ASC,
	[ClientId] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_PersistedGrants_SubjectId_SessionId_Type]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_PersistedGrants_SubjectId_SessionId_Type] ON [dbo].[PersistedGrants]
(
	[SubjectId] ASC,
	[SessionId] ASC,
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Preference_CreatedByUserId]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_Preference_CreatedByUserId] ON [dbo].[Preference]
(
	[CreatedByUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Preference_DeletedByUserId]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_Preference_DeletedByUserId] ON [dbo].[Preference]
(
	[DeletedByUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Preference_UpdatedByUserId]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_Preference_UpdatedByUserId] ON [dbo].[Preference]
(
	[UpdatedByUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Relationship_CreatedByUserId]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_Relationship_CreatedByUserId] ON [dbo].[Relationship]
(
	[CreatedByUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Relationship_DeletedByUserId]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_Relationship_DeletedByUserId] ON [dbo].[Relationship]
(
	[DeletedByUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Relationship_UpdatedByUserId]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_Relationship_UpdatedByUserId] ON [dbo].[Relationship]
(
	[UpdatedByUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Salutation_CreatedByUserId]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_Salutation_CreatedByUserId] ON [dbo].[Salutation]
(
	[CreatedByUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Salutation_DeletedByUserId]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_Salutation_DeletedByUserId] ON [dbo].[Salutation]
(
	[DeletedByUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Salutation_UpdatedByUserId]    Script Date: 11/5/2023 10:52:48 AM ******/
CREATE NONCLUSTERED INDEX [IX_Salutation_UpdatedByUserId] ON [dbo].[Salutation]
(
	[UpdatedByUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Preference] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Preference] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Relationship] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Relationship] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Salutation] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Salutation] ADD  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Preference]  WITH CHECK ADD  CONSTRAINT [FK_Preference_CreatedByUser] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Preference] CHECK CONSTRAINT [FK_Preference_CreatedByUser]
GO
ALTER TABLE [dbo].[Preference]  WITH CHECK ADD  CONSTRAINT [FK_Preference_DeletedByUser] FOREIGN KEY([DeletedByUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Preference] CHECK CONSTRAINT [FK_Preference_DeletedByUser]
GO
ALTER TABLE [dbo].[Preference]  WITH CHECK ADD  CONSTRAINT [FK_Preference_UpdatedByUser] FOREIGN KEY([UpdatedByUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Preference] CHECK CONSTRAINT [FK_Preference_UpdatedByUser]
GO
ALTER TABLE [dbo].[Relationship]  WITH CHECK ADD  CONSTRAINT [FK_Relationship_CreatedByUser] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Relationship] CHECK CONSTRAINT [FK_Relationship_CreatedByUser]
GO
ALTER TABLE [dbo].[Relationship]  WITH CHECK ADD  CONSTRAINT [FK_Relationship_DeletedByUser] FOREIGN KEY([DeletedByUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Relationship] CHECK CONSTRAINT [FK_Relationship_DeletedByUser]
GO
ALTER TABLE [dbo].[Relationship]  WITH CHECK ADD  CONSTRAINT [FK_Relationship_UpdatedByUser] FOREIGN KEY([UpdatedByUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Relationship] CHECK CONSTRAINT [FK_Relationship_UpdatedByUser]
GO
ALTER TABLE [dbo].[Salutation]  WITH CHECK ADD  CONSTRAINT [FK_Salutation_CreatedByUser] FOREIGN KEY([CreatedByUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Salutation] CHECK CONSTRAINT [FK_Salutation_CreatedByUser]
GO
ALTER TABLE [dbo].[Salutation]  WITH CHECK ADD  CONSTRAINT [FK_Salutation_DeletedByUser] FOREIGN KEY([DeletedByUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Salutation] CHECK CONSTRAINT [FK_Salutation_DeletedByUser]
GO
ALTER TABLE [dbo].[Salutation]  WITH CHECK ADD  CONSTRAINT [FK_Salutation_UpdatedByUser] FOREIGN KEY([UpdatedByUserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Salutation] CHECK CONSTRAINT [FK_Salutation_UpdatedByUser]
GO
USE [master]
GO
ALTER DATABASE [DoctorCredentialingApp] SET  READ_WRITE 
GO
