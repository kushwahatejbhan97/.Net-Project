<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" ViewStateMode="Disabled" Inherits="KiranaWorldApp.Home" %>
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
    <link rel="stylesheet" type="text/css" href="css/AppStyle.css"   media="all"  />
    
    <meta name="robots" content="noindex, nofollow" />
    
<style type="text/css">
#myloader
{
            position: fixed;
            width: 100%;
            height: 100%;
            background:  url(/Admin/images/KiranaWorld.png) center center no-repeat, url(/loader2.gif) center center no-repeat;
            background-color:#fff;
           
            z-index: 99999;
}

.MymenuImg
{
    width:26px;
}
#myloader {
    -moz-animation: cssAnimation 0s ease-in 1.7s forwards;
    /* Firefox */
    -webkit-animation: cssAnimation 0s ease-in 1.7s forwards;
    /* Safari and Chrome */
    -o-animation: cssAnimation 0s ease-in 1.7s forwards;
    /* Opera */
    animation: cssAnimation 0s ease-in 1.7s forwards;
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



</style>
</head>
<body onload="myfuction()" onunload="myFunctiona()" class="body cms-index-index cms-home-page ">

<div id="myloader">
   
</div>

<div class="wrapper" style="background:#d0d0d0c9!important">
<div id="overlay" style=" background-color:#00000066; position: absolute; z-index:9000; top:0px; right:0px; width:100%;"></div>
<form id="Form1" runat="server">

 <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"> </asp:ToolkitScriptManager>
<div id="mobile-menu" >

<div class="row"  style="background-color:#FFEB3B; height:70px;   " >
  
      
   <div class="col-xs-10 col-sm-10 col-md-10  col-lg-10" style="text-align:center;  color: #071463; font-size:20px; padding-top:20px; " > <a  runat="server" id="CustName" style=" text-transform:capitalize" href="profile.aspx"></a> </div>
   <div class="col-xs-2 col-sm-2 col-md-2  col-lg-2" style=" height:100%;   padding-top:16px; background-color: #0000006b; text-align:right; padding-right: 4px;"   ><a href="profile.aspx" ><i style="  font-size:30px; color:#ffffffc7;" class="fa fa-angle-double-right" aria-hidden="true"></i></a> </div>
  
  </div>
 <ul>

<li><span class="home1"><img src="img/Menucategory.png" alt="Menucategory" class="MymenuImg" /> &nbsp;Categories</span>
 
    <ul style="">
    
                        <li>
                        <a href="SubCatDetails.aspx?CatId=45" style="padding-right: 55px;"> &nbsp;Foodgrains, Oil, &amp; Masala </a>
                            
                        
                        </li><li>
                        <a href="SubCatDetails.aspx?CatId=43"> &nbsp;Fruits &amp; Vegetables </a>
                            
                        
                        </li><li>
                        <a href="SubCatDetails.aspx?CatId=44"> &nbsp;Beverages </a>
                            
                        
                        </li><li>
                        <a href="SubCatDetails.aspx?CatId=49"> &nbsp;Snacks &amp; Branded Foods </a>
                            
                        
                        </li><li>
                        <a href="SubCatDetails.aspx?CatId=46"> &nbsp;Bakery, Cakes &amp; Dairy </a>
                            
                        
                        </li><li>
                        <a href="SubCatDetails.aspx?CatId=50"> &nbsp;Cleaning &amp; Household </a>
                            
                        
                        </li><li>
                        <a href="SubCatDetails.aspx?CatId=52"> &nbsp;Baby Care </a>
                            
                        
                        </li><li>
                        <a href="SubCatDetails.aspx?CatId=48"> &nbsp;Beauty &amp; Hygiene </a>
                            
                        
                        </li><li>
                        <a href="SubCatDetails.aspx?CatId=47"> &nbsp;Eggs , Meat &amp; Fish </a></li>

       
    </ul>
 </li>
 
 
 
 
 <li><a href="ChangeAddre.aspx" class="home1"><img src="img/MenuAddress.png" alt="MenuAddress" class="MymenuImg"  /> &nbsp; My Addresses</a></li>
 <li><a href="OrderDetails.aspx" class="home1"><img src="img/MenuCart.png" alt="orders"  class="MymenuImg" /> &nbsp; Orders</a></li>
 <li><a href="CartReview.aspx"  class="home1"><img src="img/MenuCart2.png" alt="My Cart"  class="MymenuImg" /> &nbsp; My Cart</a></li>
 <li><a href="ItemList.aspx?Type=3"  class="home1"><img src="img/Offers.png" alt="Offers"  class="MymenuImg" /> &nbsp; Offers</a></li>
 <li><a href="profile.aspx" class="home1"><img src="img/MenuWallet.png" alt="My Wallet"  class="MymenuImg" /> &nbsp; My Wallet</a></li>
 <li><a href="wishlist.aspx" class="home1"><i class="fa fa-heart" aria-hidden="true"></i> &nbsp; Wish List</a></li>
 <li><a href="whatsapp://send?text=Hello%2C%20I%20like%20to%20order%20with%20KiranaWorld.&phone=+918877778770"  class="home1"><i class="fa fa-whatsapp" aria-hidden="true"></i> &nbsp; Order From Whatsapp </a></li>
 <li><a runat="server" id="shareme" class="home1"><i class="fa fa-share-alt" aria-hidden="true"></i> &nbsp; Share App </a></li>
 <li><a href="contact.aspx"  class="home1"><i class="fa fa-phone" aria-hidden="true"></i> &nbsp; Contact-us </a></li>
 <li><a href="feedback.aspx"  class="home1"><i class="fa fa-comments-o" aria-hidden="true"></i> &nbsp; Feedback </a></li>
 <li><asp:LinkButton ID="LinkButton1" OnClick="logout" runat="server"><img src="img/MenuOut.png" alt="My Wallet"  class="MymenuImg" /> &nbsp; LogOut</asp:LinkButton></li>
      
 
 </ul>
    </div>
