namespace Core.Exceptions
{
    public sealed class RelationshipNotFoundException : NotFoundException
    {
        public RelationshipNotFoundException(int relationshipId)
            : base($"The relationship with the identifier {relationshipId} was not found.")
        {
        }
    }
}
