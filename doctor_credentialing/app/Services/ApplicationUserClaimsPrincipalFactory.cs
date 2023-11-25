using Domain;
using IdentityModel;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Models.Entity;
using System.Security.Claims;

namespace Services
{
    public class ApplicationUserClaimsPrincipalFactory : UserClaimsPrincipalFactory<ApplicationUser>
    {
        private readonly ApplicationDbContext _context;
        private readonly UserManager<ApplicationUser> _userManager;

        public ApplicationUserClaimsPrincipalFactory(
            ApplicationDbContext context,
            UserManager<ApplicationUser> userManager,
            IOptions<IdentityOptions> options) : base(userManager, options)
        {
            _context = context;
            _userManager = userManager;
        }

        public async override Task<ClaimsPrincipal> CreateAsync(ApplicationUser user)
        {
            var principal = await base.CreateAsync(user);

            (principal.Identity as ClaimsIdentity)?.AddClaims(await GetClaims(user));

            return principal;
        }

        protected async override Task<ClaimsIdentity> GenerateClaimsAsync(ApplicationUser user)
        {
            var principal = await base.GenerateClaimsAsync(user);

            principal.AddClaims(await GetClaims(user));

            return principal;
        }

        private async Task<Claim[]> GetClaims(ApplicationUser user)
        {
            var roles = await _userManager.GetRolesAsync(user);

            var preference = await _context.Preferences.FirstOrDefaultAsync(x => x.CreatedByUserId == user.Id);
            string locale = preference == null ? "en-US" : preference.Locale;

            var claims = new List<Claim> {
                new Claim(ClaimTypes.Name, user.UserName),
                new Claim(JwtClaimTypes.Locale, locale),
                new Claim(ClaimTypes.Email, user.Email),
            };

            foreach (var role in roles)
            {
                claims.Add(new Claim(JwtClaimTypes.Role, role));
            }

            return claims.ToArray();
        }
    }
}
