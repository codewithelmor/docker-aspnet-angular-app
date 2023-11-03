﻿USE [DoctorCredentialingApp]
GO
IF NOT EXISTS (SELECT 1 FROM [dbo].[__EFMigrationsHistory] WHERE [MigrationId] IN ('00000000000000_CreateIdentitySchema'))
    BEGIN
        INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'6.0.23')
        INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231102073435_CreatePreferenceTable', N'6.0.23')
    END
IF NOT EXISTS (SELECT 1 FROM [dbo].[AspNetRoles] WHERE [Name] IN ('Admin', 'Approver', 'Applicant', 'User'))
    BEGIN
        INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'0A4B3986-23EB-4B44-8265-D3F4B0DD7ECE', N'User', N'USER', NULL)
        INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'10AE9BD9-07F0-4F8A-8546-7239C7E808CB', N'Applicant', N'APPLICANT', NULL)
        INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'11CEF0C2-84B4-4B9B-A647-0D2B6615D1D5', N'Approver', N'APPROVER', NULL)
        INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'ECA6167C-F837-44D3-A672-DDF4862439F0', N'Admin', N'ADMIN', NULL)
    END
IF NOT EXISTS (SELECT 1 FROM [dbo].[AspNetUsers] WHERE [Email] = 'admin@email.com')
    BEGIN
        INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'9dc02186-3c26-43d7-a37c-36d4f3f0d3d7', N'admin@email.com', N'ADMIN@EMAIL.COM', N'admin@email.com', N'ADMIN@EMAIL.COM', 1, N'AQAAAAEAACcQAAAAEG4DBnHEsViDETgFeC6J0TEf8Ihk1wKqPf5zsISF8gunSw3+uRe/7Z2hdENlLiXSTQ==', N'CZZGTWJ7IVAAAGWGQ6GVHMCQJ3EBT3FA', N'c7d8208e-dd21-4222-87d3-4eb0f5d1a08b', NULL, 0, 0, NULL, 1, 0)
        INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9dc02186-3c26-43d7-a37c-36d4f3f0d3d7', N'0A4B3986-23EB-4B44-8265-D3F4B0DD7ECE')
        INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9dc02186-3c26-43d7-a37c-36d4f3f0d3d7', N'ECA6167C-F837-44D3-A672-DDF4862439F0')
    END
IF NOT EXISTS (SELECT 1 FROM [dbo].[AspNetUsers] WHERE [Email] = 'approver@email.com')
    BEGIN
        INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'114b59d3-4f58-46a3-9db0-fa7c2dbaeebe', N'approver@email.com', N'APPROVER@EMAIL.COM', N'approver@email.com', N'APPROVER@EMAIL.COM', 1, N'AQAAAAEAACcQAAAAEOPq51GvszSbH7MwioBK2vSrOTDRITXDXZSxZD09eqNGOc/7k4sAU4rxowLM8Xz0Yg==', N'HDQ6WCBN3GZVGG6G2FUV4Z74G7UYSDZT', N'37ca8a65-901e-4ff9-b9b4-0ca7f4049f33', NULL, 0, 0, NULL, 1, 0)
        INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'114b59d3-4f58-46a3-9db0-fa7c2dbaeebe', N'0A4B3986-23EB-4B44-8265-D3F4B0DD7ECE')
        INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'114b59d3-4f58-46a3-9db0-fa7c2dbaeebe', N'11CEF0C2-84B4-4B9B-A647-0D2B6615D1D5')
    END
