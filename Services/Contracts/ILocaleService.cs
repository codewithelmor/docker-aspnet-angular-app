using Microsoft.AspNetCore.Mvc.Rendering;

namespace Services.Contracts
{
    public interface ILocaleService
    {
        SelectList GetLocales(string? selectedLocale = null);
    }
}
