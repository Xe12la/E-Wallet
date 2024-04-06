<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Create_Admin_Account.aspx.cs" Inherits="E_Wallet.Create_Admin_Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
    <br />
    <h1 class="w3-text-blue w3-center">Create Account for ADMIN</h1>
    <br />
    <div style="padding-block:25px 100px 75px; background-color:#2FBDBD; color:crimson ">
    
    <table style="margin: auto; padding: 5px; width: 100%; line-height: inherit; display: inline-table;" align="middle" runat="server">
        <tr runat="server">
            <td  runat="server" style="padding: 10px; width: 745px; height: 44px;" class="text-right">Lastname</td>
            <td  runat="server" class="modal-sm" style="padding: 10px; width: 233px; height: 44px;">
            <asp:TextBox class="w3-input w3-round w3-blue w3-opacity-min w3-hover-shadow " ID="txtLname" runat="server" style="margin-left: 0" Width="255px" placeholder="Last Name" Text="" ></asp:TextBox>
            </td>
            <td  runat="server" style="padding: 10px; width: 666px; height: 44px;">
            <asp:RequiredFieldValidator ID="rfvLname" runat="server" ErrorMessage="* Lastname is Required" ControlToValidate="txtLname" style="color: #FF0000"></asp:RequiredFieldValidator>
            </td>
            <td  runat="server" style="padding: 10px; height: 44px;">
                </td>
        </tr>
       
        <tr runat="server">
            <td runat="server" style="padding: 10px; width: 745px" class="text-right">Firstname </td>
            <td  runat="server" style="padding: 10px; width: 233px;" class="modal-sm">
            <asp:TextBox class="w3-input w3-round w3-blue w3-opacity-min w3-hover-shadow " ID="txtFname" runat="server" Width="255px" placeholder="First Name" Text="" ></asp:TextBox>
            </td>
            <td runat="server" style="padding: 10px; width: 666px;">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtFname" ErrorMessage="* Firstname is Required" style="color: #FF0000"></asp:RequiredFieldValidator>
            </td>
            <td runat="server" style="padding: 10px;">
                &nbsp;</td>
        </tr>
  

        <tr runat="server">
            <td runat="server" style="padding: 10px; width: 745px; " class="text-right">Email Address</td>
            <td runat="server" class="modal-sm" style="padding: 10px; width: 233px;">
                <asp:TextBox class="w3-input w3-round w3-blue w3-opacity-min w3-hover-shadow " ID="txtEmail" runat="server" Width="255px" placeholder="Email Address" ></asp:TextBox>
            </td>
            <td runat="server" style="padding: 10px; width: 666px;">
                <asp:RegularExpressionValidator ID="emailRV" runat="server" ControlToValidate="txtEmail" ErrorMessage="* Invalid Email Address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" style="color: #FF0000"></asp:RegularExpressionValidator>
            </td>
            <td runat="server" style="padding: 10px;">
                &nbsp;</td>
        </tr>

        <tr runat="server">
            <td runat="server" style="padding: 10px; width: 745px" class="text-right">Birth Date</td>
            <td runat="server" class="modal-sm" style="padding: 10px; width: 233px;">
            <asp:TextBox  class="w3-input w3-round w3-blue w3-opacity-min w3-hover-shadow" ID="txtbdate" runat="server" type="date" Width="254px" placeholder="Birth of Date" Text="" OnTextChanged="txtbdate_TextChanged" ></asp:TextBox>

            </td>
            <td runat="server" style="padding: 10px; width: 666px;">&nbsp;</td>
            <td runat="server" style="padding: 10px">&nbsp;</td>
        </tr>
        <tr runat="server">
            <td runat="server" style="padding: 10px; width: 745px; " class="text-right">Username</td>
            <td runat="server" class="modal-sm" style="padding: 10px; width: 233px;">
            <asp:TextBox class="w3-input w3-round w3-blue w3-opacity-min w3-hover-shadow " ID="txtusrn" runat="server" Width="255px" placeholder="Username" Text="" OnTextChanged="txtusrn_TextChanged"></asp:TextBox>
            </td>
            <td runat="server" style="padding: 10px; width: 666px;">
                &nbsp;</td>
            <td runat="server" style="padding: 10px;">&nbsp;</td>
        </tr>
        <tr runat="server">
            <td runat="server" style="padding: 10px; width: 745px; height: 44px;" class="text-right">Password</td>
            <td runat="server" class="modal-sm" style="padding: 10px; width: 233px; height: 44px;">
            <asp:TextBox class="w3-input w3-round w3-blue w3-opacity-min w3-hover-shadow " ID="txtpwd" runat="server" TextMode="Password" ValidationGroup="RegisterCheck" Width="255px" placeholder="Password" Text="" ></asp:TextBox>
            </td>
            <td runat="server" style="padding: 10px; width: 666px; height: 44px;" colspan="1">
            <asp:RegularExpressionValidator ID="valPassword" runat="server" ControlToValidate="txtpwd"
                ErrorMessage="Minimum password length is 8, must contain at least 1 digit, 1 alphabetic or special character, and must not contain any spaces. "
                ValidationExpression="^[A-Za-z\d]([a-zA-Z0-9@#$%^&+=*]{8,20})$"
                ValidationGroup="RegisterCheck" Display="Dynamic" Font-Italic="True" Font-Size="10px" ForeColor ="Red" Width="245px" Height="20px" CssClass="w3-text-red" />

            </td>
            <td runat="server" style="padding: 10px; height: 44px;">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpwd" ValidationGroup="RegisterCheck" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr runat="server">
            <td runat="server" style="padding: 10px; width: 745px; height: 44px;" class="text-right">Confirm Password</td>
            <td runat="server" class="modal-sm" style="padding: 10px; width: 233px; height: 44px;">
            <asp:TextBox class="w3-input w3-round w3-blue w3-opacity-min w3-hover-shadow" ID="txtcpwd" runat="server" TextMode="Password" Width="255px" placeholder="Confirm Password" Text="" ></asp:TextBox>
            </td>
            <td runat="server" style="padding: 10px; width: 666px; height: 44px;">
            <asp:CompareValidator ID="cvcpwd" runat="server" ErrorMessage="* Password did not match!" ControlToCompare="txtpwd" ControlToValidate="txtcpwd" style="color: #FF0000"></asp:CompareValidator>
            </td>
            <td runat="server" style="padding: 10px; height: 44px;">
            </td>
        </tr>
        <tr runat="server">
            <td runat="server" style="height: 5px;" class="text-right">&nbsp;</td>
            <td runat="server" class="modal-sm" style="height: 5px;">
                <asp:Label ID="lblWarning" runat="server" style="color: #FF0000; font-size: small" Text="Label" Visible="False"></asp:Label>
            </td>
            <td runat="server" style="height: 5px; width: 666px;">
                &nbsp;</td>
            <td runat="server" style="height: 5px;">
                &nbsp;</td>
        </tr>
        <tr runat="server">
            <td runat="server" style="padding: 10px; width: 745px">
                &nbsp;</td>
            <td runat="server" class="modal-sm" style="padding: 10px; width: 233px;">
            <asp:Button CssClass="btn btn-outline-warning w3-hover-blue w3-round w3-hover-shadow" ID="btn" runat="server" Text="Submit" OnClick="btn_Click" Height="34px" Width="114px" Font-Names="Hobo Std"/>


            </td>
            <td runat="server" style="padding: 10px; width: 666px;">
                &nbsp;
                <a href="AdminTransaction.aspx">BACK TO MAIN MENU</a>
            </td>
            <td runat="server" style="padding: 10px">&nbsp;</td>
        </tr>
        </table>
</div>
</asp:Content>
