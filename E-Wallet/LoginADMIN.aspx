<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LoginADMIN.aspx.cs" Inherits="E_Wallet.LoginADMIN" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <br />
    <div style="padding:40px 60px 20px; background-color:#FFCCBC; width: 556px; margin-left: 292px; margin-right: 0px;" class="w3-round-large">
<div style="width: 488px; margin-left: 173px; background-color: cadetblue" class="w3-round-xxlarge">
        <div style="margin-left: 28px; width: 266px; height: 37px;"><asp:Label ID="Label3" runat="server" Text="ADMIN LOGIN" Font-Bold="True" Font-Names="Cooper Std Black" Font-Size="XX-Large"></asp:Label><br /></div>
        <div style="margin-left: 59px; width: 303px;"><asp:Label ID="Label4" runat="server" Text="Have it your W A Y !"></asp:Label></div>
    </div>
    <div style="margin-left: 55px; background-color:lightsalmon; margin-top: 23px;" class="w3-round-xlarge">
    <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server" Font-Names="Britannic Bold" Font-Size="Medium" Text="EMAIL: "></asp:Label>
        <asp:TextBox class="w3-input w3-round-large" BackColor="DarkSeaGreen" ID="txtUserName" runat="server" ></asp:TextBox>
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label  ID="Label2" runat="server" Font-Names="Britannic Bold" Font-Size="Medium" Text="PASSWORD: "></asp:Label>
        <asp:TextBox class="w3-input w3-round-large" BackColor="DarkSeaGreen" ID="txtPassword" TextMode="Password" runat="server"></asp:TextBox>
        <br />
        <div style="margin-left: 192px"><asp:Button CssClass="btn btn-outline-success w3-hover-blue w3-hover-shadow" BackColor="CadetBlue" ID="btnLOGIN" runat="server" OnClick="btnLOGIN_Click" style="margin-left: 2px" Text="LOG IN" Width="111px" Font-Size="Medium" />
</div>
     <br />
     <br />
        </div>

    </div>
    
</asp:Content>
