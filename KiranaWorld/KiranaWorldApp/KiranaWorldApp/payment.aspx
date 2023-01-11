<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="KiranaWorldApp.payment" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

<title>KiranaWorld | Payment</title>
 
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />

    <link rel="shortcut icon" href="/Admin/assets/images/KwIcon.png" />
    <base />
    <meta name="description" content="Kirana World" />
    <link href="catalog/view/theme/oc01/stylesheet/bootstrap.min.css" rel="stylesheet"
        media="screen" />
         
    <script src="js/jquery-latest.min.js" type="text/javascript"></script>
    <!-- this meta viewport is required for BOLT //-->
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" >
    <!-- BOLT Sandbox/test //-->
    <%--<script id="bolt" src="https://sboxcheckout-static.citruspay.com/bolt/run/bolt.min.js" bolt-color="e34524" bolt-logo="http://boltiswatching.com/wp-content/uploads/2015/09/Bolt-Logo-e14421724859591.png"></script>--%>
    <!-- BOLT Production/Live //-->
     <script id="bolt" src="https://checkout-static.citruspay.com/bolt/run/bolt.min.js" bolt-color="e34524" bolt-logo="http://boltiswatching.com/wp-content/uploads/2015/09/Bolt-Logo-e14421724859591.png"></script>
  



    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />

    <style>
/* width */
::-webkit-scrollbar {
  width: 3px;
}

/* Track */
::-webkit-scrollbar-track {
  background: #f1f1f1; 
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background: #888; 
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: #555; 
}
</style>

    <style type="text/css">
    table {
    border-spacing: 0;
    border-collapse: separate;
}

.MyBtn
{
    width:155px;
    
    box-shadow: 0 0 4px gray;
    margin-bottom:20px;
    margin-right:10px;

}

div.dv
{
	margin-bottom:5px;
}

</style>

    

