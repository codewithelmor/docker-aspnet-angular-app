using Microsoft.AspNetCore.Identity.UI.Services;
using Models.Options;
using Services;
using Services.Contracts;

namespace Web.Extensions
{
    public static class ServiceCollectionExtension
    {
        public static IServiceCollection AddOptionModels(this IServiceCollection services, IConfiguration configuration)
        {
            services.Configure<EmailSettings>(config =>
            {
                configuration.GetSection("EmailSettings").Bind(config);
            });

            return services;
        }

        public static IServiceCollection AddServices(this IServiceCollection services)
        {
            services.AddSingleton<IEmailSender, EmailSender>();
            services.AddScoped<ILocaleService, LocaleService>();

            return services;
        }
    }
}