<div id="page" style="background:#d0d0d0c9!important"> 

  


  

  
  <div class=" container"  style="background:#84c225; position: fixed;  height:50px; width:100%; color:#fff; z-index:40;  " >
  <div class="mm-toggle-wrap"  style="   position: fixed; z-index:40; width:33px !important; overflow:hidden;  " >
         
            <div class="mm-toggle" style="background:#84c225"> 
                <img src="img/mobmenuicon.png" alt="MenuIcon"  style="margin:0px !important; width:24px;" /> 
            </div>
              </div>
        <div style="   position: fixed; width:58%; left:13%; top:17px; z-index:40;  "  >
           <div style=" font-weight:600; line-height:10px;">Your Location</div>
           <asp:Label ID="MyAdd" runat="server" style="display: inline-block; width: 200px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden"></asp:Label>
          </div>
           <div style="   position: fixed; width:12%; right:5%; top:14px; text-align: right;  ">            
                
                <a href="profile.aspx"><img src="img/fa-user.png" /></a> 
          </div>
          </div>
  <div class="shadow-bottom " id="headerBottom" runat="server"  style=" background:#84c225;  position: fixed; width:100%;  top:49px; z-index:40; ">
          <asp:Panel ID="Panel1" runat="server" DefaultButton="Button1">
    <asp:TextBox ID="txtSearch" placeholder="search from 5000+ products"  CssClass="form-control"  runat="server" /><img src="img/search-icon.png" alt="Search" title="Search"  style="position:fixed;  top:57px; right:5%; z-index: -1; " />

    <asp:Button ID="Button1" runat="server" OnClick="Searchclick"   Style="display: none" />
