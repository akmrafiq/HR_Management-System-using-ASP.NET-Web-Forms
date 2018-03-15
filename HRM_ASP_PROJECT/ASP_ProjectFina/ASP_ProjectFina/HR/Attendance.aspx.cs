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
    public partial class Attendance : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-LEO7ORE;Initial Catalog=HR_PAYROLL;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGrid();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SqlDataAdapter sda = new SqlDataAdapter("Select * from tblAttendence where EmpCode='" + txtEmpCode.Text + "'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlEmployee.SelectedValue = dt.Rows[0]["EmpCode"].ToString();
            (Calender.FindControl("TextBox1") as TextBox).Text = dt.Rows[0]["AttDate"].ToString();
            txtInHour.Text = dt.Rows[0]["InHour"].ToString();

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var date = (Calender.FindControl("TextBox1") as TextBox).Text;
           
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into tblAttendence(EmpCode,AttDate,InHour,InMinute,OutHour,OutMinute,AttStatus)values('" + ddlEmployee.SelectedValue + "','" + date + "','" + txtInHour.Text + "','" + txtInMinute.Text + "','" + txtOutHour.Text + "','" + txtOutMinute.Text + "','" + ddlAttStatus.SelectedValue + "')", con);
            cmd.ExecuteNonQuery();
            ClearAll();
            Literal1.Text = "Data save successfully.";
            LoadGrid();
            con.Close();
        }
        private void ClearAll()
        {
           
            ddlEmployee.SelectedIndex=-1;
            (Calender.FindControl("TextBox1") as TextBox).Text="";
            txtInHour.Text="";
            txtInMinute.Text="";
            txtOutHour.Text="";
            txtOutMinute.Text="";
            ddlAttStatus.SelectedIndex = -1;
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update tblAttendence set EmpCode='" + ddlEmployee.SelectedValue + "',InHour='" + txtInHour.Text + "',InMinute='" + txtInMinute.Text + "',OutHour='" + txtOutHour.Text + "',OutMinute='" + txtOutMinute.Text + "',AttStatus='" + ddlAttStatus.SelectedValue+ "',AttDate='" + (Calender.FindControl("TextBox1") as TextBox).Text + "' where EmpCode='" + txtEmpCode.Text + "'", con);
            cmd.ExecuteNonQuery();
            ClearAll();
            Literal1.Text = "Data Updated successfully.";
            LoadGrid();
            con.Close();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("delete from tblAttendence where EmpCode='" + txtEmpCode.Text + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            Literal1.Text = "Data Deleted successfully";
            ClearAll();
            LoadGrid();
            con.Close();
        }
        private void LoadGrid()
        {
            SqlDataAdapter sda = new SqlDataAdapter("Select EmpCode,AttDate,(InHour+':'+InMinute) as Intime, (OutHour+':'+OutMinute) as OutTime,AttStatus from tblAttendence", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        protected void txtEmpCode_TextChanged(object sender, EventArgs e)
        {
            SqlDataAdapter sda = new SqlDataAdapter("select * from tblEmployee where EmpCode='" + txtEmpCode.Text + "'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlEmployee.DataSource = dt;
            ddlEmployee.DataBind();
            ddlEmployee.DataTextField = "EmpName";
            ddlEmployee.DataValueField = "EmpCode";
            ddlEmployee.DataBind();
        }
    }
}