using AutoMapper;
using Core.Abstractions.Messaging;
using Core.Repositories.Contracts;
using Core.Responses.Salutations;
using Core.UnitOfWorks.Contracts;
using Microsoft.EntityFrameworkCore;
using Models.Entity;

namespace Mediators.Salutations.Commands.CreateSalutation
{
    public sealed class CreateSalutationCommandHandler : ICommandHandler<CreateSalutationCommand, SalutationResponse>
    {
        private readonly IMapper _mapper;
        private readonly ISalutationRepository _salutationRepository;
        private readonly IApplicationUnitOfWork _unitOfWork;

        public CreateSalutationCommandHandler(
            IMapper mapper, 
            ISalutationRepository salutationRepository,
            IApplicationUnitOfWork unitOfWork)
        {
            _mapper = mapper;
            _salutationRepository = salutationRepository;
            _unitOfWork = unitOfWork;
        }

        public async Task<SalutationResponse> Handle(CreateSalutationCommand request, CancellationToken cancellationToken)
        {
            var existingSalutation = _salutationRepository.FirstOrDefault(x => x.IsActive && !x.IsDeleted && x.Title.ToLower() == request.Title.ToLower());

            if (existingSalutation == null)
            {
                var salutation = new Salutation()
                {
                    Title = request.Title,
                    IsActive = request.IsActive,
                    IsDeleted = request.IsDeleted,
                    CreatedByUserId = request.CreatedByUserId,
                    CreatedDate = request.CreatedDate,
                };

                await _salutationRepository.AddAsync(salutation);

                await _unitOfWork.Commit(cancellationToken);

                return _mapper.Map<SalutationResponse>(salutation);
            }
            else
            {
                return _mapper.Map<SalutationResponse>(existingSalutation);
            }
        }
    }
}