using Core.Abstractions.Messaging;
using MediatR;

namespace Core.Mediators.Relationships.Commands.DeleteRelationship
{
    public sealed class DeleteRelationshipCommand : ICommand<Unit>
    {
        public int Id { get; set; }
        public bool IsDeleted { get; set; } = true;
        public string? DeletedByUserId { get; set; }
        public DateTimeOffset? DeletedDate { get; set; }
    }
}
