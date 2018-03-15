<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Attendance.aspx.cs" Inherits="ASP_ProjectFina.HR.Attendance" %>

<%@ Register Src="~/Calender.ascx" TagPrefix="uc1" TagName="Calender" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row col-md-12">
        <h2>Employee Attendance</h2>
   
    <div id="entryTable">
        <div id="deptEntry">
            <div class="form-group">
                <label class="control-label">Employee Code</label>
                <asp:TextBox ID="txtEmpCode" runat="server" CssClass="form-control" AutoPostBack="True" OnTextChanged="txtEmpCode_TextChanged"></asp:TextBox>
            </div>
          
             <div class="form-group" style="width:280px">
                <label class="control-label">Employee Name</label>
                <asp:DropDownList ID="ddlEmployee" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="form-group">
                <label class="control-label">Attendance Date</label>
                <uc1:Calender runat="server" ID="Calender" />
            </div>
            
            <div class="form-group">
                <label class="control-label">In Hour</label>
                <asp:TextBox ID="txtInHour" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            
            <div class="form-group">
                <label class="control-label">In Minute</label>
                <asp:TextBox ID="txtInMinute" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="control-label">Out Hour</label>
                <asp:TextBox ID="txtOutHour" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="control-label">Out Minute</label>
                <asp:TextBox ID="txtOutMinute" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label class="control-label">Attendance Status</label>
                <asp:DropDownList ID="ddlAttStatus" runat="server" CssClass="form-control">
                    <asp:ListItem Value="P">Present</asp:ListItem>
                    <asp:ListItem Value="A">Absent</asp:ListItem>
                    <asp:ListItem Value="L">Late</asp:ListItem>
                    <asp:ListItem Value="OD">On Duty</asp:ListItem>
                </asp:DropDownList>
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
