using AutoMapper;
using Core.Abstractions.Messaging;
using Core.Repositories.Contracts;
using Core.Responses.Salutations;
using Microsoft.EntityFrameworkCore;

namespace Core.Mediators.Salutations.Queries.GetSalutations
{
    public sealed class GetSalutationsQueryHandler : IQueryHandler<GetSalutationsQuery, List<SalutationResponse>>
    {
        private readonly IMapper _mapper;
        private readonly ISalutationRepository _salutationRepository;

        public GetSalutationsQueryHandler(
            IMapper mapper,
            ISalutationRepository salutationRepository)
        {
            _mapper = mapper;
            _salutationRepository = salutationRepository;
        }

        public async Task<List<SalutationResponse>> Handle(GetSalutationsQuery request, CancellationToken cancellationToken)
        {
            var salutations = await _salutationRepository
                .Find(x => !x.IsDeleted)
                .ToListAsync(cancellationToken);

            return _mapper.Map<List<SalutationResponse>>(salutations);
        }
    }
}