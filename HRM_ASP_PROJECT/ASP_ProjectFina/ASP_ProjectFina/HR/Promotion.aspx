<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Promotion.aspx.cs" Inherits="ASP_ProjectFina.HR.Promotion" %>
<%@ Register Src="~/Calender.ascx" TagPrefix="uc1" TagName="Calender" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-md-12">
        <h2>Benefit table Entry</h2>
        <div id="entry">
            <div class="col-md-6">
                <div class="form-group">
                    <label class="control-label">Benefit Code</label>
                    <asp:TextBox ID="txtEmpCode" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group" style="width: 280px">
                    <label class="control-label">Employee Name</label>
                    <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="control-label">Benefit Amount</label>
                    <asp:TextBox ID="txtBenfitAmount" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label">Benefit Active Date</label>
                    <uc1:Calender runat="server" ID="Calender1" />
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
                    <label class="control-label">Previous Net Salary</label>
                    <asp:TextBox ID="txtPrevNetSal" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label">New Net Salary</label>
                    <asp:TextBox ID="txtNewNetSal" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label">Gross Amount</label>
                    <asp:TextBox ID="txtGross" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label">Basic</label>
                    <asp:TextBox ID="txtbasic" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <label class="control-label">House Rent</label>
                    <asp:TextBox ID="txtHuRent" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label">Medical</label>
                    <asp:TextBox ID="txtMedical" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label">Convence All</label>
                    <asp:TextBox ID="txtConvence" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label">Cash Intensive</label>
                    <asp:TextBox ID="txtCash" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label">Launce Allowance</label>
                    <asp:TextBox ID="txtLaunceAll" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label">Other Allowance</label>
                    <asp:TextBox ID="txtOthers" runat="server" CssClass="form-control"></asp:TextBox>
                </div>


                <div class="form-group">
                    <label class="control-label">State Status</label>
                    <asp:TextBox ID="txtState" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label class="control-label">Benefit Active Date</label>
                    <uc1:Calender runat="server" ID="Calender" />
                </div>
                <div class="form-group">
                    <label class="control-label">Remarks</label>
                    <asp:TextBox ID="txtRemarks" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

            </div>

            <div class="form-group" id="buttons" >
                <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn btn-success" />
                <asp:Button ID="Button2" runat="server" Text="Update" CssClass="btn btn-primary" />
                <asp:Button ID="Button3" runat="server" Text="Delete" CssClass="btn btn-danger" />
            </div>

        </div>
    </div>

    <style type="text/css">
        #entry {
            width: 100%;
            margin: 20px auto;
            margin-left: 100px;
        }
        #buttons{
            margin-left:20px;
        }
    </style>
</asp:Content>
