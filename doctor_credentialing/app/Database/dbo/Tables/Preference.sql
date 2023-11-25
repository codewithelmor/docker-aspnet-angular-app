CREATE TABLE [dbo].[Preference] (
    [Id]              INT                IDENTITY (1, 1) NOT NULL,
    [Locale]          NVARCHAR (5)       NOT NULL,
    [IsActive]        BIT                DEFAULT ((1)) NOT NULL,
    [IsDeleted]       BIT                NOT NULL,
    [CreatedByUserId] NVARCHAR (450)     NOT NULL,
    [CreatedDate]     DATETIMEOFFSET (7) DEFAULT (getutcdate()) NOT NULL,
    [UpdatedByUserId] NVARCHAR (450)     NULL,
    [UpdatedDate]     DATETIMEOFFSET (7) NULL,
    [DeletedByUserId] NVARCHAR (450)     NULL,
    [DeletedDate]     DATETIMEOFFSET (7) NULL,
    CONSTRAINT [PK_Preference] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Preference_CreatedByUser] FOREIGN KEY ([CreatedByUserId]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_Preference_DeletedByUser] FOREIGN KEY ([DeletedByUserId]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_Preference_UpdatedByUser] FOREIGN KEY ([UpdatedByUserId]) REFERENCES [dbo].[AspNetUsers] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Preference_UpdatedByUserId]
    ON [dbo].[Preference]([UpdatedByUserId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Preference_DeletedByUserId]
    ON [dbo].[Preference]([DeletedByUserId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Preference_CreatedByUserId]
    ON [dbo].[Preference]([CreatedByUserId] ASC);

