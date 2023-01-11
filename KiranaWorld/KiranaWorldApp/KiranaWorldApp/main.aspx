<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="KiranaWorldApp.main" %>

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
    <script type="text/javascript" src="js/revolution-slider.js"></script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/simple-line-icons.css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" media="all" />
    <link href="css/revolution-slider.css" rel="stylesheet" />
   
    
    
    <script type="text/javascript" src="js/main.js"></script>
    
    <style type="text/css">
        .divBanner
        {
            margin-top: 3px;
            margin-bottom: 3px;
        }
        .divCategory
        {
            padding-left: 5px;
            padding-right: 5px;
        }
        .Category
        {
            padding-left: 0px !important;
            padding-right: 0px !important;
        }
        
        .offer
        {
            border-radius: 50%;
            height: 40px;
            width: 40px;
            font-size: 11px;
            font-family: ProximaNova;
            position: absolute;
            text-align: center;
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
            font-family: ProximaNova;
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
            margin-right: 8px;
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
            font-family: ProximaNova;
            font-size: 14px;
            font-weight: 700;
            line-height: 18.2px;
        }
    </style>
    <style type="text/css">
        .mobile-menu li li
        {
            background: #ffffff;
        }
        .round-button
        {
            display: block;
            width: 40px;
            height: 40px;
            line-height: 40px;
            border-radius: 50%;
            color: #0f1015;
            text-align: center;
            text-decoration: none;
            background: #dfdddd;
            box-shadow: 0 0 3px gray;
            font-size: 18px;
            font-weight: bold;
            margin-left: 3px;
        }
        .round-button:hover
        {
            color: White;
            background: #fed700;
        }
        .nav
        {
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
        .footer
        {
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
        .footer ul
        {
            padding: 0;
            margin: 0px auto;
            list-style-type: none;
            width: 90%;
            display: table;
            height: 100%;
        }
        #mobile-menu
        {
            text-transform: none;
        }
        .footer ul li
        {
            width: 20%;
            display: table-cell;
            text-align: center;
            position: relative;
            padding-top: 0;
            vertical-align: middle;
            line-height: normal;
            padding-left: 10px;
        }
        ul li
        {
            list-style-type: none;
        }
        ul, ol, li
        {
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
            background: #f2f2f2 url('/spinner-min.gif') no-repeat center center;
            z-index: 99999;
        }
        
        .shadow-bottom
        {
            -webkit-box-shadow: 0 8px 6px -6px rgba(0, 0, 0, 0.19);
            -moz-box-shadow: 0 8px 6px -6px rgba(0, 0, 0, 0.19);
            box-shadow: 0 8px 6px -6px rgba(0, 0, 0, 0.19);
            position: fixed;
            top: 0;
            left: 0;
            z-index: 9;
        }
    </style>
    <style type="text/css">
        .hidepanel {
  position: absolute;
  top: 0px;
  left: 100%;
  visibility:hidden;
  z-index:0;
  }
.showpanel
{
    position:inherit;
    display:block;
    visibility:visible;
    width: 100%; 
}

.move
{
    position:inherit;
    display:block;
    visibility:visible;
    width: 100%; 
  animation-name: example;
  animation-duration: .5s;
}

@keyframes example {
  0%   { margin-left:100%; opacity: 90%; }
  
  100% { margin-left:0px; opacity: 100%; }
}

.moveback
{
    position:inherit;
    display:block;
    visibility:visible;
    width: 100%; 
  animation-name: exampleback;
  animation-duration: .5s;
}

@keyframes exampleback {
  0%   { margin-left:-100%; opacity: 90%; }
  
  100% { margin-left:0px; opacity: 100%; }
}



        
    </style>

    

    
</head>
<body onload="myfuction()" onunload="myFunctiona()" class="body cms-index-index cms-home-page ">
    <div id="myloader">
    </div>
    <div class="wrapper" style="background: #d0d0d0c9!important">
        <div id="overlay" style="background-color: transparent; position: absolute; z-index: 9000;
            top: 0px; right: 0px; width: 200px;">
        </div>
        <form id="form1" runat="server">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
       <div id="mobile-menu" >
 <ul>
 <li style="background:#fcfcfc; padding:15px"><label style=" font-weight:normal;">Hello</label><br />
    <asp:Label ID="CustName" style="font-size:15px" runat="server" Text="Customer"></asp:Label><br />
 
    
<asp:Label ID="CusAddressfull" Visible="false" runat="server" style=" font-weight:normal;" ><i class="fa fa-map-marker" aria-hidden="true"></i> &nbsp;<asp:Label ID="CusAddress" runat="server" Text=""></asp:Label> </asp:Label>
 </li>
 <li><a href="Home.aspx" class="home1"><i class="fa fa-user" aria-hidden="true"></i>&nbsp;Home</a></li>
 
 
 <li><a href="Address.aspx" class="home1"><i class="fa fa-calendar" aria-hidden="true"></i> &nbsp;MyAddress</a></li>
 <li><a href="OrderDetails.aspx" class="home1"><i class="fa fa-shopping-basket" aria-hidden="true"></i>&nbsp; Orders</a></li>
 <li><a href="OrderDetails.aspx" class="home1"><img src="img/wallet.png" style="height: 12px;" /> &nbsp;Order Details</a></li>
 <li><asp:LinkButton ID="LinkButton3" runat="server" OnClick="logout"  CssClass="home1"><i class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;Log out</asp:LinkButton></li>
 </ul>
    </div>
        <div id="page" style="background: #d0d0d0c9!important">
         <div class=" container" id="headertop" runat="server" style="background:#84c225; position: fixed;  height:50px; width:100%; color:#fff; z-index:40;  " >
  <div class="mm-toggle-wrap"  style="   position: fixed; z-index:40; width:37px !important; overflow:hidden;  " >
         
            <div class="mm-toggle " style="background:#84c225"> 
                <img src="img/mobmenuicon.png" alt="MenuIcon"  style="margin:0px !important; width:100% !important; height:100% !important" /> 
            </div>
              </div>
        <div style="   position: fixed; width:58%; left:13%; top:17px; z-index:40;  "  >
           <div style=" font-weight:600; line-height:10px;">Your Location</div>
           <asp:Label ID="MyAdd" runat="server" style="display: inline-block; width: 200px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden"></asp:Label>
          </div>
           <div   style="   position: fixed; width:12%; right:5%; top:14px  ">            
                <i class="fa fa-user" style=" float:right;" aria-hidden="true"></i> 
          </div>
          </div>
            <div id="headerBottom" runat="server" class="shadow-bottom " style="background: #84c225;
                position: fixed; width: 100%; padding: 2px; top: 50px; z-index: 40;">
                <asp:Panel ID="Panel1" runat="server" DefaultButton="Button1">
                    <asp:TextBox ID="txtSearch" placeholder="search 6000 products" CssClass="form-control"
                        runat="server" />
                    <asp:Button ID="Button1" runat="server" OnClick="Search_Click" Style="display: none" />
                </asp:Panel>
            </div>
            

             <asp:UpdatePanel ID="UpdatePanelHome" runat="server">
                <ContentTemplate>
                    <div runat="server" id="home"   >
           <div style=" width:100%; height:89px;" >
    
            </div>
            
           <div class=" divBanner" id="slider" runat="server"   visible="true">
           <iframe src="Myslider.aspx" style=" width:100%; height:100%; border:none;background-image: url('/Admin/Slider/Mobile/3010864.jpg');   background-repeat: no-repeat; background-size: 100% 100%;"  title="W3Schools Free Online Web Tutorials"></iframe>
               
            </div>
                
                
            <div class="titleback" style="margin:0 auto;" >
  
      
      Shop by category
  
  </div>


            <div class="divCategory container"  >
                
  

  <div class="row" style="max-width:642px; margin:0 auto;">
   <asp:Repeater ID="RepeaterCategory" runat="server"   OnItemCommand="CatLink"  DataSourceID="SqlDataSource3">
                        <ItemTemplate>
  <div class="Category col-xs-4 col-sm-3 col-md-3 col-lg-2" >
      
      
      <asp:ImageButton ID="ImageButton1"  runat="server"  CommandArgument='<%# Eval("CatId")+ ";" + Eval("CatName")  %>' ImageUrl='<%# "/Admin/Category/Mobile/"+ Eval("CatImgMbl") %>'  CssClass=" img-responsive" style=" height:90px; border: 0.5px solid rgb(238, 238, 238); overflow:hidden; "  />

  </div>
  </ItemTemplate>
  </asp:Repeater>
  <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:theOMartMSConnectionString1 %>" 
                DeleteCommand="DELETE FROM [Category] WHERE [CatId] = @CatId" 
                InsertCommand="INSERT INTO [Category] ([CatName], [CatImgMbl], [CatImgDesk], [SellerId]) VALUES (@CatName, @CatImgMbl, @CatImgDesk, @SellerId)" 
                ProviderName="<%$ ConnectionStrings:theOMartMSConnectionString1.ProviderName %>" 
                SelectCommand="SELECT TOP(9)  CatId, CatName, CatImgMbl, CatImgDesk, SellerId FROM Category  ORDER BY SellerId" 
                
                UpdateCommand="UPDATE [Category] SET [CatName] = @CatName, [CatImgMbl] = @CatImgMbl, [CatImgDesk] = @CatImgDesk, [SellerId] = @SellerId WHERE [CatId] = @CatId">
                
            </asp:SqlDataSource>
  
  </div>
  
      
  
  </div>

              </div>
                 </ContentTemplate>
             </asp:UpdatePanel>

             


            <asp:UpdatePanel ID="UpdatePanelCatSubcat" runat="server">
    <ContentTemplate>
            <div runat="server" id="CatSubcat" class="hidepanel" >
            <div style=" width:100%; height:89px;" >
    
  </div>
                <div class=" container"  style="background:#84c225; top:0px; position: fixed;  height:50px; width:100%; color:#fff; z-index:40; ">
                  <div style="   position: fixed; width:20%; left:5%; z-index:42; top:14px;  " >
         
                      <asp:LinkButton ID="BacktoHome" OnClick="BacktoHomeClick" runat="server"><i style="font-size:24px; font-weight:bold; color:White; line-height:15px;" class="fa">&#xf104;</i></asp:LinkButton>
            	
              </div>
        <div style="   position: fixed; width:58%; left:20%; top:14px; font-size:16px; z-index:40; text-align:center;">
           <div style=" font-weight:600; "><%=catname%></div>
           
           </div>
            </div>

                <div class="divCategory  " id="CatSubcate"   >
    <div class="row" style="max-width:642px; margin:0 auto;">
   <asp:Repeater ID="RepeaterSubCategory" runat="server" OnItemCommand="SubCatLink"  DataSourceID="SqlSubCategory">
        <ItemTemplate>
            <div class="Category col-xs-4 col-sm-3 col-md-3 col-lg-2" style="border: 0.5px solid rgb(238, 238, 238); overflow:hidden;">
                <asp:ImageButton ID="ImageButton1"   CommandArgument='<%# Eval("SubCatId")+ ";" + Eval("SubCatName")  %>' ImageUrl='<%# "https://www.kiranaworld.in/Admin/Subcategory/Mobile/"+ Eval("SubMobImg") %>' CssClass=" img-responsive" style=" height:90px; "  runat="server" />
            </div>
        </ItemTemplate>
  </asp:Repeater>
  <asp:SqlDataSource ID="SqlSubCategory" runat="server" 
                ConnectionString="<%$ ConnectionStrings:theOMartMSConnectionString1 %>" 
                
          SelectCommand="SELECT [SubCatId], [CatId], [SubCatName], [SubMobImg] FROM [SubCategory] WHERE ([CatId] = 0)">
      
                
            </asp:SqlDataSource>
  
  </div>
  </div>


            

            

            </div>

            

            
  


            </ContentTemplate></asp:UpdatePanel>


            
            
            <iframe src="Default.aspx" class="hidepanel"  id="LoginPage" runat="server" style="background-color:White; height: 100vh; border:none;  position:fixed ; z-index:50; top:0; left:0; width:100%;" title="Login"></iframe>
            
            

            
  


          
            






























            <div style=" width:100%; height:50px;" >
                        
                        
                    </div>
            
           <div id="footerBottom" runat="server" class="footer headroomft headroom headroom--not-bottom headroom--pinned headroom--top" style="display: block;">
                <ul  style="background:#ffffff;">

            <li >
             <asp:LinkButton ID="LinkButton5" runat="server">
                    <img src="/AdminImg/KiranaWorld.png" style="width:40px; height:30px" />
                    </asp:LinkButton>
            </li>


            <li >
            <asp:LinkButton ID="LinkButton4" runat="server"> <img src="img/Categories.png" /></asp:LinkButton>
           </li>


            <li > 
            <a href="Search.aspx"><img src="img/Search.png" /></a>
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
<script type="text/javascript" src="js/bootstrap.min.js"></script> 
<script type="text/javascript" src="js/owl.carousel.min.js"></script> 
<script type="text/javascript" src="js/mobile-menu.js"></script> 
<script type="text/javascript" src="js/main.js"></script> 
        </form>
    </div>
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
    <script type="text/javascript">
        var preloader = document.getElementById("myloader");
        function myfuction() {
            preloader.style.display = 'none';
        };
  
  </script>
</body>
</html>
