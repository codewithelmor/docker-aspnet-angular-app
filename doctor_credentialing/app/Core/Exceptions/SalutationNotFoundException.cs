namespace Core.Exceptions
{
    public sealed class SalutationNotFoundException : NotFoundException
    {
        public SalutationNotFoundException(int salutationId)
            : base($"The salutation with the identifier {salutationId} was not found.")
        {
        }
    }
}
