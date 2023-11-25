using Core.Abstractions.Messaging;
using Core.Exceptions;
using Core.Repositories.Contracts;
using Core.UnitOfWorks.Contracts;
using MediatR;

namespace Core.Mediators.Relationships.Commands.UpdateRelationship
{
    internal sealed class UpdateRelationshipCommandHandler : ICommandHandler<UpdateRelationshipCommand, Unit>
    {
        private readonly IRelationshipRepository _relationshipRepository;
        private readonly IApplicationUnitOfWork _unitOfWork;

        public UpdateRelationshipCommandHandler(
            IRelationshipRepository relationshipRepository,
            IApplicationUnitOfWork unitOfWork)
        {
            _relationshipRepository = relationshipRepository;
            _unitOfWork = unitOfWork;
        }

        public async Task<Unit> Handle(UpdateRelationshipCommand request, CancellationToken cancellationToken)
        {
            var relationship = _relationshipRepository.FirstOrDefault(x => !x.IsDeleted && x.Id == request.Id);

            if (relationship is null)
            {
                throw new RelationshipNotFoundException(request.Id);
            }

            relationship.Name = request.Name;
            relationship.IsActive = request.IsActive;
            relationship.UpdatedByUserId = request.UpdatedByUserId;
            relationship.UpdatedDate = DateTimeOffset.UtcNow;

            _relationshipRepository.Update(relationship);

            await _unitOfWork.Commit(cancellationToken);

            return Unit.Value;
        }
    }
}
