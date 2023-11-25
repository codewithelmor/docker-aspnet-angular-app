using Core.Abstractions.Messaging;
using Core.Responses.Salutations;

namespace Mediators.Salutations.Commands.CreateSalutation
{
    public sealed class CreateSalutationCommand : ICommand<SalutationResponse>
    {
        public string Title { get; set; } = string.Empty;
        public bool IsActive { get; set; } = true;
        public bool IsDeleted { get; set; } = false;
        public string CreatedByUserId { get; set; } = string.Empty;
        public DateTimeOffset CreatedDate { get; set; }
    }
}
