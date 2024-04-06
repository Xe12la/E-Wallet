<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SAO.aspx.cs" Inherits="E_Wallet.SAO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <br />
        <br />
        <br />
    <asp:Button CssClass="btn btn-outline-success w3-hover-green w3-hover-shadow" ID="bntViewAll" runat="server" Text="View All" Font-Size="Small" Height="37px" OnClick="bntViewAll_Click" Font-Names="Cascadia Mono"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
    <asp:Button CssClass="btn btn-outline-success w3-hover-green w3-hover-shadow" ID="bntCustom" runat="server" Text="Custom" Font-Size="Small" Height="37px" OnClick="bntCustom_Click" Font-Names="Cascadia Mono"/>
    &nbsp;
    <asp:Button CssClass="btn btn-success btn-lg w3-border-dark-gray  w3-hover-shadow" ID="Button3" runat="server" OnClick="Button1_Click" PostBackUrl="~/Transaction.aspx" style="margin-left: 34px" Text="Back" Font-Size="Small" Height="37px"/>
    <br />
    <br />
        <div style="padding: 20px 30px 20px; background-color:darkcyan">
<asp:Label ID="lblStart" runat="server" Text="Start" Visible="true"></asp:Label> <br />
    <asp:TextBox ID="txtStartDate" class="w3-input w3-round-large w3-opacity-min" BackColor="Gold" runat="server" type="date" Width="254px" placeholder="Birth of Date" Text="" OnTextChanged="txtStartDate_TextChanged" ></asp:TextBox>
    <br />
    <asp:Label ID="lblEnd" runat="server" Text="End" Visible="true"></asp:Label> <br />
    <asp:TextBox ID="txtEndDate" class="w3-input w3-round-large  w3-opacity-min" BackColor="Gold" runat="server" type="date" Width="254px" placeholder="Birth of Date" Text="" OnTextChanged="txtEndDate_TextChanged" ></asp:TextBox>
    <br />
    <asp:RadioButtonList ID="rbnCustom_TypeofTransaction" runat="server" Font-Size="Medium" ForeColor="#33CC33" BorderColor="#009900" BorderStyle="Dashed" Font-Names="Letter Gothic Std" RepeatDirection="Vertical" RepeatLayout="UnorderedList">
        <asp:ListItem Value="S">SEND</asp:ListItem>
        <asp:ListItem Value="W">WITHDRAW</asp:ListItem>
        <asp:ListItem Value="D">DEPOSIT</asp:ListItem>
    </asp:RadioButtonList>
        </div>
    
    <br />
    <asp:Button CssClass="btn btn-outline-success w3-hover-green w3-hover-shadow" ID="bntViewCustom" runat="server" Text="View" Font-Size="Small" Height="37px" OnClick="bntViewCustom_Click"  Font-Names="Cascadia Mono"/>
    <asp:GridView ID="State_Of_Acct" runat="server" CellPadding="2" ForeColor="Black" GridLines="None" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="PaleGoldenrod"></AlternatingRowStyle>
        <Columns>
            <asp:BoundField HeaderText="ID Number" DataField="ID" ItemStyle-Width="10%"></asp:BoundField>
            <asp:BoundField HeaderText="Type" DataField="TYPE" ItemStyle-Width="10%"></asp:BoundField>
            <asp:BoundField HeaderText="Time and Date" DataField="TDATE" ItemStyle-Width="10%"></asp:BoundField>
            <asp:BoundField HeaderText="Amount" DataField="AMT" ItemStyle-Width="10%">
                <FooterStyle VerticalAlign="Middle"></FooterStyle>

                <ItemStyle BorderWidth="0px" CssClass="w3-center"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField HeaderText="Sent to" DataField="SENDTO" ItemStyle-Width="10%"></asp:BoundField>
            <asp:BoundField HeaderText="Sent by" DataField="SENDBY" ItemStyle-Width="10%"></asp:BoundField>
        </Columns>       
        <FooterStyle BackColor="Tan"></FooterStyle>

        <HeaderStyle BackColor="Tan" Font-Bold="True"></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue"></PagerStyle>

        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#FAFAE7"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#DAC09E"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#E1DB9C"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#C2A47B"></SortedDescendingHeaderStyle>
    </asp:GridView>
    <asp:Button CssClass="btn btn-success btn-lg w3-border-dark-gray w3-hover-shadow" ID="Button2" runat="server" OnClick="Button1_Click" PostBackUrl="~/Transaction.aspx" style="margin-left: 34px" Text="Back" Font-Size="Small" Height="37px"/>
    <br />
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
</asp:Content>