</asp:Panel>
           
   </div>
  
  
  
  

  <div class="divBanner" id="slider" runat="server" style=" margin-top:83px;"   visible="true">
         <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">        
                    <HeaderTemplate>
                    <div class="main-slider">
                    <div class="swiper-viewport">
                    <div id="slideshow0" class="swiper-container">
                    <div class="swiper-wrapper">
                    
                        </HeaderTemplate>

             <ItemTemplate> 

                                     <div class="swiper-slide text-center">
                            
                            <img src='https://www.kiranaworld.in/Admin/Slider/Mobile/<%# Eval("MblImg") %>' alt='<%# Eval("name") %>' title='<%# Eval("name") %>' class=" image img-responsive"  style=" width:100%;" />
                            
                            </div>

                            

                            

             </ItemTemplate>

                            <FooterTemplate>
                            </div>
                            </div>
                             
                            </div>

                            </div>
                            
    </FooterTemplate>
                           
                      
                            
                        
                    

        
             
  </asp:Repeater>
 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:theOMartMSConnectionString1 %>" SelectCommand="SELECT [id], [name], [show], [DeskImg], [MblImg], [CatId] FROM [Slider] WHERE ([show] = @show)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="true" Name="show" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>
 


            </div>
  
  
 <div class="row" style=" padding:0 2%; background-color:white; "><marquee width="98%"  direction="left" height="20px">
                        <asp:Label ID="lblAppMarque" runat="server" style=" font-size:18px; width:100%; font-weight:600; color:#f44336" Text=""></asp:Label>
