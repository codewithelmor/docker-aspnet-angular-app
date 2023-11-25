namespace Models.Entity
{
    public partial class ApplicationUser
    {
        public virtual ICollection<Preference> PreferenceCreatedByUsers { get; set; } = new List<Preference>();
        public virtual ICollection<Preference> PreferenceDeletedByUsers { get; set; } = new List<Preference>();
        public virtual ICollection<Preference> PreferenceUpdatedByUsers { get; set; } = new List<Preference>();


        public virtual ICollection<Salutation> SalutationCreatedByUsers { get; set; } = new List<Salutation>();
        public virtual ICollection<Salutation> SalutationDeletedByUsers { get; set; } = new List<Salutation>();
        public virtual ICollection<Salutation> SalutationUpdatedByUsers { get; set; } = new List<Salutation>();


        public virtual ICollection<Relationship> RelationshipCreatedByUsers { get; set; } = new List<Relationship>();
        public virtual ICollection<Relationship> RelationshipDeletedByUsers { get; set; } = new List<Relationship>();
        public virtual ICollection<Relationship> RelationshipUpdatedByUsers { get; set; } = new List<Relationship>();

    }
}
