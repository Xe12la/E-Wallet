<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Withdraw.aspx.cs" Inherits="E_Wallet.Withdraw" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <center><br />

    <h3>Withdraw Page</h3>
     <br />
         <button type="button" class="btn btn-primary">Balance: <span class="badge bg-secondary"> <%Response.Write(Session["bal"]);%></span></button>
 <br /> <br />
    <asp:Label ID="Label2" runat="server" Text="Amount to withdraw"></asp:Label>
     <br />
    <asp:TextBox class="w3-input w3-round w3-green" ID="txtwdrawAmt" runat="server"></asp:TextBox>
    <br />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button CssClass="btn btn-success btn-lg w3-border-dark-gray" ID="bntWithdraw" runat="server" Text="Withdraw" OnClick="bntWithdraw_Click" Font-Size="Small" Height="37px"/>
    <asp:Button CssClass="btn btn-success btn-lg w3-border-dark-gray" ID="Button2" runat="server" OnClick="Button1_Click" PostBackUrl="~/Transaction.aspx" style="margin-left: 34px" Text="Back" Font-Size="Small" Height="37px"/>
</center>
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
</asp:Content>
