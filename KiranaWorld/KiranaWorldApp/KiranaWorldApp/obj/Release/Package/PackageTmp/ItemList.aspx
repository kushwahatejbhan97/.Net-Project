<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemList.aspx.cs" Inherits="KiranaWorldApp.ItemDetails" %>
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
#myloader {
    -moz-animation: cssAnimation 0s ease-in 1s forwards;
    /* Firefox */
    -webkit-animation: cssAnimation 0s ease-in 1s forwards;
    /* Safari and Chrome */
    -o-animation: cssAnimation 0s ease-in 1s forwards;
    /* Opera */
    animation: cssAnimation 0s ease-in 1s forwards;
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
  <nav class="shadow-bottom" style="background:#84c225; height:92px; width:100%; color:#fff; z-index:40;  " >
 
  <div class=" container" id="headertop" runat="server"  style="background:#84c225; position: fixed;  height:50px; width:100%; color:#fff; z-index:40;  " >
  <div class="mm-toggle-wrap"  style="   position: fixed; width:10% !important; z-index:40;  " >
         
            <div class="mm-toggle " style="background:#84c225"> 
            <a href="javascript:void(0)" onclick="goBack()"><img src="img/backbtn.png" alt="back" /></a>
           
            </div>
              </div>
        <div style="   position: fixed; width:75%; left:10%; top:16px;  z-index:40; text-align:center;">
           <div ><asp:Label ID="catname" style="display: inline-block; width: 180px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; font-weight:600; color:White; font-size:16px; " runat="server" Text=""></asp:Label></div>
           
           </div>

           <div style="   position: fixed; width:23%; right:2%; top:14px; z-index:41;  "> 
                    
                <a href="javascript:void(0);" onclick="MoboFiltershow()" > <img  src="/image/filtericon.png" style="-webkit-box-shadow: 0 0 6px #fff; box-shadow: 0 0 6px #fff;" alt="Filter" /></a>
          </div>
           </div>
           
          <div class="shadow-bottom " id="headerBottom" runat="server"  style=" background:#84c225;  position: fixed; width:100%; padding:2px; top:50px; z-index:40; ">
          <asp:Panel ID="Panel1" runat="server" DefaultButton="Button1">
    <asp:TextBox ID="txtSearch" placeholder="search from 5000+ products"  CssClass="form-control"  runat="server" /><img src="img/search-icon.png" alt="Search" title="Search"  style="position:fixed;  top:57px; right:5%; z-index: -1; " />

    <asp:Button ID="Button1" runat="server" OnClick="Searchclick"   Style="display: none" />
