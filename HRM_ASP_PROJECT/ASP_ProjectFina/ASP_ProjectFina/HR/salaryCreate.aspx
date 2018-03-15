<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="salaryCreate.aspx.cs" Inherits="ASP_ProjectFina.HR.salaryCreate" %>

<%@ Register Src="~/Calender.ascx" TagPrefix="uc1" TagName="Calender" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Create Salary</h2>
    <div class="row">
        <div class="col-md-3">
            <div class="form-group">
                <label class="control-label">Select Date</label>
                <uc1:Calender runat="server" ID="Calender" />
            </div>
            <div class="form-group">
                <label class="control-label">Select Month</label>
                <asp:DropDownList ID="ddlMonth" runat="server" CssClass="form-control">
                    <asp:ListItem Value="1">Jan</asp:ListItem>
                    <asp:ListItem Value="2">Feb</asp:ListItem>
                    <asp:ListItem Value="3">March</asp:ListItem>
                    <asp:ListItem Value="4">April</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label class="control-label">Select Year</label>
                <asp:DropDownList ID="ddlYear" runat="server" CssClass="form-control">
                    <asp:ListItem Value="2018">2018</asp:ListItem>
                    <asp:ListItem Value="2017">2017</asp:ListItem>
                    <asp:ListItem Value="2016">2016</asp:ListItem>
                    <asp:ListItem Value="2015">2015</asp:ListItem>
                </asp:DropDownList>
            </div>
             <div class="form-group">
                 <asp:Button CssClass="btn btn-primary" ID="btnCreateSalary" runat="server" Text="Create Salary" />
            </div>
        </div>
    </div>
</asp:Content>
