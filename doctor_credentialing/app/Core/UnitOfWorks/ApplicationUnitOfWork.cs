using Core.UnitOfWorks.Contracts;
using Domain;

namespace Core.UnitOfWorks
{
    public class ApplicationUnitOfWork : UnitOfWork<ApplicationDbContext>, IApplicationUnitOfWork
    {
        public ApplicationUnitOfWork(ApplicationDbContext context) : base(context)
        {
        }
    }
}