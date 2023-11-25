using AutoMapper;
using Mediators.Salutations.Commands.CreateSalutation;

namespace Core.Mappers.Salutations
{
    public class CreateSalutationRequestMap : Profile
    {
        public CreateSalutationRequestMap()
        {
            CreateMap<CreateSalutationRequest, CreateSalutationCommand>()
                .ForMember(dest => dest.CreatedByUserId,
                    opt => opt.MapFrom(src => src.GetUserId()))
                .ForMember(dest => dest.CreatedDate,
                    opt => opt.MapFrom(src => DateTimeOffset.UtcNow))
                .ForMember(dest => dest.IsDeleted,
                    opt => opt.MapFrom(src => false));
        }
    }
}
