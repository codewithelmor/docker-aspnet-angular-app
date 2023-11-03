using Domain.Configurations;
using Duende.IdentityServer.EntityFramework.Options;
using Microsoft.AspNetCore.ApiAuthorization.IdentityServer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Models.Entity;

namespace Domain
{
    public class ApplicationDbContext : ApiAuthorizationDbContext<ApplicationUser>
    {
        public ApplicationDbContext(DbContextOptions options, IOptions<OperationalStoreOptions> operationalStoreOptions)
            : base(options, operationalStoreOptions)
        {

        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);

            #region Entity Configurations

            builder.ApplyConfiguration(new PreferenceConfiguration());
            builder.ApplyConfiguration(new RelationshipConfiguration());
            builder.ApplyConfiguration(new SalutationConfiguration());

            #endregion

        }

        #region Database Sets

        public virtual DbSet<Preference> Preferences { get; set; }
        public virtual DbSet<Relationship> Relationships { get; set; }
        public virtual DbSet<Salutation> Salutations { get; set; }

        #endregion

    }
}