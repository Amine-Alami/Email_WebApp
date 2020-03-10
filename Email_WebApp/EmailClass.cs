using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Net;
using System.Net.Mail;

namespace Email_WebApp
{
	public class EmailClass
	{
		//https://stackoverflow.com/a/32336
		public static void SendEmail(DataTable dt, string SenderEmail, string mdps)
		{
			for (int i = 0; i < dt.Rows.Count; i++)
			{
				string email = dt.Rows[i]["EMAIL"].ToString();
				if (email == string.Empty)
				{
					//TextArea1.InnerText += ("Email NOT sent to " + dt.Rows[i]["NOM"].ToString() + "\n");
					break;
				}
				var fromAddress = new MailAddress(SenderEmail, "Amine Alami");
				var toAddress = new MailAddress(dt.Rows[i]["EMAIL"].ToString());
				string fromPassword = mdps;
				string subject = "Test 3 to " + dt.Rows[i]["NOM"].ToString();
				string body = "Test if emails work";

				var smtp = new SmtpClient
				{
					Host = "smtp.gmail.com",
					Port = 587,
					EnableSsl = true,
					DeliveryMethod = SmtpDeliveryMethod.Network,
					UseDefaultCredentials = false,
					Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
				};
				using (var message = new MailMessage(fromAddress, toAddress)
				{
					Subject = subject,
					Body = body
				})
				{
					smtp.Send(message);
				}
				//TextArea1.InnerText += ("Email sent to " + dt.Rows[i]["NOM"].ToString() + "\n");
			}
		}
	}
}