CREATE TABLE [dbo].[Relationship] (
    [Id]              INT                IDENTITY (1, 1) NOT NULL,
    [Name]            NVARCHAR (20)      NOT NULL,
    [IsActive]        BIT                DEFAULT ((1)) NOT NULL,
    [IsDeleted]       BIT                NOT NULL,
    [CreatedByUserId] NVARCHAR (450)     NOT NULL,
    [CreatedDate]     DATETIMEOFFSET (7) DEFAULT (getutcdate()) NOT NULL,
    [UpdatedByUserId] NVARCHAR (450)     NULL,
    [UpdatedDate]     DATETIMEOFFSET (7) NULL,
    [DeletedByUserId] NVARCHAR (450)     NULL,
    [DeletedDate]     DATETIMEOFFSET (7) NULL,
    CONSTRAINT [PK_Relationship] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Relationship_CreatedByUser] FOREIGN KEY ([CreatedByUserId]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_Relationship_DeletedByUser] FOREIGN KEY ([DeletedByUserId]) REFERENCES [dbo].[AspNetUsers] ([Id]),
    CONSTRAINT [FK_Relationship_UpdatedByUser] FOREIGN KEY ([UpdatedByUserId]) REFERENCES [dbo].[AspNetUsers] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Relationship_UpdatedByUserId]
    ON [dbo].[Relationship]([UpdatedByUserId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Relationship_DeletedByUserId]
    ON [dbo].[Relationship]([DeletedByUserId] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Relationship_CreatedByUserId]
    ON [dbo].[Relationship]([CreatedByUserId] ASC);

