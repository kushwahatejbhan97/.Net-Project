<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="KiranaWorldApp.checkout" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<title>KiranaWorld</title>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta http-equiv="x-ua-compatible" content="ie=edge" />
	
	<meta name="viewport" content="initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,width=device-width,user-scalable=no" />
	<script type="text/javascript" src="js/jquery.min.js"></script> 
  
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
	
	<link rel="stylesheet" type="text/css" href="css/Mystyle.css" media="all" />

	


	


	

   
	
<style type="text/css">

#myloader
{
   position: fixed;
			width: 100%;
			height: 100%;
			background:  url(/AdminImg/KiranaWorld.png) center center no-repeat, url(/loader2.gif) center center no-repeat;
			background-color:#ffffff;
		   
			z-index: 99999;
}

.shadow-bottom
{
	-webkit-box-shadow: 0 8px 6px -6px rgba(0, 0, 0, 0.19);
	   -moz-box-shadow: 0 8px 6px -6px rgba(0, 0, 0, 0.19);
			box-shadow: 0 8px 6px -6px rgba(0, 0, 0, 0.19);
			position: fixed;
			top:0;
	
	left: 0;
	z-index: 9;
}


.divProductsize
{
	position:fixed;
	bottom:0px;
	left:0;
}

.btn-Add
		  {
			align-self: center;
			font-size: 14px;
			
			position: relative;
				background: #e95f62;
			color: #fff;
			border: none;
			border-radius: 3px;
			margin-right:8px; 
			width:100%;
			text-align:center;
			height:40px;
			vertical-align:middle;
			font-weight:600;
		  }
		  
		  
input[type=checkbox], input[type=radio]  {
	margin: 0px !important;
	float: left;
	margin-top: 5px !important;
	margin-bottom: 4px !important;
	
	line-height: normal;
	float: left;
}
td label, label[for="ChkWallet"] {
	overflow: hidden;
	white-space: nowrap;
	margin-left: 3px;
	padding-top: 0px;
	font-size: 14px;
	margin-top: 3px;
	margin-bottom: 4px !important;
	font-weight:600;
}

		  

</style>
  
</head>
<body onload="myfuction()" onunload="myFunctiona()" class="body cms-index-index cms-home-page ">



<div id="myloader">
   
</div>

<div class="wrapper" style="background:#d0d0d0c9!important">
<div id="overlay" style=" background-color:transparent; position: absolute; z-index:9000; top:0px; right:0px; width:200px;"></div>
<form id="Form1" runat="server">

 <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"> </asp:ToolkitScriptManager>

