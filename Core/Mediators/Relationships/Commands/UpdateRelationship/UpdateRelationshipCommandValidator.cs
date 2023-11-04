using FluentValidation;

namespace Core.Mediators.Relationships.Commands.UpdateRelationship
{
    public sealed class UpdateRelationshipCommandValidator : AbstractValidator<UpdateRelationshipCommand>
    {
        public UpdateRelationshipCommandValidator()
        {
            RuleFor(x => x.Id).GreaterThanOrEqualTo(1);

            RuleFor(x => x.Name).NotEmpty().MaximumLength(20);
        }
    }
}