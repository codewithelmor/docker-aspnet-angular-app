using AutoMapper;
using Core.Mediators.Salutations.Commands.DeleteSalutation;

namespace Core.Mappers.Salutations
{
    public class DeleteSalutationRequestMap : Profile
    {
        public DeleteSalutationRequestMap()
        {
            CreateMap<DeleteSalutationRequest, DeleteSalutationCommand>()
                .ForMember(dest => dest.DeletedByUserId,
                    opt => opt.MapFrom(src => src.GetUserId()))
                .ForMember(dest => dest.DeletedDate,
                    opt => opt.MapFrom(src => DateTimeOffset.UtcNow));
        }
    }
}