</marquee></div>
 
 <div class="titleback" style=" background-image:url('strip/1.jpg'); color:White; " >
  
      
      Shop by category
  
  </div>
    <div class="divCategory container">
                
  

  <div class="row" style="max-width:768px; margin:0 auto;">
   
  <div class="Category col-xs-4 col-sm-3 col-md-3 col-lg-2">
  
    <a href="SubCatDetails.aspx?CatId=45"><img src="Category/grains.jpg" alt="Foodgrains, Oil, &amp; Masala" title="Foodgrains, Oil, &amp; Masala" class=" img-responsive catsubcatImg"  /></a>                    

  </div>
  
  <div class="Category col-xs-4 col-sm-3 col-md-3 col-lg-2">
  
    <a href="SubCatDetails.aspx?CatId=43"><img src="Category/fruits.jpg" alt="Fruits &amp; Vegetables" title="Fruits &amp; Vegetables" class=" img-responsive catsubcatImg"  /></a>                    

  </div>
  
  <div class="Category col-xs-4 col-sm-3 col-md-3 col-lg-2">
  
    <a href="SubCatDetails.aspx?CatId=44"><img src="Category/beverages.jpg" alt="Beverages" title="Beverages" class=" img-responsive catsubcatImg"   /></a>                    

  </div>
  
  <div class="Category col-xs-4 col-sm-3 col-md-3 col-lg-2">
  
    <a href="SubCatDetails.aspx?CatId=49"><img src="Category/snacks.jpg" alt="Snacks &amp; Branded Foods" title="Snacks &amp; Branded Foods" class=" img-responsive catsubcatImg"   /></a>                    

  </div>
  
  <div class="Category col-xs-4 col-sm-3 col-md-3 col-lg-2">
  
    <a href="SubCatDetails.aspx?CatId=46"><img src="Category/bakery.jpg" alt="Bakery, Cakes &amp; Dairy" title="Bakery, Cakes &amp; Dairy" class=" img-responsive catsubcatImg"  /></a>                    

  </div>
  
  <div class="Category col-xs-4 col-sm-3 col-md-3 col-lg-2">
  
    <a href="SubCatDetails.aspx?CatId=50"><img src="Category/cleaning.jpg" alt="Cleaning &amp; Household" title="Cleaning &amp; Household" class=" img-responsive catsubcatImg"  /></a>                    

  </div>
  
  <div class="Category col-xs-4 col-sm-3 col-md-3 col-lg-2">
  
    <a href="SubCatDetails.aspx?CatId=52"><img src="Category/babycare.jpg" alt="Baby Care" title="Baby Care" class=" img-responsive catsubcatImg"   /></a>                    

  </div>
  
  <div class="Category col-xs-4 col-sm-3 col-md-3 col-lg-2">
  
    <a href="SubCatDetails.aspx?CatId=48"><img src="Category/beauty.jpg" alt="Beauty &amp; Hygiene" title="Beauty &amp; Hygiene" class=" img-responsive catsubcatImg"   /></a>                    

  </div>
  
  <div class="Category col-xs-4 col-sm-3 col-md-3 col-lg-2">
  
    <a href="SubCatDetails.aspx?CatId=47"><img src="Category/chicken.jpg" alt="Eggs , Meat &amp; Fish" title="Eggs , Meat &amp; Fish" class=" img-responsive catsubcatImg"   /></a>                    

  </div>
  
  
  
  </div>
      
  
  </div>


  
 <div class="titleback" style=" background-image:url('strip/5.jpg'); " >
  
      
      Foodgrain, Oil & Masala
  
  </div>


  <div class="divCategory container">
                
  

  <div class="row" style="max-width:768px; margin:0 auto;">
   
   
            <div class="Category col-xs-6 col-sm-6 col-md-3 col-lg-2"  >

            <a href="ItemList.aspx?Type=5&amp;SubCatId=110"> <img src="https://www.kiranaworld.in/Admin/Subcategory/Mobile/3013864.jpg" alt="Atta | Flour" title="Atta | Flour" class=" img-responsive catsubcatImg"   /> </a>                   

                
            </div>
        
            <div class="Category col-xs-6 col-sm-6 col-md-3 col-lg-2"  >

            <a href="ItemList.aspx?Type=5&amp;SubCatId=111"> <img src="https://www.kiranaworld.in/Admin/Subcategory/Mobile/3013875.jpg" alt="Rice | Rice products" title="Rice | Rice products" class=" img-responsive catsubcatImg"   /> </a>                   

                
            </div>
        
            <div class="Category col-xs-6 col-sm-6 col-md-3 col-lg-2"  >

            <a href="ItemList.aspx?Type=5&amp;SubCatId=112"> <img src="https://www.kiranaworld.in/Admin/Subcategory/Mobile/3013868.jpg" alt="Oil | Ghee" title="Oil | Ghee" class=" img-responsive catsubcatImg"   /> </a>                   

                
            </div>
        
            <div class="Category col-xs-6 col-sm-6 col-md-3 col-lg-2"  >

            <a href="ItemList.aspx?Type=5&amp;SubCatId=113"> <img src="https://www.kiranaworld.in/Admin/Subcategory/Mobile/3013862.jpg" alt=" Dals | Pulses" title=" Dals | Pulses" class=" img-responsive catsubcatImg"   /> </a>                   

                
            </div>
        
  
  
  
  
  </div>
  
      
  
  </div>

  
   <div class="titleback" style=" background-image:url('strip/1.jpg'); color:White; " >
  
      
      Fruits & Vegetables
  
  </div>


 <div class="divCategory container">
                
  

  <div class="row" style="max-width:768px; margin:0 auto;">
   
   
            <div class="Category col-xs-6 col-sm-6 col-md-3 col-lg-2" >
                <a href="ItemList.aspx?Type=5&amp;SubCatId=96"> <img src="https://www.kiranaworld.in/Admin/Subcategory/Mobile/3013887.jpg" alt="Vegetables" title="Vegetables" class=" img-responsive catsubcatImg"   /> </a>     
            </div>
        
            <div class="Category col-xs-6 col-sm-6 col-md-3 col-lg-2"  >
                <a href="ItemList.aspx?Type=5&amp;SubCatId=97"> <img src="https://www.kiranaworld.in/Admin/Subcategory/Mobile/3013885.jpg" alt="Fresh fruits" title="Fresh fruits" class=" img-responsive catsubcatImg"   /> </a>     
            </div>
        
            <div class="Category col-xs-6 col-sm-6 col-md-3 col-lg-2"  >
                <a href="ItemList.aspx?Type=5&amp;SubCatId=100"> <img src="https://www.kiranaworld.in/Admin/Subcategory/Mobile/3013881.jpg" alt="Exotic" title="Exotic" class=" img-responsive catsubcatImg"   /> </a>     
            </div>
        
            <div class="Category col-xs-6 col-sm-6 col-md-3 col-lg-2"  >
                <a href="ItemList.aspx?Type=5&amp;SubCatId=176"> <img src="https://www.kiranaworld.in/Admin/Subcategory/Mobile/3013883.jpg" alt="Flowers" title="Flowers" class=" img-responsive catsubcatImg"   /> </a>     
            </div>
        
  
  
  
  
  </div>
  
      
  
  </div>

   <div class="titleback" style=" background-image:url('strip/5.jpg'); " >
  
      
      Cleaning & Household
  
  </div>


  <div class="divCategory container">
                
  

  <div class="row" style="max-width:768px; margin:0 auto;">
   
   
            <div class="Category col-xs-6 col-sm-6 col-md-3 col-lg-3"  >
                <a href="ItemList.aspx?Type=5&amp;SubCatId=134"> <img src="https://www.kiranaworld.in/Admin/Subcategory/Mobile/3013845.jpg" alt="Detergents | Dishwash" title="Detergents | Dishwash" class=" img-responsive catsubcatImg"   /> </a>     
            </div>
        
            <div class="Category col-xs-6 col-sm-6 col-md-3 col-lg-3"  >
                <a href="ItemList.aspx?Type=5&amp;SubCatId=135"> <img src="https://www.kiranaworld.in/Admin/Subcategory/Mobile/3013843.jpg" alt="All Purpose Cleaners" title="All Purpose Cleaners" class=" img-responsive catsubcatImg"   /> </a>     
            </div>
        
            <div class="Category col-xs-6 col-sm-6 col-md-3 col-lg-3"  >
                <a href="ItemList.aspx?Type=5&amp;SubCatId=136"> <img src="https://www.kiranaworld.in/Admin/Subcategory/Mobile/3013855.jpg" alt="Repellents | Fresheners" title="Repellents | Fresheners" class=" img-responsive catsubcatImg"   /> </a>     
            </div>
        
            <div class="Category col-xs-6 col-sm-6 col-md-3 col-lg-3"  >
                <a href="ItemList.aspx?Type=5&amp;SubCatId=138"> <img src="https://www.kiranaworld.in/Admin/Subcategory/Mobile/3013849.jpg" alt="Mops | Bushes | Scrubs" title="Mops | Bushes | Scrubs" class=" img-responsive catsubcatImg"   /> </a>     
            </div>
        
  
  
  
  
  </div>
  
      
  
  </div>


 <!--End of Newsletter Popup-->   
  </div>


