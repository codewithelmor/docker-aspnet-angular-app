using Microsoft.EntityFrameworkCore;

namespace Core.UnitOfWorks.Contracts
{
    public interface IUnitOfWork<out TContext> : IDisposable where TContext : DbContext
    {
        TContext GetDbContext();
        Task Commit(CancellationToken cancellationToken = default);
        void Rollback();
    }
}