</asp:Panel>
           
   </div>
          
  </nav>

  <div id="footerBottom" class="footer headroomft headroom headroom--not-bottom headroom--pinned headroom--top" style="display: block;">
                         <ul  style="background:#ffffff;">

            <li >
                <a href="Default.aspx"><img src="/AdminImg/KiranaWorld.png" alt="Home" title="Home" style=" height:25px;" /></a>
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
  
  <div style=" width:100%; height:90px;" >
    <img src="/loading.gif" alt="plus"  style=" height:8px;" />
                        <img src="img/minus.png" alt="plus" style=" height:8px;" />
                        <img src="img/plus.png" alt="plus" style=" height:8px;" />
  </div>


  

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
   

  <div class="divProducts row" >

 
  <asp:Repeater ID="RepeaterProduct" runat="server" OnItemCommand="RepeaterProductCommand">
                        <ItemTemplate>

  <div class="row col-xs-12 col-sm-12 col-md-6 col-lg-6" style="background:#ffffff; padding-top:10px; padding-left:3px !important; padding-right:3px !important; border-bottom:1px solid #eee;" >

  
  <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" style="padding-left:0px !important; padding-right:0px !important;">
  <div class="offer">
  <span style="margin-top:5px"><%# Eval("Discount")%>% Off</span>
  </div>
   <img style="height:120px; width:120px;" alt="Item" src='https://www.kiranaworld.in/Admin/Products/mobile/<%# Eval("ImgUrlMbl") %>'   />
  <div class="Type">
      <img src="img/<%# Eval("Type")%>.png" alt="type" />
  
  </div>
  </div>
  <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7" style="padding-left:0px !important; padding-right:0px !important;">
  <span class="brand" ><%# Eval("Brand")%></span><br />
   <span class="divProName"><%# Eval("ItemName")%></span> &nbsp; &nbsp; <span style=" color: green; font-size:15px;  "  runat="server" visible='<%# Eval("Cashback")%>' > *Cashback</span><br /> 
  <div style=" height:35px; margin-top: 3px; margin-bottom:3px;">
   <span id="Span1" runat="server"  Visible='<%# Eval("Single")%>'  style="color:#8f8f8f;max-width: 170px; line-height:30.2px !important;  font-size:14px"><%# Eval("PackSize")%></span>
      <asp:LinkButton ID="LinkButton2" CssClass="drpcss"  Visible='<%# Eval("Multi")%>' CommandName="SizeMaker" CommandArgument='<%# Eval("ItemId")+";" +Eval("ItemName") + ";" + Eval("Type") + ";" + Eval("Brand") %>'  runat="server"><%# Eval("PackSize")%></asp:LinkButton>
      
    </div>
  <div class="row">
  <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6" style="padding-left:0px !important; padding-right:0px !important;">
  <span style="color:#8f8f8f">MRP: </span><span style="color:#8f8f8f; text-decoration:line-through;">Rs.<%# Eval("Mrp")%></span><br /><b style="font-size:14px">RS </b><span style="color:#1a1a1a; font-weight:700; font-size:14px;"><%# Eval("SellingPrice")%></span>
  </div>

    <div ID="Stock" runat="server" visible='<%# Eval("InStock")%>' class="col-xs-6 col-sm-6 col-md-6 col-lg-6   " style=" text-align:center; max-width:110px; margin-top:5px;" >
  

  <div ID="DivAddBtn" runat="server" visible='<%# Eval("NotInCart")%>'  >
  
      <asp:Button ID="Button1"   CssClass="btn btn-Add" runat="server" Text="ADD" CommandName="Add" CommandArgument='<%# Eval("ItemId") + ";" +  Eval("ItemName")  + ";" + Eval("PackSize") + ";" + Eval("Mrp") + ";" + Eval("SellingPrice") + ";" + Eval("PackId") + ";" + Eval("ImgUrlMbl") + ";" + Eval("Discount") + ";" + Eval("Type") + ";" + Eval("Brand") + ";" + Eval("Cashback")+ ";" + Eval("Pcb1")+ ";" + Eval("Pcb2")+ ";" + Eval("Pcb3") %>' />

  </div>
  <div ID="DivQty" visible='<%# Eval("InCart")%>' runat="server" >
  <div class="row" >
  <div class="col-xs-4" style=" padding-left:0px !important; padding-right:0px !important; margin:0 auto !important;">
      <asp:ImageButton ID="ImageButton1" CommandName="DecreaseQty" CommandArgument='<%# Eval("PackId")  %>' ImageUrl="img/minus.png" runat="server" style=" height:22px; width:22px;" />
      </div>
      <div class="col-xs-4" style="  text-align:center; margin:0 auto;  padding-left:0px !important; padding-right:0px !important; color: #e95f62e6; font-size: 20px; font-weight: 600; height:22px; width:26px;">
      <asp:Label ID="Qty" Text='<%# Eval("NoOfItems")%>' runat="server" ></asp:Label>
      </div>
      <div class="col-xs-4" style=" padding-left:0px !important; padding-right:0px !important; margin:0 auto !important;">
      <asp:ImageButton ID="ImageButton2" CommandName="IncreaseQty" CommandArgument='<%# Eval("PackId")  %>' ImageUrl="img/plus.png" style=" height:22px;  width:22px; " runat="server" />
     </div>
     </div>
  </div>
  </div>

   <div ID="OutStock" runat="server" visible='<%# Eval("OutofStack")%>' class="col-xs-5 col-sm-5 col-md-5 col-lg-5  " style=" text-align:center; color:Maroon;">
   Out Of Stock
   </div>

  </div>
  
  </div>

  
  </div>
                       
  </ItemTemplate>
  </asp:Repeater>
  
      <div id="NoItemDisplay"      runat="server" style=" width:90%;  margin:100px auto; padding: 20px; background:white;" visible="false" >
                  <center><h3>We are sorry, no product found.</h3>
                  Please try to search with a different spelling or check out our Offers.<br />
                    <a href="ItemList.aspx?Type=3" class=" btn btn-primary" >Check Offer</a></center>
                                                            
                  </div>
      
      
  
  </div>

  <div id="MoboFilter" runat="server" >
                                                 
                                                  <div style="color: White; background-color: #73ba07; text-align: left; font-family: Serif;
                                                    padding: 8px; font-size: 14px; font-weight: 700; vertical-align:bottom; margin-right: -8px; margin-left: -8px;">
                                                    <img src="/image/filtericon.png" alt="" style="    height: 26px; overflow:hidden; " /> <asp:LinkButton OnClick="clearSelect" style=" color:White; text-decoration:undeline; float:right; margin-right:8px;"  ID="LinkButton1" runat="server">Clear All</asp:LinkButton>
                                                </div>
                                                <div class="block special-product">
                                                <div class="sidebar-bar-title">
                                                        <h3>Category</h3>
                                                    </div>
                                                    <div class="block-content" style=" max-height: 133px; overflow:auto;">
                                                        <asp:CheckBoxList ID="Chkscat" CssClass="form-control filtercontrol"  
                                                            runat="server" 
                                                             >
                                                        </asp:CheckBoxList> 
                                                        
                                                        
                                                        
                                                    </div>
                                                    <div class="sidebar-bar-title">
                                                        <h3>Brands</h3>
                                                    </div>
                                                    <div class="block-content" style=" max-height: 133px; overflow:auto;">
                                                        <asp:CheckBoxList ID="ChksBrand" CssClass="form-control filtercontrol" 
                                                            runat="server"   >
                                                        </asp:CheckBoxList> 
                                                        
                                                        
                                                        
                                                    </div>
                                                    
                                                <div class="sidebar-bar-title">
                                                        <h3>Price</h3>

                                                    </div>
                                                    <div class="block-content" style=" max-height: 156px; overflow:auto;">
                                                        
                                                        <asp:RadioButtonList ID="RdsPice" CssClass="form-control filtercontrol"    runat="server">
                                                        <asp:ListItem Text="Less than 50" Value="50" ></asp:ListItem>
                                                        <asp:ListItem Text="Less than 100" Value="100" ></asp:ListItem>
                                                        <asp:ListItem Text="Less than 150" Value="150" ></asp:ListItem>
                                                        <asp:ListItem Text="Less than 200" Value="200" ></asp:ListItem>
                                                        <asp:ListItem Text="Less than 500" Value="500" ></asp:ListItem>
                                                        <asp:ListItem Text="Less than 1000" Value="1000" ></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                        
                                                        
                                                    </div>
                                                    
                                               
                                            <div id="Div1" class="actions row"  style=" text-align:center;position: fixed;left: 0;bottom: 0px;width: 100%;box-shadow: 0 0 2px #888; ">
                                                <asp:Button ID="Button2" runat="server" class=" btn btn-Add" style="margin: 0px; width: 100%;" OnClick="Chk_SelectedIndexChanged" Text="Apply" />
                     
                    
                    
                    </div>
                    </div>
                                            
                                            
                                            </div>
  
  
     
      
     <div id="snackbar" runat="server" style=" z-index:22" >
      
      
        <div class="divProductsize row" style=" width:100%;"  >
        


 
        <div class="panel-heading active" style=" background-color: #22263e; font-size: 15px; padding:15px;  text-align: center; color: White; z-index: 500;  ">
         <asp:Label ID="ItemName" style="font-size:18px; overflow: hidden; display:inline-block; width:200px; text-overflow: ellipsis; white-space: nowrap;" runat="server" Text=""></asp:Label>
         
                    <a href="javascript:void(0)"   id="closechoose" onclick="hideme()" class=" closechoose " style="font-size:20px; float:right; padding-right: 8px;">
                        <img src="img/closeiconfafa.png" id="closemeimg" runat="server" /></a> 
                    
                    </div>


  <asp:Repeater ID="RepeaterChooseQuantity" runat="server" OnItemCommand="RepeaterProductChooseQuantity"  >
                        <ItemTemplate>
  <div class="row col-xs-12 col-sm-12 col-md-12 col-lg-12" style="background:#fff; padding-top:10px; padding-left:3px !important; padding-right:3px !important; border-bottom:1px solid #eee;" >

  
  <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="padding-left:0px !important; max-width:100px; padding-right:4px !important;">
  <div class="offer">
  <span style="margin-top:5px"><%# Eval("Discount")%>% Off</span>
  </div>
   <img style="height:80px; width:80px;" src='https://www.kiranaworld.in/Admin/Products/mobile/<%# Eval("ImgUrlMbl") %>' alt="Photo"   />  
  
  </div>
  <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" style="padding-left:0px !important; padding-right:0px !important;">
  
   
 <div style="color: #1a1a1a; height:30px; text-align:left; font-weight:700; display:inline-block; width:100%; text-overflow: ellipsis; white-space: nowrap; overflow:hidden; line-height:30.2px !important; font-size:17px"><span>Qty:</span> <%# Eval("PackSize")%></div>
      
      
    
  <div class="row">
  <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7" style="padding-left:0px !important; text-align:left; padding-right:0px !important;">
  <span style="color:#8f8f8f">MRP: </span><span style="color:#8f8f8f; text-decoration:line-through;">&#8377;<%# Eval("Mrp")%></span><br /><b style="font-size:17px">&#8377; </b><span style="color:#1a1a1a; font-weight:700; font-size:17px;"><%# Eval("SellingPrice")%></span></div>
 
 
  

