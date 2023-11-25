using Core.Mediators;

namespace Mediators.Relationships.Commands.CreateRelationship
{
    public sealed class CreateRelationshipRequest : BaseRequest
    {
        public string Name { get; set; } = string.Empty;
    }
}
