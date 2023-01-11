<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sidvin.Admin.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title> Admin Login | SidvinReality</title>
    <link rel="shortcut icon" href="/assets/images/logo/logo.png"/>
   <link href="Login/css/style.css" rel="stylesheet" type='text/css' />
	<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	 <script src="https://www.google.com/recaptcha/api.js">

	 </script>
	


	<link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,400,300,600,700' rel='stylesheet' type='text/css' />

</head>
<body>
    <form id="form1" runat="server">
       <h1>SidvinRealty Login </h1>
		<div class="login">	
			<div class="ribbon-wrapper h2 ribbon-red">
				<div class="ribbon-front">
					<h2 >login</h2>
				</div>
				<div class="ribbon-edge-topleft2"></div>
				<div class="ribbon-edge-bottomleft"></div>
			</div>
			
				<div id="Divlogin" runat="server" style="margin-top: 34px" >
				<ul>
					<li>
						<asp:TextBox ID="txtUser"   class="text"  runat="server" placeholder=" User Name" ></asp:TextBox>
						<asp:RequiredFieldValidator ID="RequiredField1" Display="Dynamic" ValidationGroup="abc" ControlToValidate="txtUser" ForeColor="Red" runat="server" ErrorMessage="*User"></asp:RequiredFieldValidator>
					</li>
					 <li>
						 <asp:TextBox ID="txtpassword" TextMode="Password" class="text"  runat="server" placeholder="Password" ></asp:TextBox>
						 <asp:RequiredFieldValidator ID="RequiredField2" Display="Dynamic" ValidationGroup="abc" ControlToValidate="txtpassword" ForeColor="Red" runat="server" ErrorMessage="*Password"></asp:RequiredFieldValidator>
						</li>
					
				</ul>

				<div class="submit">
				<asp:Button ID="Button1"  CssClass="login "  ValidationGroup="abc" runat="server" Text="SIGN IN" OnClick="Button1_Click" />
				
			</div>

					</div>
			
			
		
			
		</div>
    </form>
</body>
</html>
