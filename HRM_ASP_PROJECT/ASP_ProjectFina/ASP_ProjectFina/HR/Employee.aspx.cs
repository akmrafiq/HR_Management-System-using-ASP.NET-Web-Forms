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
    public partial class Employee : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-LEO7ORE;Initial Catalog=HR_PAYROLL;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadDepartment();
                LoadDesignation();
                LoadSection();
                LoadDivision();
                LoadEmpType();
                LoadGrid();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string dateDOB = (calenderDOB.FindControl("TextBox1") as TextBox).Text;
            string joiningDate = (CalenderJoiningDate.FindControl("TextBox1") as TextBox).Text;
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into tblEmployee (EmpCode,EmpName,Address,Email,DOB,ContactNo,Gender, "+
            " JoiningDate,DeptCode,DesigCode,SecCode,DivCode,EmpTypeCode,CurrentSalary) "+
             " values('" + txtEmpCode.Text.Trim() + "','" + txtName.Text.Trim() + "','" + txtAddress.Text + "','" + txtEmail.Text.Trim() + "','" + dateDOB + "','" + txtMobile.Text + "','" + ddlGender.SelectedItem.Text + "','" + joiningDate + "','" + ddlDept.SelectedValue + "','" + ddlDesig.SelectedValue + "','" + ddlSection.SelectedValue + "','" + ddlDividion.SelectedValue + "','" + ddlEmpType.SelectedValue + "','" + txtCrrntSalary.Text + "')", con);
            cmd.ExecuteNonQuery();
            con.Close();
            lblMsg.Text = "Data Saved Successfully!!!";
            LoadGrid();
            ClearAll();
        }
        private void LoadGrid()
        {
            SqlDataAdapter sda = new SqlDataAdapter("Select distinct e.EmpCode, e.EmpName,e.Address,e.Email,e.JoiningDate,e.ContactNo, "+
            " d.DepartmentName,di.Division,dg.Designation,et.EmpType from tblEmployee e "+
            " inner join tblDepartment d on e.DeptCode=d.DeptCode "+
            " inner join tblDivision di on e.DivCode=di.DivCode "+
            " inner join tblSection s on e.SecCode=s.SecCode "+
            " inner join tblEmployeeType et on e.EmpTypeCode=et.EmpTypecode "+
            " inner join tblDesignation dg on dg.DesigCode=e.DesigCode", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        private void LoadDepartment()
        {
            SqlDataAdapter sda = new SqlDataAdapter("Select DeptCode,DepartmentName from tblDepartment", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlDept.DataSource = dt;
            ddlDept.DataTextField = "DepartmentName";
            ddlDept.DataValueField = "DeptCode";
            ddlDept.DataBind();
        }
        private void LoadDesignation()
        {
            SqlDataAdapter sda = new SqlDataAdapter("Select DesigCode,Designation from tblDesignation", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlDesig.DataSource = dt;
            ddlDesig.DataTextField = "Designation";
            ddlDesig.DataValueField = "DesigCode";
            ddlDesig.DataBind();
        }
        private void LoadSection()
        {
            SqlDataAdapter sda = new SqlDataAdapter("Select SecCode,SectionName from tblSection", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlSection.DataSource = dt;
            ddlSection.DataTextField = "SectionName";
            ddlSection.DataValueField = "SecCode";
            ddlSection.DataBind();
        }
        private void LoadEmpType()
        {
            SqlDataAdapter sda = new SqlDataAdapter("Select EmpTypecode,EmpType from tblEmployeeType", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlEmpType.DataSource = dt;
            ddlEmpType.DataTextField = "EmpType";
            ddlEmpType.DataValueField = "EmpTypecode";
            ddlEmpType.DataBind();
        }
        private void LoadDivision()
        {
            SqlDataAdapter sda = new SqlDataAdapter("Select DivCode,Division from tblDivision", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlDividion.DataSource = dt;
            ddlDividion.DataTextField = "Division";
            ddlDividion.DataValueField = "DivCode";
            ddlDividion.DataBind();
        }

        protected void ddlDept_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataAdapter sda = new SqlDataAdapter("Select DesigCode,Designation from tblDesignation where DeptCode='"+ddlDept.SelectedValue+"'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            ddlDesig.DataSource = dt;
            ddlDesig.DataTextField = "Designation";
            ddlDesig.DataValueField = "DesigCode";
            ddlDesig.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string dateDOB = (calenderDOB.FindControl("TextBox1") as TextBox).Text;
            string joiningDate = (CalenderJoiningDate.FindControl("TextBox1") as TextBox).Text;
            SqlDataAdapter sda = new SqlDataAdapter("Select EmpCode,EmpName,Address,Email,DOB,ContactNo,Gender,JoiningDate,DeptCode,DesigCode,SecCode,DivCode,EmpTypeCode,CurrentSalary from tblEmployee where EmpCode='" + txtEmpCode.Text + "'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            txtName.Text = dt.Rows[0]["EmpName"].ToString();
            txtAddress.Text = dt.Rows[0]["Address"].ToString();
            txtEmail.Text = dt.Rows[0]["Email"].ToString();
            (calenderDOB.FindControl("TextBox1") as TextBox).Text = dt.Rows[0]["DOB"].ToString();
            txtMobile.Text = dt.Rows[0]["ContactNo"].ToString();
            ddlGender.SelectedValue = dt.Rows[0]["Gender"].ToString();
            (CalenderJoiningDate.FindControl("TextBox1") as TextBox).Text = dt.Rows[0]["JoiningDate"].ToString();
            ddlDept.SelectedValue = dt.Rows[0]["DeptCode"].ToString();
            ddlDesig.SelectedValue = dt.Rows[0]["DesigCode"].ToString();
            ddlSection.SelectedValue = dt.Rows[0]["SecCode"].ToString();
            ddlDividion.SelectedValue = dt.Rows[0]["DivCode"].ToString();
            ddlEmpType.SelectedValue = dt.Rows[0]["EmpTypeCode"].ToString();
            txtCrrntSalary.Text = dt.Rows[0]["CurrentSalary"].ToString();
            
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string dateDOB = (calenderDOB.FindControl("TextBox1") as TextBox).Text;
            string joiningDate = (CalenderJoiningDate.FindControl("TextBox1") as TextBox).Text;
            con.Open();
            SqlCommand cmd = new SqlCommand("update tblEmployee set EmpName='" + txtName.Text + "',Address='" + txtAddress.Text + "',Email='" + txtEmail.Text + "',DOB='" + dateDOB + "',ContactNo='" + txtMobile.Text + "',Gender='" + ddlGender.SelectedValue + "',JoiningDate='" + joiningDate + "',DeptCode='"+ddlDept.SelectedValue+"',DesigCode='"+ddlDesig.SelectedValue+"',SecCode='"+ddlSection.SelectedValue+"',DivCode='"+ddlDividion.SelectedValue+"',EmpTypeCode='"+ddlEmpType.SelectedValue+"',CurrentSalary='"+txtCrrntSalary.Text+"' where EmpCode='"+txtEmpCode.Text+"'", con);
            cmd.ExecuteNonQuery();
            ClearAll();
            con.Close();
            lblMsg.Text = "Data Updataed Successfully!!!";
            LoadGrid();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("delete from tblEmployee where EmpCode='" + txtEmpCode.Text + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            lblMsg.Text = "Data deleted Successfully!!!";
            LoadGrid();
        }
        private void ClearAll()
        {
            txtName.Text = "";
            txtAddress.Text="";
            txtEmail.Text ="";
            (calenderDOB.FindControl("TextBox1") as TextBox).Text="";
            txtMobile.Text=""; 
            ddlGender.SelectedIndex=-1;
            (CalenderJoiningDate.FindControl("TextBox1") as TextBox).Text="";
            ddlDept.SelectedIndex=-1;
            ddlDesig.SelectedIndex=-1;
            ddlSection.SelectedIndex=-1;
            ddlDividion.SelectedIndex=-1;
            ddlEmpType.SelectedIndex=-1;
            txtCrrntSalary.Text="";
            txtEmpCode.Text="";
            txtEmpCode.Focus();
        }
    }
}