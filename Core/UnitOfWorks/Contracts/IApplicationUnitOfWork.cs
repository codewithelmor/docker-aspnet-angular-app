using Domain;

namespace Core.UnitOfWorks.Contracts
{
    public interface IApplicationUnitOfWork : IUnitOfWork<ApplicationDbContext>
    {
    }
}