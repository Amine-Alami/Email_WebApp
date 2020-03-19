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
	public partial class Personnel : System.Web.UI.Page
	{
		FbConnection cnx = new FbConnection("database=localhost:\\Users\\hp\\Desktop\\stage\\OT.FDB;user=sysdba;password=masterkey");

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!Page.IsPostBack)
			{
				if (Session["User"] == null)
					Response.Redirect("Carousel.aspx");
				TextBoxDU.Text = ("2019-01-01");
				TextBoxAU.Text = DateTime.Now.ToString("yyyy-MM-dd");

				DataTable dt = GetData();
				
				GridView1.DataSource = dt;
				GridView1.DataBind();
				
			}
		}

		private DataTable GetData()
		{
			if (cnx.State == ConnectionState.Open)
				cnx.Close();
			cnx.Open();
			DataTable dt = new DataTable();
			FbCommand cmd = new FbCommand("GETDETAILSONE", cnx, cnx.BeginTransaction());
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.AddWithValue("@DU", TextBoxDU.Text);
			cmd.Parameters.AddWithValue("@AU", TextBoxAU.Text);
			cmd.Parameters.AddWithValue("@MATR", Session["User"].ToString());
			FbDataAdapter da = new FbDataAdapter(cmd);
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
		public string SortDireaction
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
		
	}
}