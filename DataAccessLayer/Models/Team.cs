#nullable enable

namespace DataAccessLayer.Models
{
    public class Team
    {
        public int IdTeam { get; set; }
        public string? Name { get; set; }
        public TeamLead? TeamLead { get; set; }
    }
}
