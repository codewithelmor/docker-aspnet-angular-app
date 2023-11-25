using AutoMapper;
using Core.Abstractions.Messaging;
using Core.Repositories.Contracts;
using Core.Responses.Relationships;
using Core.UnitOfWorks.Contracts;
using Microsoft.EntityFrameworkCore;
using Models.Entity;

namespace Mediators.Relationships.Commands.CreateRelationship
{
    public sealed class CreateRelationshipCommandHandler : ICommandHandler<CreateRelationshipCommand, RelationshipResponse>
    {
        private readonly IMapper _mapper;
        private readonly IRelationshipRepository _relationshipRepository;
        private readonly IApplicationUnitOfWork _unitOfWork;

        public CreateRelationshipCommandHandler(
            IMapper mapper, 
            IRelationshipRepository relationshipRepository,
            IApplicationUnitOfWork unitOfWork)
        {
            _mapper = mapper;
            _relationshipRepository = relationshipRepository;
            _unitOfWork = unitOfWork;
        }

        public async Task<RelationshipResponse> Handle(CreateRelationshipCommand request, CancellationToken cancellationToken)
        {
            var existingRelationship = _relationshipRepository.FirstOrDefault(x => x.IsActive && !x.IsDeleted && x.Name.ToLower() == request.Name.ToLower());

            if (existingRelationship == null)
            {
                var relationship = new Relationship()
                {
                    Name = request.Name,
                    IsActive = request.IsActive,
                    IsDeleted = request.IsDeleted,
                    CreatedByUserId = request.CreatedByUserId,
                    CreatedDate = request.CreatedDate,
                };

                await _relationshipRepository.AddAsync(relationship);

                await _unitOfWork.Commit(cancellationToken);

                return _mapper.Map<RelationshipResponse>(relationship);
            }
            else
            {
                return _mapper.Map<RelationshipResponse>(existingRelationship);
            }
        }
    }
}