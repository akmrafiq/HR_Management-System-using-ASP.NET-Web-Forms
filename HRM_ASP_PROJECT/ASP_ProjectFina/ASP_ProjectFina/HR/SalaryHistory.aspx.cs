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
    public partial class SalaryHistory : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=DESKTOP-LEO7ORE;Initial Catalog=HR_PAYROLL;Integrated Security=True;");
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void txtEmpCode_TextChanged(object sender, EventArgs e)
        {
            SqlDataAdapter sda = new SqlDataAdapter("Select distinct e.EmpCode, e.EmpName,e.Address,e.Email,e.JoiningDate,e.ContactNo, "+
                " d.DepartmentName,di.Division,dg.Designation,et.EmpType from tblEmployee e "+
                " inner join tblDepartment d on e.DeptCode=d.DeptCode "+
                " inner join tblDivision di on e.DivCode=di.DivCode "+
                " inner join tblSection s on e.SecCode=s.SecCode "+
                " inner join tblEmployeeType et on e.EmpTypeCode=et.EmpTypecode "+
                " inner join tblDesignation dg on dg.DesigCode=e.DesigCode where EmpCode='emp-001'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            if(dt.Rows.Count>0)
            {
                lblEmpName.Text = dt.Rows[0]["EmpName"].ToString();
                lblDepartment.Text = dt.Rows[0]["DepartmentName"].ToString();
            }
        }
        protected void btnCalculate_Click(object sender, EventArgs e)
        {
            
            double grossAmount = Convert.ToDouble(txtSalary.Text);
            double basicAmount = grossAmount * .60;
            double houseRentAmount = grossAmount * .20;
            double medicalAmount = grossAmount * .10;
            double otherAllAmount = grossAmount * .10;

            lblGross.Text = grossAmount.ToString();
            lblBasic.Text = basicAmount.ToString();
            lblHouseRent.Text = houseRentAmount.ToString();
            lblMedical.Text = medicalAmount.ToString();
            lblOthersAll.Text = otherAllAmount.ToString();
        }
        
        protected void btnSave_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Insert into tblSalary (EmpCode,Basic,HouseRent,Medical,OtherAllowance,Gross) "+
            " values('"+txtEmpCode.Text+"','"+lblBasic.Text+"','"+lblHouseRent.Text+"','"+lblMedical.Text+"','"+lblOthersAll.Text+"','"+lblGross.Text+"')",con);
            cmd.ExecuteNonQuery();
            //update employee current salary
            SqlCommand cmd2 = new SqlCommand("update tblEmployee set CurrentSalary='"+lblGross.Text+"' where EmpCode='"+txtEmpCode.Text+"'",con);
            cmd2.ExecuteNonQuery();
            Literal1.Text = "Data saved successfully!!! ";
            con.Close();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SqlDataAdapter sda = new SqlDataAdapter("", con);
        }
    }
}