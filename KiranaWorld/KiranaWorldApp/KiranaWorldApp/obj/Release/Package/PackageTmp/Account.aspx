<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="KiranaWorldApp.Account" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>KiranaWorld</title>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="x-ua-compatible" content="ie=edge" />
	
	<meta name="viewport" content="initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,width=device-width,user-scalable=no" />
   
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="css/Mystyle.css" media="all" />
	


	<style type="text/css">
		#myloader
		{
			position: fixed;
			width: 100%;
			height: 100%;
			background:  url(/images/KiranaWorld.png) center center no-repeat, url(loader2.gif) center center no-repeat;
			background-color:#ffffff;
		   
			z-index: 99999;
		}
		#myloader {
	-moz-animation: cssAnimation 0s ease-in 1s forwards;
	/* Firefox */
	-webkit-animation: cssAnimation 0s ease-in 1s forwards;
	/* Safari and Chrome */
	-o-animation: cssAnimation 0s ease-in 1s forwards;
	/* Opera */
	animation: cssAnimation 0s ease-in 1s forwards;
	-webkit-animation-fill-mode: forwards;
	animation-fill-mode: forwards;
	
}
@keyframes cssAnimation {
	to {
		width:0;
		height:0;
		overflow:hidden;
		display:none;
	}
}
@-webkit-keyframes cssAnimation {
	to {
		width:0;
		height:0;
		overflow:hidden;
		display:none;
	}
}


	.otpver
	{

		background:transparent;
		outline:none;
		color:#131212;
		font-size:15px;
		border:none !important;
		width:85% !important;
		float:left;
	   
	}
  
	internal-autofill-selected {
	background-color: rgb(255, 255, 255) !important;
	background-image: none !important;
	color: black !important;
}
		
	
			.partitioned {
   padding-left: 15px;
  letter-spacing: 42px;
  border: 0;
  background-image: linear-gradient(to left, black 70%, rgba(255, 255, 255, 0) 0%);
  background-position: bottom;
  background-size: 50px 1px;
  background-repeat: repeat-x;
  background-position-x: 35px;
  width: 220px !important;
  min-width: 220px;
  border:none !important;     
  box-shadow: none !important;
}
#divInner{
  left: 0;
  position: sticky;
}
#divOuter{
  width: 190px; 
  overflow: hidden;
 
}
.btn-Add
{
	border-radius: 0px !important ;
}

	
 

	</style>

   
</head>


<body onload="myfuction()" onunload="myFunctiona()" class="body cms-index-index cms-home-page ">


<div id="myloader">
   
</div>

<div class="wrapper" style="background:#e8e5e58c!important">

<form id="Form1" runat="server">

 <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"> </asp:ToolkitScriptManager>

