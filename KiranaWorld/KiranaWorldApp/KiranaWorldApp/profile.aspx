<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="KiranaWorldApp.profile" %>
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
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />

    <link rel="stylesheet" type="text/css" href="css/Mystyle.css" media="all" />

    <link rel="stylesheet" type="text/css" href="css/font-awesome.css" media="all" />


    


    

   
    
<style type="text/css">
    .Category
    {
        border-bottom: 0.5px solid rgb(238, 238, 238); overflow:hidden; color:#04223e;
        font-size:15px;
        padding:10px;
        padding-left:10px !important;
        
        
        
    }
#myloader
{
   position: fixed;
            width: 100%;
            height: 100%;
            background:  url(/Admin/images/KiranaWorld.png) center center no-repeat, url(/loader2.gif) center center no-repeat;
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
    padding: 5px;
    border-radius: 3px;
    -ms-flex-item-align: stretch;
    align-self: stretch;
    border: 1px solid #d0d0d0;
    background: url('img/dropdownside.png') no-repeat 98%;
    max-width: 160px; line-height:23.2px !important;  
    font-size:14px;
    white-space: nowrap;
    overflow:hidden;  
    text-overflow: ellipsis;
    display:block;
    min-width:50px;
    height:35px;
}

.filtercontrol
        {
            height:auto !important;
            text-align:left;
            border:none;
            padding: 0px !important;
            box-shadow: none;
        }
        .block-content::-webkit-scrollbar {
  width: 4px;
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
.MymenuImg
{
    width:22px;
}
.mobile-menu li {
    border: 1px solid gainsboro;
}
.divCategory
{
    padding-left:0px;
    padding-right:0px;
}
.mobile-menu li span {
    display: inline;
    color:White;
        padding-top: 1px !important;
    padding-bottom: 1px !important;
    padding-left: 2px !important;
}

</style>


  
</head>
<body onload="myfuction()" onunload="myFunctiona()" class="body cms-index-index cms-home-page ">


<div id="myloader">
   
</div>

<div class="wrapper" >
<div id="overlay" style=" background-color:transparent; position: absolute; z-index:9000; top:0px; right:0px; width:200px;"></div>
<form id="Form1" runat="server">

 

<div id="page" style="background:#fff!important"> 

  


 <nav class="shadow-bottom" style="background:#84c225; height:50px; width:100%; color:#fff; z-index:40;  " >

 <div class=" container" id="headertop" runat="server"  style="background:#84c225; position: fixed;  height:50px; width:100%; color:#fff; z-index:40;  " >
  <div class="mm-toggle-wrap"  style="   position: fixed; width:20%; z-index:40;  " >
         
            <div class="mm-toggle " style="background:#84c225"> 
            <a href="Home.aspx" onclick="goBack()"><img src="img/backbtn.png" alt="back" /></a>
            </div>
              </div>
        <div style="   position: fixed; width:58%; left:20%; top:16px; font-size:16px; z-index:40; text-align:center;">
           <div ><asp:Label ID="catname" style=" font-weight:600; color:White; font-size:16px; " runat="server" Text="Profile"></asp:Label>
           
           </div>
           </div>
           </div>
           
          
  </nav>
  
  <div style=" width:100%; height:50px;" >
    
  </div>


 


  <div class="divCategory container" style=" width:100%;"  >
                
  

  <div class="row clearfix" style="background-color: #FFEB3B;padding: 10px; color: #071463; font-size: 17px;">

            <div class=" col-sm-3 col-xs-3 col-md-2 col-lg-2">

                <img src="img/man-300x300.png" class=" img-responsive" />
            </div>
            <div class=" col-sm-9 col-xs-9 col-md-10 col-lg-10" style=" padding:10px;">
            <asp:Label ID="CName" runat="server" Text="" style=" font-size: 20px; width:100%" ></asp:Label>
            <asp:Label ID="CEmail" runat="server" Text=""  ></asp:Label><br />
            <asp:Label ID="CMob" runat="server" Text=""  ></asp:Label>
           </div>
           </div>
            <div class="row mobile-menu" style="">

          

           <ul>
           <li><a href="ChangeAddre.aspx" class="home1"><img src="img/MenuAddress.png" alt="MenuAddress" class="MymenuImg"  /> &nbsp; My Addresses</a></li>
 <li><a href="OrderDetails.aspx" class="home1"><img src="img/MenuCart.png" alt="orders"  class="MymenuImg" /> &nbsp; Orders <div style=" float:right; margin-right:10px; background-color:#33c333;  padding:2px; width:auto; text-align:center; border-radius: 2px;"> <asp:Label   ID="NoofOrder" runat="server" Text="0"></asp:Label></div></a></li>
 <li><a href="CartReview.aspx"  class="home1"><img src="img/MenuCart2.png" alt="My Cart"  class="MymenuImg" /> &nbsp; My Cart</a></li>
 <li><a href="ItemList.aspx?Type=3"  class="home1"><img src="img/Offers.png" alt="Offers"  class="MymenuImg" /> &nbsp; Offers</a></li>
 <li><a href="javascript:void(0);"  class="home1"><img src="img/MenuGift.png" alt="ReferCode"  class="MymenuImg" /> &nbsp; ReferCode <div style=" float:right; margin-right:10px; background-color:#33c333; padding:2px; width:auto;  color:White; border-radius: 2px;"><asp:Label ID="LblReferId"  runat="server" ></asp:Label></div></a></li>
 <li><a href="javascript:void(0);" class="home1"><img src="img/MenuWallet.png" alt="My Wallet"  class="MymenuImg" /> &nbsp; My Wallet <div style=" float:right; margin-right:10px; background-color:#33c333; padding:2px; width:auto;  color:White; border-radius: 2px;">₹<asp:Label ID="Wallet"  runat="server" Text="0"></asp:Label></div></a></li>
 <li><a href="wishlist.aspx" class="home1"><i class="fa fa-heart" aria-hidden="true"></i> &nbsp; Wish List</a></li>
 <li><asp:LinkButton ID="LinkButton1" OnClick="logout" runat="server"><img src="img/MenuOut.png" alt="My Wallet"  class="MymenuImg" /> &nbsp; LogOut</asp:LinkButton></li>
      
 
           </ul>
          
                
            <div class="line"></div>

           </div>
  
  </div>
  
      
  
  </div>

  
  
   
 <div class="container">
 
        <div class="row">
            <div class="col-main col-sm-12 col-xs-12">
              
              

                    

                   
                    <div class="col-main col-sm-12 col-xs-12">
              
              

                    <div class="page-title" style=" height:50px;">
                        
                        
                    </div>

                   
        <div id="footerBottom" class="footer headroomft headroom headroom--not-bottom headroom--pinned headroom--top" style="display: block;">
         <ul  style="background:#ffffff;">

            <li >
                <a href="Home.aspx"><img src="/AdminImg/KiranaWorld.png" alt="Home" title="Home" style=" height:25px;" /></a>
            </li>


            <li >
                <a href="Categories.aspx"><img src="img/Categories.png" alt="Categories" title="Categories" style=" height:31px;" /></a>
           </li>


            <li > 
            <a href="Search.aspx"><img src="img/Search.png"  alt="Search" title="Search" style=" height:31px;" /></a>
            </li>


            <li >
           <a href="ItemList.aspx?Type=3"> <img src="img/Offers.png" alt="" title="" style=" height:31px;" /></a>
           </li>


            <li > 
            <a href="CartReview.aspx"><img src="img/Basket.png"  alt="Basket" title="Basket" style=" height:31px;" /></a>
            </li>
        </ul>
        </div>
                   
                    
            </div>
     <%--    <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true"  AssociatedUpdatePanelID="UpdatePanel1" >
                        <ProgressTemplate>
                          <div style="position:fixed; width: 100%; background: white; bottom:150px; z-index:9999999999999;">
                             <div class="center">
                             <center><img src="/loading.gif" class="img-responsive" style="width:60px;" /></center>  
                              </div>
                           </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>   --%>       
                    
            </div>
        </div>
    </div>

 <!--End of Newsletter Popup-->   
  </div>


 





  </form>

  </div>

  <div  id="CatSubcat" class="hidepanel" style=" overflow:scroll; height: 100vh;  border:none;  position:fixed ;  top:0; left:0; width:100%;" >
            

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

    function myalertPop() {
        // Get the snackbar DIV
        var x = document.getElementById("alertpop");

        // Add the "show" class to DIV
        x.className = "show";

        // After 3 seconds, remove the show class from DIV
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
    }


</script>
<script type="text/jscript">
    function hideme() {
        var x = document.getElementById("snackbar");
        x.className = "hideme";



    }

</script>
    
 <script type="text/javascript">
     function goBack() {
         window.history.back();
     }
</script>

</body>
</html>
