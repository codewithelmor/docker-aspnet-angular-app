using AutoMapper;
using Core.Mediators.Relationships.Commands.DeleteRelationship;

namespace Core.Mappers.Relationships
{
    public class DeleteRelationshipRequestMap : Profile
    {
        public DeleteRelationshipRequestMap()
        {
            CreateMap<DeleteRelationshipRequest, DeleteRelationshipCommand>()
                .ForMember(dest => dest.DeletedByUserId,
                    opt => opt.MapFrom(src => src.GetUserId()))
                .ForMember(dest => dest.DeletedDate,
                    opt => opt.MapFrom(src => DateTimeOffset.UtcNow));
        }
    }
}
