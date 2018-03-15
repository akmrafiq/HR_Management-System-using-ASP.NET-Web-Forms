<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Department.aspx.cs" Inherits="ASP_ProjectFina.HR.Department" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row col-md-12">
        <h2>Department Entry</h2>
   
    <div id="entryTable">
        
        <div id="deptEntry">
            <div class="form-group">
                <label class="control-label">Department Code</label>
                <asp:TextBox ID="txtDeptCode" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="control-label">Department Name</label>
                <asp:TextBox ID="txtDept" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            <div class="form-group">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-success" OnClick="btnSave_Click"/>
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdate_Click"/>
                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger" OnClick="btnDelete_Click"/>
                
            </div>
        </div>
        <div id="edit">
            <div class="form-group">
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-default" OnClick="btnSearch_Click" />
            </div>
        </div>

    </div>
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#DCDCDC" />
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />

        </asp:GridView>
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
</asp:Content>
