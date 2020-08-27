#nullable enable
using System.ComponentModel.DataAnnotations;
using TimeTrackerSite.Resources;

namespace TimeTrackerSite.Models
{
    public class User
    {
        [Required(ErrorMessage = null, ErrorMessageResourceType = typeof(Login), ErrorMessageResourceName = nameof(Login.requiredFiled))]
        [Display(ResourceType = typeof(Login), Name = nameof(Login.username))]
        [EmailAddress(ErrorMessage = null, ErrorMessageResourceType = typeof(Login), ErrorMessageResourceName = nameof(Login.invalidUsername))]
        public string? Username { get; set; }

        [Required(ErrorMessage = null, ErrorMessageResourceType = typeof(Login), ErrorMessageResourceName = nameof(Login.requiredFiled))]
        [Display(ResourceType = typeof(Login), Name = nameof(Login.password))]
        [DataType(DataType.Password)]
        public string? Password { get; set; }

        [Required(ErrorMessage = null, ErrorMessageResourceType = typeof(Login), ErrorMessageResourceName = nameof(Login.requiredFiled))]
        [Display(ResourceType = typeof(Login), Name = nameof(Login.confirmPassword))]
        [Compare("Password", ErrorMessage = null, ErrorMessageResourceType = typeof(Login), ErrorMessageResourceName = nameof(Login.passwordMatchError))]
        [DataType(DataType.Password)]
        public string? ConfirmPassword { get; set; }
    }
}