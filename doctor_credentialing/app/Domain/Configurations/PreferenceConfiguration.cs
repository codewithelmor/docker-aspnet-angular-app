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
    public class PreferenceConfiguration : IEntityTypeConfiguration<Preference>
    {
        public void Configure(EntityTypeBuilder<Preference> builder)
        {
            builder.ToTable("Preference");

            builder.Property(e => e.CreatedByUserId).HasMaxLength(450);
            builder.Property(e => e.CreatedDate).HasDefaultValueSql("(getutcdate())");
            builder.Property(e => e.DeletedByUserId).HasMaxLength(450);
            builder.Property(e => e.IsActive)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            builder.Property(e => e.Locale).HasMaxLength(5);
            builder.Property(e => e.UpdatedByUserId).HasMaxLength(450);

            builder.HasOne(d => d.CreatedByUser).WithMany(p => p.PreferenceCreatedByUsers)
                .HasForeignKey(d => d.CreatedByUserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Preference_CreatedByUser");

            builder.HasOne(d => d.DeletedByUser).WithMany(p => p.PreferenceDeletedByUsers)
                .HasForeignKey(d => d.DeletedByUserId)
                .HasConstraintName("FK_Preference_DeletedByUser");

            builder.HasOne(d => d.UpdatedByUser).WithMany(p => p.PreferenceUpdatedByUsers)
                .HasForeignKey(d => d.UpdatedByUserId)
                .HasConstraintName("FK_Preference_UpdatedByUser");
        }
    }
}
