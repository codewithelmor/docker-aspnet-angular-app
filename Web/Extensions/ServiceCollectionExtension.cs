using Microsoft.AspNetCore.Identity.UI.Services;
using Models.Options;
using Services;
using Services.Contracts;
using Web.Constants;

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

        public static IServiceCollection AddCorsSettings(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddCors(options =>
            {
                string[] origins = configuration.GetSection("CorsPolicy:Origins").Get<string[]>();

                options.AddPolicy(ControllerPolicy.Cors,
                    builder => builder
                        .WithOrigins(origins)
                        .AllowAnyMethod()
                        .AllowAnyHeader()
                        .AllowCredentials());
            });

            return services;
        }
    }
}
