<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeAddre.aspx.cs" Inherits="KiranaWorldApp.ChangeAddre" %>
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
            .circlecart {
  color:Black;
  font-size:9px;
 
 
 
  padding:6px;
  border-radius:999px;
  line-height:6px;
  position:fixed;
  right:22%;
  
  bottom:25px;
  text-align:center;
 
  font-weight:bold;
  background: white;
  border:1px solid red;

  z-index:600;
}


.Address
{
        background: #1a1a1a;
    padding: 15px 8px;
    color: #fff;
    font-size: 1.6rem;
    text-align: center;
}


    
    </style>


    
<style>
.radio-toolbar input[type="radio"] {
  opacity: 0;
  position: fixed;
  width: 0;
}
.radio-toolbar label {
    display: inline-block;
    background-color:transparent;
    font-weight:600;
    padding: 7px 14px;
    font-family: sans-serif, Arial;
    font-size: 14px;
    
    border: 1px solid #8f8f8f;
    border-radius: 4px;
    color:#4a4a4a;
    
}
.radio-toolbar input[type="radio"]:checked + label {
   

     border: 1px solid #dc3545;
    color:#dc3545 !important;
     font-weight:700;
}
.radio-toolbar input[type="radio"]:focus + label {
    border: 1px #dc3545;
}

.fs-title
{
    color:Black;
}
td
{
    padding-left:10px;
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

.form-control
{
    border:none;
    border-bottom:1px solid grey;
    -webkit-box-shadow:none;
    border-radius:0px;
    
}
    
    </style>

   <style>
.vl {
  border-right: 1px solid green;
  height: 20px;
  
}
</style>
    
<style type="text/css">
#myloader
{
  position: fixed;
            width: 100%;
            height: 100%;
            background:  url(/Admin/images/KiranaWorld.png) center center no-repeat, url(/loader2.gif) center center no-repeat;
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

<div class="wrapper" style="background:#fff">
<div id="overlay" style=" background-color:transparent; position: absolute; z-index:9000; top:0px; right:0px; width:200px;"></div>
<form id="Form1" runat="server">

 <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"> </asp:ToolkitScriptManager>

<div id="page" > 

  


 <nav class="shadow-bottom" style="background:#84c225; height:50px width:100%; color:#fff; z-index:40;  " >
<div class=" container" id="headertop" runat="server"  style="background:#84c225; position: fixed;  height:50px; width:100%; color:#fff; z-index:40;  " >
  <div class="mm-toggle-wrap"  style="   position: fixed; width:10% !important; z-index:40;  " >
         
            <div class="mm-toggle " style="background:#84c225"> 
            
            <a href="javascript:void(0)" onclick="goBack()"><img src="img/backbtn.png" alt="back" /></a>
            </div>
              </div>
        <div style="   position: fixed; width:75%; left:10%; top:16px;  z-index:40; text-align:center;">
           <div ><asp:Label ID="catname" style="display: inline-block; width: 180px; text-overflow: ellipsis; white-space: nowrap; overflow: hidden; font-weight:600; color:White; font-size:16px; " runat="server" Text="Saved Addresses"></asp:Label></div>
           
           </div>

           <div style="   position: fixed; width:9%; right:2%; top:14px; z-index:41;  "> 
                    
                <a href="Address.aspx"><img src="img/NewAddess.png" alt="Add New Address" title="Add New Address" style=" width:24px;" /> </a>
          </div>
           </div>
          
  </nav>
  
  <div style=" width:100%; height:50px;" >
    
  </div>
  <div class="row" style="background:#d0d0d0c9!important; padding:5px">
  <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
  <h6 style="text-transform:uppercase">Saved Addresses</h6>
  </div>
  
  </div>
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" 
        onitemcommand="Repeater1_ItemCommand">
   <ItemTemplate>
  <div class="row" style="border-bottom:1px solid #80808038; margin-top:5px; padding-bottom:5px">
  <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1" style="padding-right:0px">
      
       <asp:ImageButton ID="ImageButton4"  CommandName="Checkboxchange"  CommandArgument='<%#Eval("AddId") %>' ImageUrl='<%#Eval("prime")+".png"%>'  runat="server" />
      
  </div>
  <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8" style=" padding-right:0px">
  <span style="color:Red"><%# Eval("Type")%> :</span>&nbsp;<span>Flot No: <%# Eval("HNo")%>, <%# Eval("AName")%></span><br />
  <span><%# Eval("StreetDet")%>, <%# Eval("StreetDet")%></span><br />
  <span><%# Eval("City")%>- <%# Eval("Pincode")%></span>
  </div>
  <div class="row col-xs-3 col-sm-3 col-md-3 col-lg-3" style="padding-left:0px; padding-right:0px; margin-top:5px">
  <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6  vl">
  <a href="EditAddress.aspx?AddId=<%#Eval("AddId") %>">
      <img src="img/Edit2.png" />  </a>
  </div>

  <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
     
      <asp:ImageButton ID="ImageButton1" CommandName="Delete" CommandArgument='<%#Eval("AddId") %>' ImageUrl="img/trash.png"  runat="server" />

 
  </div>
  </div>
  
  
  </div>
  </ItemTemplate>
   </asp:Repeater>



 


    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
   


  
      
      
     
   
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
                        
                        
                   
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:theOMartMSConnectionString1 %>" 
                        DeleteCommand="DELETE FROM [Address] WHERE [AddId] = @AddId" 
                        InsertCommand="INSERT INTO [Address] ([ClientId], [HNo], [AName], [StreetDet], [LandMark], [AreaDet], [Number], [City], [Pincode], [Type], [Tag], [prime]) VALUES (@ClientId, @HNo, @AName, @StreetDet, @LandMark, @AreaDet, @Number, @City, @Pincode, @Type, @Tag, @prime)" 
                        SelectCommand="SELECT [AddId], [Address], [ClientId], [HNo], [AName], [StreetDet], [LandMark], [AreaDet], [Number], [City], [Pincode], [Type], [Tag], [prime] FROM [Address] WHERE ([ClientId] = @ClientId)" 
                        
                        UpdateCommand="UPDATE [Address] SET [ClientId] = @ClientId, [HNo] = @HNo, [AName] = @AName, [StreetDet] = @StreetDet, [LandMark] = @LandMark, [AreaDet] = @AreaDet, [Number] = @Number, [City] = @City, [Pincode] = @Pincode, [Type] = @Type, [Tag] = @Tag, [prime] = @prime WHERE [AddId] = @AddId">
                        <DeleteParameters>
                            <asp:Parameter Name="AddId" Type="Int32" />
                        </DeleteParameters>
                        
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="1003" Name="ClientId" 
                                SessionField="ClientId" Type="Int32" />
                        </SelectParameters>
                        
                        
                    </asp:SqlDataSource>
                        
                        
                    </div>
   
 
 <!--End of Newsletter Popup-->   
  </div>


 




<script type="text/javascript" src="js/bootstrap.min.js"></script> 
<script type="text/javascript" src="js/owl.carousel.min.js"></script> 
<script type="text/javascript" src="js/mobile-menu.js"></script> 
<script type="text/javascript" src="js/main.js"></script> 

  </form>

  </div>

  <div id="CatSubcat" class="hidepanel" style=" overflow:scroll; height: 100vh;  border:none;  position:fixed ;  top:0; left:0; width:100%;" >
            

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
                   
                    
            </div>
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
