CREATE TABLE [dbo].[Salutation] (
    [Id]              INT                IDENTITY (1, 1) NOT NULL,
    [Title]           NVARCHAR (5)       NOT NULL,
    [IsActive]        BIT                DEFAULT ((1)) NOT NULL,
    [IsDeleted]       BIT                NOT NULL,
    [CreatedByUserId] NVARCHAR (450)     NOT NULL,
    [CreatedDate]     DATETIMEOFFSET (7) DEFAULT (getutcdate()) NOT NULL,
    [UpdatedByUserId] NVARCHAR (450)     NULL,
    [UpdatedDate]     DATETIMEOFFSET (7) NULL,
    [DeletedByUserId] NVARCHAR (450)     NULL,
    [DeletedDate]     DATETIMEOFFSET (7) NULL,
    CONSTRAINT [PK_Salutation] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Salutation_CreatedByUser] FOREIGN KEY ([CreatedByUserId]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_Salutation_DeletedByUser] FOREIGN KEY ([DeletedByUserId]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_Salutation_UpdatedByUser] FOREIGN KEY ([UpdatedByUserId]) REFERENCES [dbo].[AspNetUsers] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Salutation_UpdatedByUserId]
    ON [dbo].[Salutation]([UpdatedByUserId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Salutation_DeletedByUserId]
    ON [dbo].[Salutation]([DeletedByUserId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Salutation_CreatedByUserId]
    ON [dbo].[Salutation]([CreatedByUserId] ASC);

