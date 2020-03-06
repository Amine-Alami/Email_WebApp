using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;
using FirebirdSql.Data.FirebirdClient;
using System.Net;
using System.Net.Mail;

namespace Email_WebApp
{
	public partial class Main : System.Web.UI.Page
	{
		FbConnection cnx = new FbConnection("database=localhost:\\Users\\hp\\Desktop\\stage\\OT.FDB;user=sysdba;password=masterkey");

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				if (cnx.State == ConnectionState.Open)
					cnx.Close();
				cnx.Open();

				//FbCommand cmd = new FbCommand("select first 50 MATRICULE_152, PRENOM_152, EMAIL_152, DATE_COMPT_210, ('de  ' ||HE_COMPT_210 || '  à  ' || HS_COMPT_210) AS PERIODE ,CUMUL_ARRONDI_210 from T_0152_PERSONNEL join t_0210_mvts on MATRICULE_152 = MATRICULE_152_210", cnx, cnx.BeginTransaction());
				FbCommand cmd = new FbCommand("GETPERSONNEL", cnx, cnx.BeginTransaction());
				//cmd.CommandType = CommandType.Text;	
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.AddWithValue("@num", 50);
				DataTable dt = new DataTable();
				dt.Clear();
				FbDataAdapter da = new FbDataAdapter(cmd);
				da.Fill(dt);

				//https://www.aspsnippets.com/Articles/Display-data-from-database-in-HTML-table-in-ASPNet.aspx

				//Building an HTML string.
				StringBuilder html = new StringBuilder();
				
				//Building the Data rows.
				foreach (DataRow row in dt.Rows)
				{
					html.Append("<tr>");

					html.Append("<td>");
					html.Append("<input type=\"checkbox\" name=\"CheckSelect").Append(row["MATRICULE"]).Append("\">");
					html.Append("</td>");

					foreach (DataColumn column in dt.Columns)
					{
						html.Append("<td>");
						html.Append(row[column.ColumnName]);
						html.Append("</td>");
					}
					html.Append("</tr>");

					// string ss = $"test { html }";
					
				}
				datatableBody.Controls.Add(new Literal
				{
					Text = html.ToString()
				});

				// Activate the code below when you're ready to send emails
				// SendEmail(dt);
			}
		}

		//https://stackoverflow.com/a/32336
		/*private void SendEmail(DataTable dt)
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
		}*/
	}
}