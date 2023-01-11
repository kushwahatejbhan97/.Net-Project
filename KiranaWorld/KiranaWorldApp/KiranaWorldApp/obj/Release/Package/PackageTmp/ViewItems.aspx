<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewItems.aspx.cs" Inherits="KiranaWorldApp.ViewItems" %>
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
.MyfullBottomBtn
{
    background: #e95f62;
    padding: 10px 6px;
    color: #fff;
    font-size: 1.4rem;
    text-align: center;
    width: 80%;
    border: none;
    margin:10px 10%;
}

.container
{
    padding-left:1px !important;
    padding-right:1px !important;
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

  

  
 
 <nav class="shadow-bottom" style="background:#84c225; height:50px; width:100%; color:#fff; z-index:40; position: fixed;  " >

 <div class=" container" id="headertop" runat="server"  style="background:#84c225; position: fixed;  height:50px; width:100%; color:#fff; z-index:40;  " >
  <div class="mm-toggle-wrap"  style="   position: fixed; width:20%; z-index:40;  " >
         
            <div class="mm-toggle " style="background:#84c225"> 
            <a href="OrderDetails.aspx" id="bckbtn" runat="server"> <img src="img/backbtn.png" alt="backbtn" /> </a>
            </div>
              </div>
        <div style="   position: fixed; width:58%; left:20%; top:16px; font-size:16px; z-index:40; text-align:center;">
           <div ><asp:Label ID="catname" style=" font-weight:600; color:White; font-size:16px; " runat="server" Text="Your Basket">Order Details</asp:Label>
           
           </div>
           </div>
           </div>
           
          
  </nav>
  
  <div style=" width:100%; height:51px;" >
    
  </div>

  <div class=" container">

   <asp:Repeater ID="Repeater1" DataSourceID="SqlDataSource2"   runat="server" >
           
              <ItemTemplate>
           <div class="orders container ">
                      
       
          
          
           <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style=" overflow:hidden; text-overflow: ellipsis; border-bottom:1px solid #eee; padding:10px; "> 
          <h4>Delivery Address</h4> 
           
           <%# Eval("Address") %><br />
           <%# Eval("Email") %>

           </div>
           

            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style=" overflow:hidden; text-overflow: ellipsis;  border-bottom:1px solid #eee; padding:10px; ">
            <h4>Payment Information</h4> 
            
            Mode of Payment:&nbsp;<%# Eval("PaymentMode") %><br />
            Payment Status:&nbsp;<%# Eval("PaymentStatus") %><br />
            Delivery Date:&nbsp;<%# Eval("DeliveredDate") %><br />
            Order Date:&nbsp;<%#Eval("Date", "{0:dd/MM/yyyy}")%> <br />
            Product Count:&nbsp;<%#Eval("ProductCount")%> <br />
            Pack Count:&nbsp;<%#Eval("Packcount")%>
            </div>
           


           <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style=" overflow:hidden; text-overflow: ellipsis;  border-bottom:1px solid #eee; padding:10px; ">
           <h4>Order Summary</h4>
           Sub Total :&nbsp;<%# Eval("SubTotal")%><br />
            Delivery Charges:&nbsp;<%# Eval("DeliveryCharge") %><br />
            Coupon Discount :&nbsp;<%# Eval("couponDis")%><br />
            Order Amount:&nbsp;<%# Eval("TotalAmount")%><br />
           Net Payable:&nbsp;<%# Eval("GrandTotal")%><br />
            
            
          </div>
        
         
     
</div>
</ItemTemplate>
</asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MsHungerSolConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [OrderDe] WHERE [OrderId] = @OrderId" 
                    ProviderName="<%$ ConnectionStrings:MsHungerSolConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT [OrderId], [ClientId], [Date],  [TotalAmount],[SubTotal], [Email],[ProductCount], [Packcount], [DeliveryCharge], [GrandTotal], [couponDis], [Saving], [Address],  [PaymentMode], [PaymentStatus], [ClientName], [DeliveredDate],  [CurrentStatus],  [StatusText], [ProductCount] FROM [OrderDe] WHERE ([ClientId] = @ClientId) AND ([OrderId] =@OrderId) ORDER BY [OrderId] DESC" 
                    >
                    <DeleteParameters>
                    <asp:QueryStringParameter Name="OrderId" QueryStringField="OrderId" DefaultValue="0" />
                        <asp:Parameter Name="OrderId" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>
                     <asp:QueryStringParameter Name="OrderId" QueryStringField="OrderId" DefaultValue="0" />
                    
                    <asp:SessionParameter SessionField="ClientId" Name="ClientId" Type="Int32" />
                    
                    </SelectParameters>
                   
                </asp:SqlDataSource>

                <asp:Button ID="Button1"  CssClass="MyfullBottomBtn " Visible="false" runat="server" Text="Cancel This Order" CausesValidation="false"  onclick="Button1_Click1"></asp:Button>

<div class="titleback container" style=" background-image:url('strip/1.jpg'); color:White; height:32px; " >
  
      
      Products
  
  </div>

  <asp:Repeater ID="Repeatercartitemmaster" DataSourceID="SqlDataSource1" runat="server">
           <HeaderTemplate></HeaderTemplate>
              <ItemTemplate>
                          <div class="row container " style="background:#ffffff; padding-top:10px; padding-left:3px !important; padding-right:3px !important; border-bottom:1px solid #eee;" >

  
  <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" style="padding-left:0px !important; padding-right:0px !important;">
  
   <img style="height:120px; width:120px;" alt="Item" src='https://www.kiranaworld.in/Admin/Products/mobile/<%# Eval("ImgUrl") %>'   />
  
  </div>
  <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7" style="padding-left:0px !important; padding-right:0px !important;">
  <span class="brand" ><%# Eval("Brand")%></span><br />
   <span class="divProName"><%# Eval("ItemName")%></span><br />
  <div style=" height:28px; margin-top: 3px; margin-bottom:3px;">
   <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="padding-left:0px !important; padding-right:0px !important;"><span  style="color:#8f8f8f;max-width: 170px; line-height:22.2px !important;  font-size:14px"><%# Eval("PackSize")%></span></div>
   <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="padding-left:0px !important; padding-right:0px !important;"> <span style="color:#8f8f8f"> Quantity - <%# Eval("Qty")%></span></div>
      
    </div>
  <div class="row">
  <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="padding-left:0px !important; font-size:12px padding-right:0px !important;">
  <span style="color:#8f8f8f"> </span><span style="color:#8f8f8f; text-decoration:line-through;">Rs.<%# Eval("Mrp")%></span><br />
  <b style="font-size:12px">RS </b><span style="color:#1a1a1a; font-weight:600; font-size:12px;"><%# Eval("Price")%></span>
  </div>

    

   <div   class="col-xs-6 col-sm-6 col-md-6 col-lg-6  " style="color:#1a1a1a; font-weight:600; font-size:12px;">
   
   Total Amount  Rs.<%# Eval("TotalAmount")%></span>
   </div>

  </div>
  
  </div>

  
  </div>

                          
                    
                       </ItemTemplate>
                     <FooterTemplate></FooterTemplate>
                     </asp:Repeater>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MsHungerSolConnectionString1 %>" 
                    SelectCommand="SELECT [OrderId], [PackId], [ItemName], [Mrp], [Price], [Qty], [TotalAmount], [Description], [PackSize], [ImgUrl], [Brand], [Date] FROM [Order_details] WHERE ([OrderId] = @OrderId)" 
                    >
                    <SelectParameters>
                    
                    
                        <asp:QueryStringParameter DefaultValue="0" Name="OrderId" 
                            QueryStringField="OrderId" Type="Int32" />
                    
                    </SelectParameters>
                   
                </asp:SqlDataSource>


 
                
    

     
                

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

  

</body>
</html>
