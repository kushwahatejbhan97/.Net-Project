<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyOrders.aspx.cs" Inherits="KiranaWorldApp.MyOrders" %>
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
   <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    
    <link rel="stylesheet" type="text/css" href="css/Mystyle.css" media="all" />

    <style type="text/css">
        
        .divBanner
        {
            
          
            
            margin-top:3px;
            margin-bottom:3px;
            
           
        }
        .divCategory
        {
            padding-left:5px;
            padding-right:5px;
        }
       .Category
        {
            padding-left:0px !important;
            padding-right:0px !important;
        }
        
        .offer
        {
             border-radius:50%;
            height:40px;
            width:40px;
            font-size:11px;
            font-family:ProximaNova;
            position: absolute;
            text-align:center;
            
    top: 3px;
    left: 3px;
    padding: 7px;
    pointer-events: none;
    line-height: 120%;
    background: #e95f62;
    color: #fff;
        }
        
        .divHotproducts
        {
            font-family:ProximaNova;
        }
        .divProName
        {
        line-height: 18px !important;
    font-size: 1.6rem;
    color: #1a1a1a;
    -webkit-line-clamp: 2;
    font-weight: 400;
            
        }
            
          
          
          .Type
          {
    height: 14px;
    width: 14px;
    z-index: 1;
    position: absolute;
    bottom: 10px;
    left: 5px;
          }
          
          .brand
          {
              text-transform: uppercase;
    color: #8f8f8f; 
    font-family:ProximaNova; 
    font-size:14px;
     font-weight:700;
     
     line-height:18.2px;
          }
            .circlecart {
  color:Black;
  font-size:9px;
 
 
 
  padding:6px;
  border-radius:999px;
  line-height:6px;
  position:fixed;
  right:22%;
  
  bottom:25px;
  text-align:center;
 
  font-weight:bold;
  background: white;
  border:1px solid red;

  z-index:600;
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
          
    
    </style>


    


    <style type="text/css">
        
       
.mobile-menu li li
{
    background:#ffffff;
}

        .round-button {
    display:block;
    width:40px;
    height:40px;
    line-height:40px;
   
    border-radius: 50%;
    color:#0f1015;
    text-align:center;
    text-decoration:none;
    background: #dfdddd;
    box-shadow: 0 0 3px gray;
    font-size:18px;
    font-weight:bold;
    margin-left:3px;
}
.round-button:hover 
{
    color:White;
    background: #fed700;
}
        
      .nav {
    padding-left: 0;
    margin-bottom: 0;
    list-style: none;
    display: flow-root;
}

    .footMenu    
        {
   position: fixed;
    bottom: 52px;
    right: 0px;
    background: #1fa287;
    width: 200px;
}
        
    .footer {
    position: fixed;
    bottom: 0;
    left: 0;
    z-index: 9;
    width: 100%;
    background-color: #fff;
    height: 50px;
    -webkit-box-shadow: 0px 0 10px rgba(0, 0, 0, 0.19);
	   -moz-box-shadow: 0px 0 10px rgba(0, 0, 0, 0.19);
	        box-shadow: 0px 0 10px rgba(0, 0, 0, 0.19);
    will-change: transform;
    border-radius: 0px 0px 1px 1px;
}
.footer ul {
    padding: 0;
    
    margin: 0px auto;
    list-style-type: none;
    width: 90%;
    display: table;
    height: 100%;
}
#mobile-menu
{
    text-transform:none;
}
.Address
{
       background: #84c225;
    padding: 5px 8px;
    color: #fff;
    font-size: 1.6rem;
    text-align: center;
}
.footer ul li {
    width: 20%;
    display: table-cell;
    text-align: center;
    position: relative;
    padding-top: 0;
    vertical-align: middle;
    line-height: normal;
    padding-left:10px;
}
ul li {
    list-style-type: none;
}
ul, ol, li {
    list-style: none;
    margin: 0;
    padding: 0;
    background: none;
}
    </style>

   
    
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

.drpcss {
    margin: 14px 0;
    padding: 5px 34px 5px 10px;
    border-radius: 3px;
    -ms-flex-item-align: stretch;
    align-self: stretch;
    border: 1px solid #d0d0d0;
    background: url('img/dropdownside.jpg') no-repeat 95%;
}

</style>
  
</head>
<body onload="myfuction()" onunload="myFunctiona()" class="body cms-index-index cms-home-page ">



<div id="myloader">
   
</div>

<div class="wrapper" style="background:#fff">
<div id="overlay" style=" background-color:transparent; position: absolute; z-index:9000; top:0px; right:0px; width:200px;"></div>
<form id="Form1" runat="server">

 <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"> </asp:ToolkitScriptManager>

<div id="page" > 

  

  
 <nav class="shadow-bottom" style="background:#84c225; height:50px; width:100%; color:#fff; z-index:40;  " >
  <div style="   position: fixed; width:20%; left:5%; z-index:40; top:14px;  " >
         
            	<i class='fas fa-angle-left' style='font-size:22px'></i>
              </div>
        <div style="   position: fixed; width:58%; left:20%; top:14px; font-size:16px; z-index:40; text-align:center;  "  >
           <div style=" font-weight:600; ">My Orders</div>
           
           </div>
           
          
  </nav>
  
  <div style=" width:100%; height:50px;" >
    
  </div>
  
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

  <div class="row" style="  background-color:#d0d0d040!important; height:auto; padding:10px 5px;">
  <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9">
 
 <span style="font-size:14px">Please select multiple Pay Now orders to pay at once.</span>
 </div>

 <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
 <asp:Button ID="Button1" CssClass="btn btn-Add" runat="server" 
          style=" float:right; font-size:12px; padding: 2px 12px; " Text="PAY NOW" 
           />
           </div>
     
  </div>
   
  
  <div class="row" style="margin-top:10px; margin-left:10px;">
  <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
  &#10060
  </div>
  <div class="row col-xs-10 col-sm-10 col-md-10 col-lg-10" style="background:#d0d0d040!important; margin-left:10px;">
  <span style="font-weight:bold">Thu 20 Mar 2020</span><br />
  <span>MHO-114654209-220320</span><br />
  <span>Rs</span>&nbsp;<span>1525</span><br />
  <span style="float:left">12 Items</span><span style="float:right">Cancelled</span>
  
  </div>
  
  
  
  </div>

  <div class="row" style="margin-top:10px; margin-left:10px;">
  <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
  &#10060
  </div>
  <div class="row col-xs-10 col-sm-10 col-md-10 col-lg-10" style="background:#d0d0d040!important; margin-left:10px;">
  <span style="font-weight:bold">Thu 20 Mar 2020</span><br />
  <span>MHO-114654209-220320</span><br />
  <span>Rs</span>&nbsp;<span>1525</span><br />
  <span style="float:left">12 Items</span><span style="float:right">Cancelled</span>
  
  </div>
  
  
  
  </div>
 
 <div class="row" style="margin-top:10px; margin-left:10px;">
  <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
  &#10004
  </div>
  <div class="row col-xs-10 col-sm-10 col-md-10 col-lg-10" style="background:#d0d0d040!important; margin-left:10px;">
  <span style="font-weight:bold">Thu 20 Mar 2020</span><br />
  <span>MHO-114654209-220320</span><br />
  <span>Rs</span>&nbsp;<span>1525</span><br />
  <span style="float:left">12 Items</span><span style="float:right">Complete</span>
  
  </div>
  
  
  
  </div>
  
  <div class="row" style="margin-top:10px; margin-left:10px;">
  <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
  &#10004
  </div>
  <div class="row col-xs-10 col-sm-10 col-md-10 col-lg-10" style="background:#d0d0d040!important; margin-left:10px;">
  <span style="font-weight:bold">Thu 20 Mar 2020</span><br />
  <span>MHO-114654209-220320</span><br />
  <span>Rs</span>&nbsp;<span>1525</span><br />
  <span style="float:left">12 Items</span><span style="float:right">Complete</span>
  
  </div>
  
  
  
  </div>
      
      
     </ContentTemplate>

 </asp:UpdatePanel>
 <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true"  AssociatedUpdatePanelID="UpdatePanel1" >
                        <ProgressTemplate>
                          <div style="position:fixed; width: 100%; background: white; bottom:150px; z-index:9999999999999;">
                             <div class="center">
                             <center><img src="/loading.gif" class="img-responsive" style="width:60px;" /></center>  
                              </div>
                           </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
 

  <div style=" width:100%; height:50px;" >
                        
                        
                    </div>
   
 
   

 <!--End of Newsletter Popup-->   
  </div>


 




<script type="text/javascript" src="js/bootstrap.min.js"></script> 
<script type="text/javascript" src="js/owl.carousel.min.js"></script> 
<script type="text/javascript" src="js/mobile-menu.js"></script> 
<script type="text/javascript" src="js/main.js"></script> 

  </form>

  </div>

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
