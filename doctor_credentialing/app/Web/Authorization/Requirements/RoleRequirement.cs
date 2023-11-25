using Microsoft.AspNetCore.Authorization;

namespace Web.Authorization.Requirements
{
    public class RoleRequirement : IAuthorizationRequirement
    {
        public RoleRequirement(string role)
        {
            Role = role;
        }
        public string Role { get; set; }
    }
}
