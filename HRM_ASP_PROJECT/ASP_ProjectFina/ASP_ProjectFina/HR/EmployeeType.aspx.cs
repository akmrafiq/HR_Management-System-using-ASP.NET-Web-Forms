using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace ASP_ProjectFina.HR
{
    public partial class EmployeeType : System.Web.UI.Page
    //SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-4IQEBB7\SQL2014;Initial Catalog=HR_PAYROLL;Integrated Security=True");
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-LEO7ORE;Initial Catalog=HR_PAYROLL;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGrid();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into tblEmployeeType values('" + txtempTypeCode.Text + "','" + txtEmpType.Text + "')", con);
            cmd.ExecuteNonQuery();
            ClearAll();
            Literal1.Text = "Data save successfully.";
            LoadGrid();
            con.Close();
        }
        private void ClearAll()
        {
            txtempTypeCode.Text = "";
            txtEmpType.Text = "";
            txtempTypeCode.Focus();
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update tblEmployeeType set EmpType='" + txtEmpType.Text + "' where DesigCode='" + txtempTypeCode.Text + "'", con);
            cmd.ExecuteNonQuery();
            ClearAll();
            Literal1.Text = "Data Updated successfully.";
            LoadGrid();
            con.Close();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("delete from tblEmployeeType where EmpTypeCode='" + txtempTypeCode.Text + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            Literal1.Text = "Data Deleted successfully";
            ClearAll();
            LoadGrid();
            con.Close();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SqlDataAdapter sda = new SqlDataAdapter("Select * from tblEmployeeType where EmpTypeCode='" + txtempTypeCode.Text + "'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            txtEmpType.Text = dt.Rows[0]["EmpType"].ToString();
        }
        private void LoadGrid()
        {
            SqlDataAdapter sda = new SqlDataAdapter("Select * from tblEmployeeType", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}