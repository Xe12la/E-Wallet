<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SendTo.aspx.cs" Inherits="E_Wallet.SendTo1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <div style="padding: 20px 30px 20px; background-color:#FFCCBC; width: 443px; margin-left: 354px;" class=" w3-round-xxlarge">
        <div style="padding: 10px 10px 10px; background-color:#00887A; width: 490px; margin-left: 0px; height: 61px;" class="w3-round-xlarge">
        <asp:Label ID="Label2" runat="server" Text="Send Money" Font-Bold="True" Font-Italic="True" Font-Names="Leelawadee UI" ForeColor="#FF0066" Font-Size="XX-Large" Height="47px" Width="204px"></asp:Label>
        </div>
         <div>
            <asp:Label ID="Label1" runat="server" Font-Names="Arial Narrow" Font-Size="Small" Text="Send To"></asp:Label>
        </div> 
        <asp:TextBox class="w3-input w3-round w3-green" ID="txtSendToEm" runat="server" placeholder="Email Address of the Recipient" ></asp:TextBox><br />
        <div>
            <div>
              <asp:Label ID="Label3" runat="server" Font-Names="Arial Narrow" Font-Size="Small" Text="Amount"></asp:Label>
            </div>    
            <div>
               <asp:TextBox class="w3-input w3-round w3-green" ID="txtAmountToSend" runat="server"></asp:TextBox><br />
            </div>
            <div>
        <asp:Button  CssClass="btn btn-outline-success w3-hover-blue w3-hover-shadow" BackColor="#00887A" ID="btnSendMoney" runat="server" Text="Send" OnClick="btnSendMoney_Click" style="margin-left: 39px"  Font-Size="Small" Height="37px" />
        <asp:Button CssClass="btn btn-primary btn-lg w3-border-dark-gray w3-hover-shadow" ID="Button2" runat="server" OnClick="Button1_Click" PostBackUrl="~/Transaction.aspx" style="margin-left: 43px" Text="Back" Font-Size="Small" Height="37px"/>
            </div>
        </div>   <%-- div for the padding layout. --%>
    </div>
    
    
        <br />
        <br />
        <br />
        <br />
        <br />
    
       
</asp:Content>
 