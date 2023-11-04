using AutoMapper;
using Mediators.Relationships.Commands.CreateRelationship;

namespace Core.Mappers.Relationships
{
    public class CreateRelationshipRequestMap : Profile
    {
        public CreateRelationshipRequestMap()
        {
            CreateMap<CreateRelationshipRequest, CreateRelationshipCommand>()
                .ForMember(dest => dest.CreatedByUserId,
                    opt => opt.MapFrom(src => src.GetUserId()))
                .ForMember(dest => dest.CreatedDate,
                    opt => opt.MapFrom(src => DateTimeOffset.UtcNow))
                .ForMember(dest => dest.IsDeleted,
                    opt => opt.MapFrom(src => false));
        }
    }
}
