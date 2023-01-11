<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="KiranaWorldApp.Categories" %>

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

 

<div id="page" style="background:#d0d0d0c9!important"> 

  


 <nav class="shadow-bottom" style="background:#84c225; height:92px; width:100%; color:#fff; z-index:40;  " >

 <div class=" container" id="headertop" runat="server"  style="background:#84c225; position: fixed;  height:50px; width:100%; color:#fff; z-index:40;  " >
  <div class="mm-toggle-wrap"  style="   position: fixed; width:20%; z-index:40;  " >
         
            <div class="mm-toggle " style="background:#84c225"> 
            <a href="javascript:void(0)" onclick="goBack()"><img src="img/backbtn.png" alt="back" /></a>
            </div>
              </div>
        <div style="   position: fixed; width:58%; left:20%; top:16px; font-size:16px; z-index:40; text-align:center;">
           <div ><asp:Label ID="catname" style=" font-weight:600; color:White; font-size:16px; " runat="server" Text="Categories"></asp:Label>
           
           </div>
           </div>
           </div>
           
          <div class="shadow-bottom " id="headerBottom" runat="server"  style=" background:#84c225;  position: fixed; width:100%; padding:2px; top:50px; z-index:40; ">
          <asp:Panel ID="Panel1" runat="server" DefaultButton="Button1">
    <asp:TextBox ID="txtSearch" placeholder="search from 5000+ products"  CssClass="form-control"  runat="server" /><img src="img/search-icon.png" alt="Search" title="Search"  style="position:fixed;  top:57px; right:5%; z-index: -1; " />

    <asp:Button ID="Button1" runat="server" OnClick="Searchclick"   Style="display: none" />
