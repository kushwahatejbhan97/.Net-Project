<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="icemmmt.admin._default" %>

<!DOCTYPE html>

<html lang="en">

<head>
    <title>Welcome to ICEMMMT 2022</title>
    <!-- meta tags -->
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="keywords" content="Art Sign Up Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, 
		Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design"
    />
    <!-- /meta tags -->
    <!-- custom style sheet -->
    <link href="login/css/Style2.css" rel="stylesheet" />
    
    <!-- /custom style sheet -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- fontawesome css -->
    <link href="css/fontawesome-all.css" rel="stylesheet" />
    <!-- /fontawesome css -->
    <!-- google fonts-->
    <link href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <!-- /google fonts-->

</head>


<body>
    
    <h1>Admin Control</h1>
    <div class=" w3l-login-form">
       <%-- <h2>Login Here</h2>--%>
        <form runat="server" method="POST">

            <div class=" w3l-form-group">
                <label>Username:</label>
                <div class="group">
                    <i class="fas fa-user"></i>
                   <%-- <input type="text" class="form-control" placeholder="Username" required="required" />--%>
                    <asp:TextBox ID="txtusername" runat="server" CssClass="form-control" placeholder="Username"></asp:TextBox>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Username cannot be blank" 
									ControlToValidate="username" ForeColor="#23b4cc"></asp:RequiredFieldValidator>--%>
                </div>
            </div>
            <div class=" w3l-form-group">
                <label>Password:</label>
                <div class="group">
                    <i class="fas fa-unlock"></i>
                   <%-- <input type="password" class="form-control" placeholder="Password" required="required" />--%>
                    
                     <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="form-control" placeholder="Password"></asp:TextBox>
                </div>
            </div>
            
           
            <asp:Button ID="btnsubmit" runat="server" Text="Login" OnClick="btnsubmit_Click"/>
        </form>
        

    </div>
    <%--<footer>
        <p class="copyright-agileinfo"> &copy; 2018 Material Login Form. All Rights Reserved | Design by <a href="http://w3layouts.com">W3layouts</a></p>
    </footer>--%>

</body>

</html>
