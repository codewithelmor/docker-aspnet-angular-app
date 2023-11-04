using AutoMapper;
using Core.Mediators.Salutations.Commands.UpdateSalutation;

namespace Core.Mappers.Salutations
{
    public class UpdateSalutationRequestMap : Profile
    {
        public UpdateSalutationRequestMap()
        {
            CreateMap<UpdateSalutationRequest, UpdateSalutationCommand>()
                .ForMember(dest => dest.UpdatedByUserId,
                    opt => opt.MapFrom(src => src.GetUserId()))
                .ForMember(dest => dest.UpdatedDate,
                    opt => opt.MapFrom(src => DateTimeOffset.UtcNow));
        }
    }
}
