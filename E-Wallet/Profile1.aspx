<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Profile1.aspx.cs" Inherits="E_Wallet.Profile1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
<div class="row gutters">
<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
<div class="card h-100">
	<div class="card-body">
		<div class="account-settings">
			<div class="user-profile">
				<div class="user-avatar">
				<%--<img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Maxwell Admin">--%>
				    <br />
				<img src="https://ml7u4cm4jjmy.i.optimole.com/CaABJw-CBpwrp7H/w:auto/h:auto/q:auto/https://bmsenergiasolar.com.br/wp-content/uploads/2020/02/default-user-2.png" alt="Maxwell Admin" style="width: 186px; height: 195px">
				</div>
			</div>
			<div>
				<h5>Hello !</h5>
				<h5>Email: <%Response.Write(Session["username"]);%></h5>
			</div>
		</div>
	</div>
</div>
</div>
<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
<div class="card h-100">
	<div class="card-body">
		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<h6 class="mb-2 text-primary">Personal Details</h6>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="firstName">First Name</label>
					<asp:TextBox class="form-control" ID="firstName" placeholder="Enter first name" runat="server"></asp:TextBox>
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="emailAddress">Email Address</label><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="emailAddress" ErrorMessage="*invalid email" Font-Overline="False" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
&nbsp;<asp:TextBox class="form-control" ID="emailAddress" placeholder="Enter Email Address" runat="server"></asp:TextBox>
				</div>
			</div>
		
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="lastName">Last Name</label>
					<asp:TextBox class="form-control" id="lastName" placeholder="Enter Last Name" runat="server"></asp:TextBox>
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="userName">Username</label>
					<asp:TextBox class="form-control" id="userName" placeholder="Enter Username" runat="server"></asp:TextBox>
				</div>
			</div>
		</div>
		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12" style="left: 0px; top: 0px; width: 452px">
				<div class="text-right">
					<asp:Button ID="BntCancel" runat="server" Text="Cancel" class="btn btn-secondary w3-text-black" PostBackUrl="~/Transaction.aspx" OnClick="BntCancel_Click" />
					<asp:Button class="btn btn-primary" ID="BntUpdate" runat="server" Text="Update" OnClick="BntUpdate_Click" />
					
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</div>
</asp:Content>
