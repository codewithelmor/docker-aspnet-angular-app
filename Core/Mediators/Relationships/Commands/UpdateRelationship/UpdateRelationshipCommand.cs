using Core.Abstractions.Messaging;
using MediatR;

namespace Core.Mediators.Relationships.Commands.UpdateRelationship
{
    public sealed class UpdateRelationshipCommand : ICommand<Unit>
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public bool IsActive { get; set; } = true;
        public string? UpdatedByUserId { get; set; }
        public DateTimeOffset? UpdatedDate { get; set; }
    }
}
