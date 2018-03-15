<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BenefitInfo.aspx.cs" Inherits="ASP_ProjectFina.HR.Promotion" %>

<%@ Register Src="~/Calender.ascx" TagPrefix="uc1" TagName="Calender" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-12">
        <h2>Benefit table Entry</h2>
        <div id="entry">
            <div id="mainEntryArea">
                <div class="form-group">
                    <label class="control-label">Employee Code</label>
                    <asp:TextBox ID="txtEmpCode" runat="server" CssClass="form-control" OnTextChanged="txtEmpCode_TextChanged" AutoPostBack="True"></asp:TextBox>
                </div>
                <div>
                    <table>
                        <tr>
                            <th>
                                <asp:Label ID="Label1" runat="server" Text="Employee Name :"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblEmpName" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="Label2" runat="server" Text="Employee Department :"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblEmpDept" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="Label3" runat="server" Text="Employee Designation :"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblDesi" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="Label4" runat="server" Text="Employee Type :"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblempType" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="Label6" runat="server" Text="Employee Division :"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblempDiv" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="Label5" runat="server" Text="Previous Gross Sallary :"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblPrevGrossSalary" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>

                
                <div class="form-group" style="width: 280px">
                    <label class="control-label">Benefit Type</label>
                    <asp:DropDownList ID="ddlBenefitType" runat="server" CssClass="form-control">
                        <asp:ListItem>Increment</asp:ListItem>
                        <asp:ListItem>Promotion</asp:ListItem>
                        <asp:ListItem>Refixation</asp:ListItem>
                        <asp:ListItem Selected="True">---Select---</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="control-label">Benefit Amount</label>
                    <asp:TextBox ID="txtBenfitAmount" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnCalculate" runat="server" Text="Calculate" CssClass="btn btn-default" OnClick="btnCalculate_Click" />
                </div>
                <div>
                    <table>
                        <tr>
                            <th>
                                <asp:Label ID="Label7" runat="server" Text="New Gross Salary :"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblNewGroSalary" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="Label9" runat="server" Text="Basic :"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblBasic" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="Label11" runat="server" Text="House Rent :"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblHouseRent" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="Label13" runat="server" Text="Medical :"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblMedical" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="Label15" runat="server" Text="Other Allowance :"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblOtherAllowance" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="form-group">
                    <label class="control-label">State Status</label>
                    <asp:DropDownList ID="ddlSatus" runat="server" CssClass="form-control" style="width:286px;">
                        <asp:ListItem>Approved</asp:ListItem>
                        <asp:ListItem>Pending</asp:ListItem>
                        <asp:ListItem>Deny</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="control-label">Benefit Active Date</label>
                    <uc1:Calender runat="server" ID="Calender" />
                </div>
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                <div class="form-group" id="buttons">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click" />
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="btnDelete_Click" />
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-default"/>
                </div>

            </div>

            
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered"></asp:GridView>

        </div>
        
    </div>

    <style type="text/css">
        #entry {
            width: 100%;
            margin: 20px auto;
            margin-left: 100px;
        }

        #buttons {
            margin-left: 20px;
        }

        table td {
            color: #2069d0;
            font-size: 18px;
            font-weight: bold;
        }

        table th {
            color: #ff6a00;
        }
        #mainEntryArea{
            width:70%;
            margin:20px auto;
        }
        /*#btnSearch{
            float:right;
           
        }*/
    </style>
</asp:Content>
