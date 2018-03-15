<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TransferRecord.aspx.cs" Inherits="ASP_ProjectFina.HR.TransferRecord" %>

<%@ Register Src="~/Calender.ascx" TagPrefix="uc1" TagName="Calender" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-12">
        <h2>Transfer Record Entry</h2>
        <div id="entry">
            <div id="entryForm">
                <div class="form-group">
                    <label class="control-label">Employee Code</label>
                    <asp:TextBox ID="txtEmpCode" runat="server" CssClass="form-control" OnTextChanged="txtEmpCode_TextChanged" AutoPostBack="true"></asp:TextBox>
                </div>

                <%--<div class="form-group" style="width: 280px">
                    <label class="control-label">Employee Name</label>
                    <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>--%>
                <div>
                    <table id="empInfo">
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
                                <asp:Label ID="Label2" runat="server" Text="Employee Old Department :"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblEmpDept" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <asp:Label ID="Label3" runat="server" Text="Employee Old Designation :"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblDesi" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>

                        <tr>
                            <th>
                                <asp:Label ID="Label6" runat="server" Text="Employee Old Division :"></asp:Label>
                            </th>
                            <td>
                                <asp:Label ID="lblempDiv" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>

                    </table>
                </div>
                <div class="form-group">
                    <label class="control-label">New Department</label>
                    <asp:DropDownList ID="ddlDept" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlDept_SelectedIndexChanged" Style="width: 286px;"></asp:DropDownList>
                </div>


                <div class="form-group">
                    <label class="control-label">New Designation</label>
                    <asp:DropDownList ID="ddlDesig" runat="server" CssClass="form-control" Style="width: 286px;"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="control-label">New Division</label>
                    <asp:DropDownList ID="ddlDividion" runat="server" CssClass="form-control" Style="width: 286px;"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="control-label">Transfer Active date</label>
                    <uc1:Calender runat="server" ID="Calender1" />
                </div>
                <div class="form-group">
                    <label class="control-label">State Status</label>
                    <asp:DropDownList ID="ddlSatus" runat="server" CssClass="form-control" Style="width: 286px;">
                        <asp:ListItem>Approved</asp:ListItem>
                        <asp:ListItem>Pending</asp:ListItem>
                        <asp:ListItem>Deny</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                <div class="form-group" id="buttons">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click" />
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-primary" OnClick="btnSearch_Click" />
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

        #empInfo td {
            color: #2069d0;
            font-size: 18px;
            font-weight: bold;
        }

        #empInfo th {
            color: #ff6a00;
        }

        #entryForm {
            width: 70%;
            margin: 15px auto;
        }
    </style>
</asp:Content>
