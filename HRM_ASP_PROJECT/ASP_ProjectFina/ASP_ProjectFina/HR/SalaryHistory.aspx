<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SalaryHistory.aspx.cs" Inherits="ASP_ProjectFina.HR.SalaryHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row col-md-12">
        <h2>Salary History</h2>

        <div id="entryTable">
            <div id="deptEntry">
                <div class="form-group">
                    <label class="control-label">Employee Code</label>
                    <asp:TextBox ID="txtEmpCode" runat="server" CssClass="form-control" AutoPostBack="true" OnTextChanged="txtEmpCode_TextChanged"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label">Employee Name :</label>
                    <asp:Label style="color:#152df1;font-weight:bold;font-size:15px;" ID="lblEmpName" runat="server" Text="" CssClass="control-label"></asp:Label>
                    
                </div>
                <div class="form-group">
                    <label class="control-label">Department :</label>
                    <asp:Label style="color:#152df1;font-weight:bold;font-size:15px;" ID="lblDepartment" runat="server"  Text="" CssClass="control-label"></asp:Label>
                </div>
                <div class="form-group">
                    <label class="control-label">Salary :</label>
                    <asp:TextBox ID="txtSalary" runat="server" ></asp:TextBox>
                    <asp:Button ID="btnCalculate" runat="server" Text="Calculate" OnClick="btnCalculate_Click" />
                </div>
                <div class="form-group">
                    <label class="control-label">Gross :</label>
                    <asp:Label style="color:#152df1;font-weight:bold;font-size:15px;" ID="lblGross" runat="server"  Text="" CssClass="control-label"></asp:Label>
                </div>
                <div class="form-group">
                    <label class="control-label">Basic :</label>
                    <asp:Label style="color:#152df1;font-weight:bold;font-size:15px;" ID="lblBasic" runat="server"  Text="" CssClass="control-label"></asp:Label>
                </div>
                 <div class="form-group">
                    <label class="control-label">House Rent :</label>
                    <asp:Label style="color:#152df1;font-weight:bold;font-size:15px;" ID="lblHouseRent" runat="server"  Text="" CssClass="control-label"></asp:Label>
                </div>
                <div class="form-group">
                    <label class="control-label">Medical :</label>
                    <asp:Label style="color:#152df1;font-weight:bold;font-size:15px;" ID="lblMedical" runat="server"  Text="" CssClass="control-label"></asp:Label>
                </div>
                <div class="form-group">
                    <label class="control-label">Others Allowance :</label>
                    <asp:Label style="color:#152df1;font-weight:bold;font-size:15px;" ID="lblOthersAll" runat="server"  Text="" CssClass="control-label"></asp:Label>
                </div>
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                <div class="form-group">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click" />
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" />
                </div>
            </div>
            <div id="edit">
                <div class="form-group">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-default" OnClick="btnSearch_Click" />
                </div>
            </div>

        </div>

        <style type="text/css">
            .row {
                min-height: 400px;
            }

            #entryTable {
                width: 500px;
                margin: 10px auto;
                margin-top: 50px;
            }

            #deptEntry {
                width: 500px;
                margin: 10px auto;
                float: left;
            }

            #edit {
                width: 100px;
                float: left;
                margin-top: 35px;
                margin-left: -3px;
            }
        </style>
    </div>
</asp:Content>
