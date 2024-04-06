<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserInformation.aspx.cs" Inherits="E_Wallet.UserInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <br />
    <h3 class="w3-light-blue w3-center" >LIST OF ALL USER</h3>
    <center>
    <div>
    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <li style="background-color: #FFFFFF;color: #284775;">LAST NAME: 
                <asp:Label ID="lnameLabel" runat="server" Text='<%# Eval("lname") %>' />
                <br />
                FIRST NAME: 
                <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                <br />
                EMAIL ADDRESS: 
                <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                <br />
                BIRTHDAY: 
                <asp:Label ID="bdateLabel" runat="server" Text='<%# Eval("bdate") %>' />
                <br />
                USERNAME: 
                <asp:Label ID="usrnameLabel" runat="server" Text='<%# Eval("usrname") %>' />
                <br />
                PASSWORD: 
                <asp:Label ID="pswdLabel" runat="server" Text='<%# Eval("pswd") %>' />
                <br />
            </li>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <li style="background-color: #999999;">LAST NAME: 
                <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />
                <br />
                 FIRST NAME: 
                <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />
                <br />
                EMAIL ADDRESS: 
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br />
                BIRTHDAY: 
                <asp:TextBox ID="bdateTextBox" runat="server" Text='<%# Bind("bdate") %>' />
                <br />
                USERNAME: 
                <asp:TextBox ID="usrnameTextBox" runat="server" Text='<%# Bind("usrname") %>' />
                <br />
                PASSWORD: 
                <asp:TextBox ID="pswdTextBox" runat="server" Text='<%# Bind("pswd") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </li>
        </EditItemTemplate>
        <EmptyDataTemplate>
            No data was returned.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <li style="">LAST NAME: 
                <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />
                <br /> FIRST NAME: 
                <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />
                <br />EMAIL ADDRESS: 
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br />BIRTHDAY: 
                <asp:TextBox ID="bdateTextBox" runat="server" Text='<%# Bind("bdate") %>' />
                <br />USERNAME: 
                <asp:TextBox ID="usrnameTextBox" runat="server" Text='<%# Bind("usrname") %>' />
                <br />PASSWORD: 
                <asp:TextBox ID="pswdTextBox" runat="server" Text='<%# Bind("pswd") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            </li>
        </InsertItemTemplate>
        <ItemSeparatorTemplate>
<br />
        </ItemSeparatorTemplate>
        <ItemTemplate>
            <li style="background-color: #E0FFFF;color: #333333;">LAST NAME: 
                <asp:Label ID="lnameLabel" runat="server" Text='<%# Eval("lname") %>' />
                <br />
                 FIRST NAME: 
                <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                <br />
                EMAIL ADDRESS: 
                <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                <br />
                BIRTHDAY: 
                <asp:Label ID="bdateLabel" runat="server" Text='<%# Eval("bdate") %>' />
                <br />
                USERNAME: 
                <asp:Label ID="usrnameLabel" runat="server" Text='<%# Eval("usrname") %>' />
                <br />
                PASSWORD: 
                <asp:Label ID="pswdLabel" runat="server" Text='<%# Eval("pswd") %>' />
                <br />
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <li style="background-color: #E2DED6;font-weight: bold;color: #333333;">LAST NAME: 
                <asp:Label ID="lnameLabel" runat="server" Text='<%# Eval("lname") %>' />
                <br />
                 FIRST NAME: 
                <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                <br />
                EMAIL ADDRESS: 
                <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                <br />
                BIRTHDAY: 
                <asp:Label ID="bdateLabel" runat="server" Text='<%# Eval("bdate") %>' />
                <br />
                USERNAME: 
                <asp:Label ID="usrnameLabel" runat="server" Text='<%# Eval("usrname") %>' />
                <br />
                PASSWORD: 
                <asp:Label ID="pswdLabel" runat="server" Text='<%# Eval("pswd") %>' />
                <br />
            </li>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [lname], [fname], [email], [bdate], [usrname], [pswd] FROM [USERTBL] ORDER BY [lname]"></asp:SqlDataSource>
        <br />
        <asp:Button ID="Button2" runat="server" CssClass="btn btn-success btn-lg w3-border-dark-gray" Font-Size="Small" Height="37px" OnClick="Button1_Click" PostBackUrl="~/AdminTransaction.aspx" style="margin-left: 0px" Text="Back" />
    </div>
   </center>
</asp:Content>
