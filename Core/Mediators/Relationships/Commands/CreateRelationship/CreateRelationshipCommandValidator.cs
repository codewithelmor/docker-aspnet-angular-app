using FluentValidation;

namespace Mediators.Relationships.Commands.CreateRelationship
{
    public sealed class CreateRelationshipCommandValidator : AbstractValidator<CreateRelationshipCommand>
    {
        public CreateRelationshipCommandValidator()
        {
            RuleFor(x => x.Name).NotEmpty().MaximumLength(20);
        }
    }
}