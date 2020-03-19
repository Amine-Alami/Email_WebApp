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
				if (Session["User"] == null || Session["User"].ToString() != "admin")
					Response.Redirect("Carousel.aspx");
				TextBoxDU.Text = ("2019-01-01");
				TextBoxAU.Text = DateTime.Now.ToString("yyyy-MM-dd");

				TreeView1.CollapseAll();

				DataTable dt = GetData();
				

				GridView1.DataSource = dt;
				GridView1.DataBind();

				FillDropDownLists();


				// Activate the code below when you're ready to send emails
				//EmailClass.SendEmail(dt);
			}
		}

		private DataTable GetData()
		{
			if (cnx.State == ConnectionState.Open)
				cnx.Close();
			cnx.Open();
			DataTable dt = new DataTable();
			FbDataAdapter da;
			FbCommand cmd;
			if(DropDownListDetails.SelectedValue == "Total")
			{ 
				if (DropDownList2.SelectedValue == "")
				{
					cmd = new FbCommand("GETPERSONNELWS", cnx, cnx.BeginTransaction());
					cmd.CommandType = CommandType.StoredProcedure;
					cmd.Parameters.AddWithValue("@du", TextBoxDU.Text);
					cmd.Parameters.AddWithValue("@au", TextBoxAU.Text);
					cmd.Parameters.AddWithValue("@PRENMATR", TextBoxSearch.Text);
					cmd.Parameters.AddWithValue("@SEX", DropDownList1.SelectedValue);
				}else
				{
					cmd = new FbCommand("GETPERSONNEL", cnx, cnx.BeginTransaction());
					cmd.CommandType = CommandType.StoredProcedure;
					cmd.Parameters.AddWithValue("@du", TextBoxDU.Text);
					cmd.Parameters.AddWithValue("@au", TextBoxAU.Text);
					cmd.Parameters.AddWithValue("@PRENMATR", TextBoxSearch.Text);
					cmd.Parameters.AddWithValue("@SECT", DropDownList2.SelectedValue);
					cmd.Parameters.AddWithValue("@SEX", DropDownList1.SelectedValue);
				}
			}else
			{
				cmd = new FbCommand("GETDETAILS", cnx, cnx.BeginTransaction());
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.AddWithValue("@du", TextBoxDU.Text);
				cmd.Parameters.AddWithValue("@au", TextBoxAU.Text);
				cmd.Parameters.AddWithValue("@PRENMATR", TextBoxSearch.Text);
				cmd.Parameters.AddWithValue("@SECT", DropDownList2.SelectedValue);
				cmd.Parameters.AddWithValue("@SEX", DropDownList1.SelectedValue);
			}
			da = new FbDataAdapter(cmd);
			da.Fill(dt);

			TotalEmp.InnerText = dt.Rows.Count.ToString();
			int total = 0;
			foreach (DataRow row in dt.Rows)
			{
				total += int.Parse(row["TOTAL"].ToString());
			}
			TotalHs.InnerText = $"{total.ToString()} h";

			return dt;
		}

		private void FillDropDownLists()
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

			DropDownList2.Items.Insert(0, new ListItem("SECTION",""));

			DropDownList1.Items.Insert(0, new ListItem("SEXE", ""));
			DropDownList1.Items.Insert(1, new ListItem("HOMME", "M"));
			DropDownList1.Items.Insert(2, new ListItem("FEMME", "F"));
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

		protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
		{
			if (e.Row.RowType == DataControlRowType.DataRow)
			{
				(e.Row.FindControl("CheckBoxBody") as CheckBox).Checked = CheckBoxSelectAll.Checked;
			}
			
		}

		protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
		{
			DataTable dt = GetData();

			SetSortDirection(SortDireaction);
			if (dt != null)
			{
				//Sort the data.
				dt.DefaultView.Sort = e.SortExpression + " " + _sortDirection;
				GridView1.DataSource = dt;
				GridView1.DataBind();
				SortDireaction = _sortDirection;
				int columnIndex = 0;
				foreach (DataControlFieldHeaderCell headerCell in GridView1.HeaderRow.Cells)
				{
					if (headerCell.ContainingField.SortExpression == e.SortExpression)
					{
						columnIndex = GridView1.HeaderRow.Cells.GetCellIndex(headerCell);
					}
				}
				
			}
		}
		public string  SortDireaction
		{
			get
			{
				if (ViewState["SortDireaction"] == null)
					return string.Empty;
				else
					return ViewState["SortDireaction"].ToString();
			}
			set
			{
				ViewState["SortDireaction"] = value;
			}
		}
		private string _sortDirection;
		protected void SetSortDirection(string sortDirection)
		{
			if (sortDirection == "ASC")
			{
				_sortDirection = "DESC";

			}
			else
			{
				_sortDirection = "ASC";
			}
		}

		protected void TextBoxSearch_TextChanged(object sender, EventArgs e)
		{
			DataTable dt = GetData();

			GridView1.DataSource = dt;
			GridView1.DataBind();
		}

		protected void TextBoxDU_TextChanged(object sender, EventArgs e)
		{
			DataTable dt = GetData();

			GridView1.DataSource = dt;
			GridView1.DataBind();
		}

		protected void TextBoxAU_TextChanged(object sender, EventArgs e)
		{
			DataTable dt = GetData();

			GridView1.DataSource = dt;
			GridView1.DataBind();
		}

		protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
		{
			DataTable dt = GetData();

			GridView1.DataSource = dt;
			GridView1.DataBind();
		}

		protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
		{
			DataTable dt = GetData();

			GridView1.DataSource = dt;
			GridView1.DataBind();
		}

		protected void DropDownListDetails_SelectedIndexChanged(object sender, EventArgs e)
		{
			DataTable dt = GetData();

			GridView1.DataSource = dt;
			GridView1.DataBind();
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

		protected void CheckBoxBody_CheckedChanged(object sender, EventArgs e)
		{
			bool chk = true;
			foreach (GridViewRow row in GridView1.Rows)
			{
				CheckBox CheckBoxBody = (CheckBox)row.FindControl("CheckBoxBody");
				if (!CheckBoxBody.Checked)
				{
					chk = false;
				}
			}
			if (chk == false)
				CheckBoxSelectAll.Checked = false;
			else
				CheckBoxSelectAll.Checked = true;
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
			}else
			{
				var stack = new Stack<TreeNode>();
				stack.Push(e.Node);
				while (stack.Count > 0)
				{
					var node = stack.Pop();
					node.Checked = false;
					foreach (TreeNode childNode in node.ChildNodes)
					{
						stack.Push(childNode);
					}
				}
			}
		}

		protected void Reset_Click(object sender, EventArgs e)
		{
			TextBoxDU.Text = ("2019-01-01");
			TextBoxAU.Text = DateTime.Now.ToString("yyyy-MM-dd");
			TextBoxSearch.Text = "";
			DropDownList2.Items.Clear();
			DropDownList1.Items.Clear();
			FillDropDownLists();

			DataTable dt = GetData();

			GridView1.DataSource = dt;
			GridView1.DataBind();
		}
	}
}