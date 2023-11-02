namespace Models.Entity
{
    public partial class ApplicationUser
    {
        public virtual ICollection<Preference> PreferenceCreatedByUsers { get; set; } = new List<Preference>();

        public virtual ICollection<Preference> PreferenceDeletedByUsers { get; set; } = new List<Preference>();

        public virtual ICollection<Preference> PreferenceUpdatedByUsers { get; set; } = new List<Preference>();

    }
}
