<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShopbyCategory.aspx.cs" Inherits="KiranaWorldApp.ShopbyCategory" %>
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
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/simple-line-icons.css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />
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
            
          .btn-Add
          {
                  align-self: center;
    font-size: 14px;
    padding: 6px 20px;
    position: relative;
        background: #e95f62;
    color: #fff;
    border: none;
    border-radius: 3px;
    margin-right:8px; 
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
            
    
    </style>


    <style>
        
       
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

   <%-- <script  type="text/javascript">
    
    document.addEventListener('contextmenu', event => event.preventDefault());
    
    </script>--%>
    
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

</style>
</head>
<body onload="myfuction()" onunload="myFunctiona()" class="body cms-index-index cms-home-page ">


<%--xs-4 sm-3 md-2 lg-2--%>
<%--xs-12 sm-12 md-6 lg-6--%>
<div id="myloader">
   
</div>

<div class="wrapper" style="background:#d0d0d0c9!important">
<div id="overlay" style=" background-color:transparent; position: absolute; z-index:9000; top:0px; right:0px; width:200px;"></div>
<form id="Form1" runat="server">

 <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"> </asp:ToolkitScriptManager>
<div id="mobile-menu">
 <ul>
 <li style="background:#fcfcfc; padding:15px"><label style=" font-weight:normal;">Hello</label><br />
    <asp:Label ID="CustName" style="font-size:15px" runat="server" Text="Customer"></asp:Label><br />
 
    
<asp:Label ID="CusAddressfull" Visible="false" runat="server" style=" font-weight:normal;" ><i class="fa fa-map-marker" aria-hidden="true"></i> &nbsp;<asp:Label ID="CusAddress" runat="server" Text=""></asp:Label> </asp:Label>
 </li>
 <li><a href="Home.aspx" class="home1"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;Home</a></li>
 <li><a href="myProfile.aspx" class="home1"><i class="fa fa-user" aria-hidden="true"></i> &nbsp;My Account</a></li>
 <li><a href="Wallet.aspx" class="home1"><img src="img/wallet.png" style="height: 12px;" /> &nbsp;My Wallet</a></li>
 <li><a href="Mysubscriptions.aspx" class="home1"><i class="fa fa-calendar" aria-hidden="true"></i> &nbsp;Mysubscriptions</a></li>
 <li><a href="Orders.aspx" class="home1"><i class="fa fa-shopping-basket" aria-hidden="true"></i>&nbsp; Orders</a></li>
 <li><a href="OldOrders.aspx" class="home1"><i class="fa fa-shopping-cart" aria-hidden="true"></i> &nbsp;Previous Orders</a></li>
 <li><a href="Notifications.aspx" class="home1"><i class="fa fa-bell" aria-hidden="true"></i> &nbsp;Notifications</a></li>
 <li><asp:LinkButton ID="LinkButton3" runat="server"   CssClass="home1"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;Log out</asp:LinkButton></li>
 </ul>
    </div>
<div id="page" style="background:#d0d0d0c9!important"> 

  
  <!-- Navbar -->


  <nav class="shadow-bottom" style="background:#84c225; height:92px; width:100%; color:#fff;  " >
  <div class="mm-toggle-wrap"  style="   position: fixed; width:20%; " >
         
            <div class="mm-toggle " style="background:#84c225"> 
            <i class="fa fa-align-justify" style="margin:0px !important; width:23px;"></i> 
            </div>
              </div>
        <div style="   position: fixed; width:58%; left:20%; top:16px; "  >
           <h4 style="text-align:center; color:#fff;">TheOMart</h4>
          
           </div>
           <div style="   position: fixed; width:12%; right:5%; top:14px  ">            
                <i class="fa fa-user" style=" float:right;" aria-hidden="true"></i> 
          </div>
          <div style="   position: fixed; width:96%; left:2%; right:2%; top:50px; ">
           <asp:TextBox ID="TextBox1" placeholder="search 18000+ products" CssClass="form-control"   runat="server"></asp:TextBox>
          </div>
  </nav>
  
  <div style=" width:100%; height:96px;" >
    
  </div>
  <div class="row" style="text-align:center; background:#fff; height:auto;">
  <h4 style="padding:9px; color:#1a1a1a; font-weight:100; text-transform:uppercase;">Shop By Category</h4>
  
  </div>

  <div class="Category">
  <ul>

        <asp:Repeater ID="outerRep" runat="server" >

            <ItemTemplate>

                <li>

                    <asp:Label Font-Size="Large" Font-Bold="true" ID="lblCategoryName" runat="server"

                        Text='<%# Eval("CatName") %>' />

                </li>

                <ul>

                <asp:Repeater ID="innerRep" runat="server">

                    <ItemTemplate>

                        <li style="background-color: AliceBlue">

                            <asp:HyperLink ID="hlProductName" runat="server" Text='<%# Eval("SubCatName")%>' />

                      </li>

                    </ItemTemplate>

                </asp:Repeater>

                </ul>

                </ItemTemplate>

                </asp:Repeater>

                </ul>
  
  </div>

    

  
  <div style=" width:100%; height:50px;" >
                        
                        
                    </div>
   
 <div class="container">
 
        <div class="row">
            <div class="col-main col-sm-12 col-xs-12">
              
              

                    <div class="page-title" style="padding-bottom: 10px;">
                        
                    </div>

                   
                    <footer id="footerBottom" class="footer headroomft headroom headroom--not-bottom headroom--pinned headroom--top" style="display: block;">
         <ul  style="background:#ffffff;">

            <li >
             <asp:LinkButton ID="LinkButton5" PostBackUrl="~/Android/User/Home.aspx" runat="server">
                    <img src="img/Logo%20-%20Copy.png" style="width:30px; height:30px" />
                    </asp:LinkButton>
            </li>


            <li >
            <asp:LinkButton ID="LinkButton4" runat="server"> <img src="img/Categories.png" /></asp:LinkButton>
           </li>


            <li > 
            <asp:LinkButton ID="LinkButton1" runat="server"><img src="img/Search.png" /></asp:LinkButton>
            </li>


            <li >
            <asp:LinkButton ID="LinkButton2" runat="server"> <img src="img/Offers.png" /></asp:LinkButton>
           </li>


            <li > 
             <asp:LinkButton ID="LinkButton6" runat="server"><img src="img/Basket.png" /></asp:LinkButton>
            </li>


          
          
            

        </ul>
        </footer>
                   
                    
            </div>
        </div>
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
        setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
    }


</script>

  
<%--<script type="text/javascript">

    setInterval(function () {
        if (!navigator.onLine) {

            alert("Please Check Your Connection and Try Again");
        }
    }, 100);  
</script>--%>
 <%--<script  type="text/javascript">
    
    document.addEventListener('contextmenu', event => event.preventDefault());
    
    </script>--%>

    
 

</body>
</html>
