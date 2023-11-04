namespace Core.Mediators.Relationships.Commands.UpdateRelationship
{
    public sealed class UpdateRelationshipRequest : BaseRequest
    {
        public string Name { get; set; } = string.Empty;
        public bool IsActive { get; set; }
    }
}
