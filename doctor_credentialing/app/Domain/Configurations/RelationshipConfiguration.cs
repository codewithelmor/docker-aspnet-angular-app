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
    public class RelationshipConfiguration : IEntityTypeConfiguration<Relationship>
    {
        public void Configure(EntityTypeBuilder<Relationship> builder)
        {
            builder.ToTable("Relationship");

            builder.Property(e => e.CreatedByUserId).HasMaxLength(450);
            builder.Property(e => e.CreatedDate).HasDefaultValueSql("(getutcdate())");
            builder.Property(e => e.DeletedByUserId).HasMaxLength(450);
            builder.Property(e => e.IsActive)
                .IsRequired()
                .HasDefaultValueSql("((1))");
            builder.Property(e => e.Name).HasMaxLength(20);
            builder.Property(e => e.UpdatedByUserId).HasMaxLength(450);

            builder.HasOne(d => d.CreatedByUser).WithMany(p => p.RelationshipCreatedByUsers)
                .HasForeignKey(d => d.CreatedByUserId)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Relationship_CreatedByUser");

            builder.HasOne(d => d.DeletedByUser).WithMany(p => p.RelationshipDeletedByUsers)
                .HasForeignKey(d => d.DeletedByUserId)
                .HasConstraintName("FK_Relationship_DeletedByUser");

            builder.HasOne(d => d.UpdatedByUser).WithMany(p => p.RelationshipUpdatedByUsers)
                .HasForeignKey(d => d.UpdatedByUserId)
                .HasConstraintName("FK_Relationship_UpdatedByUser");
        }
    }
}
