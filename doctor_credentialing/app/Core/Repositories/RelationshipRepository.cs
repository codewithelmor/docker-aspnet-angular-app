using Core.Repositories.Contracts;
using Core.UnitOfWorks.Contracts;
using Models.Entity;

namespace Core.Repositories
{
    public class RelationshipRepository : BaseRepository<Relationship>, IRelationshipRepository
    {
        public RelationshipRepository(IApplicationUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}
