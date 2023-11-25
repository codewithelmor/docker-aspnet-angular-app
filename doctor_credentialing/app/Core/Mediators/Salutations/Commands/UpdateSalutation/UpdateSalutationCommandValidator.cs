using FluentValidation;

namespace Core.Mediators.Salutations.Commands.UpdateSalutation
{
    public sealed class UpdateSalutationCommandValidator : AbstractValidator<UpdateSalutationCommand>
    {
        public UpdateSalutationCommandValidator()
        {
            RuleFor(x => x.Id).GreaterThanOrEqualTo(1);

            RuleFor(x => x.Title).NotEmpty().MaximumLength(5);
        }
    }
}