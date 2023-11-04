using FluentValidation;

namespace Core.Mediators.Salutations.Commands.DeleteSalutation
{
    public sealed class DeleteSalutationCommandValidator : AbstractValidator<DeleteSalutationCommand>
    {
        public DeleteSalutationCommandValidator()
        {
            RuleFor(x => x.Id).GreaterThanOrEqualTo(1);
        }
    }
}