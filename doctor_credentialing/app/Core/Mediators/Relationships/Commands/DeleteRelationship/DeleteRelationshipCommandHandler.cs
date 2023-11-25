using Core.Abstractions.Messaging;
using Core.Exceptions;
using Core.Repositories.Contracts;
using Core.UnitOfWorks.Contracts;
using MediatR;

namespace Core.Mediators.Relationships.Commands.DeleteRelationship
{
    internal sealed class DeleteRelationshipCommandHandler : ICommandHandler<DeleteRelationshipCommand, Unit>
    {
        private readonly IRelationshipRepository _relationshipRepository;
        private readonly IApplicationUnitOfWork _unitOfWork;

        public DeleteRelationshipCommandHandler(
            IRelationshipRepository relationshipRepository,
            IApplicationUnitOfWork unitOfWork)
        {
            _relationshipRepository = relationshipRepository;
            _unitOfWork = unitOfWork;
        }

        public async Task<Unit> Handle(DeleteRelationshipCommand request, CancellationToken cancellationToken)
        {
            var relationship = _relationshipRepository.FirstOrDefault(x => !x.IsDeleted && x.Id == request.Id);

            if (relationship is null)
            {
                throw new RelationshipNotFoundException(request.Id);
            }

            relationship.IsDeleted = request.IsDeleted;
            relationship.DeletedByUserId = request.DeletedByUserId;
            relationship.DeletedDate = DateTimeOffset.UtcNow;

            _relationshipRepository.Update(relationship);

            await _unitOfWork.Commit(cancellationToken);

            return Unit.Value;
        }
    }
}