<div id="page" > 

  

  
 <nav class="shadow-bottom" style="background:#84c225; height:50px; width:100%; color:#fff; z-index:40;  " >
  <div style="   position: fixed; width:20%; left:5%; z-index:40; top:14px;  " >
		 
				<a href="CartReview.aspx"><img src="img/backbtn.png" alt="back" /></a>
			  </div>
		<div style="   position: fixed; width:58%; left:20%; top:14px; font-size:16px; z-index:40; text-align:center;  "  >
		   <div style=" font-weight:600; ">Checkout</div>
		   
		   </div>
		   
		  
  </nav>
  
  <div style=" width:100%; height:50px;" >
	
  </div>
   <asp:UpdatePanel ID="UpdatePanel1" runat="server">
	<ContentTemplate>
  <div style=" width: 100%; background-color:White; height:auto; padding:10px 5px;">
 <img src="img/LocationAlt.png" alt="Location" /> <span style="font-size:15px; font-weight:600; ">Deliver to:</span> 


 <asp:Button ID="Button1" CssClass="btn btn-default" runat="server" 
		  style=" float:right; font-size:12px; padding: 2px 12px; " Text="Change" 
		  onclick="Button1_Click" /><br />
	  <asp:Label ID="lblAddr" runat="server" Text=""></asp:Label>
  </div>
   
  <div  style=" width: 100%; box-shadow: 0 8px 6px -6px rgba(0, 0, 0, 0.19); background:#f7f7f7!important; margin-top:10px; height:auto; padding:10px 5px; font-size:15px; font-weight:500;  ">
   <span style="font-weight:700;   ">Delivery Option: </span>  <span style="margin-left:30px;   "> Please select delivery-slot </span>
	  
	  <div class="row container " style=" margin-top:10px; margin-bottom:10px;" >
		  <asp:DropDownList ID="DropDownList1" CssClass=" form-control  " runat="server" 
			  DataSourceID="SqlDataSource1"  DataTextField="Value" DataValueField="SlotId">
		  </asp:DropDownList>
		  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
			  ConnectionString="<%$ ConnectionStrings:theOMartMSConnectionString1 %>" 
			  SelectCommand="SELECT [SlotId], [SlotCount], [Date], [Value] FROM [Slot] WHERE ([SlotCount] > 0)  AND (Date > { fn NOW() }) ORDER BY [Date] ASC">
			  <SelectParameters>
				  <asp:Parameter DefaultValue="0" Name="SlotCount" Type="Int32" />
			  </SelectParameters>
		  </asp:SqlDataSource>
	  </div>
	  
	   
  </div>
  
 <div  style=" width: 100%; box-shadow: 0 8px 6px -6px rgba(0, 0, 0, 0.19); background:#f7f7f7!important; margin-top:10px; height:auto; padding:10px 5px; font-size:15px; font-weight:500;  ">
   <span style="font-weight:700;   ">Payment Option: </span> 
	  <span style="margin-left:30px;   "> Delivery Charges </span>  <asp:Label style="font-weight:700;   " ID="DeliveryC" runat="server" Text="40"></asp:Label>
	   <div class="row container " style=" margin-top:10px; margin-bottom:10px;" >
		   <span>"Nonveg exclusive orders are delivered in 3 hrs starting from 9 am"</span>
	   </div>
	 <div class="row container " style=" margin-top:10px; margin-bottom:10px;" >
		  
		  <asp:RadioButtonList ID="Payselect"  AutoPostBack="true"  runat="server" 
							RepeatDirection="Horizontal" RepeatColumns="1" 
							onselectedindexchanged="Payselect_SelectedIndexChanged"   >
			  <asp:ListItem  Value="PayNow"  Selected="True"  >PayNow</asp:ListItem>
			  <asp:ListItem Value="COD">Cash On Delivery</asp:ListItem>
		   </asp:RadioButtonList>
	  </div>

	 <div class="row">
	 <div class=" col-sm-6 col-xs-6 col-md-6" style="font-weight:700; margin-left:0; padding-left:0;   "><img src="img/infoAlt.png" alt="infoAlt" />Grand Total:</div>
	 <div class=" col-sm-6 col-xs-6 col-md-6"><asp:Label style="font-weight:700;   " ID="LblTAmount" runat="server" Text="0"></asp:Label></div> </div>
	 
	 <div class="row">
	 <div class=" col-sm-6 col-xs-6 col-md-6" style="font-weight:700; margin-left:0; padding-left:0;   "><img src="img/infoAlt.png" alt="infoAlt" />Wallet:</div>
	 
	 <div class=" col-sm-6 col-xs-6 col-md-6">
	<asp:CheckBox ID="ChkWallet"  Checked="true"  Text="" runat="server" AutoPostBack="true" OnCheckedChanged="ChkWallet_CheckedChanged" /> 
	 </div>
	 </div>
	 
	 <div class="row">
	 <div class=" col-sm-6 col-xs-6 col-md-6" style="font-weight:700; margin-left:0; padding-left:0;   "><img src="img/infoAlt.png" alt="infoAlt" />Net Payable :

	 </div>
	 <div class=" col-sm-6 col-xs-6 col-md-6"> <asp:Label class="span3" style=" font-weight:700; color:Maroon !important;" ID="LblNetPayable" runat="server" Text="25"></asp:Label>
		 </div>
	 </div>

	 <div class="row">
	 <div class=" col-sm-6 col-xs-6 col-md-6" style="font-weight:700; margin-left:0; padding-left:0;   "><img src="img/infoAlt.png" alt="infoAlt" />Total Cashback:</div>
	 <div class=" col-sm-6 col-xs-6 col-md-6"><asp:Label style="font-weight:700;   " ID="LblCashback" runat="server" Text="0"></asp:Label></div> </div>
			 <br />
	   <div class="row container " style=" margin-top:10px; margin-bottom:10px;" >
		   <asp:Button CssClass="btn btn-Add" ID="Pay" runat="server" 
			   Text="Place the order & Proceed to Pay" onclick="AddNewOrder" />
	   </div>
  </div>
 
  
  
	   </ContentTemplate>
</asp:UpdatePanel>

<asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true"  AssociatedUpdatePanelID="UpdatePanel1" >
						<ProgressTemplate>
						  <div style="position:fixed; width: 100%; background: white; bottom:80px; z-index:9999999999999;">
							 <div class="center">
							 <center><img src="/loading.gif" class="img-responsive" style="width:60px;" /></center>  
							  </div>
						   </div>
						</ProgressTemplate>
					</asp:UpdateProgress>
	  
  
 

  <div style=" width:100%; height:34px;" >
						
						
					</div>
   
 
   

 <!--End of Newsletter Popup-->   
  </div>


 




<script type="text/javascript" src="js/bootstrap.min.js"></script> 
<script type="text/javascript" src="js/owl.carousel.min.js"></script> 
<script type="text/javascript" src="js/mobile-menu.js"></script> 
<script type="text/javascript" src="js/main.js"></script> 

  </form>

  </div>

  <div id="CatSubcat" class="hidepanel" style=" overflow:scroll; height: 100vh;  border:none;  position:fixed ;  top:0; left:0; width:100%;" >
			

			<div id="loader2" runat="server" >
	</div>
			  

			</div>


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

<script type="text/jscript">

	function mytoast() {
		// Get the snackbar DIV
		var x = document.getElementById("snackbar");

		// Add the "show" class to DIV
		x.className = "show";

		// After 3 seconds, remove the show class from DIV
		//setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
	}


</script>
<script type="text/jscript">
	function hideme() {
		var x = document.getElementById("snackbar");
		x.className = "hideme";



	}

</script>

  
<%--<script type="text/javascript">

	setInterval(function () {
		if (!navigator.onLine) {

			alert("Please Check Your Connection and Try Again");
		}
	}, 100);  
</script>--%>
 

	
 

</body>
</html>