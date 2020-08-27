#nullable enable

namespace DataAccessLayer.Models
{
    public class Employee
    {
        public int IdEmployee { get; set; }
        public string? Firstname { get; set; }
        public string? Lastname { get; set; }
        public EmployeeType EmployeeType { get; set; }
        public string? Email { get; set; }
        internal string? Password { get; set; }
        public string? Phone { get; set; }
        public int? TeamId { get; set; }
        public string? Fullname { get; set; }

        public override string ToString()
        {
            return $"{Firstname} {Lastname}";
        }
    }
}
