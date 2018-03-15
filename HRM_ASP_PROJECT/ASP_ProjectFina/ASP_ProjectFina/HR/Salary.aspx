<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Salary.aspx.cs" Inherits="ASP_ProjectFina.HR.Salary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row col-md-12">
        <h2>Salary Entry</h2>
   
    <div id="entryTable">
        <div id="deptEntry">
            <div class="form-group">
                <label class="control-label">Salary Code</label>
                <asp:TextBox ID="txtSalaryCode" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
             <div class="form-group" style="width:280px">
                <label class="control-label">Employee Name</label>
                <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="form-group">
                <label class="control-label">Basic</label>
                <asp:TextBox ID="txtbasic" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label class="control-label">House Rent</label>
                <asp:TextBox ID="txtHuRent" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label class="control-label">Medical</label>
                <asp:TextBox ID="txtMedical" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="control-label">Others Amount</label>
                <asp:TextBox ID="txtOthers" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="control-label">Gross Amount</label>
                <asp:TextBox ID="txtGross" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn btn-success"/>
                <asp:Button ID="Button2" runat="server" Text="Update" CssClass="btn btn-primary"/>
                <asp:Button ID="Button3" runat="server" Text="Delete" CssClass="btn btn-danger"/>
            </div>
            
        </div>
        <div id="edit">
            <div class="form-group">
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-default" />
            </div>
        </div>

    </div>
 
        <style type="text/css">
            .row{
                min-height:400px;
            }
            #entryTable{
                width:500px;
                margin:10px auto;
                margin-top:50px;
            }
            #deptEntry{
                width:300px;
                margin:10px auto;
                float:left;
                
                
            }
            #edit {
                 width:100px;
                float:left;
                margin-top:35px;
                margin-left:-3px;
            }

        </style>
    </div>
</asp:Content>
