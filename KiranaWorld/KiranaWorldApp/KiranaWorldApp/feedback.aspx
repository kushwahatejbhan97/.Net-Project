<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="KiranaWorldApp.feedback" %>
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
        .form-control[disabled]
        {
            background-color: white !important;
        }
        
        .otpver
    {

        background:transparent;
        outline:none;
        color:#131212;
        font-size:15px;
        border:none !important;
        width:85% !important;
        float:left;
       
    }
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
        
        input:-internal-autofill-selected
{ 
    background: none !important;
    
    background-color:transparent !important;
  

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
        background: #dc3545;
    padding: 15px 8px;
    color: #fff;
    font-size: 1.6rem;
    text-align: center;
    border:none;
}


    
    </style>


    
<style>


input[type="radio"]
{
    width:100%;
    min-width:12px;
    margin: 2px 0 0;
}
td label {
    
    margin: 2px 0 0;
    text-align:center;
     min-width:12px;
     width:100%;
   
    
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

<div class="wrapper" style="background:#fff">
<div id="overlay" style=" background-color:transparent; position: absolute; z-index:9000; top:0px; right:0px; width:200px;"></div>
<form id="Form1" runat="server">

 <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"> </asp:ToolkitScriptManager>

<div id="page" > 

  


   <nav class="shadow-bottom" style="background:#84c225; height:50px; width:100%; color:#fff;  " >
  <div class="mm-toggle-wrap"  style="   position: fixed; width:20%; " >
         
            <div class="mm-toggle " style="background:#84c225"> 
          <a href="home.aspx" id="bckbtn" runat="server"> <img src="img/backbtn.png" alt="backbtn" /> </a>
            </div>
              </div>
        <div style="   position: fixed; width:58%; left:20%; top:17px; "  >
           <h4 style="text-align:center; color:#fff">Feedback</h4>
           
           </div>
           <div style="   position: fixed; width:12%; right:5%; top:14px  ">            
              
          </div>
          
  </nav>
  
  <div style=" width:100%; height:52px;" >
    
  </div>
     <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
  <div class="form-group">
  <h6 style="padding-left:10px; margin-top:10px;">Personal Details:</h6>
  <div class="row" style="margin-top:10px">
  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
  <label>*Name</label>
      <asp:TextBox ID="tb_name" CssClass="form-control" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tb_name" Display="Dynamic" ForeColor="Red" runat="server" ErrorMessage="Enter First Name" ValidationGroup="BuyLotNewdadd"></asp:RequiredFieldValidator>
  </div>
    </div>
     <div class="row" style="margin-top:10px">
   <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
    <label>*Contact number to say hello</label>
      <asp:TextBox ID="tb_mobileno" CssClass="form-control" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Your Mobile Number!" ControlToValidate="tb_mobileno" Display="Dynamic"  ForeColor="red" ValidationGroup="BuyLotNewdadd"></asp:RequiredFieldValidator>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="tb_mobileno" ValidationGroup="BuyLotNewdadd" runat="server" ErrorMessage="Invalid Phone Number" ForeColor="Red" Display="Dynamic" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
  </div>
  </div>
 
 
  

  
  

  
  <div class="row" style="margin-top:10px">
  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
  <label>*How was our service?</label>
      
      <asp:RadioButtonList ID="RdBtnService"  RepeatDirection="Horizontal" runat="server">
          <asp:ListItem>1</asp:ListItem>
          <asp:ListItem>2</asp:ListItem>
          <asp:ListItem>3</asp:ListItem>
          <asp:ListItem>4</asp:ListItem>
          <asp:ListItem>5</asp:ListItem>
          <asp:ListItem>6</asp:ListItem>
          <asp:ListItem>7</asp:ListItem>
          <asp:ListItem>8</asp:ListItem>
          <asp:ListItem>9</asp:ListItem>
          <asp:ListItem>10</asp:ListItem>
      </asp:RadioButtonList>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ErrorMessage="Enter Your Service!" ControlToValidate="RdBtnService" Display="Dynamic"  ForeColor="red" ValidationGroup="BuyLotNewdadd"></asp:RequiredFieldValidator>
  </div>
   
  </div>

   <div class="row" style="margin-top:10px">
  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
  <label>*How was our delivery?</label>
      
      <asp:RadioButtonList ID="RdBtnDel"  RepeatDirection="Horizontal" runat="server">
          <asp:ListItem>1</asp:ListItem>
          <asp:ListItem>2</asp:ListItem>
          <asp:ListItem>3</asp:ListItem>
          <asp:ListItem>4</asp:ListItem>
          <asp:ListItem>5</asp:ListItem>
          <asp:ListItem>6</asp:ListItem>
          <asp:ListItem>7</asp:ListItem>
          <asp:ListItem>8</asp:ListItem>
          <asp:ListItem>9</asp:ListItem>
          <asp:ListItem>10</asp:ListItem>
      </asp:RadioButtonList>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please rate our Service!" ControlToValidate="RdBtnDel" Display="Dynamic"  ForeColor="red" ValidationGroup="BuyLotNewdadd"></asp:RequiredFieldValidator>
  </div>
   
  </div>
  
  
  <div class="row" style="margin-top:10px">
  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
  <label>*Was our App user friendly?</label>
      
      <asp:RadioButtonList ID="RdBtnfriendly"  RepeatDirection="Horizontal" runat="server">
          <asp:ListItem>1</asp:ListItem>
          <asp:ListItem>2</asp:ListItem>
          <asp:ListItem>3</asp:ListItem>
          <asp:ListItem>4</asp:ListItem>
          <asp:ListItem>5</asp:ListItem>
          <asp:ListItem>6</asp:ListItem>
          <asp:ListItem>7</asp:ListItem>
          <asp:ListItem>8</asp:ListItem>
          <asp:ListItem>9</asp:ListItem>
          <asp:ListItem>10</asp:ListItem>
      </asp:RadioButtonList>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please rate our Service!" ControlToValidate="RdBtnfriendly" Display="Dynamic"  ForeColor="red" ValidationGroup="BuyLotNewdadd"></asp:RequiredFieldValidator>
  </div>
   
  </div>
  
  
  
  </div>

 


 
   


  
      
      
     
   

  <div style=" width:100%; height:50px;" >
                        
                        
                    </div>
   
 <div id="footerBottom" class="footer headroomft headroom headroom--not-bottom headroom--pinned headroom--top" style="display: block;">
 
 <asp:Button ID="BtnFeedback" style="width:100%" CssClass="Address" runat="server" 
        Text="Send Feedback" OnClick="BtnFeedback_Click" ></asp:Button>
 
 
 
 </div>
 <asp:Label ID="alertpop" runat="server" Text=""></asp:Label>
      </ContentTemplate>

 </asp:UpdatePanel>

 <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true"  AssociatedUpdatePanelID="UpdatePanel1" >
                        <ProgressTemplate>
                          <div style="position:fixed; width: 100%; background: white; bottom:150px; z-index:9999999999999;">
                             <div class="center">
                             <center><img src="/loading.gif" alt="loading" class="img-responsive" style="width:60px;" /></center>  
                              </div>
                           </div>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
 <!--End of Newsletter Popup-->   
  </div>


 




<script type="text/javascript" src="js/bootstrap.min.js"></script> 

<script type="text/javascript" src="js/main.js"></script> 

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
        // Get the alertpop DIV
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

  
<%--<script type="text/javascript">

    setInterval(function () {
        if (!navigator.onLine) {

            alert("Please Check Your Connection and Try Again");
        }
    }, 100);  
</script>--%>
 

    
 

</body>
</html>
