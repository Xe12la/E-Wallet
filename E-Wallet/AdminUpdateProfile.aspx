<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminUpdateProfile.aspx.cs" Inherits="E_Wallet.AdminUpdateProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	
       <div class="container">
<div class="row gutters">
<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
<div class="card h-100">
	<div class="card-body">
		<div class="account-settings">
			<div class="user-profile">
				<div class="user-avatar">
					<img src="https://bootdey.com/img/Content/avatar/avatar7.png" id="avater">
				</div>
			</div>
			<div>
				<h5>Hi ADMIN!</h5>
				<h6"><%Response.Write(Session["username"]);%></h6>
			</div>
		</div>
	</div>
</div>
</div>
<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
<div class="card h-100">
	<div class="card-body">
		<div class="row gutters">
            <br />
            <br />
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                <asp:Label class="mb-2 text-primary w3-text-black" ID="lblPersonalD" runat="server" Text="Personal Details" Font-Bold="True" Font-Names="Arial"></asp:Label>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12" style="left: 0px; top: 0px">
				<div class="form-group">
					<asp:Label for="firstName" ID="lblfirstname" runat="server" Text="First Name" Font-Bold="True" Font-Names="Letter Gothic Std"></asp:Label>
					<asp:TextBox class="form-control w3-hover-blue" ID="firstName" placeholder="Enter first name" runat="server"></asp:TextBox>
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<asp:Label for="emailAddress" ID="lblemail" runat="server" Text="Email Address" Font-Bold="True" Font-Names="Letter Gothic Std"></asp:Label>
					<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemailAddress" ErrorMessage="*invalid email" Font-Overline="False" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
					<asp:TextBox class="form-control w3-hover-blue" ID="txtemailAddress" placeholder="Enter Email Address" runat="server"></asp:TextBox>
				</div>
			</div>
		
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<asp:Label for="lastName" ID="lblLName" runat="server" Text="Last Name" Font-Bold="True" Font-Names="Letter Gothic Std"></asp:Label>
					<asp:TextBox class="form-control w3-hover-blue" id="lastName" placeholder="Enter Last Name" runat="server"></asp:TextBox>
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<asp:Label for="userName" ID="lblUsername" runat="server" Text="Username" Font-Bold="True" Font-Names="Letter Gothic Std"></asp:Label>
					<asp:TextBox class="form-control w3-hover-blue" id="txtuserName" placeholder="Enter Username" runat="server"></asp:TextBox>
				</div>
			</div>
		</div>
		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" style="left: 0px; top: 0px; width: 452px">
				<div class="text-right">
					<asp:Button ID="BntCancel" runat="server" Text="Cancel" class="btn btn-outline-success w3-hover-green w3-round w3-hover-shadow" PostBackUrl="~/AdminUpdateProfile.aspx" OnClick="BntCancel_Click" Font-Names="Hobo Std" />
					<asp:Button class="btn btn-outline-warning w3-hover-blue w3-round w3-hover-shadow" ID="BntUpdate" runat="server" Text="Update" OnClick="BntUpdate_Click" Font-Names="Hobo Std" />
					
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</div>
	<center>
	<div>
		<asp:Button class="btn btn-outline-warning w3-hover-blue w3-round w3-hover-shadow" ID="bntUpdateProfile" runat="server" Text="Update MyProfile" OnClick="bntUpdateProfile_Click" Font-Names="Hobo Std" Height="47px" Width="189px" />
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<asp:Button class="btn btn-outline-warning w3-hover-blue w3-round w3-hover-shadow" ID="bntListAdmin" runat="server" Text="List of my CO-ADMIN" OnClick="bntListAdmin_Click" Font-Names="Hobo Std" Height="47px" Width="189px" />
	<asp:Button CssClass="btn btn-success btn-lg w3-border-dark-gray w3-hover-shadow" ID="bntBack" runat="server" OnClick="Button1_Click" PostBackUrl="~/AdminTransaction.aspx" style="margin-left: 34px" Text="Back to main menu" Font-Size="Small" Height="37px"/>
	    <br />
	    <br />
        <asp:Label ID="lblListadmin" CssClass="info" runat="server" Text="---------------------------  LIST OF MY CO-ADMIN  ---------------------------" Font-Names="Impact" Height="23px" Width="470px" Font-Size="Medium"></asp:Label>
	    <br />
	</div>
	</center>
    <center>
	<div>
	    <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <span style="background-color: #FFFFFF;color: #284775;">Last Name: 
                <asp:Label ID="lnameLabel" runat="server" Text='<%# Eval("lname") %>' />
                <br />
                First Name: 
                <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                <br />
                Email Address: 
                <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                <br />
                Username: 
                <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                <br />
                Birthdate: 
                <asp:Label ID="bdateLabel" runat="server" Text='<%# Eval("bdate") %>' />
                <br />
<br /></span>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <span style="background-color: #999999;">Last Name: 
                <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />
                <br />
                First Name: 
                <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />
                <br />
                Email Address: 
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br />
                Username: 
                <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                <br />
                Birthdate: 
                <asp:TextBox ID="bdateTextBox" runat="server" Text='<%# Bind("bdate") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br /><br /></span>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <span style="">Last Name: 
                <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>' />
                <br />First Name: 
                <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>' />
                <br />Email Address: 
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br />Username: 
                <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>' />
                <br />Birthdate: 
                <asp:TextBox ID="bdateTextBox" runat="server" Text='<%# Bind("bdate") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br /><br /></span>
            </InsertItemTemplate>
            <ItemTemplate>
                <span style="background-color: #E0FFFF;color: #333333;">Last Name: 
                <asp:Label ID="lnameLabel" runat="server" Text='<%# Eval("lname") %>' />
                <br />
                First Name: 
                <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                <br />
                Email Address: 
                <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                <br />
                Username: 
                <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                <br />
                Birthdate: 
                <asp:Label ID="bdateLabel" runat="server" Text='<%# Eval("bdate") %>' />
                <br />
<br /></span>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <span runat="server" id="itemPlaceholder" />
                </div>
                <div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
                    <asp:DataPager ID="DataPager1" runat="server">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <span style="background-color: #E2DED6;font-weight: bold;color: #333333;">Last Name: 
                <asp:Label ID="lnameLabel" runat="server" Text='<%# Eval("lname") %>' />
                <br />
                First Name: 
                <asp:Label ID="fnameLabel" runat="server" Text='<%# Eval("fname") %>' />
                <br />
                Email Address: 
                <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                <br />
                Username: 
                <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
                <br />
                Birthdate: 
                <asp:Label ID="bdateLabel" runat="server" Text='<%# Eval("bdate") %>' />
                <br />
<br /></span>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [lname], [fname], [email], [username], [bdate] FROM [AdminTbl] ORDER BY [lname]"></asp:SqlDataSource>
	<br />
        
	</div></center>
</asp:Content>
