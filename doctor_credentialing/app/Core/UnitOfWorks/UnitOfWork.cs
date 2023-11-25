using Core.UnitOfWorks.Contracts;
using Microsoft.EntityFrameworkCore;

namespace Core.UnitOfWorks
{
    public class UnitOfWork<TContext> : IUnitOfWork<TContext> where TContext : DbContext
    {
        private readonly TContext _context;

        protected UnitOfWork(TContext context)
        {
            _context = context;
        }

        public TContext GetDbContext()
        {
            return _context;
        }

        public async Task Commit(CancellationToken cancellationToken = default)
        {
            await _context.SaveChangesAsync(cancellationToken);
        }

        public void Rollback()
        {
            _context
                .ChangeTracker
                .Entries()
                .ToList()
                .ForEach(x => x.Reload());
        }
        
        public void Dispose()
        {
            _context?.Dispose();
        }
    }
}