</asp:Panel>
           
   </div>
  </nav>
  
  <div style=" width:100%; height:90px;" >
    
  </div>


 <div class="titleback" style=" background-image:url('strip/5.jpg'); " >
  
      
      Foodgrain, Oil & Masala
  
  </div>


  <div class="divCategory container"  >
                
  

  <div class="row" style="max-width:768px; margin:0 auto;">
   
   <asp:Repeater ID="Repeater2" runat="server" DataSourceID="SqlDataSource6" >
        <ItemTemplate>
            <div class="Category col-xs-4 col-sm-3 col-md-3 col-lg-2" style="border: 0.5px solid rgb(238, 238, 238); overflow:hidden;">

            <a  href='ItemList.aspx?Type=5&SubCatId=<%# Eval("SubCatId") %>'> <img src='https://www.kiranaworld.in/Admin/Subcategory/Mobile/<%# Eval("SubMobImg") %>' alt='<%# Eval("SubCatName") %>' title='<%# Eval("SubCatName") %>'  class=" img-responsive" style=" width:100%;  border: 1px solid rgb(238, 238, 238); overflow:hidden; " /> </a>                   

                
            </div>
        </ItemTemplate>
  </asp:Repeater>
  
  <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:theOMartMSConnectionString1 %>"
                                SelectCommand="SELECT    [SubCatId], [CatId], [SubCatName], [SubMobImg] FROM [SubCategory] WHERE ([CatId] = @CatId) ">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="45" Name="CatId" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
  
  
  </div>
  
      
  
  </div>

  
   <div class="titleback" style=" background-image:url('strip/1.jpg'); color:White; " >
  
      
      Fruits & Vegetables
  
  </div>


  <div class="divCategory container"  >
                
  

  <div class="row" style="max-width:768px; margin:0 auto;">
   
   <asp:Repeater ID="Repeater3" runat="server" DataSourceID="SqlDataSource2" >
        <ItemTemplate>
            <div class="Category col-xs-4 col-sm-3 col-md-3 col-lg-2" style="  border: 0.5px solid rgb(238, 238, 238); overflow:hidden;">
                <a  href='ItemList.aspx?Type=5&SubCatId=<%# Eval("SubCatId") %>'> <img src='https://www.kiranaworld.in/Admin/Subcategory/Mobile/<%# Eval("SubMobImg") %>' alt='<%# Eval("SubCatName") %>' title='<%# Eval("SubCatName") %>'  class=" img-responsive" style="width:100%;  border: 1px solid rgb(238, 238, 238); overflow:hidden; " /> </a>     
            </div>
        </ItemTemplate>
  </asp:Repeater>
  
  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:theOMartMSConnectionString1 %>"
                                SelectCommand="SELECT    [SubCatId], [CatId], [SubCatName], [SubMobImg] FROM [SubCategory] WHERE ([CatId] = @CatId) ">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="43" Name="CatId" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
  
  
  </div>
  
      
  
  </div>

   <div class="titleback" style=" background-image:url('strip/5.jpg'); " >
  
      
      Cleaning & Household
  
  </div>


  <div class="divCategory container"  >
                
  

  <div class="row" style="max-width:768px; margin:0 auto;">
   
   <asp:Repeater ID="Repeater5" runat="server"  DataSourceID="SqlDataSource4" >
        <ItemTemplate>
            <div class="Category col-xs-4 col-sm-3 col-md-3 col-lg-2" style="border: 0.5px solid rgb(238, 238, 238); overflow:hidden;">
                <a  href='ItemList.aspx?Type=5&SubCatId=<%# Eval("SubCatId") %>'> <img src='https://www.kiranaworld.in/Admin/Subcategory/Mobile/<%# Eval("SubMobImg") %>' alt='<%# Eval("SubCatName") %>' title='<%# Eval("SubCatName") %>'  class=" img-responsive" style=" width:100%;  border: 1px solid #b1afaf; overflow:hidden; " /> </a>     
            </div>
        </ItemTemplate>
  </asp:Repeater>
  
  <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:theOMartMSConnectionString1 %>"
                                SelectCommand="SELECT    [SubCatId], [CatId], [SubCatName], [SubMobImg] FROM [SubCategory] WHERE ([CatId] = @CatId) ">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="50" Name="CatId" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
  
  
  </div>
  
      
  
  </div>

  
   
   <div class="titleback" style=" background-image:url('strip/1.jpg'); color:White; " >
  
      
      Snacks Store
  
  </div>


  <div class="divCategory container"  >
                
  

  <div class="row" style="max-width:768px; margin:0 auto;">
   
   <asp:Repeater ID="Repeater4" runat="server" DataSourceID="SqlDataSource3" >
        <ItemTemplate>
            <div class="Category col-xs-4 col-sm-3 col-md-3 col-lg-2" style="  border: 0.5px solid rgb(238, 238, 238); overflow:hidden;">
                <a  href='ItemList.aspx?Type=5&SubCatId=<%# Eval("SubCatId") %>'> <img src='https://www.kiranaworld.in/Admin/Subcategory/Mobile/<%# Eval("SubMobImg") %>' alt='<%# Eval("SubCatName") %>' title='<%# Eval("SubCatName") %>'  class=" img-responsive" style="width:100%;  border: 1px solid rgb(238, 238, 238); overflow:hidden; " /> </a>     
            </div>
        </ItemTemplate>
  </asp:Repeater>
  
  <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:theOMartMSConnectionString1 %>"
                                SelectCommand="SELECT    [SubCatId], [CatId], [SubCatName], [SubMobImg] FROM [SubCategory] WHERE ([CatId] = @CatId) ">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="49" Name="CatId" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
  
  
  </div>
  
      
  
  </div>
 

 <div class="titleback" style=" background-image:url('strip/5.jpg'); " >
  
      
      Summer Drinks & Beverages
  
  </div>


  <div class="divCategory container"  >
                
  

  <div class="row" style="max-width:768px; margin:0 auto;">
   
   <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" >
        <ItemTemplate>
            <div class="Category col-xs-4 col-sm-3 col-md-3 col-lg-2" style="border: 0.5px solid rgb(238, 238, 238); overflow:hidden;">

            <a  href='ItemList.aspx?Type=5&SubCatId=<%# Eval("SubCatId") %>'> <img src='https://www.kiranaworld.in/Admin/Subcategory/Mobile/<%# Eval("SubMobImg") %>' alt='<%# Eval("SubCatName") %>' title='<%# Eval("SubCatName") %>'  class=" img-responsive" style=" width:100%;  border: 1px solid rgb(238, 238, 238); overflow:hidden; " /> </a>                   

                
            </div>
        </ItemTemplate>
  </asp:Repeater>
  
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:theOMartMSConnectionString1 %>"
                                SelectCommand="SELECT    [SubCatId], [CatId], [SubCatName], [SubMobImg] FROM [SubCategory] WHERE ([CatId] = @CatId) ">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="44" Name="CatId" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
  
  
  </div>
  
      
  
  </div>

 

   <div class="titleback" style=" background-image:url('strip/1.jpg'); color:White; " >
  
      
      Baby Care
  
  </div>


  <div class="divCategory container"  >
                
  

  <div class="row" style="max-width:768px; margin:0 auto;">
   
   <asp:Repeater ID="Repeater6" runat="server"  DataSourceID="SqlDataSource5" >
        <ItemTemplate>
            <div class="Category col-xs-4 col-sm-3 col-md-3 col-lg-2" style="border: 0.5px solid rgb(238, 238, 238); overflow:hidden;">
                <a  href='ItemList.aspx?Type=5&SubCatId=<%# Eval("SubCatId") %>'> <img src='https://www.kiranaworld.in/Admin/Subcategory/Mobile/<%# Eval("SubMobImg") %>' alt='<%# Eval("SubCatName") %>' title='<%# Eval("SubCatName") %>'  class=" img-responsive" style=" width:100%;  border: 1px solid #b1afaf; overflow:hidden; " /> </a>     
            </div>
        </ItemTemplate>
  </asp:Repeater>
  
  <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:theOMartMSConnectionString1 %>"
                                SelectCommand="SELECT    [SubCatId], [CatId], [SubCatName], [SubMobImg] FROM [SubCategory] WHERE ([CatId] = @CatId) ">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="52" Name="CatId" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
  
  
  </div>
  
      
  
  </div>

  

 <div class="titleback" style=" background-image:url('strip/5.jpg'); " >
  
      
      Bakery Cakes & Dairy
  
  </div>


  <div class="divCategory container"  >
                
  

  <div class="row" style="max-width:768px; margin:0 auto;">
   
   <asp:Repeater ID="Repeater7" runat="server" DataSourceID="SqlDataSource7" >
        <ItemTemplate>
            <div class="Category col-xs-4 col-sm-3 col-md-3 col-lg-2" style="border: 0.5px solid rgb(238, 238, 238); overflow:hidden;">

            <a  href='ItemList.aspx?Type=5&SubCatId=<%# Eval("SubCatId") %>'> <img src='https://www.kiranaworld.in/Admin/Subcategory/Mobile/<%# Eval("SubMobImg") %>' alt='<%# Eval("SubCatName") %>' title='<%# Eval("SubCatName") %>'  class=" img-responsive" style=" width:100%;  border: 1px solid rgb(238, 238, 238); overflow:hidden; " /> </a>                   

                
            </div>
        </ItemTemplate>
  </asp:Repeater>
  
  <asp:SqlDataSource ID="SqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:theOMartMSConnectionString1 %>"
                                SelectCommand="SELECT    [SubCatId], [CatId], [SubCatName], [SubMobImg] FROM [SubCategory] WHERE ([CatId] = @CatId) ">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="45" Name="CatId" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
  
  
  </div>
  
      
  
  </div>

  
   <div class="titleback" style=" background-image:url('strip/1.jpg'); color:White; " >
  
      
      Beauty & Hygiene
  
  </div>


  <div class="divCategory container"  >
                
  

  <div class="row" style="max-width:768px; margin:0 auto;">
   
   <asp:Repeater ID="Repeater8" runat="server" DataSourceID="SqlDataSource8" >
        <ItemTemplate>
            <div class="Category col-xs-4 col-sm-3 col-md-3 col-lg-2" style="  border: 0.5px solid rgb(238, 238, 238); overflow:hidden;">
                <a  href='ItemList.aspx?Type=5&SubCatId=<%# Eval("SubCatId") %>'> <img src='https://www.kiranaworld.in/Admin/Subcategory/Mobile/<%# Eval("SubMobImg") %>' alt='<%# Eval("SubCatName") %>' title='<%# Eval("SubCatName") %>'  class=" img-responsive" style="width:100%;  border: 1px solid rgb(238, 238, 238); overflow:hidden; " /> </a>     
            </div>
        </ItemTemplate>
  </asp:Repeater>
  
  <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:theOMartMSConnectionString1 %>"
                                SelectCommand="SELECT    [SubCatId], [CatId], [SubCatName], [SubMobImg] FROM [SubCategory] WHERE ([CatId] = @CatId) ">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="48" Name="CatId" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
  
  
  </div>
  
      
  
  </div>

   <div class="titleback" style=" background-image:url('strip/5.jpg'); " >
  
      
      Eggs , Meat & Fish
  
  </div>


  <div class="divCategory container"  >
                
  

  <div class="row" style="max-width:768px; margin:0 auto;">
   
   <asp:Repeater ID="Repeater9" runat="server"  DataSourceID="SqlDataSource9" >
        <ItemTemplate>
            <div class="Category col-xs-4 col-sm-3 col-md-3 col-lg-2" style="border: 0.5px solid rgb(238, 238, 238); overflow:hidden;">
                <a  href='ItemList.aspx?Type=5&SubCatId=<%# Eval("SubCatId") %>'> <img src='https://www.kiranaworld.in/Admin/Subcategory/Mobile/<%# Eval("SubMobImg") %>' alt='<%# Eval("SubCatName") %>' title='<%# Eval("SubCatName") %>'  class=" img-responsive" style=" width:100%;  border: 1px solid #b1afaf; overflow:hidden; " /> </a>     
            </div>
        </ItemTemplate>
  </asp:Repeater>
  
  <asp:SqlDataSource ID="SqlDataSource9" runat="server" ConnectionString="<%$ ConnectionStrings:theOMartMSConnectionString1 %>"
                                SelectCommand="SELECT    [SubCatId], [CatId], [SubCatName], [SubMobImg] FROM [SubCategory] WHERE ([CatId] = @CatId) ">
                                <SelectParameters>
                                    <asp:Parameter DefaultValue="47" Name="CatId" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
  
  
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