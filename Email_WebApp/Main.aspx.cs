using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using FirebirdSql.Data.FirebirdClient;
using System.Net;
using System.Net.Mail;

namespace Email_WebApp
{
	public partial class Main : System.Web.UI.Page
	{
		FbConnection cnx = new FbConnection("database=localhost:\\Users\\hp\\Desktop\\stage\\EMPLOYEE.GDB;user=sysdba;password=masterkey");

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				if (cnx.State == ConnectionState.Open)
					cnx.Close();
				cnx.Open();

				FbCommand cmd = new FbCommand("select * from T_PERSONNEL", cnx, cnx.BeginTransaction());

				DataTable dt = new DataTable();
				dt.Clear();
				FbDataAdapter da = new FbDataAdapter(cmd);
				da.Fill(dt);

				gvitems.DataSource = dt;
				gvitems.DataBind();

				SendEmail(dt);
			}
		}

		//https://stackoverflow.com/a/32336
		private void SendEmail(DataTable dt)
		{
			for (int i = 0; i < dt.Rows.Count; i++)
			{
				string email = dt.Rows[i]["EMAIL"].ToString();
				if (email == string.Empty)
				{
					TextArea1.InnerText += ("Email NOT sent to " + dt.Rows[i]["NOM"].ToString() + "\n");
					break;
				}
				var fromAddress = new MailAddress("alamia5020@gmail.com", "Amine Alami");
				var toAddress = new MailAddress(dt.Rows[i]["EMAIL"].ToString());
				const string fromPassword = "aminox7895123";
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
				TextArea1.InnerText += ("Email sent to " + dt.Rows[i]["NOM"].ToString() + "\n");
			}
		}
	}
}