using Core.Abstractions.Messaging;
using Core.Responses.Relationships;

namespace Mediators.Relationships.Commands.CreateRelationship
{
    public sealed class CreateRelationshipCommand : ICommand<RelationshipResponse>
    {
        public string Name { get; set; } = string.Empty;
        public bool IsActive { get; set; } = true;
        public bool IsDeleted { get; set; } = false;
        public string CreatedByUserId { get; set; } = string.Empty;
        public DateTimeOffset CreatedDate { get; set; }
    }
}