<div ID="Stock" runat="server" visible='<%# Eval("InStock")%>' class="col-xs-5 col-sm-5 col-md-5 col-lg-5  " style=" text-align:center; max-width:110px;">
  

  <div ID="DivAddBtn" runat="server" visible='<%# Eval("NotInCart")%>'  style=" text-align:center; max-width:100px;">
  
     <asp:Button ID="Button1"   CssClass="btn btn-Add" runat="server" Text="ADD" CommandName="Add" CommandArgument='<%# Eval("ItemId") + ";" +  Eval("ItemName")  + ";" + Eval("PackSize") + ";" + Eval("MRP") + ";" + Eval("SellingPrice") + ";" + Eval("PackId") + ";" + Eval("ImgUrlMbl") + ";" + Eval("Discount") + ";" + Eval("Type") + ";" + Eval("Brand") %>' />
      <br />
      <span  style="font-family: 'Roboto', sans-serif;  font-size: 11px; width:100px; color: #8f8f8f!important;  line-height: 30.2px !important;white-space: nowrap; text-overflow: ellipsis;">Save:<span style="color: #B12704!important;
                                                                                            font-weight: 700;"> &#8377;<%# int.Parse(Eval("MRP").ToString())- int.Parse(Eval("SellingPrice").ToString())%></span></span></div>
  <div ID="DivQty" visible='<%# Eval("InCart")%>' runat="server"  style="text-align:center; max-width:100px;">
  <div class="row" >
  <div class="col-xs-4" style="padding-left:0px !important; padding-right:0px !important;">
      <asp:ImageButton ID="ImageButton1" CommandName="DecreaseQty" CommandArgument='<%#  Eval("ItemId") + ";" +  Eval("ItemName")  + ";" + Eval("PackSize") + ";" + Eval("MRP") + ";" + Eval("SellingPrice") + ";" + Eval("PackId") + ";" + Eval("ImgUrlMbl") + ";" + Eval("Discount") + ";" + Eval("Type") + ";" + Eval("Brand") %>' ImageUrl="img/minus.png" runat="server" style=" height:22px; width:22px;" />
      </div>
      <div class="col-xs-4" style=" padding-left:0px !important; padding-right:0px !important; text-align:center; margin:0 auto;  color: #e95f62e6; font-size: 20px; font-weight: 600; height: 22px; width: 26px;">
      <asp:Label ID="Qty" Text='<%# Eval("NoOfItems")%>' runat="server" ></asp:Label>
      </div>
      <div class="col-xs-4" style="padding-left:0px !important; padding-right:0px !important; float:left;">
      <asp:ImageButton ID="ImageButton2" CommandName="IncreaseQty" CommandArgument='<%# Eval("ItemId") + ";" +  Eval("ItemName")  + ";" + Eval("PackSize") + ";" + Eval("MRP") + ";" + Eval("SellingPrice") + ";" + Eval("PackId") + ";" + Eval("ImgUrlMbl") + ";" + Eval("Discount") + ";" + Eval("Type") + ";" + Eval("Brand")%>' ImageUrl="img/plus.png" style="  height:22px; width: 22px;" runat="server" />
     </div>
     </div>
     <br />
      <span  style="font-family: 'Roboto', sans-serif;  font-size: 11px; width:100px; color: #8f8f8f!important;  line-height: 30.2px !important;white-space: nowrap; text-overflow: ellipsis;">Save:<span style="color: #B12704!important;
                                                                                            font-weight: 700;"> &#8377;<%# int.Parse(Eval("MRP").ToString())- int.Parse(Eval("SellingPrice").ToString())%></span></span></div>
  </div>

   <div ID="OutStock" runat="server" visible='<%# Eval("OutofStack")%>' class="col-xs-5 col-sm-5 col-md-5 col-lg-5  " style=" text-align:center; color:Maroon;">
   Out Of Stock
   </div>


  </div>
  
  </div>

  
  </div>
  </ItemTemplate>
  </asp:Repeater>
  
      
      
      
  
  </div>
      
      </div>
     
   <asp:Label ID="cartCount" CssClass="circlecart" runat="server" Text="0"></asp:Label> 
   <asp:Label ID="alertpop" runat="server" Text=""></asp:Label>
      

        <div style=" width:100%; height:50px;" >
                        
                        
                    </div>
   
 <div class="container">
 
        <div class="row">
            <div class="col-main col-sm-12 col-xs-12">
              
              

                    <div class="page-title" style=" height:10px;">
                        
                        
                    </div>

                   
        
                   
                    
            </div>
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


 <!--End of Newsletter Popup-->   
 


 


 

 <div runat="server" id="CatSubcat" class="hidepanel" style=" overflow:scroll; height: 100vh;  border:none;  position:fixed ;  top:0; left:0; width:100%;" >
            

            <div id="loader2" runat="server" >
    </div>
              

            </div>

  </form>
   </div>



  

<script type="text/jscript">

    function mytoast() {
        // Get the snackbar DIV

        var y = document.getElementById("closemeimg");
        y.className = "show";
        var x = document.getElementById("snackbar");

        // Add the "show" class to DIV
        x.className = "showani";

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
        var y = document.getElementById("closemeimg");
        y.className = "hideme";
        var x = document.getElementById("snackbar");
        x.className = "hidemeani";



    }

</script>

 <script type="text/jscript">

     function MoboFiltershow() {
         // Get the snackbar DIV
         var x = document.getElementById("MoboFilter");

         // Add the "show" class to DIV
         x.className = " show";

         // After 3 seconds, remove the show class from DIV
         //setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
     }


</script>

<script type="text/jscript">

    function MoboFilterhide() {
        // Get the snackbar DIV
        var x = document.getElementById("MoboFilter");

        // Add the "show" class to DIV
        x.className = "hideme";

        // After 3 seconds, remove the show class from DIV
        //setTimeout(function () { x.className = x.className.replace("show", ""); }, 3000);
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

  
  <script>
      function goBack() {
          window.history.back();
      }
</script>
 

    
 

</body>
</html>
