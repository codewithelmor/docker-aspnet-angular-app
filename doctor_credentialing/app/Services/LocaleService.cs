using Microsoft.AspNetCore.Mvc.Rendering;
using Services.Contracts;
using System.Globalization;

namespace Services
{
    public class LocaleService : ILocaleService
    {
        public SelectList GetLocales(string? selectedLocale = null)
        {
			try
			{
                var locales = new List<SelectListItem>();

                string? selectedValue = (!string.IsNullOrWhiteSpace(selectedLocale)) ? selectedLocale : null;

                CultureInfo[] cultureInfos = CultureInfo.GetCultures(CultureTypes.AllCultures & ~CultureTypes.NeutralCultures);
                foreach (CultureInfo cultureInfo in cultureInfos)
                {
                    string groupName = (cultureInfo.Name.Equals("en-US") || cultureInfo.Name.Equals("fr-FR"))
                        ? "Supported" : "Unsupported";

                    locales.Add(new SelectListItem()
                    {
                        Group = new SelectListGroup()
                        {
                            Name = groupName,
                            Disabled = groupName == "Unsupported",
                        },
                        Disabled = groupName == "Unsupported",
                        Text = cultureInfo.DisplayName,
                        Value = cultureInfo.Name,
                        Selected = (!string.IsNullOrWhiteSpace(selectedLocale) && selectedLocale == cultureInfo.Name)
                    });
                }

                locales = locales
                    .OrderBy(x => x.Group.Name)
                    .ThenBy(x => x.Text)
                    .ToList();

                return new SelectList(locales, "Value", "Text", selectedValue, "Group.Name");
            }
			catch (Exception)
			{
				throw;
			}
        }
    }
}
