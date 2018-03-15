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
    public partial class Promotion : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-LEO7ORE;Initial Catalog=HR_PAYROLL;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGrid();
            }
        }

        protected void txtEmpCode_TextChanged(object sender, EventArgs e)
        {
            SqlDataAdapter sda = new SqlDataAdapter("Select distinct e.EmpName,e.CurrentSalary, " +
            " d.DepartmentName,di.Division,dg.Designation,et.EmpType from tblEmployee e " +
            " inner join tblDepartment d on e.DeptCode=d.DeptCode " +
            " inner join tblDivision di on e.DivCode=di.DivCode " +
            " inner join tblSection s on e.SecCode=s.SecCode " +
            " inner join tblEmployeeType et on e.EmpTypeCode=et.EmpTypecode " +
            " inner join tblDesignation dg on dg.DesigCode=e.DesigCode where e.EmpCode='"+txtEmpCode.Text+"'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                lblEmpName.Text = dt.Rows[0]["EmpName"].ToString();
                lblEmpDept.Text = dt.Rows[0]["DepartmentName"].ToString();
                lblDesi.Text = dt.Rows[0]["Designation"].ToString();
                lblempType.Text = dt.Rows[0]["EmpType"].ToString();
                lblempDiv.Text = dt.Rows[0]["Division"].ToString();
                lblPrevGrossSalary.Text = dt.Rows[0]["CurrentSalary"].ToString();
                
            }
            
        }

        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            
            double NewGrosAmount = Convert.ToDouble(lblPrevGrossSalary.Text )+Convert.ToDouble(txtBenfitAmount.Text);
            double basicAmount = NewGrosAmount * 0.60;
            double houseRentAmount = NewGrosAmount * 0.20;
            double MedicalAmount = NewGrosAmount * 0.10;
            double OtherAllowance = NewGrosAmount * 0.10;

            lblNewGroSalary.Text = NewGrosAmount.ToString();
            lblBasic.Text = basicAmount.ToString();
            lblHouseRent.Text = houseRentAmount.ToString();
            lblMedical.Text = MedicalAmount.ToString();
            lblOtherAllowance.Text = OtherAllowance.ToString();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string BenefitAcciDate=(Calender.FindControl("TextBox1") as TextBox).Text;
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into tblBenefit (EmpCode,BenefitAmount,BenefitType,PreviousNetSalary,NewNetSalary,Basic,HouseRent,Medical,otherAllowance,BenifitActiveDate) values('"+txtEmpCode.Text+"','"+txtBenfitAmount.Text+"','"+ddlBenefitType.SelectedValue+"','"+lblPrevGrossSalary.Text+"','"+lblNewGroSalary.Text+"','"+lblBasic.Text+"','"+lblMedical.Text+"','"+lblHouseRent.Text+"','"+lblOtherAllowance.Text+"','"+BenefitAcciDate+"')", con);
            SqlCommand cmd1 = new SqlCommand("update tblEmployee set CurrentSalary='"+lblNewGroSalary.Text+"' where EmpCode='"+txtEmpCode.Text+"'", con);
            cmd.ExecuteNonQuery();
            cmd1.ExecuteNonQuery();
            Literal1.Text = "Data saved successfully!!!";
            LoadGrid();
            ClearAll();
            con.Close();
        }

        private void ClearAll()
        {
            txtEmpCode.Text = "";
            lblEmpName.Text = "";
            lblEmpDept.Text = "";
            lblDesi.Text = "";
            lblempType.Text = "";
            lblempDiv.Text = "";
            txtBenfitAmount.Text = "";
            ddlBenefitType.SelectedIndex = -1;
            lblPrevGrossSalary.Text = "";
            lblNewGroSalary.Text = "";
            lblBasic.Text = "";
            lblMedical.Text = "";
            lblHouseRent.Text = "";
            lblOtherAllowance.Text = "";
            (Calender.FindControl("TextBox1") as TextBox).Text = "";
            txtEmpCode.Focus();
        }

        private void LoadGrid()
        {
            SqlDataAdapter sda = new SqlDataAdapter("select distinct EmpCode,BenefitAmount,BenefitType,PreviousNetSalary,NewNetSalary,Basic,HouseRent,Medical,otherAllowance,BenifitActiveDate from tblBenefit", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string BenefitAcciDate = (Calender.FindControl("TextBox1") as TextBox).Text;
            con.Open();
            SqlCommand cmd = new SqlCommand("update tblBenefit set BenefitAmount='" + txtBenfitAmount.Text + "',BenefitType='" + ddlBenefitType.SelectedValue + "',PreviousNetSalary='" + lblPrevGrossSalary.Text + "',NewNetSalary='" + lblNewGroSalary.Text + "',Basic='" + lblBasic.Text + "',HouseRent='" + lblHouseRent.Text + "',Medical='" + lblMedical.Text + "',otherAllowance='" + lblOtherAllowance.Text + "',BenifitActiveDate='" + BenefitAcciDate + "' where EmpCode='"+txtEmpCode.Text+"'", con);
            SqlCommand cmd1 = new SqlCommand("update tblEmployee set CurrentSalary='" + lblNewGroSalary.Text + "' where EmpCode='" + txtEmpCode.Text + "'", con);
            cmd.ExecuteNonQuery();
            cmd1.ExecuteNonQuery();
            Literal1.Text = "Data updated successfully!!!";
            LoadGrid();
            ClearAll();
            con.Close();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            
            SqlCommand cmd = new SqlCommand("delete from tblBenefit where EmpCode='"+txtEmpCode.Text+"'", con);
            cmd.ExecuteNonQuery();
            Literal1.Text = "Data Deleted successfully!!!";
        }

    }
}