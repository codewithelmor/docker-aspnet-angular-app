using FluentValidation;

namespace Core.Mediators.Relationships.Commands.DeleteRelationship
{
    public sealed class DeleteRelationshipCommandValidator : AbstractValidator<DeleteRelationshipCommand>
    {
        public DeleteRelationshipCommandValidator()
        {
            RuleFor(x => x.Id).GreaterThanOrEqualTo(1);
        }
    }
}