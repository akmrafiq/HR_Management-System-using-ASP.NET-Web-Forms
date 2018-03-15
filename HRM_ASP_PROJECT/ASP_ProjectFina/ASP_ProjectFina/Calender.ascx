<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Calender.ascx.cs" Inherits="ASP_ProjectFina.Calender" %>
<%--<link href="Content/bootstrap.css" rel="stylesheet" />--%>
<style type="text/css">
    #TextBox1{
        float:left;
    }
    #ImageButton1{
        width:23px;
        margin-left:290px;
    }
    #Calendar1{
        margin-left:290px;
    }
</style>
<div class="form-group" style="width:320px;">
    <asp:TextBox ID="TextBox1" runat="server" Width="280" Height="35"></asp:TextBox>
    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/cal.png" OnClick="ImageButton1_Click"/>
    <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
</div>

