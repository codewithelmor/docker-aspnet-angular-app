using Core.Abstractions.Messaging;
using Core.Responses.Relationships;

namespace Core.Mediators.Relationships.Queries.GetRelationships
{
    public sealed record GetRelationshipsQuery() : IQuery<List<RelationshipResponse>>;
}
