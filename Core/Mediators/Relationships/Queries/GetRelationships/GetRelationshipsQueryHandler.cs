using AutoMapper;
using Core.Abstractions.Messaging;
using Core.Repositories.Contracts;
using Core.Responses.Relationships;
using Microsoft.EntityFrameworkCore;

namespace Core.Mediators.Relationships.Queries.GetRelationships
{
    public sealed class GetRelationshipsQueryHandler : IQueryHandler<GetRelationshipsQuery, List<RelationshipResponse>>
    {
        private readonly IMapper _mapper;
        private readonly IRelationshipRepository _relationshipRepository;

        public GetRelationshipsQueryHandler(
            IMapper mapper,
            IRelationshipRepository relationshipRepository)
        {
            _mapper = mapper;
            _relationshipRepository = relationshipRepository;
        }

        public async Task<List<RelationshipResponse>> Handle(GetRelationshipsQuery request, CancellationToken cancellationToken)
        {
            var relationships = await _relationshipRepository
                .Find(x => !x.IsDeleted)
                .ToListAsync(cancellationToken);

            return _mapper.Map<List<RelationshipResponse>>(relationships);
        }
    }
}