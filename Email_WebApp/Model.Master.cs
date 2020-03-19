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
using System.IO;

namespace Firebird_Test
{
	public partial class Model : System.Web.UI.MasterPage
	{
		FbConnection cnx = new FbConnection("database=localhost:\\Users\\hp\\Desktop\\stage\\OT.FDB;user=sysdba;password=masterkey");

		protected void Page_Load(object sender, EventArgs e)
		{
			if (Session["User"] == null)
			{
				login.Visible = true;
				logout.Visible = false;
			}
			else
			{
				login.Visible = false;
				logout.Visible = true;
				ProfileName.InnerHtml = Session["Name"].ToString();
			}
		}

		protected void btnSignIN_Click(object sender, EventArgs e)
		{
			if (cnx.State == ConnectionState.Open)
				cnx.Close();
			cnx.Open();
			DataTable dt = new DataTable();
			FbCommand cmd = new FbCommand("GETLOGIN", cnx, cnx.BeginTransaction());
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.AddWithValue("@MATR", txtLogin.Text);

			FbDataAdapter da = new FbDataAdapter(cmd);
			da.Fill(dt);

			if (dt.Rows.Count != 0)
			{
				string password = dt.Rows[0]["PASS"].ToString();
				if (password == "")
					password = dt.Rows[0]["LOGIN"].ToString();

				if ((txtLogin.Text == dt.Rows[0]["LOGIN"].ToString() && txtPass.Text == password))
				{
					Session["User"] = txtLogin.Text;
					Session["Name"] = dt.Rows[0]["PRENOM"].ToString();
					Response.Redirect("Personnel.aspx");
				}
			}
			else if (txtLogin.Text == "admin" && txtPass.Text == "admin")
			{
				Session["User"] = txtLogin.Text;
				Session["Name"] = txtLogin.Text;
				Response.Redirect("Employees.aspx");
			}
		}

		protected void NavSignin_Click(object sender, EventArgs e)
		{

		}

		protected void btnLogout_Click(object sender, EventArgs e)
		{
			Session.Contents.Remove("User");
			Response.Redirect("Carousel.aspx");
		}

		protected void btnActivity_Click(object sender, EventArgs e)
		{
			if (Session["User"] != null)
			{
				if (Session["User"].ToString() == "admin")
					Response.Redirect("Employees.aspx");
				else
					Response.Redirect("Personnel.aspx");
			}
		}

		protected void btnProfile_Click(object sender, EventArgs e)
		{
			if (Session["User"] != null)
			{
				Response.Redirect("Profile.aspx");
			}
		}
	}
}