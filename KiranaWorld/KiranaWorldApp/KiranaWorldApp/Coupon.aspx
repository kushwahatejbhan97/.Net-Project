<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Coupon.aspx.cs" Inherits="KiranaWorldApp.Coupon" %>
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
            background:  url(/AdminImg/KiranaWorld.png) center center no-repeat, url(/loader2.gif) center center no-repeat;
            background-color:#ffffff;
           
            z-index: 99999;
}

.form-control
{
    border:none !important ;
    box-shadow:inset 0 1px 1px #fff;
    transition:#fff ease-in-out .15s, box-shadow ease-in-out .15s;
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


.aspNetDisabled
{
    background:Gray !important;
}
#TxtCoupon::placeholder {
  color: #ccccccd1;
}

.couponback {
    background-image: url(/images/coupon.jpg);
    background-repeat: no-repeat;
    height: 160px;
    background-position: center;
}

.couponcode {
    font-size: 16px;
    font-weight: 600;
    padding-top: 14px;
    padding-left: 10%;
    text-align: left;
    color: rgb(58 173 26);
}
.form-controlcoupon {
    width: 100%;
    float: left;
    text-decoration: none;
    display: inline-block;
    text-align: center;
    border: none;
    line-height: 50px;
    font-size: 14px;
    height: 50px;
    padding: 0 2rem;
    color: #fc8019;
    letter-spacing: 0;
    border: 1px solid #fc8019;
    margin-top: 26px;
    line-height: 36px;
    width: auto;
    height: 36px;
    padding: 0 15px;
    outline: none;
    min-width: 120px;
    background: #fff;
    font-weight: 600;
    cursor: pointer;
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
            <a href="CartReview.aspx"><img src="img/backbtn.png" alt="back" /></a>
            </div>
              </div>
        <div style="position: fixed; width:58%; left:20%; top:16px; font-size:16px; z-index:40; text-align:center;">
           <div >
               <asp:Label ID="catname" style=" font-weight:600; color:White; font-size:16px; " runat="server" Text="Apply Coupon"></asp:Label>
           
           </div>
           </div>
           </div>
           
          
  </nav>
  
  <div style=" width:100%; height:48px;" >
    
  </div>

       <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    
 

<div class="titleback" style=" background-image:url('strip/8.jpg'); color: #03A9F4; height:40px; font-size:15px; padding-top:11px; " >
  
      
     AVAILABLE COUPONS
  
  </div>

                           
<div runat="server" id="CouponChecker"  style="  background:white; width:100%; " >

 
 
   
   <div style=" color:Red; float:none; width:100%; font-weight:600;"> 
       <asp:Label ID="NotApplied" style=" text-align:left;"  runat="server" Visible="false"  Text="*This coupon either doesn't exists or expired."></asp:Label></div>
</div>
<div runat="server" id="CouponApplied"  class="  divHotproducts" visible="false" style=" background:#fff;  padding:15px; padding-left:10%; padding-right:8%; border-bottom: #f1ad4961 1px solid;  width:100%;" >
<center>
    
    <asp:Label ID="LnkCouponApplied" runat="server" Text="Coupon Applied"  style=" color:Maroon; font-weight:600; margin:0 auto " ></asp:Label>

    </center>
</div>


   
  
        
        <div class="divHotproducts container" style="background:#fff;" >
 

      <div style="box-shadow: 0 0 1px #888; padding-bottom:10px; ">
    

                        <asp:Repeater ID="repeatercoupon"  OnItemCommand="repeatercouponapply"   runat="server" >
           <HeaderTemplate>
               
               
           </HeaderTemplate>

              <ItemTemplate>
                          
                          <div class="row" style="  box-shadow:  0 0 7px #888; padding-top:7px; background-color: white; padding-bottom:4px;    ">
                         
                               <div class="col-md-12 col-lg-12 col-sm-12" ></div>
                              <div class="col-md-12 col-lg-12 col-sm-12" style="font-weight:bold;color: White;background-color: #d2322d;padding: 7px;"><%# Eval("Title")%> </div>
                               <div class="col-md-12 col-lg-12 col-sm-12" style="padding-top:16px;font-weight:700"> <%# Eval("Description")%>  </div>
                              <div class="col-md-12 col-lg-12 col-sm-12" style="font-size: 11px;padding-bottom: 15px;"><%--<%# Eval("MinAmount")%>--%>Valid From <%# Eval("FDate")%> To <%# Eval("TDate")%>  </div>

                              <div  class="col-md-12 col-lg-12 col-sm-12 couponback"   ><div class="couponcode" ><%# Eval("CouponName")%> </div>

                                 
                                  <asp:Button ID="Button13" class="form-controlcoupon" runat="server" CommandName="Apply" CommandArgument='<%# Eval("CouponName")  %>'    Text="Apply"   />
                              </div>
                               

                                     </div>
                    
                       </ItemTemplate>
                     <FooterTemplate></FooterTemplate>
                     </asp:Repeater>
    
      <div id="NoCouponDisplay"      runat="server" style="  margin:20px auto;" visible="false" >
                  <h5 style="font-weight:600;font-size:14px ;color: #ff403b;">We are sorry, no coupons found at this time.</h5>
          <center><h2></h2>
                 </center>
                                                            
                  </div>
                     
                   </div>
 
  <%--<asp:Repeater ID="RepeaterHotProducts" runat="server"  OnItemCommand="RepeaterCartCommand">
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
  <div class="row" style=" float:none; width:100%; margin-top: 5px;"><span style="font-size:18px;">Qty - </span>
   <span id="Span1" runat="server"   style="color:#8f8f8f;max-width: 250px; line-height:30.2px !important;  font-size:14px"><%# Eval("PackSize")%></span><br />
   <b style="font-size:14px">RS </b><span style="color:#1a1a1a; font-weight:700; font-size:14px;"><%# Eval("Price")%></span>
    </div>
  <div class="row">
  <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="padding-left:0px !important; padding-right:0px !important;">
   <asp:Button ID="MoveTo" runat="server" CssClass="  MyBtn" CommandName="MoveToCart" CommandArgument='<%# Eval("ItemId") + ";" +  Eval("ItemName")  + ";" + Eval("PackSize") + ";" + Eval("MRP") + ";" + Eval("Price") + ";" + Eval("PackId") + ";" + Eval("ImgUrl") + ";" + Eval("Discount") + ";" + Eval("Type") + ";" + Eval("Brand") %>' Text="Move To Wishlist" />
  </div>

  
  <div ID="DivQty"  runat="server" class="col-xs-6 col-sm-6 col-md-6 col-lg-6 " style="text-align:center; max-width:110px;">
  <div class="row" >
  <div class="col-xs-4" style="padding-left:0px !important">
      <asp:ImageButton ID="ImageButton1" CommandName="DecreaseQty" CommandArgument='<%# Eval("PackId")  %>' ImageUrl="img/minus.png" runat="server" style=" height:22px;" />
      </div>
      <div class="col-xs-4" style=" padding-left:0px !important; text-align:center; padding-right:0px !important; color: #e95f62e6; font-size: 20px; font-weight: 600; height: 22px; width: 18px;">
      <asp:Label ID="Qty" Text='<%# Eval("NoOfItems")%>' runat="server" ></asp:Label>
      </div>
      <div class="col-xs-4" style="padding-left:0px !important; padding-right:0px !important">
      <asp:ImageButton ID="ImageButton2" CommandName="IncreaseQty" CommandArgument='<%# Eval("PackId")  %>' ImageUrl="img/plus.png" style=" height:22px;" runat="server" />
     </div>
     </div>

     
  </div>
  </div>
  
  </div>
  
  </div>
  </ItemTemplate>
  </asp:Repeater>--%>
  
      
      



      
  
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
