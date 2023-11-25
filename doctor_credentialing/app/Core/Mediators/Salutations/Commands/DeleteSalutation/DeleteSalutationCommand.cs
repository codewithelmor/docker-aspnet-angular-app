using Core.Abstractions.Messaging;
using MediatR;

namespace Core.Mediators.Salutations.Commands.DeleteSalutation
{
    public sealed class DeleteSalutationCommand : ICommand<Unit>
    {
        public int Id { get; set; }
        public bool IsDeleted { get; set; } = true;
        public string? DeletedByUserId { get; set; }
        public DateTimeOffset? DeletedDate { get; set; }
    }
}
