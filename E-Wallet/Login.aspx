<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="E_Wallet.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" >
       <br />
    <div style="padding:40px 60px 20px; background-color:#FFCCBC; width: 556px; margin-left: 292px; margin-right: 0px;" class="w3-round-large">
<div style="width: 557px; margin-left: 77px; background-color: cadetblue" class="w3-round-xxlarge">
        <div style="margin-left: 28px; width: 515px; height: 37px;"><span style="font-family: 'Cooper Std Black'; font-weight: bold; font-size: xx-large">WELCOME TO YOURE BANK</span><br /></div>
        <div style="margin-left: 187px; width: 200px;"><asp:Label ID="Label4" runat="server" Text="Have it your W A Y !"></asp:Label></div>
    </div>
    <div style="margin-left: 55px; background-color:lightsalmon; margin-top: 23px;" class="w3-round-xlarge">
    <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" Font-Names="Britannic Bold" Font-Size="Medium" Text="EMAIL: "></asp:Label>
        <asp:TextBox class="w3-input w3-round-large" BackColor="DarkSeaGreen" ID="txtUserName" runat="server" ></asp:TextBox>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label  ID="Label6" runat="server" Font-Names="Britannic Bold" Font-Size="Medium" Text="PASSWORD: "></asp:Label>
        <asp:TextBox class="w3-input w3-round-large" BackColor="DarkSeaGreen" ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
        <br />
        <div style="margin-left: 192px">
            <asp:Button CssClass="btn btn-outline-success w3-hover-blue w3-hover-shadow" BackColor="CadetBlue" ID="Button2" runat="server" OnClick="btnLOGIN_Click" style="margin-left: 2px" Text="LOG IN" Width="111px" Font-Size="Medium" />
       </div>
        <div style="width: 258px; margin-left: 98px">
            <asp:Label ID="Label3" runat="server" Text="Don't have an Account?"></asp:Label>
             &nbsp;<a href="createAccount.aspx" enableviewstate="True">Sign Up!</a>
        </div>
       
         <br />
         <br />
        </div>
    </div>
    <br />
    <br />
    <div>
        <p class="w3-center" style="text-shadow:2px 2px #FFFFFF"><a href="LoginADMIN.aspx">Admin</a></p>
    </div>
</asp:Content>
