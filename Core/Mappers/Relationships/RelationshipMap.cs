using AutoMapper;
using Core.Responses.Relationships;
using Models.Entity;

namespace Core.Mappers.Relationships
{
    public class RelationshipMap : Profile
    {
        public RelationshipMap()
        {
            CreateMap<Relationship, RelationshipResponse>();
        }
    }
}
