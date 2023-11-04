using Core.Abstractions.Messaging;
using MediatR;

namespace Core.Mediators.Salutations.Commands.UpdateSalutation
{
    public sealed class UpdateSalutationCommand : ICommand<Unit>
    {
        public int Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public bool IsActive { get; set; } = true;
        public string? UpdatedByUserId { get; set; }
        public DateTimeOffset? UpdatedDate { get; set; }
    }
}
