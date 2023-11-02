using Domain;
using IdentityModel;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Options;
using Models.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace Services
{
    public class ApplicationUserClaimsPrincipalFactory : UserClaimsPrincipalFactory<ApplicationUser>
    {
        private readonly ApplicationDbContext _context;

        public ApplicationUserClaimsPrincipalFactory(
            ApplicationDbContext context,
            UserManager<ApplicationUser> userManager,
            IOptions<IdentityOptions> options) : base(userManager, options)
        {
            _context = context;
        }

        public async override Task<ClaimsPrincipal> CreateAsync(ApplicationUser user)
        {
            var principal = await base.CreateAsync(user);

            var preference = await _context.Preferences.FirstOrDefaultAsync(x => x.CreatedByUserId == user.Id);
            string locale = preference == null ? "en-US" : preference.Language;

            ((ClaimsIdentity)principal.Identity).AddClaims(new[] {
                new Claim(ClaimTypes.Name, user.UserName),
                new Claim(JwtClaimTypes.Locale, locale),
                new Claim(ClaimTypes.Email, user.Email),
            });

            return principal;
        }

        protected async override Task<ClaimsIdentity> GenerateClaimsAsync(ApplicationUser user)
        {
            var principal = await base.GenerateClaimsAsync(user);

            var preference = await _context.Preferences.FirstOrDefaultAsync(x => x.CreatedByUserId == user.Id);
            string locale = preference == null ? "en-US" : preference.Language;

            principal.AddClaims(new[] {
                new Claim(ClaimTypes.Name, user.UserName),
                new Claim(JwtClaimTypes.Locale, locale),
                new Claim(ClaimTypes.Email, user.Email),
            });

            return principal;
        }
    }
}
