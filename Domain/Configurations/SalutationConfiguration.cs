using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Models.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain.Configurations
{
    public class SalutationConfiguration : IEntityTypeConfiguration<Salutation>
    {
        public void Configure(EntityTypeBuilder<Salutation> builder)
        {
            builder.ToTable("Salutation");

            builder.Property(e => e.CreatedByUserId).HasMaxLength(450);
            builder.Property(e => e.CreatedDate).HasDefaultValueSql("(getutcdate())");
            builder.Property(e => e.DeletedByUserId).HasMaxLength(450);
            builder.Property(e => e.IsActive)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            builder.Property(e => e.Title).HasMaxLength(5);
            builder.Property(e => e.UpdatedByUserId).HasMaxLength(450);

            builder.HasOne(d => d.CreatedByUser).WithMany(p => p.SalutationCreatedByUsers)
                .HasForeignKey(d => d.CreatedByUserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Salutation_CreatedByUser");

            builder.HasOne(d => d.DeletedByUser).WithMany(p => p.SalutationDeletedByUsers)
                .HasForeignKey(d => d.DeletedByUserId)
                .HasConstraintName("FK_Salutation_DeletedByUser");

            builder.HasOne(d => d.UpdatedByUser).WithMany(p => p.SalutationUpdatedByUsers)
                .HasForeignKey(d => d.UpdatedByUserId)
                .HasConstraintName("FK_Salutation_UpdatedByUser");
        }
    }
}
