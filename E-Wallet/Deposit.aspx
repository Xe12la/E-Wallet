<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Deposit.aspx.cs" Inherits="E_Wallet.Deposit11" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <br /> <br /> <br /> 
    <div>   
      </div>
    <div style="padding: 20px 30px 20px; background-color:#FFCCBC; width: 443px; margin-left: 354px;" class=" w3-round-xxlarge">
         <div style="padding: 10px 10px 10px; background-color:#00887A; width: 490px; margin-left: 0px; height: 61px;" class="w3-round-xlarge">
   <asp:Label ID="Label3" runat="server" Text="DEPOSIT" Font-Bold="True" Font-Italic="True" Font-Names="Leelawadee UI" ForeColor="#FF0066" Font-Size="XX-Large" Height="47px" Width="140px"></asp:Label>
           </div>
        <div>
            <asp:Label ID="Label2" runat="server" Font-Names="Arial Narrow" Font-Size="Small" Text="AMOUNT"></asp:Label>
        </div>   
        <div>
            <asp:TextBox class="w3-input w3-round w3-green" ID="txtdepAmount" runat="server"></asp:TextBox>
        </div>
        <br />
        <div style="width: 355px; margin-left: 28px">
           <asp:Button CssClass="btn btn-outline-success w3-hover-blue w3-hover-shadow" BackColor="#00887A" ID="Button1" runat="server" OnClick="Button1_Click" style="margin-left: 39px" Text="Deposit" Font-Size="Small" Height="37px" />
           <asp:Button CssClass="btn btn-primary btn-lg w3-border-dark-gray w3-hover-shadow" ID="Button2" runat="server" OnClick="Button1_Click" PostBackUrl="~/Transaction.aspx" style="margin-left: 43px" Text="Back" Font-Size="Small" Height="37px"/>
        </div>
        </div>
    <div></div>

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
