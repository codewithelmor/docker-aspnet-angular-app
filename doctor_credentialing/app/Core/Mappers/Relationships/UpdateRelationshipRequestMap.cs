using AutoMapper;
using Core.Mediators.Relationships.Commands.UpdateRelationship;

namespace Core.Mappers.Relationships
{
    public class UpdateRelationshipRequestMap : Profile
    {
        public UpdateRelationshipRequestMap()
        {
            CreateMap<UpdateRelationshipRequest, UpdateRelationshipCommand>()
                .ForMember(dest => dest.UpdatedByUserId,
                    opt => opt.MapFrom(src => src.GetUserId()))
                .ForMember(dest => dest.UpdatedDate,
                    opt => opt.MapFrom(src => DateTimeOffset.UtcNow));
        }
    }
}
