// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
#nullable disable

using System;
using System.ComponentModel.DataAnnotations;
using System.Text.Encodings.Web;
using System.Threading.Tasks;
using Domain;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Models.Entity;

namespace Web.Areas.Identity.Pages.Account.Manage
{
    public class PreferenceModel : PageModel
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly ApplicationDbContext _context;

        public PreferenceModel(
            UserManager<ApplicationUser> userManager,
            ApplicationDbContext context)
        {
            _userManager = userManager;
            _context = context;
        }

        /// <summary>
        ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
        ///     directly from your code. This API may change or be removed in future releases.
        /// </summary>
        public string Username { get; set; }

        /// <summary>
        ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
        ///     directly from your code. This API may change or be removed in future releases.
        /// </summary>
        [TempData]
        public string StatusMessage { get; set; }

        /// <summary>
        ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
        ///     directly from your code. This API may change or be removed in future releases.
        /// </summary>
        [BindProperty]
        public InputModel Input { get; set; }

        /// <summary>
        ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
        ///     directly from your code. This API may change or be removed in future releases.
        /// </summary>
        public class InputModel
        {
            /// <summary>
            ///     This API supports the ASP.NET Core Identity default UI infrastructure and is not intended to be used
            ///     directly from your code. This API may change or be removed in future releases.
            /// </summary>
            [Required]
            [Display(Name = "Language")]
            public string Language { get; set; }
        }

        private async Task LoadAsync(ApplicationUser user)
        {
            var userName = await _userManager.GetUserNameAsync(user);
            var preference = await _context.Preferences.FirstOrDefaultAsync(x => x.CreatedByUserId == user.Id);

            Username = userName;

            Input = new InputModel
            {
                Language = preference?.Language
            };
        }

        public async Task<IActionResult> OnGetAsync()
        {
            var user = await _userManager.GetUserAsync(User);
            if (user == null)
            {
                return NotFound($"Unable to load user with ID '{_userManager.GetUserId(User)}'.");
            }

            await LoadAsync(user);
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            var user = await _userManager.GetUserAsync(User);
            if (user == null)
            {
                return NotFound($"Unable to load user with ID '{_userManager.GetUserId(User)}'.");
            }

            if (!ModelState.IsValid)
            {
                await LoadAsync(user);
                return Page();
            }

            var preference = await _context.Preferences.FirstOrDefaultAsync(x => x.CreatedByUserId == user.Id);
            if (preference != null && Input.Language != preference.Language)
            {
                preference.Language = Input.Language;
                preference.UpdatedByUserId = user.Id;
                preference.UpdatedDate = DateTimeOffset.UtcNow;

                _context.Preferences.Update(preference);
                if ((await _context.SaveChangesAsync()) <= 0)
                {
                    StatusMessage = "Unexpected error when trying to set preference.";
                    return Page();
                }
            }
            else
            {
                await _context.Preferences.AddAsync(new Preference()
                {
                    Language = Input.Language,
                    IsActive = true,
                    CreatedByUserId = user.Id,
                    CreatedDate = DateTimeOffset.UtcNow
                });
                if ((await _context.SaveChangesAsync()) <= 0)
                {
                    StatusMessage = "Unexpected error when trying to set preference.";
                    return Page();
                }
            }

            StatusMessage = "Your preference has been updated";
            return Page();
        }
    }
}