</head>
<body>
    <form id="form1" runat="server" method="post">
   
    
    <input type="hidden" runat="server" id="udf5" name="udf5" value="BOLT_KIT_ASP.NET" />
    <input type="hidden" runat="server" id="surl" name="surl"  />
    <input type="hidden" runat="server" id="furl" name="furl"  />
    <input type="hidden" runat="server" id="key"  name="key" value="KmhM2h9n"  />
    <input type="hidden" runat="server" id="salt" name="salt" value="K5ly7q5oRP"  />
    <input type="hidden" runat="server" id="txnid" name="txnid" />
    <input type="hidden" runat="server" id="amount" name="amount"/>
    <input type="hidden" runat="server" id="hash" name="hash" value="" />
    <input type="hidden" runat="server" id="pinfo" name="pinfo"  />
    <input type="hidden" runat="server" id="firstname" name="firstname"  />
        <input type="hidden" runat="server" id="fname" name="fname"  />
    <input type="hidden" runat="server" id="email" name="email"  />
    <input type="hidden" runat="server" id="phone" name="phone"  />
    <input type="hidden" runat="server" id="mobile" name="mobile"  />
    <input type="hidden" runat="server" id="productinfo" name="productinfo" value="" />
    <input type="hidden" runat="server" id="service_provider" name="service_provider" value="payu_paisa" />
    

    
  

       

                                 <div class="product-img-wrap" id="OrderSucess">
                                    <table cellspacing="0" cellpadding="0" style="background-color:#fff;color:#29303f;width:100%;max-width:450px;font-family:Helvetica,Arial,sans-serif;margin:0px auto;border:1px solid #ddd;font-size:14px" > 
 <tbody>


                <tr >
                <td style="height:75px;color:#fff;background-color:#194862;background:-moz-linear-gradient(left,#194862 0%,#2a6e8d 100%);background:-webkit-linear-gradient(left,#194862 0%,#2a6e8d 100%);background:linear-gradient(to right,#194862 0%,#2a6e8d 100%)">
                  <table cellspacing="0" cellpadding="0" style="width:100%;height:75px">
                    <tbody>
                      <tr>
                        <td style="padding: 15px 0 0 15px;">
                           <h3 style="margin:0;font-size:20spx;color:#fff"> &nbsp;Order Placed Successfully</h3>
                        </td>
                        <td style="vertical-align:bottom;text-align:right;width:60px">
                         <img src="/placed.png" style="max-height:60px;min-height:60px;vertical-align:bottom" class="CToWUd">
                        </td>
                        </tr>
                        
                        
                    </tbody>
                  </table>
                </td>
              </tr>








            <tr> 
              <td style="padding:4px 0px 0 0;line-height:1">

                <table cellpadding="0" cellspacing="0" style=" text-align: center; width:100%;max-width:100%;padding:10px 20px;font-size:14px;background-color:#f2f7fb">
                  <tbody>
                  
                  
                  <tr>
                    <td style=" padding-bottom:15px; ">
                      
                     <h3 style=" color:Maroon; font-weight:600; font-size:20px; "> Click here to pay </h3>
                    </td>
                    </tr> 
                    <tr>
                    <td >
                         <asp:ImageButton ID="submit" ImageUrl="~/212.png"  CssClass="MyBtn " runat="server" OnClick="Button1_Click"  />
                         <div id ="frmError" runat="server">
      
      <br/>
      <br/>
      </div>
                        </td>
                  </tr>
                </tbody>
                
                </table>
              </td>
            </tr>
             
          
          
          
           <tr>
            <td style="padding:15px 20px 0 20px;line-height:1">
              <table cellpadding="0" cellspacing="0" style="width:100%">
                <tbody><tr>
                  <td style="padding-bottom:8px; padding-top:4px;">
                  <h3> Order detail(s)  &nbsp;&nbsp;&nbsp; Order ID : &nbsp; KW-<%=Session["OrderId"] %> </h3>
                     
                  </td>
                </tr>
                </tbody>
              </table>
            </td>
          </tr>
          
          
          <asp:Repeater ID="RepeaterORDER" DataSourceID="SqlDataSource1" runat="server">
            <ItemTemplate>
             <tr>
                <td>
                
                <div class="row" style="  box-shadow:  0 0 1px #888; padding-top:10px; background-color: white; padding-bottom:4px;    ">
                         
                          <div class="col-xs-3 col-sm-3 col-lg-3 col-md-3" style="  max-width:80px;"   >
                          <div  class="product-image">
                          
                            <img src='https://www.kiranaworld.in/Admin/Products/mobile/<%# Eval("ImgUrl") %>' alt='<%# Eval("ItemName")%>' style=" max-width:60px;">
                          </div>
                          </div>

                          <div class=" row col-sm-9 col-md-9 col-lg-9 col-xs-9" style=" padding-right:0px; ">
                          <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12" style="padding-left:0px !important; padding-right:0px !important;  padding-bottom:6px; font-weight:bold;  text-align:left; white-space: nowrap; overflow: hidden; width:200px; text-overflow: ellipsis;">
                            <%# Eval("ItemName")%>
                             </div>
                             <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12 row"  style=" padding-top:10px; padding-right:0px !important;">
                             
           
            <div class="col-lg-2 col-sm-2 col-md-2 col-xs-3  "  style="padding-left:0px !important; padding-right:0px !important;"  >
            
                 
                  <div class="col-xs-10 col-sm-10 col-lg-10 col-md-10" style=" text-align:center;  color:#4c7808; font-weight: 700; font-size:15px; ">
                  <%# Eval("Qty")%>
    
      </div>
                  

    
    
     </div>
             <div class="col-lg-1 col-sm-1 col-md-1 col-xs-1" style="padding-left:0px !important; padding-right:0px !important;">&#215;</div>
             <div class="col-lg-4 col-sm-4 col-md-4 col-xs-4" style="padding-left:0px !important; text-align:left; padding-right:0px !important;">&#8377; <%# Eval("Price")%></div>
            <div class="col-lg-4 col-sm-4 col-md-4 col-xs-4  " style="padding-left:0px !important; padding-right:0px !important;  text-align:left; font-weight:600;"  >
                                  &#8377;<%# Eval("TotalPrice")%>
                                  <img  src="" />
                                </div>
                                
         

                              </div>
                           </div>

                           </div>
                
                
                </td>
              </tr>
            </ItemTemplate>
          </asp:Repeater>
        
             

        <tr>
          <td style="padding:5px 20px 0px 20px;line-height:1">
            <table cellpadding="0" cellspacing="0" style="width:100%">
              <tbody>
                <tr>
                  <td style="padding-bottom:10px">
                    <span style="font-size:13px;color:#000000;margin-top:0;background-color:#fff;padding-right:10px"><b>Order billing details </b></span>
                  </td>
                </tr>
              </tbody>
            </table>
          </td>
        </tr>
        
        <tr>
          <td style="padding:0px 20px 50px;line-height:1.4">
            <table cellpadding="0" cellspacing="0" style="width:100%;font-size:14px">
              <tbody>
                <tr>
                    <td style="padding:5px 0;border-bottom-style:inset;border-bottom-width:thin">
                      Package value
                    </td>
                    <td style="color:#29303f;border-bottom-style:inset;border-bottom-width:thin;text-align:right">
                      Rs. <%=Session["amount"] %>
                    </td>
                </tr>
                             

              </tbody>
            </table>
          </td>
        </tr>

         
        
        
      
    
      <tr>
          <td style="padding:12px 20px 0px 20px;background-color:#f2f2f2">
            <span style="font-size:16px;margin-top:0;padding-right:10px;color:#29303f;font-weight:bold">KNOW MORE</span>
          </td>
        </tr>
        <tr>
          <td style="padding:10px 0px 10px 0;background-color:#f2f2f2">
            <table cellpadding="0" cellspacing="0" style="background-color:#fff;font-size:14px;border-radius:0 3px 3px 0">
            <tbody>
            
              <tr>
                <td style="padding:20px 20px 0;vertical-align:top">
                  <img src="image/contact-us.png" style="width:100px" class="CToWUd">
                </td>
                <td style="padding:20px 20px 20px 0">
                  <h3 style="margin:0;font-size:14px">Need help? Get in touch</h3>
                  <p style="margin:5px 0">We are happy to help you. For any assistance call us @ (+91) 88 77 77 8770 / (+91) 88 77 77 9770  </p>
                </td>
              </tr>
            </tbody>
          </table>
          </td>
        </tr>
            </tbody>
            </table>
          </div>
      
       <div class="gap"></div>
   
       
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:theOMartMSConnectionString1 %>" 
        SelectCommand="SELECT * FROM [Order_details] WHERE ([OrderId] = @OrderId)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="0" Name="OrderId" SessionField="OrderId" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

        <script type="text/javascript"><!--
    $(document).ready(function () {

        $.ajax({
            url: 'Hash.aspx',
            type: 'post',
            data: JSON.stringify({
                key: $('#key').val(),
                salt: $('#salt').val(),
                txnid: $('#txnid').val(),
                amount: $('#amount').val(),
                pinfo: $('#pinfo').val(),
                fname: $('#fname').val(),
                email: $('#email').val(),
                mobile: $('#mobile').val(),
                udf5: $('#udf5').val()
            }),
            contentType: "application/json",
            dataType: 'json',
            success: function (json) {
                if (json['error']) {
                    $('#alertinfo').html('<i class="fa fa-info-circle"></i>' + json['error']);
                }
                else if (json['success']) {
                    $('#hash').val(json['success']);
                }
            }
        });
    });
//-->
        </script>

                    



    </form>


    
</body>
</html>
