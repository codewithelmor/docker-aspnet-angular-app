using Core.Abstractions.Messaging;
using Core.Exceptions;
using Core.Repositories.Contracts;
using Core.UnitOfWorks.Contracts;
using MediatR;

namespace Core.Mediators.Salutations.Commands.DeleteSalutation
{
    internal sealed class DeleteSalutationCommandHandler : ICommandHandler<DeleteSalutationCommand, Unit>
    {
        private readonly ISalutationRepository _salutationRepository;
        private readonly IApplicationUnitOfWork _unitOfWork;

        public DeleteSalutationCommandHandler(
            ISalutationRepository salutationRepository,
            IApplicationUnitOfWork unitOfWork)
        {
            _salutationRepository = salutationRepository;
            _unitOfWork = unitOfWork;
        }

        public async Task<Unit> Handle(DeleteSalutationCommand request, CancellationToken cancellationToken)
        {
            var salutation = _salutationRepository.FirstOrDefault(x => !x.IsDeleted && x.Id == request.Id);

            if (salutation is null)
            {
                throw new SalutationNotFoundException(request.Id);
            }

            salutation.IsDeleted = request.IsDeleted;
            salutation.DeletedByUserId = request.DeletedByUserId;
            salutation.DeletedDate = DateTimeOffset.UtcNow;

            _salutationRepository.Update(salutation);

            await _unitOfWork.Commit(cancellationToken);

            return Unit.Value;
        }
    }
}