<div runat="server" id="CatSubcat" class="hidepanel" style=" overflow:scroll; height: 100vh;  border:none;  position:fixed ; top:0; left:0; width:100%;" >
            

            <div id="loader2" runat="server" >
    </div>
              

            </div>

 <div class="container">
 
        <div class="row">
            <div class="col-main col-sm-12 col-xs-12">
              
              

                    <div class="page-title" style="padding-bottom: 50px;">
                    
                        
                    </div>

                   
                    <div id="footerBottom" class="footer headroomft headroom headroom--not-bottom headroom--pinned headroom--top" style="display: block;">
         <ul  style="background:#ffffff;">

            <li >
                <a href="javascript:void(0);"><img src="/AdminImg/KiranaWorld.png" alt="Home" title="Home" style=" height:25px;" /></a>
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
                <asp:Label ID="cartCount" CssClass="circlecart" runat="server" Text="0"></asp:Label>     
                    
            </div>
        </div>
    </div>




  </form>

  </div>

 
     <script type="text/javascript" src="js/bootstrap.min.js" ></script> 
     
<script type="text/javascript" src="js/mobile-menu.js"></script> 
         
    <script type="text/jscript" src="swiper/js/swiper.jquery.js"></script>
    <link href="swiper/css/swiper.min.css" rel="stylesheet"
        media="screen" />

        <script><!--
            $('#slideshow0').swiper({
                mode: 'horizontal',
                slidesPerView: 1,

                paginationClickable: true,

                spaceBetween: 0,
                autoplay: 3000,
                autoplayDisableOnInteraction: true,
                loop: true
            });
--></script>


<script type="text/javascript" src="js/owl.carousel.min.js"></script> 
<script type="text/javascript" src="js/mobile-menu.js"></script> 
<script type="text/javascript" src="js/main.js"></script> 

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

  
  <script type="text/jscript">

      window.addEventListener("beforeunload", function (e) {
          var x = document.getElementById("CatSubcat");
          x.className = "move";


          var preloader = document.getElementById("loader2");
          preloader.className = "secondloaderHider";

      });


      
  
  </script>
 

    
 

</body>

</html>
