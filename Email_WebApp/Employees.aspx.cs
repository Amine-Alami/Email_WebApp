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

namespace Email_WebApp
{
	public partial class Main : System.Web.UI.Page
	{
		FbConnection cnx = new FbConnection("database=localhost:\\Users\\hp\\Desktop\\stage\\OT.FDB;user=sysdba;password=masterkey");
		
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				DataTable dt = GetData();
				TotalEmp.InnerText = dt.Rows.Count.ToString();
				int total = 0;
				foreach (DataRow row in dt.Rows)
				{
					total += int.Parse(row["TOTAL"].ToString());
				}
				TotalHs.InnerText = $"{total.ToString()} h";

				GridView1.DataSource = dt;
				GridView1.DataBind();

				FillDropDownList();


				// Activate the code below when you're ready to send emails
				//EmailClass.SendEmail(dt);
			}
		}

		private DataTable GetData()
		{
			if (cnx.State == ConnectionState.Open)
				cnx.Close();
			cnx.Open();

			FbCommand cmd = new FbCommand("GETPERSONNEL", cnx, cnx.BeginTransaction());
			cmd.CommandType = CommandType.StoredProcedure;
			//cmd.Parameters.AddWithValue("@du", "2020-02-03");
			//cmd.Parameters.AddWithValue("@au", "2020-02-08");

			DataTable dt = new DataTable();
			FbDataAdapter da = new FbDataAdapter(cmd);
			da.Fill(dt);
			return dt;
		}

		private void FillDropDownList()
		{
			if (cnx.State == ConnectionState.Open)
				cnx.Close();
			cnx.Open();

			FbCommand cmd = new FbCommand("GETSECTION", cnx, cnx.BeginTransaction());
			cmd.CommandType = CommandType.StoredProcedure;

			DataTable dt = new DataTable();
			FbDataAdapter da = new FbDataAdapter(cmd);
			da.Fill(dt);

			TotalDep.InnerText = dt.Rows.Count.ToString();

			DropDownList2.DataSource = dt;
			DropDownList2.DataTextField = "LIBELLE";
			DropDownList2.DataValueField = "CODE";
			DropDownList2.DataBind();

			DropDownList2.Items.Insert(0, new ListItem("SECTION", ""));
		}

		protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
		{
			DataTable dt = GetData();

			dt.DefaultView.RowFilter = $"PRENOM LIKE '{TextBoxSearch.Text}%' OR MATRICULE LIKE '{TextBoxSearch.Text}%' ";
			dt.DefaultView.RowFilter += $"AND PRENOM LIKE '{DropDownList1.SelectedValue}%' ";
			if (DropDownList2.SelectedValue != "")
				dt.DefaultView.RowFilter += $"AND SECTION = {DropDownList2.SelectedValue} ";
			
			
			GridView1.PageIndex = e.NewPageIndex;
			GridView1.DataSource = dt;
			GridView1.DataBind();
		}

		protected void TextBoxSearch_TextChanged(object sender, EventArgs e)
		{
			DataTable dt = GetData();
			dt.DefaultView.RowFilter = $"PRENOM LIKE '{TextBoxSearch.Text}%' OR MATRICULE LIKE '{TextBoxSearch.Text}%' ";
			dt.DefaultView.RowFilter += $"AND PRENOM LIKE '{DropDownList1.SelectedValue}%' ";
			if(DropDownList2.SelectedValue != "")
				dt.DefaultView.RowFilter += $"AND SECTION = {DropDownList2.SelectedValue} ";

			GridView1.DataSource = dt;
			GridView1.DataBind();
		}

		protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
		{
			DataTable dt = GetData();
			dt.DefaultView.RowFilter = $"PRENOM LIKE '{DropDownList1.SelectedValue}%' ";
			if (DropDownList2.SelectedValue != "")
				dt.DefaultView.RowFilter += $"AND SECTION = {DropDownList2.SelectedValue} ";
			dt.DefaultView.RowFilter += $"AND (PRENOM LIKE '{TextBoxSearch.Text}%' OR MATRICULE LIKE '{TextBoxSearch.Text}%') ";

			GridView1.DataSource = dt;
			GridView1.DataBind();
		}

		protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
		{
			DataTable dt = GetData();
			dt.DefaultView.RowFilter = $"PRENOM LIKE '{DropDownList1.SelectedValue}%' ";
			if (DropDownList2.SelectedValue != "")
				dt.DefaultView.RowFilter += $" AND SECTION = {DropDownList2.SelectedValue}";
			dt.DefaultView.RowFilter += $"AND (PRENOM LIKE '{TextBoxSearch.Text}%' OR MATRICULE LIKE '{TextBoxSearch.Text}%') ";

			GridView1.DataSource = dt;
			GridView1.DataBind();
		}

		protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				(e.Row.FindControl("CheckBoxBody") as CheckBox).Checked = CheckBoxSelectAll.Checked;
			}
			
		}

		protected void TreeView1_TreeNodeCheckChanged(object sender, TreeNodeEventArgs e)
		{
			if (e.Node.Checked)
			{
				var stack = new Stack<TreeNode>();
				stack.Push(e.Node);
				while (stack.Count > 0)
				{
					var node = stack.Pop();
					node.Checked = true;
					foreach (TreeNode childNode in node.ChildNodes)
					{
						stack.Push(childNode);
					}
				}
			}
		}

		protected void CheckBoxSelectAll_CheckedChanged(object sender, EventArgs e)
		{
			foreach (GridViewRow row in GridView1.Rows)
			{
				CheckBox CheckBoxBody = (CheckBox)row.FindControl("CheckBoxBody");
				if (CheckBoxSelectAll.Checked)
				{
					CheckBoxBody.Checked = true;
				}
				else
					CheckBoxBody.Checked = false;
			}
		}
	}
}