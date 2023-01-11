<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="KiranaWorldApp.OrderDetails" %>
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
span
{
    line-height:20px;
    font-weight:600;
    font-size: 13px;
    
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
            background:  url(/AdminImg/KiranaWorld.png) center center no-repeat, url(/loader2.gif) center center no-repeat;
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

<div class="wrapper" style="background:#fff !important">
<div id="overlay" style=" background-color:transparent; position: absolute; z-index:9000; top:0px; right:0px; width:200px;"></div>
<form id="Form1" runat="server">

 <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"> </asp:ToolkitScriptManager>

<div id="page" > 

  

  
 
 <nav class="shadow-bottom" style="background:#84c225; height:50px; width:100%; color:#fff; z-index:40; position: fixed;  " >

 <div class=" container" id="headertop" runat="server"  style="background:#84c225; position: fixed;  height:50px; width:100%; color:#fff; z-index:40;  " >
  <div class="mm-toggle-wrap"  style="   position: fixed; width:20%; z-index:40;  " >
         
            <div class="mm-toggle " style="background:#84c225"> 
            <a href="Home.aspx"><img src="img/backbtn.png" /></a>
            </div>
              </div>
        <div style="   position: fixed; width:58%; left:20%; top:16px; font-size:16px; z-index:40; text-align:center;">
           <div ><asp:Label ID="catname" style=" font-weight:600; color:White; font-size:16px; " runat="server" Text="Your Basket"> Your Orders</asp:Label>
           
           </div>
           </div>
           </div>
           
          
  </nav>
  
  <div style=" width:100%; height:51px;" >
    
  </div>



            <asp:Repeater ID="Repeater1" DataSourceID="SqlDataSource1"  runat="server"  >
           
              <ItemTemplate>
           

           <a href="ViewItems.aspx?OrderId=<%# Eval("OrderId") %>&Status=<%# Eval("Status") %>&Mobile=<%# Eval("Mobile") %>" >
  <div class="row" style="margin-top:10px; width:98%; ">
  <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" style="padding-top: 11px;">
      <img src="img/OpenOrder.png" alt="OpenOrder" class=" img-responsive" />
  </div>
  <div class="row col-xs-11 col-sm-11 col-md-11 col-lg-11" style="background:#d0d0d040!important; padding: 11px;">
  <span style="font-weight:bold"><%# Eval("DeliveredDate")%></span><br />
  <span>KW<%# Eval("OrderId") %></span><br />
  <span>Rs</span>&nbsp;<span><%# Eval("GrandTotal")%></span> 
      <br />
  <span style="float:left"><%# Eval("ProductCount")%> Products</span><span style="float:right"><%# Eval("StatusText")%></span>
  
  </div>
  </div>
  </a>
</ItemTemplate>
</asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MsHungerSolConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [OrderDe] WHERE [OrderId] = @OrderId" 
                    ProviderName="<%$ ConnectionStrings:MsHungerSolConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT [OrderId], [ClientId], [Date],  [TotalAmount], [Email], [Mobile], [DeliveryCharge], [GrandTotal], [Address],  [PaymentMode], [PaymentStatus], [ClientName], [DeliveredDate],  [CurrentStatus],  [StatusText], [Status], [ProductCount] FROM [OrderDe] WHERE ([ClientId] = @ClientId) AND (Status='1') ORDER BY [OrderId] DESC" 
                    >
                    <DeleteParameters>
                        <asp:Parameter Name="OrderId" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>
                    
                    
                    <asp:SessionParameter SessionField="ClientId" Name="ClientId" Type="Int32" />
                    
                    </SelectParameters>
                   
                </asp:SqlDataSource>
 
            <asp:Repeater ID="Repeater2" DataSourceID="SqlDataSource2"  runat="server" OnItemCommand="RepeaterCartCommand" >
           
              <ItemTemplate>
           <a href="ViewItems.aspx?OrderId=<%# Eval("OrderId") %>" >
            <div class="row" style="margin-top:10px; width:98%; ">
  <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" style="padding-top: 11px;">
      <img src="img/OpenOrder.png" alt="OpenOrder" class=" img-responsive" />
  </div>
  <div class="row col-xs-11 col-sm-11 col-md-11 col-lg-11" style="background:#d0d0d040!important; padding: 11px;">
  <span style="font-weight:bold"><%# Eval("DeliveredDate")%></span><br />
  <span>KW<%# Eval("OrderId") %></span><br />
  <span>Rs</span>&nbsp;<span><%# Eval("GrandTotal")%></span>
      
      <br />
  <span style="float:left"><%# Eval("ProductCount")%> Products</span><span style="float:right"><%# Eval("StatusText")%></span>
  
  </div>
  </div>
            </a>

</ItemTemplate>
</asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MsHungerSolConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [OrderDe] WHERE [OrderId] = @OrderId" 
                    ProviderName="<%$ ConnectionStrings:MsHungerSolConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT [OrderId], [ClientId], [Date],  [TotalAmount], [Email], [DeliveryCharge], [GrandTotal], [Address],  [PaymentMode], [PaymentStatus], [ClientName], [DeliveredDate],  [CurrentStatus],  [StatusText], [ProductCount] FROM [OrderDe] WHERE ([ClientId] = @ClientId) AND ( (Status >'1') AND (Status <>'5') ) ORDER BY [OrderId] DESC" 
                    >
                    <DeleteParameters>
                        <asp:Parameter Name="OrderId" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>
                    
                    
                    <asp:SessionParameter SessionField="ClientId" Name="ClientId" Type="Int32" />
                    
                    </SelectParameters>
                   
                </asp:SqlDataSource>


            
            <asp:Repeater ID="Repeater3" DataSourceID="SqlDataSource3"  runat="server" OnItemCommand="RepeaterCartCommand" >
           
              <ItemTemplate>
           

                <a href="ViewItems.aspx?OrderId=<%# Eval("OrderId") %>" >

                 <div class="row" style="margin-top:10px; width:98%; ">
  <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" style="padding-top: 11px;">
      <img src="img/OrderCompl.png" alt="OpenOrder" class=" img-responsive" />
  </div>
  <div class="row col-xs-11 col-sm-11 col-md-11 col-lg-11" style="background:#d0d0d040!important; padding: 11px;">
  <span style="font-weight:bold"><%# Eval("DeliveredDate")%></span><br />
  <span>KW<%# Eval("OrderId") %></span><br />
    <div class="row" >
        <span style="float:left"><%# Eval("ProductCount")%> Products</span><span style="float:right"><%# Eval("StatusText")%></span>

    </div>
  <div class="row"> 
      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 " style="padding-right: 0px;padding-left: 0px;" ><span>Rs</span>&nbsp;<span><%# Eval("GrandTotal")%></span></div>
      <div ID="DivQty"  runat="server" style="padding-right: 0px;padding-left: 0px; text-align:right; float:right;" class="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
  

     <div class="row" >
         <asp:Button ID="MoveTo" runat="server" CssClass=" btn btn-danger" Style="    padding: 3px 6px; font-size: 11px;" CommandName="MoveToCart" CommandArgument='<%# Eval("OrderId")  %>' Text="Repeat Order" />

     </div>
  </div>
      </div>
      
  
  
  </div>
  </div>

                </a>

</ItemTemplate>
</asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MsHungerSolConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [OrderDe] WHERE [OrderId] = @OrderId" 
                    ProviderName="<%$ ConnectionStrings:MsHungerSolConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT [OrderId], [ClientId], [Date],  [TotalAmount], [Email], [DeliveryCharge], [GrandTotal], [Address],  [PaymentMode], [PaymentStatus], [ClientName], [DeliveredDate],  [CurrentStatus],  [StatusText], [ProductCount] FROM [OrderDe] WHERE ([ClientId] = @ClientId) AND (Status='5') ORDER BY [OrderId] DESC" 
                    >
                    <DeleteParameters>
                        <asp:Parameter Name="OrderId" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>
                    
                    
                    <asp:SessionParameter SessionField="ClientId" Name="ClientId" Type="Int32" />
                    
                    </SelectParameters>
                   
                </asp:SqlDataSource>

            <asp:Repeater ID="Repeater4" DataSourceID="SqlDataSource4"  runat="server" OnItemCommand="RepeaterCartCommand" >
              <ItemTemplate>
           

           <a href="ViewItems.aspx?OrderId=<%# Eval("OrderId") %>" >
            <div class="row" style="margin-top:10px; width:98%; ">
  <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" style="padding-top: 11px;">
      <img src="img/CancelOrder.png" class=" img-responsive" alt="OpenOrder" />
  </div>
  <div class="row col-xs-11 col-sm-11 col-md-11 col-lg-11" style="background:#d0d0d040!important; padding: 11px;">
  <span style="font-weight:bold"><%# Eval("DeliveredDate")%></span><br />
  <span>KW<%# Eval("OrderId") %></span><br />
   <div class="row" >
        <span style="float:left"><%# Eval("ProductCount")%> Products</span><span style="float:right"><%# Eval("StatusText")%></span>

    </div>
  <div class="row"> 
      <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 " style="padding-right: 0px;padding-left: 0px;" ><span>Rs</span>&nbsp;<span><%# Eval("GrandTotal")%></span></div>
      <div ID="DivQty"  runat="server" style="padding-right: 0px;padding-left: 0px; text-align:right; float:right;" class="col-xs-6 col-sm-6 col-md-6 col-lg-6 ">
  

     <div class="row" >
         <asp:Button ID="MoveTo" runat="server" CssClass=" btn btn-danger" Style="    padding: 3px 6px; font-size: 11px;" CommandName="MoveToCart" CommandArgument='<%# Eval("OrderId")  %>' Text="Repeat Order" />

     </div>
  </div>
      </div>
  
  </div>
  </div>

            </a>

</ItemTemplate>
</asp:Repeater>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:MsHungerSolConnectionString1 %>" 
                    DeleteCommand="DELETE FROM [OrderDe] WHERE [OrderId] = @OrderId" 
                    ProviderName="<%$ ConnectionStrings:MsHungerSolConnectionString1.ProviderName %>" 
                    SelectCommand="SELECT [OrderId], [ClientId], [Date],  [TotalAmount], [Email], [DeliveryCharge], [GrandTotal], [Address],  [PaymentMode], [PaymentStatus], [ClientName], [DeliveredDate],  [CurrentStatus],  [StatusText], [ProductCount] FROM [OrderDe] WHERE ([ClientId] = @ClientId) AND (Status='0') ORDER BY [OrderId] DESC" 
                    >
                    <DeleteParameters>
                        <asp:Parameter Name="OrderId" Type="Int32" />
                    </DeleteParameters>
                    <SelectParameters>
                    
                    
                    <asp:SessionParameter SessionField="ClientId" Name="ClientId" Type="Int32" />
                    
                    </SelectParameters>
                   
                </asp:SqlDataSource>


  </div>


 
 <div class="container">
 
        <div class="row">
            <div class="col-main col-sm-12 col-xs-12">
              
              

                    <div class="page-title" style="padding-bottom: 53px;">
                        
                    </div>

                   
                    <div id="footerBottom" class="footer headroomft headroom headroom--not-bottom headroom--pinned headroom--top" style="display: block;">
                         <ul  style="background:#ffffff;">

            <li >
                <a href="default.aspx"><img src="/AdminImg/KiranaWorld.png" alt="Home" title="Home" style=" height:25px;" /></a>
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

<script type="text/javascript" src="js/bootstrap.min.js"></script> 

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
