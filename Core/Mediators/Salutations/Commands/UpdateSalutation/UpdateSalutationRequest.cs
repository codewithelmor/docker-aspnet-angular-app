namespace Core.Mediators.Salutations.Commands.UpdateSalutation
{
    public sealed class UpdateSalutationRequest : BaseRequest
    {
        public string Title { get; set; } = string.Empty;
        public bool IsActive { get; set; } = true;
    }
}
