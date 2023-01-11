<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Success.aspx.cs" Inherits="KiranaWorldApp.Success" %>
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
td label {
    overflow: hidden;
    white-space: nowrap;
    margin-left: 3px;
    padding-top: 1px;
    font-size: 13px;
    margin-top: 3px;
    margin-bottom: 4px !important;
}

          

</style>
  
</head>
<body onload="myfuction()" onunload="myFunctiona()" class="body cms-index-index cms-home-page ">



<div id="myloader">
   
</div>

<div class="wrapper" style="background:#fff !important">
<div id="overlay" style=" background-color:transparent; position: absolute; z-index:9000; top:0px; right:0px; width:200px;"></div>
<form id="Form1" runat="server">

 <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"> </asp:ToolkitScriptManager>

<div id="page" > 

  

  
 <nav class="shadow-bottom" style="background:#84c225; height:50px; width:100%; color:#fff; z-index:40;  " >
  <div style="   position: fixed; width:20%; left:5%; z-index:40; top:14px;  " >
         
            	
              </div>
        <div style="   position: fixed; width:58%; left:20%; top:14px; font-size:16px; z-index:40; text-align:center;  "  >
           <div style=" font-weight:600; ">Order Placed</div>
           
           </div>
           
          
  </nav>
  
  <div style=" width:100%; height:70px;" >
    
  </div>
   <div style=" width:94%; margin:0 auto; font-size:15px;   ">
    <center>
   
       <img src="img/OrderPlaced.png" alt="Success" /><br /><br />
        <span style="color: #37d354; font-size:18px;   ">Order has been placed successfully</span><br />
        <span style=" font-size:15px;   "> with cash on delivery as payment mode.</span><br /> <br /> 
        <a href="OrderDetails.aspx" style=" font-size:15px;  font-weight:bold; color:White; " class=" btn  btn-danger " >View Orders</a>
    
    
     <a href="Default.aspx" style=" font-size:15px;  font-weight:bold; color:White; " class=" btn  btn-danger " >Continue Shopping</a>
   </center>
   <br />
 
  </div>

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
