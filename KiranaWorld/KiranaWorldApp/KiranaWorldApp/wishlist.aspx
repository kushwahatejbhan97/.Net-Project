<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wishlist.aspx.cs" Inherits="KiranaWorldApp.wishlist" %>
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
    
    .price {
    font-size: 14px;
    color: #5f686f;
    white-space: nowrap !important;
    margin:10px;
}
    
.divHotproducts
{
    -webkit-box-shadow: 0 8px 6px -6px rgba(0, 0, 0, 0.19);
	   -moz-box-shadow: 0 8px 6px -6px rgba(0, 0, 0, 0.19);
	        box-shadow: 0 8px 6px -6px rgba(0, 0, 0, 0.19);
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
.MyfullBottomBtn
{
    background: #e95f62;
    padding: 15px 8px;
    color: #fff;
    font-size: 1.6rem;
    text-align: center;
    width: 100%;
    position: fixed;
    bottom: 0px;
    left:0px;
    z-index: 10;
    border: none;
}
.MyBtn
{
    background: #0a1450;
    color: #fff;
    font-size: 9px;
    text-align: center;
    border: none;
    height: 23px;
    padding: 2px 10px;
    margin-top: 0px;
    margin-bottom: 5px;
    font-weight: 900;
}


.MyGenBtn
{
    background: #e95f62;
    
    color: #fff;
    font-size: 1.3rem;
    text-align: center;
    width: 19.5%;

    border: none;
    height: 32px;
    padding: 6px 10px;
}

.form-control
{
    border:none !important ;
    box-shadow:inset 0 1px 1px #fff;
    transition:#fff ease-in-out .15s, box-shadow ease-in-out .15s;
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

.container {
    padding-right: 0px;
    padding-left: 0px;
    margin-right: 0px;
    margin-left: 0px;
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
.aspNetDisabled
{
    background:Gray !important;
}
#TxtCoupon::placeholder {
  color: #ccccccd1;
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

 <div class=" container" id="headertop" runat="server"  style="background:#84c225; position: fixed;  height:50px; width:100%; color:#fff; z-index:40;  " >
  <div class="mm-toggle-wrap"  style="   position: fixed; width:20%; z-index:40;  " >
         
            <div class="mm-toggle " style="background:#84c225"> 
            <a href="javascript:void(0)" onclick="goBack()"><img src="img/backbtn.png" alt="back" /></a>
            </div>
              </div>
        <div style="   position: fixed; width:58%; left:20%; top:16px; font-size:16px; z-index:40; text-align:center;">
           <div ><asp:Label ID="catname" style=" font-weight:600; color:White; font-size:16px; " runat="server" Text="Your Wish List"></asp:Label>
           
           </div>
           </div>
           </div>
           
          
  </nav>
  
  <div style=" width:100%; height:48px;" >
    
  </div>

       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
 



   
  <div class="divHotproducts container" style="background:#fff;" >
 
 
  <asp:Repeater ID="RepeaterHotProducts" runat="server"  OnItemCommand="RepeaterCartCommand">
                        <ItemTemplate>
  <div class="row col-xs-12 col-sm-12 col-md-6 col-lg-6" style="background:#fff; padding-top:10px; padding-left:3px !important; padding-right:3px !important; border-bottom:1px solid #eee;" >

  
  <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" style="padding-left:0px !important; padding-right:0px !important;">
  <div class="offer">
  <span style="margin-top:5px"><%# Eval("Discount")%>% Off</span>
  </div>
   <img style="height:80px; width:80px;" src='https://www.kiranaworld.in/Admin/Products/mobile/<%# Eval("ImgUrl") %>'   />  
  <div class="Type">
      <img src="img/<%# Eval("Type")%>.png" />
  
  </div>
  </div>
  <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7" style="padding-left:0px !important; padding-right:0px !important;">
  <span class="brand" ><%# Eval("Brand")%></span><br />
   <span class="divProName"><%# Eval("ItemName")%></span><br />
  <div style=" height:31px; margin-top: 5px;"><span style="font-size:18px;">Qty - </span>
   <span id="Span1" runat="server"   style="color:#8f8f8f;max-width: 250px; line-height:30.2px !important;  font-size:14px"><%# Eval("PackSize")%></span>
    </div>
  <div class="row">
  <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="padding-left:0px !important; padding-right:0px !important;">
  <span style="color:#8f8f8f">MRP: </span><span style="color:#8f8f8f; text-decoration:line-through;">Rs.<%# Eval("Mrp")%></span><br /><b style="font-size:14px">RS </b><span style="color:#1a1a1a; font-weight:700; font-size:14px;"><%# Eval("Price")%></span>
  </div>

  
  <div ID="DivQty"  runat="server" class="col-xs-6 col-sm-6 col-md-6 col-lg-6 " style="text-align:center; max-width:110px;">
  

     <div class="row" >
         <asp:Button ID="MoveTo" runat="server" CssClass="  MyBtn" CommandName="MoveToCart" CommandArgument='<%# Eval("ItemId") + ";" +  Eval("ItemName")  + ";" + Eval("PackSize") + ";" + Eval("MRP") + ";" + Eval("Price") + ";" + Eval("PackId") + ";" + Eval("ImgUrl") + ";" + Eval("Discount") + ";" + Eval("Type") + ";" + Eval("Brand") + ";" + Eval("NoOfItems")+ ";" + Eval("Cashback")+ ";" + Eval("Pcb1")+ ";" + Eval("Pcb2")+ ";" + Eval("Pcb3") %>' Text="Move To Cart" />

     </div>
  </div>
  </div>
  
  </div>

  
  </div>
  </ItemTemplate>
  </asp:Repeater>
  
      
      



      
  
  </div>

  <div class="container">
 
        <div class="row">
            <div class="col-main col-sm-12 col-xs-12">
              
              

                    <div class="page-title" style="padding-bottom: 50px;">
                    
                        
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
                <asp:Label ID="cartCount" CssClass="circlecart" runat="server" Text="0"></asp:Label>     
                    
            </div>
        </div>
    </div>
  
 
 
  
  
      <div runat="server" id="NoItemFound" style="width:98%;  margin:60px auto;  padding: 6px; padding-top:15px; padding-bottom:15px; background:white;box-shadow: 5px 8px 6px -6px rgba(0, 0, 0, 0.19);" visible="false">
          <center style=" color:#0492a5; font-size:14px; ">
          <h3>We are sorry, no product in your WishList found.</h3>
                 
                    <a href="ItemList.aspx?Type=3" class=" btn btn-primary" >Check Offer</a>
                    </center>
         
      </div>
      
  
 

  <div style=" width:100%; height:50px;" >
                        
                        
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
 <!--End of Newsletter Popup-->   
  </div>


 






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

 <script type="text/javascript">
     function goBack() {
         window.history.back();
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
