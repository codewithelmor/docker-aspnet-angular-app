using Core.Abstractions.Messaging;
using Core.Exceptions;
using Core.Repositories.Contracts;
using Core.UnitOfWorks.Contracts;
using MediatR;

namespace Core.Mediators.Salutations.Commands.UpdateSalutation
{
    internal sealed class UpdateSalutationCommandHandler : ICommandHandler<UpdateSalutationCommand, Unit>
    {
        private readonly ISalutationRepository _salutationRepository;
        private readonly IApplicationUnitOfWork _unitOfWork;

        public UpdateSalutationCommandHandler(
            ISalutationRepository salutationRepository,
            IApplicationUnitOfWork unitOfWork)
        {
            _salutationRepository = salutationRepository;
            _unitOfWork = unitOfWork;
        }

        public async Task<Unit> Handle(UpdateSalutationCommand request, CancellationToken cancellationToken)
        {
            var salutation = _salutationRepository.FirstOrDefault(x => !x.IsDeleted && x.Id == request.Id);

            if (salutation is null)
            {
                throw new SalutationNotFoundException(request.Id);
            }

            salutation.Title = request.Title;
            salutation.IsActive = request.IsActive;
            salutation.UpdatedByUserId = request.UpdatedByUserId;
            salutation.UpdatedDate = DateTimeOffset.UtcNow;

            _salutationRepository.Update(salutation);

            await _unitOfWork.Commit(cancellationToken);

            return Unit.Value;
        }
    }
}
