using FluentEmail.Core;
using FluentEmail.Smtp;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.Extensions.Options;
using Models.Options;
using System.Net.Mail;
using System.Net;

namespace Services
{
    public class EmailSender : IEmailSender
    {
        private readonly EmailSettings _emailSettings;
        private readonly SmtpClient _smtpClient;

        public EmailSender(IOptionsMonitor<EmailSettings> emailSettings)
        {
            _emailSettings = emailSettings.CurrentValue;

            _smtpClient = new SmtpClient
            {
                Host = _emailSettings.Host,
                Port = _emailSettings.Port,
                EnableSsl = _emailSettings.EnableSsl,
                UseDefaultCredentials = _emailSettings.UseDefaultCredentials,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                Credentials = new NetworkCredential(_emailSettings.Username, _emailSettings.Password)
            };

            Email.DefaultSender = new SmtpSender(_smtpClient);
        }

        public async Task SendEmailAsync(string email, string subject, string htmlMessage)
        {
			try
			{
                var sendEmail = await Email
                    .From(_emailSettings.Username, _emailSettings.Name)
                    .To(email)
                    .Subject($"{_emailSettings.Name} | {subject}")
                    .Body(body: htmlMessage, isHtml: _emailSettings.IsBodyHtml)
                    .SendAsync();
            }
			catch (Exception)
			{
				throw;
			}
        }
    }
}
