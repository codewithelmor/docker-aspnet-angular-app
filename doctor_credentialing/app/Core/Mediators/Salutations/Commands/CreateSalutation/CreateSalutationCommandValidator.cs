using FluentValidation;

namespace Mediators.Salutations.Commands.CreateSalutation
{
    public sealed class CreateSalutationCommandValidator : AbstractValidator<CreateSalutationCommand>
    {
        public CreateSalutationCommandValidator()
        {
            RuleFor(x => x.Title).NotEmpty().MaximumLength(5);
        }
    }
}