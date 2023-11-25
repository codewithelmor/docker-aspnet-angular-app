namespace Core.Mediators.Relationships.Commands.DeleteRelationship
{
    public sealed class DeleteRelationshipRequest : BaseRequest
    {
        public bool IsDeleted { get; set; } = true;
    }
}
