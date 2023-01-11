<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RazorPayPayment.aspx.cs" Inherits="KiranaWorldApp.RazorPayPayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form action="Charge.aspx" method="post">
<script
    src="https://checkout.razorpay.com/v1/checkout.js"
    data-key="<%=key%>"
    data-amount="<%=amt%>"
    data-name="Razorpay"
    data-description="KW-<%=kworderId%>"
    data-order_id="<%=orderId%>"
    data-image="https://www.kiranaworld.in/Admin/images/KiranaWorld.png"
    data-prefill.name="<%=name%>"
    data-prefill.email="<%=email%>"
    data-prefill.contact="<%=mobileno%>"
    data-theme.color="#F37254"
    data-redirect="true"
>
</script>
<input type="hidden" value="Hidden Element" name="hidden">

  <asp:Label ID="lbl1" runat="server"></asp:Label> 



 </form>
</body>
</html>