<div id="page" > 



			<div   id="LoginPage" runat="server" style="background-color:White; height: 100vh; border:none;  position:fixed ; z-index:55; top:0; left:0; width:100%;" >
			  <div style=" width:100%; height:100px;" >

	  
	  
				  <img src="images/Banner.jpg" alt="Banner" style=" width:100%;" />
	
	  
	 
		
  </div>
   
 <div class="container">
		<div class="row">
			<div class="col-main col-sm-12 col-xs-12">
					
					<div class="  product-grid-area " style=" max-width:94%; margin:47% auto; text-align:center" >
					
						<img src="images/kiranaworldFull.png"  alt="KiranaWorldLogo"  class=" img-responsive;"  />
						
					</div>

					<div style=" width:100%; height:50px;" ></div>
			</div>
		</div>
	</div>

	<asp:UpdatePanel ID="LoginApp"  runat="server">
			<ContentTemplate >
	<footer id="footerBottom" style="height: 240px;" class="footerBottom footer headroomft headroom headroom--not-bottom headroom--pinned headroom--top" style="display: block;">
		 <h3 runat="server" id="footheader" style=" text-align:right;  margin: 0px auto; padding-top:10px; width:94%; text-align:center;">Send OTP</h3>
		 <div style=" position:fixed; right:10px; bottom:170px; " ><a href="Default.aspx">Skip <img src="img/arrow.png" style=" height: 11px;" /></a></div>
		 <div  runat="server" id="CheckMobile" class="container"   >
					 
					 
				   <div style="width:97%; margin: 0px auto; ">

					 
					 <div  style=" height:auto; padding:14px; padding-bottom: 22px; padding-left:6px;   border-bottom:2px solid #fdb813;">
							<span style=" float:left; width:10% ">+91 | </span>
							<asp:TextBox ID="TxtContactNo" MaxLength="10"  AutoCompleteType="Disabled" autocomplete="off" type="tel"  name="ContactNo"  CssClass="otpver input-text" placeholder="Mobile Number (10 Digit)" runat="server" ></asp:TextBox>  
					 </div>

					 <asp:RegularExpressionValidator Display="Dynamic" ValidationGroup="MobVal" ErrorMessage="*10 Digit Mobile Number" ForeColor="Red"  ID="RegularExpressionValidator1" runat="server" 
									ControlToValidate="TxtContactNo" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

					  </div>  
					
					   <asp:Button ID="Button1" runat="server" onclick="btnChkMobile_Click" ValidationGroup="MobVal" CssClass="btn-Add" style=" width:100%; position:absolute; bottom:0; left:0;" Text="Send OTP"></asp:Button>                           
							
						</div>
						 

			<div  runat="server"  id="CheckOtp" visible="false"  >

				<div   style=" margin: -14px auto; width:94% " >
										 
					 <div class=" container clearfix" style=" width:82%; padding-top: 20px; border-bottom:2px solid #fdb813; font-weight:700;  clear:both;  padding-left:10px;" >
					 <center>
<asp:Label ID="Label1" runat="server" style=" float:left;"  Text=""></asp:Label>
<asp:ImageButton ID="ImageButton2" ImageUrl="img/Edit.png" 
									style=" float:right; margin-top: 7px; margin-right: 10px; height:15px; " runat="server" onclick="ChangeMobile_Click" 
									 />

						 <asp:ImageButton ID="ImgBtnResend" ImageUrl="img/resendsms.png" 
									style=" float:right; margin-top: 5px; margin-right: 10px; height: 20px; " runat="server" OnClick="ImgBtnResend_Click"
									 />


									 </center>
									</div>


					  <div class=" container clearfix"  style=" width:200px;  padding-left:5px; margin:40px auto; ">
						   <div id="divOuter">
								<div id="divInner">
														<asp:TextBox ID="txtOTP"   class="partitioned" maxlength="4" runat="server"  ValidationGroup="OPtConfirm"></asp:TextBox>
													
													</div>
							</div>
						  <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="Enter Correct OTP!" ControlToValidate="txtOTP" Type="Integer" MinimumValue="1000" MaximumValue="9999" Display="Dynamic"  ForeColor="red" ValidationGroup="OPtConfirm" ></asp:RangeValidator>
						  <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ErrorMessage="Enter OTP!" ControlToValidate="TxtOtp" Display="Dynamic"  ForeColor="red" ValidationGroup="OPtConfirm"></asp:RequiredFieldValidator>
						</div>
							
							</div>
   <asp:Button ID="Button2" runat="server" onclick="OPtConfirm_Click" CssClass="btn-Add" ValidationGroup="OTPval" style=" width:100%; position:absolute; bottom:0; left:0;" Text="Confirm OTP"></asp:Button>              
						  
						</div>

		   <div  runat="server" visible="false" id="Register" class="container"   >
					 
					 
				   <div style="width:97%; margin: 0px auto; ">

					 <div  style=" height:auto; padding:14px; padding-bottom: 22px; padding-left:6px;   border-bottom:2px solid #fdb813;">
							<asp:TextBox ID="txtname"  AutoCompleteType="Disabled" autocomplete="off" type="Text"  name="txtname"  CssClass="otpver input-text" placeholder="Enter Your Name" runat="server" ></asp:TextBox>
							<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Enter Your Name!" ControlToValidate="txtname" Display="Dynamic"  ForeColor="red" ValidationGroup="MobVal"></asp:RequiredFieldValidator> 
					 </div>
					
					<div  style=" width:100%; float:left; padding-left:20px; padding-left:6px; height:auto; margin-top: 10px; border-bottom:2px solid #fdb813; padding-top: 10px;">
							<asp:TextBox ID="txtEmail"  AutoCompleteType="Disabled" autocomplete="off" type="Text"  name="txtname"  CssClass="otpver input-text" placeholder="Enter Your Email" runat="server"></asp:TextBox> 
					</div>
					   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Your Email!" ControlToValidate="txtname" Display="Dynamic"  ForeColor="red" ValidationGroup="txtEmail"></asp:RequiredFieldValidator> 
					   <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format"></asp:RegularExpressionValidator>
				   <div  style=" width:100%; float:left; padding-left:20px; padding-left:6px; height:auto;  border-bottom:2px solid #fdb813; ">
							<asp:TextBox ID="TxtReferId"  AutoCompleteType="Disabled" autocomplete="off" type="Text"  name="TxtReferId"  CssClass="otpver input-text" placeholder="Refer Code (Optional)" runat="server"></asp:TextBox> 
				   </div>

					

					  </div>  
					
					   <asp:Button ID="Button3" runat="server" onclick="btnreg_Click" ValidationGroup="MobVal" CssClass="btn-Add" style=" width:100%; position:absolute; bottom:0; left:0;" Text="Register"></asp:Button>                           
							
						</div>
					
