<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentSuccess.aspx.cs" Inherits="KiranaWorldApp.PaymentSuccess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    

<title>KiranaWorld | BOLT Response</title>
     <meta name="viewport" content="initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,width=device-width,user-scalable=no" />
   
 
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />

    <link rel="shortcut icon" href="/Admin/assets/images/KwIcon.png" />
    <base />
    <meta name="description" content="Kirana World" />
        <link href="catalog/view/theme/oc01/stylesheet/bootstrap.min.css" rel="stylesheet"
        media="screen" />

        <style type="text/css">
        .mydiv {

  
}

body{
    background-color:white;
    overflow:hidden;
}
.mydivfail {


  
}
.myhead
{
    background-color:#d61f3a;
    height:200px;
    text-align:center;
    color:white;
    font-size:30px;
   
   

   
}
.myheadfail
{
    background-color:#e4e4e4;
    height:200px;
    text-align:center;
    color:white;
    

}
        
        </style>
    
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div class="mydiv " id="Mysuccess" runat="server" visible="false" style="  ">
    <div class="myhead" >

        <img src="img/tick.jpg" style=" height:70%; clear:both; " /><br />
        Payment Successful
    </div>

        <center style=" padding-top:60px; padding-bottom:80px; "  >
    
     <a href="OrderDetails.aspx" style=" font-size:25px;  font-weight:bold; color:White; padding:20px; margin-bottom:40px; width:270px;  " class=" btn  btn-success " >View Orders</a>
            <br />
    
    
     <a href="Default.aspx" style=" font-size:25px;  font-weight:bold; color:White; padding:20px; width:270px; " class=" btn btn-success">Continue Shopping</a></center>

    
    </div>

    <div class="mydivfail " id="MyFail" runat="server" visible="false" style="  ">
    

      <div class="myheadfail" >

        <img src="img/Payfail.png" style=" height:95%; clear:both; " /><br />
       
    </div>

        <center style=" padding-top:60px; padding-bottom:80px; "  >
    
     <a href="OrderDetails.aspx" style=" font-size:25px;  font-weight:bold; color:White; padding:20px; margin-bottom:40px; width:270px;  " class=" btn  btn-success " >View Orders</a>
            <br />
    
    
     <a href="Default.aspx" style=" font-size:25px;  font-weight:bold; color:White; padding:20px; width:270px; " class=" btn btn-success">Continue Shopping</a></center>

    </div>
    </form>
</body>
</html>
