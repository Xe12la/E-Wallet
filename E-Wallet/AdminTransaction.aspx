<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminTransaction.aspx.cs" Inherits="E_Wallet.AdminTransaction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <center>
         <div>    <button type="button" class="btn btn-primary" style="width: 265px">Admin: <span class="badge bg-secondary" style="left: 2px; top: -2px; width: 162px">  <%Response.Write(Session["username"]);%></span></button>
             <br />
             <br />
            <asp:Button CssClass="btn btn-outline-warning w3-hover-blue" ID="Button1" runat="server" Text="MY PROFILE" OnClick="Button1_Click" Font-Names="Hobo Std" Height="47px" Width="176px" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button CssClass="btn btn-outline-warning w3-hover-blue" ID="Button4" runat="server" Text="CREATE NEW ADMIN" OnClick="Button4_Click" PostBackUrl="~/Create_Admin_Account.aspx" Font-Names="Hobo Std" Height="47px" Width="176px" />
         </div>
        <br />
        <br />
         <div>
                 <button type="button" class="btn btn-success" style="width: 240px; height: 33px;"><span class="badge bg-secondary" style="left: 0px; top: -1px; width: 183px; height: 19px;">User</span></button>
             <br />
             <br />
                <asp:Button  CssClass="btn btn-outline-success w3-hover-green" ID="Button2" runat="server" Text="USER TRANSACTION" OnClick="Button2_Click" Font-Names="Hobo Std" Height="47px" Width="176px"/> 
             &nbsp;&nbsp;&nbsp;
                <asp:Button  CssClass="btn btn-outline-success w3-hover-green" ID="Button3" runat="server" Text="USER INFORMATION" OnClick="Button3_Click" Font-Names="Hobo Std" Height="47px" Width="176px"/>
         </div>
    </center>
    <br />
    <br />
    <br />
    <div>
     <asp:Button CssClass="btn btn-primary btn-lg w3-border-red w3-round" ID="Button5" runat="server" Text="LOG OUT" Height="41px" Width="100px" OnClick="Button5_Click" PostBackUrl="~/LoginADMIN.aspx" Font-Size="Small"/>
    </div>
  
</asp:Content>
