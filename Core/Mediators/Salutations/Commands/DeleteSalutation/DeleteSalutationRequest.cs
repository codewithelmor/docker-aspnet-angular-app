namespace Core.Mediators.Salutations.Commands.DeleteSalutation
{
    public sealed class DeleteSalutationRequest : BaseRequest
    {
        public bool IsDeleted { get; set; } = true;
    }
}