</footer>

<asp:Label ID="alertpop" runat="server" Text=""></asp:Label>
</ContentTemplate>
			</asp:UpdatePanel>


</div>




<asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true"  AssociatedUpdatePanelID="LoginApp" >
						<ProgressTemplate>
						  <div style="position:fixed; width: 100%; background: white; bottom:50px; z-index:9999999999999;">
							 <div class="center">
							 <center><img src="/loading.gif" class="img-responsive" style="width:60px;" /></center>  
							  </div>
						   </div>
						</ProgressTemplate>
					</asp:UpdateProgress>


	 
	 
	 
	 
	 
	 
	   <div style=" width:100%; height:50px;" >
						
						
					</div>
   
			  
					
				   
			
	 
			
 
  </div>


 

 <script type="text/javascript" src="js/jquery.min.js"></script>

  <script type="text/C#">
		var obj = document.getElementById('TxtOtp');
		obj.addEventListener('keydown', stopCarret);
		obj.addEventListener('keyup', stopCarret);

		function stopCarret() {
			if (obj.value.length > 3) {
				setCaretPosition(obj, 3);
			}
		}

		function setCaretPosition(elem, caretPos) {
			if (elem != null) {
				if (elem.createTextRange) {
					var range = elem.createTextRange();
					range.move('character', caretPos);
					range.select();
				}
				else {
					if (elem.selectionStart) {
						elem.focus();
						elem.setSelectionRange(caretPos, caretPos);
					}
					else
						elem.focus();
				}
			}
		}
	</script>

	

  </form>

  </div>


  <div runat="server" id="CatSubcat" class="hidepanel" style=" overflow:scroll; height: 100vh;  border:none;  position:fixed ;  top:0; left:0; width:100%;" >
			

			<div id="loader2" runat="server" >
	</div>
			  

			</div>
  

	<script type="text/jscript">

		function mytoast() {
			// Get the alertpop DIV
			var x = document.getElementById("alertpop");

			// Add the "show" class to DIV
			x.className = "show";

			// After 3 seconds, remove the show class from DIV
			setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
		}


</script>

<script type="text/jscript">

	window.addEventListener("beforeunload", function (e) {
		var x = document.getElementById("CatSubcat");
		x.className = "move";


		var preloader = document.getElementById("loader2");
		preloader.className = "secondloaderHider";

	});


	  
  
  </script>

  <script type="text/javascript">
	  var preloader = document.getElementById("myloader");
	  function myfuction() {
		  preloader.style.display = 'none';
	  };
  
  </script>
 
</body>
</html>

