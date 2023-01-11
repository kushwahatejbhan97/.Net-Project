<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemDetails.aspx.cs" Inherits="KiranaWorldApp.ItemDetails1" %>
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

<div class="wrapper" style="background:#d0d0d0c9!important">
<div id="overlay" style=" background-color:transparent; position: absolute; z-index:9000; top:0px; right:0px; width:200px;"></div>
<form id="Form1" runat="server">

 <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"> </asp:ToolkitScriptManager>

<div id="page"  style="background:#d0d0d0c9!important"> 

  
   <nav class="shadow-bottom" style="background:#84c225; height:92px; width:100%; color:#fff; z-index:40;  " >
  <div class="mm-toggle-wrap"  style="   position: fixed; width:20%; z-index:40;  " >
         
            <div class="mm-toggle " style="background:#84c225"> 
            <i class="fa fa-align-justify" style="margin:0px !important; width:23px;"></i> 
            </div>
              </div>
        <div style="   position: fixed; width:58%; left:20%; top:17px; z-index:40;  "  >
           <div style=" font-weight:600; line-height:10px;">Your Location</div>
           <label style=" white-space: nowrap;overflow: hidden;text-overflow: ellipsis;max-width: 90%; line-height:18px;">100 feet Road, koramangala, Secunderabad, 500086. </label>
           </div>
           <div style="   position: fixed; width:12%; right:5%; top:14px  ">            
                <i class="fa fa-user" style=" float:right;" aria-hidden="true"></i> 
          </div>
          <div style="   position: fixed; width:96%; left:2%; right:2%; top:50px; ">
          <asp:Panel ID="Panel1" runat="server" DefaultButton="Button1">
    <asp:TextBox ID="txtSearch" placeholder="search 18000+ products"  CssClass="form-control" runat="server" />
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Style="display: none" />
</asp:Panel>
           
          </div>
  </nav>
  
  <div style=" width:100%; height:96px;" >
    
  </div>


  <div class="titleback" >
  
      
      <asp:Label ID="SubCatName" runat="server" style="margin-left:53px; font-size:17px" Text="Fruits & Vegetables"></asp:Label>
  
  </div>


  
 
  
 



    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
   

  <div class="row products" style="background:#fff">
      <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
      <ItemTemplate>
     
  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
  <h4><%# Eval("ItemName")%></h4>
  </div>
  <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
  <h4><%# Eval("PackSize")%></h4>
  </div>
  <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
  <span style="font-weight:bold">Rs <%# Eval("SellingPrice")%></span> &nbsp; &nbsp; <span style="color:#8f8f8f;"> MRP</span> <span style="color:#8f8f8f; text-decoration:line-through;">Rs <%# Eval("Mrp")%></span>&nbsp;&nbsp;&nbsp;&nbsp;<span style="background:#e95f62; color:#fff"><%# Eval("Discount")%>% off</span>
  </div>
  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
      <img src="../../Admin/Products/Desktop/<%# Eval("ImgUrlDesk")%>" />
      
  </div>
  </ItemTemplate>
   </asp:Repeater>


      
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
          ConnectionString="<%$ ConnectionStrings:theOMartMSConnectionString1 %>" 
          SelectCommand="SELECT [ItemId], [ItemName], [PackSize], [Description], [About], [Ingredient], [ProductInfo], [SellingPrice], [Mrp], [ImgUrlDesk], [Discount] FROM [Item] WHERE ([ItemId] = @ItemId)">
          <SelectParameters>
              <asp:QueryStringParameter Name="ItemId" QueryStringField="ItemId" 
                  Type="Int32" />
          </SelectParameters>
      </asp:SqlDataSource>


  </div>
  <div class="row product-details" style="background:#fff; margin-top:10px;">
  <h4 >About this product </h4>
      <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource1" 
         >
      <ItemTemplate>
     
  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="border-top:1px solid #eee; color:#8f8f8f;">
  <span style="font-size:14px">About</span><br />
  <span><%# Eval("About")%></span>
  </div>
  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="border-top:1px solid #eee; color:#8f8f8f;">
  <span style="font-size:14px">Description</span><br />
  <span><%# Eval("Description")%></span>
  </div>
  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="border-top:1px solid #eee; color:#8f8f8f;">
  <span style="font-size:14px">Ingredient</span><br />
  <span><%# Eval("Ingredient")%></span>
  </div>
  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="border-top:1px solid #eee; color:#8f8f8f;">
  <span style="font-size:14px">Other Prodct Info</span><br />
  <span ><%# Eval("ProductInfo")%></span>
  </div>

  <div class="row" style="margin-top:10px">
  <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="padding-left:0px !important; padding-right:0px !important">
      <img src="img/SaveLater.png" class="img-responsive" />
  
  </div>
   <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="padding-left:0px !important; padding-right:0px !important">
       <img src="img/AddBasket.png" class="img-responsive" />
  </div>
  
  </div>
  
  </ItemTemplate>
   </asp:Repeater>
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
