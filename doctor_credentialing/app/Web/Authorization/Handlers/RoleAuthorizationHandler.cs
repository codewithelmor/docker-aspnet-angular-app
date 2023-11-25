using IdentityModel;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;
using Web.Authorization.Requirements;

namespace Web.Authorization.Handlers
{
    public class RoleAuthorizationHandler : AuthorizationHandler<RoleRequirement>
    {
        protected override Task HandleRequirementAsync(AuthorizationHandlerContext context, RoleRequirement requirement)
        {
            if ((!context.User.HasClaim(c => c.Type == JwtClaimTypes.Role)) && (!context.User.HasClaim(c => c.Type == ClaimTypes.Role)))
            {
                return Task.CompletedTask;
            }
            else if (context.User.HasClaim(c => c.Type == JwtClaimTypes.Role))
            {
                var roleClaims = context.User.Claims.Where(x => x.Type == JwtClaimTypes.Role).ToList();

                if (roleClaims != null && roleClaims.Any())
                {
                    foreach (var roleClaim in roleClaims)
                    {
                        if (roleClaim != null)
                        {
                            string role = roleClaim.Value;

                            if (role.Equals(requirement.Role))
                            {
                                context.Succeed(requirement);
                                break;
                            }
                        }
                    }
                }
            }
            else if (context.User.HasClaim(c => c.Type == ClaimTypes.Role))
            {
                var roleClaims = context.User.Claims.Where(x => x.Type == ClaimTypes.Role).ToList();

                if (roleClaims != null && roleClaims.Any())
                {
                    foreach (var roleClaim in roleClaims)
                    {
                        if (roleClaim != null)
                        {
                            string role = roleClaim.Value;

                            if (role.Equals(requirement.Role))
                            {
                                context.Succeed(requirement);
                                break;
                            }
                        }
                    }
                }
            }

            return Task.CompletedTask;
        }
    }
}
