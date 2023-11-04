using Core.Behaviors;
using Core.Repositories;
using Core.Repositories.Contracts;
using Core.UnitOfWorks;
using Core.UnitOfWorks.Contracts;
using FluentValidation;
using MediatR;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity.UI.Services;
using Models.Options;
using Services;
using Services.Contracts;
using Web.Authorization.Handlers;
using Web.Authorization.Requirements;
using Web.Constants;
using Web.Middlewares;

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

        public static IServiceCollection AddCoreSettings(this IServiceCollection services)
        {
            services.AddScoped<ISalutationRepository, SalutationRepository>();

            services.AddScoped<IApplicationUnitOfWork, ApplicationUnitOfWork>();

            services.AddTransient<ExceptionHandlingMiddleware>();

            var coreAssembly = typeof(Core.AssemblyReference).Assembly;

            services.AddAutoMapper(coreAssembly);

            services.AddMediatR(config =>
            {
                config.RegisterServicesFromAssembly(coreAssembly);
            });

            services.AddTransient(typeof(IPipelineBehavior<,>), typeof(ValidationBehavior<,>));

            services.AddValidatorsFromAssembly(coreAssembly);

            return services;
        }

        public static IServiceCollection AddRoleSettings(this IServiceCollection services)
        {
            services.AddAuthorization(options =>
            {
                options.AddPolicy(Role.Admin,
                    policy => policy.Requirements.Add(new RoleRequirement(Role.Admin)));

                options.AddPolicy(Role.Approver,
                    policy => policy.Requirements.Add(new RoleRequirement(Role.Approver)));

                options.AddPolicy(Role.Applicant,
                    policy => policy.Requirements.Add(new RoleRequirement(Role.Applicant)));

                options.AddPolicy(Role.User,
                    policy => policy.Requirements.Add(new RoleRequirement(Role.User)));

                options.DefaultPolicy = new AuthorizationPolicyBuilder()
                        .RequireAuthenticatedUser()
                        .Build();
            });

            services.AddSingleton<IAuthorizationHandler, RoleAuthorizationHandler>();

            return services;
        }
    }
}
