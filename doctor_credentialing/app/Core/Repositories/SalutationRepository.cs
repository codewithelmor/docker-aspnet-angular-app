using Core.Repositories.Contracts;
using Core.UnitOfWorks.Contracts;
using Models.Entity;

namespace Core.Repositories
{
    public class SalutationRepository : BaseRepository<Salutation>, ISalutationRepository
    {
        public SalutationRepository(IApplicationUnitOfWork unitOfWork) : base(unitOfWork)
        {
        }
    }
}
