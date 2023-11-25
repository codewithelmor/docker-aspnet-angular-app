using AutoMapper;
using Core.Responses.Salutations;
using Models.Entity;

namespace Core.Mappers.Salutations
{
    public class SalutationMap : Profile
    {
        public SalutationMap()
        {
            CreateMap<Salutation, SalutationResponse>();
        }
    }
}
