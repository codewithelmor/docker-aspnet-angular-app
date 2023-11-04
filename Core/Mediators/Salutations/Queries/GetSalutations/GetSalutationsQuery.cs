using Core.Abstractions.Messaging;
using Core.Responses.Salutations;

namespace Core.Mediators.Salutations.Queries.GetSalutations
{
    public sealed record GetSalutationsQuery() : IQuery<List<SalutationResponse>>;
}
