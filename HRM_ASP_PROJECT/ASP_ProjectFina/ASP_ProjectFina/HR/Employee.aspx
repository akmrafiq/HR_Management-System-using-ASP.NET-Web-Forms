<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Employee.aspx.cs" Inherits="ASP_ProjectFina.HR.Employee" %>

<%@ Register Src="~/Calender.ascx" TagPrefix="uc1" TagName="Calender" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-12">
        <h2>Employee Entry</h2>
        <div id="entry">
            <div class="col-md-6">
                <div class="form-group">
                    <label class="control-label">Employee Code</label>
                    <asp:TextBox ID="txtEmpCode" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label">Employee Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label">Address</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label">Date Of Birth</label>
                    <uc1:Calender runat="server" ID="calenderDOB" />

                </div>
               
                <div class="form-group">
                    <label class="control-label">Gender</label>
                    <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-control" style="width:286px;">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label class="control-label">Mobile No</label>
                    <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
               

            </div>
            <div class="col-md-6">

               <%-- <div class="form-group">
                    <label class="control-label">NID</label>
                    <asp:TextBox ID="txtNid" runat="server" CssClass="form-control"></asp:TextBox>
                </div>--%>
                <div class="form-group">
                    <label class="control-label">Joining Date</label>
                    <uc1:Calender runat="server" ID="CalenderJoiningDate" />
                </div>
                <div class="form-group" style="width:280px">
                    <label class="control-label">Department</label>
                    <asp:DropDownList ID="ddlDept" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlDept_SelectedIndexChanged"></asp:DropDownList>

                </div>
                <div class="form-group" style="width:280px">
                    <label class="control-label">Designation</label>
                    <asp:DropDownList ID="ddlDesig" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group" style="width:280px">
                    <label class="control-label">Section</label>
                    <asp:DropDownList ID="ddlSection" runat="server" CssClass="form-control"></asp:DropDownList>

                </div>
                <div class="form-group" style="width:280px">
                    <label class="control-label">Division</label>
                    <asp:DropDownList ID="ddlDividion" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group" style="width:280px">
                    <label class="control-label">Employee Type</label>
                    <asp:DropDownList ID="ddlEmpType" runat="server" CssClass="form-control"></asp:DropDownList>

                </div>

                <div class="form-group">
                    <label class="control-label">Current Salary</label>
                    <asp:TextBox ID="txtCrrntSalary" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            <%--    <div class="form-group">
                    <label class="control-label">Account No</label>
                    <asp:TextBox ID="txtAcntName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label">Bank Name</label>
                    <asp:TextBox ID="txtBankName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>--%>

            </div>
            <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            <div class="form-group">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click"  />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="btnDelete_Click" />
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-default" OnClick="btnSearch_Click" />
            </div>

        </div>
    </div>
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered"></asp:GridView>
    <style type="text/css">
        #entry{
            width:100%;
            margin:20px auto;
            margin-left:100px;
        }
    </style>
</asp:Content>
