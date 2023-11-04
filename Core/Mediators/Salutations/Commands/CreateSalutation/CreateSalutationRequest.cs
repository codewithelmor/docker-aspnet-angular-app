using Core.Mediators;

namespace Mediators.Salutations.Commands.CreateSalutation
{
    public sealed class CreateSalutationRequest : BaseRequest
    {
        public string Title { get; set; } = string.Empty;
        public bool IsActive { get; set; } = true;
    }
}
