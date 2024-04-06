<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Transaction.aspx.cs" Inherits="E_Wallet.Transaction" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <div>
       <br />
            <button type="button" class="btn btn-primary">Balance: <span class="badge bg-secondary"> <%Response.Write("₱"+Session["bal"]);%></span></button>
            <br />
            <br />
            <button type="button" class="btn btn-primary">Email: <span class="badge bg-secondary">  <%Response.Write(Session["username"]);%></span></button>
            <center>
            <table style="margin-bottom: 8px; align-content:center" class="nav-justified">
                <tr>
                    <td style="height: 67px; width: 825px;"></td>
                    <td style="height: 67px; width: 961px;">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <button class="btn btn-outline-success w3-hover-shadow w3-hover-green" type="button" style="width: 207px; height: 44px"><a href="Deposit.aspx" runat="server">Deposit</a></button>
                    </td>
                    <td style="height: 67px; width: 107px;"></td>
                </tr>
                <tr>
                    <td style="height: 67px; width: 825px;"></td>
                    <td style="height: 67px; width: 961px;">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <button class="btn btn-outline-success w3-hover-shadow w3-hover-green" style="width: 207px; height: 44px" type="button">
                            <a href="Withdraw.aspx" runat="server">Withdraw</a>
                        </button>
                    </td>
                    <td style="height: 67px; width: 107px;"></td>
                </tr>
                <tr>
                    <td style="height: 67px; width: 825px;"></td>
                    <td style="height: 67px; width: 961px;">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <button class="btn btn-outline-success w3-hover-shadow w3-hover-green" style="width: 207px; height: 44px" type="button">
                           <a href="SendTo" runat="server">Send Money</a>
                        </button>
                    </td>
                    <td style="height: 67px; width: 107px;"></td>
                </tr><tr>
                    <td style="height: 67px; width: 825px;"></td>
                    <td style="height: 67px; width: 961px;">
                        <button class="btn btn-outline-success w3-hover-shadow w3-hover-green" style="width: 257px; height: 44px" type="button">
                            <a href="SAO.aspx" runat="server">My Statement of Account (SOA)</a>
                        </button>
                    </td>
                    <td style="height: 67px; width: 107px;"></td>
                </tr>
                <tr>
                    <td style="height: 67px; width: 825px;"></td>
                    <td style="height: 67px; width: 961px;">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <button class="btn btn-outline-success w3-hover-shadow w3-hover-green" style="width: 207px; height: 44px" type="button">
                           <a href="Profile1.aspx" runat="server">Profile</a>
                        </button>
                    </td>
                    <td style="height: 67px; width: 107px;"></td>
                </tr>
            </table>
   </center>
  </div>
 
 <h5><a href="Login.aspx">Log out</a></h5>
</asp:Content>