IF NOT EXISTS (SELECT 1 FROM [dbo].[Keys] WHERE [Id] = '32C4570A793E77FE16B58F6B5059089C')
    BEGIN
        INSERT [dbo].[Keys] ([Id], [Version], [Created], [Use], [Algorithm], [IsX509Certificate], [DataProtected], [Data]) VALUES (N'32C4570A793E77FE16B58F6B5059089C', 1, CAST(N'2023-11-02T05:50:33.5299419' AS DateTime2), N'signing', N'RS256', 0, 1, N'CfDJ8FAlJzRb60tHjaIWqnosXcMuJ6jT18etpVwTd9cXEhWHjvLWJv_Ie1GL9cAkpWFCC-CS050mnwq21_ZNb4s3CZvLMMqKA92oMUTIug0mphR-YrSuBFoELIXnp571HHjISDPOvFfbk7_bCr0Net28xSCFlI3kjDVEmprvtp_Dz-mjOMTdsumoN-foy8chegp03Iia72J2qPI_XqKLrkqAr3nOycr8I9_Ky6ULBrOfprdVc_SXWXzChh5agKbam_krpM980HiRBogLfRLQrnkbwg6KrufEHdZpy8fubWi5dQoktiNTYCPFIcn-tcI9cu3_OUyW54xePUPn0LdSFPW7edQisGE28__AHRd0zWBibdifyep0ZgfNPjVTdAq_fPfo8Dl6se1pznz3CnJdfU32fCt5rInLiY_vlM3n8L1CuOVjpxfbuLFK6DYJO94ffQCp8_xP7VLyYq43-DA_F0b3W8GKhvXHVtKAuXaHV4ksD_koe8tmS2O6V7ko5B5dAO07F7q6zgwmkZB0pZC3j5VuxbZkXnNpqUTcZ3qnRalvNp1W1VpRUBSmtZJooxKZdfhAlAbFI-etPeffJJG4KE0eXo76zlAo4fBGJadvBaT0vKYg0_pnATIB1skA1Sc7UV37LdPOF6BEElaWol-xT-PY6CY7iTWkt898AeR-uwYJgIFsEoaIIfyd593g3yEFdJWUcusVgTqV_17Rwj6b4J_Qc5pLUoBjv4zqSAZpgswJNqbHnnA3LpC6YJ_fEpKDx7qh1JYtRU7Lvn8inrTHMdp7ox-7jCuV6OsheDHHlb_v1-YglygBLJL2LiWpthDB2A-dn7G5pItVD-hsiJg5OeWTZP3pxmqvqTSJvZPfXProfyqEZ47WLA8JUI8JeTSxObgYwG6M2z9MeWXinCh8EeDjvzSxNy2g0rVgz86MkZ2TVBEPUmEBFJNw3mmh-ScOZGUmOtQ8Au7_zpMMvkSHth63A39c1m4oX_3URolZ5T2B3WTZWSdduKHo5s6dMW6VeDF3Q44_08O4pySy0Ru9NpoUyS6waLepi1UuobZu0Iip3M6tiAjfxzpq69R1Pn1RsyfRzHgiLDA3DNfZWr1vGYN14Qg2lusp1Wq_vxjLuSU1_Hvcc_7RVOjsGEXD_0TgyCZtP-g8mskAsK-vZmzmi0lO3lgagalrdfvJ7OE2mcIWZDKjr7hNdb3UHmxSnR-7VhjnqNfpaDUTnmvn8frEh_aLzJ6QqHv5wg6dCzkVTWRQ2Q2DknMU37BmDPm9Sl6vuvypTvaUnHQuZaLLDX5fXg9KiQ9I3Y5IBq-V8sobVbFAzqBCslkUyETYOvcoJmNQOjH9yChwJ3gS5H9g6tEeZYo4GmHuHQei5-J9fPHS0kRGXtreZ2Xp8D-yyulW4yVryMCxdtMhEV9DUtHUJddBEabHgXWBaenk6gj9aZv5CobJ5zCZc66NM6Afqyh11au2V6WZ0Hx9DLUZnlbr5tOM0bdIuAzHoOuBLj-X8cJc8cpjbiARu13kgx7did8nO9FW7F2UBJOVbbhxH0OiNFbt2wVSnBDEnNwZ6n5Fr59B7bIQWf4ccSURb2HmTyftlEmqVFD0hjOyCpRTg2lkshhv6fWAGMHvmqQivihbo0_4u2OjIpj5tFCtq-f94dy1kzHmDX9GCVQnzDgS0udUr9fRfNX56fiL1eHeaiK5DT87qcRG_8p8vvHYvqXqat9fBA89V_Dr3tFyZzZwNFC1jO2K2ynayclKo96se4BwWKgRx86XLWhxWEKM9bW8GpBZJ5k96KaJJrRNi_gaqO9OQ_HvPFWCZLYN2e6zcrnu8jYJuT6348soi0_7nCqhxAVGpVowQVUNh6d4VMcNJHUwPxW3J2K91o0Sllk-Q7NtOWLvBMImmhkAkFD1kOUw3jxH4kTU7rZYlF7pv91ymKzVT-Q1-_7g9svaZUSnCiPmEl4nP54Q6UGTXOypTNWkGWkkvlXn8xhK3W32jyoSGoxtPya0aKVeiQtqYcptWkjW3gn8KryIySUu4ZHsFv6FheRHcHQuexk4o80j_-MqW4ZCYMxkmbYyEJ1h46JKWPxTNL7bSWRJPE_1P6NWu9U3kw_etL9QpNkzXyc48qZB8Oy6xhlVa2z52QvSCgexKDImgTEkYnd76oPpFRmyzPUoYT24bi5oi9j6i9rLpB8NA9YCE4dke1-kiu6Z4hwjWomdw-GomRr6PsKMLCZlgeHebhuOB6q31Ts-b6nftoyyaRJj5Yp_OkZZEETsXarGcdBiKenPVYnIEXn-T2AQ14AvUGTAzLecLygDRH8bFVbDrBpa-klAFV9URNMIjMomWzLDZ5OuPI0MCviKK1IQE2emHxFB2ivP4VAO_AJHqoLigH0FkNABJu9vntR9aaabTkdQjAYXo5mirXeiX00BLrO1A0WtsNAsCbbI4p4xAsFL-R3mLRw0Tt1UagLVo2xciNjRD3CdEU5FQ5LR')
    END