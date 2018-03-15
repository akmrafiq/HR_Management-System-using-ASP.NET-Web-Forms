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
    public partial class Designation : System.Web.UI.Page
    {
        //SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-4IQEBB7\SQL2014;Initial Catalog=HR_PAYROLL;Integrated Security=True");
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-LEO7ORE;Initial Catalog=HR_PAYROLL;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGrid();
                ddlDepartmentLoad();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SqlDataAdapter sda = new SqlDataAdapter("Select * from tblDesignation where DesigCode='" + txtDesigCode.Text + "'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            txtDesig.Text = dt.Rows[0]["Designation"].ToString();
            ddlDept.SelectedValue = dt.Rows[0]["DeptCode"].ToString();
        }
       
        protected void btnSave_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into tblDesignation(DesigCode,Designation,DeptCode) values('" + txtDesigCode.Text + "','" + txtDesig.Text + "','"+ddlDept.SelectedValue+"')", con);
            cmd.ExecuteNonQuery();
            ClearAll();
            Literal1.Text = "Data save successfully.";
            LoadGrid();
            con.Close();
        }
        private void ClearAll()
        {
            txtDesigCode.Text = "";
            txtDesig.Text = "";
            ddlDept.SelectedIndex = -1;
            txtDesigCode.Focus();
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update tblDesignation set Designation='" + txtDesig.Text + "',DeptCode='"+ddlDept.SelectedValue+"' where DesigCode='" + txtDesigCode.Text + "'", con);
            cmd.ExecuteNonQuery();
            ClearAll();
            Literal1.Text = "Data Updated successfully.";
            LoadGrid();
            con.Close();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("delete from tblDesignation where DesigCode='" + txtDesigCode.Text + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            Literal1.Text = "Data Deleted successfully";
            ClearAll();
            LoadGrid();
            con.Close();
        }
        private void LoadGrid()
        {
            SqlDataAdapter sda = new SqlDataAdapter("Select * from tblDesignation", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        private void ddlDepartmentLoad()
        {
            SqlDataAdapter sda = new SqlDataAdapter("select * from tblDepartment", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlDept.DataSource = dt;
            ddlDept.DataTextField = "DepartmentName";
            ddlDept.DataValueField = "DeptCode";
            ddlDept.DataBind();
        }
    }
}