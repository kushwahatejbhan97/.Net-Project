<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contact-us.aspx.cs" Inherits="mindappraisers.contact_us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!--  :::  BREADCRUMBS ::: -->
<section class="breadcrumbs breadcrumbs2 contact wow fadeInDown" data-wow-duration="0.25s" data-wow-delay="0.45s">
  <div class="boxedeb">
    <div class="container page-block-small">
      <div class="col-md-12 col-sm-12 col-xs-12">
          <h2>Contact Us</h2>
          <span class="line"></span>
        <div class="rightText">
            <a href="default.aspx" title="Home">Home</a> / Contact Us
        </div>
      </div>
    </div><!--end-container-->
  </div> 
</section>
<!-- ::: END ::: -->



<!--  :::  CONTACT ::: -->
<section id="contact" class="opt">
  

	 <!-- SCROLL to bottom to edit map -->
    
    
    
    <div class="container page-block text-center wow fadeInUp" data-wow-duration="0.50s" data-wow-delay="0.50s" style="max-width:953px">
    	<h3 class="prime">Contact Us Anytime</h3>
        <span class="line"></span>
     	<p class="text-center">To learn more about how Mind Appraisers can help your business, create a Culture of Success or to schedule a consultation, send us your contact info via the form below. One of our team members will be in touch soon!</p>
        <form id="form1" runat="server">
         <div class=" col-lg-2" ></div>
          <table class=" table table-responsive table-condensed table-striped col-lg-8">
          <tr>
          <td align="left">Name</td>
          <td>
            <asp:TextBox type="text" ID="txtName" runat="server" CssClass="form-control"
                  name="name" placeholder="Your Name" ></asp:TextBox>
                  </td>
           </tr>
           
         
          <tr>
          <td align="left">Phone Number</td>
          <td>
          <asp:TextBox type="tel" ID="TextPhone" runat="server" CssClass="form-control" name="phone" placeholder="Your Phone"></asp:TextBox>
          </td>
          </tr>
         <tr>
         <td align="left">Email</td>
         <td>
          <asp:TextBox type="email"  ID="txtEmail" CssClass="form-control" runat="server"  name="email" placeholder="Your Email"></asp:TextBox>
          </td>
          </tr>
         <tr>
         <td align="left">Designation</td>
         <td>
            <asp:DropDownList ID="DropDownList1"  CssClass="form-control" runat="server" >
             <asp:ListItem Value="-1">Enter Your Designation</asp:ListItem>
                <asp:ListItem Value="1">Student</asp:ListItem>
                <asp:ListItem Value="2">Fresher</asp:ListItem>
                <asp:ListItem Value="3">Experienced</asp:ListItem>
             </asp:DropDownList>
           </td>
          </tr>
          
          
          <tr>
          <td align="left">Message  <td>
          <asp:TextBox type="text" ID="txtMessage" runat="server" name="comment" CssClass="form-control"
                   placeholder="Write your comment here..." 
                  TextMode="MultiLine" ></asp:TextBox>
                  </td>
           </tr>
          
          
          <tr>
          <td colspan="2" align="center">
             <asp:Button type="submit"  ID="Button1" runat="server" Text="Submit &#xf138;" 
                  class="btn btn-primary btn-lg" name="submit" onclick="Button1_Click"></asp:Button>
</tr>
            
         
          </table>
                  <div class=" col-lg-2"></div>
      	</form>
    </div>
    
    
    <div class="contact-info BGprime page-block">
      <div class="container wow fadeInUp" data-wow-duration="0.50s" data-wow-delay="0.50s">
        <div class="office">
            <h2 class="white text-center">Please find following details as requested.</h2>
            <hr class="light">
            <div class="col-md-4 col-sm-12 col-xs-12">
              <span><i class="fa fa-map-marker squareSmall BGsec"></i># Mind Appraisers,<br /> Plot no.4, <br /> Road no. 3, Banjara hills,<br />Hyderabad-500034.</span> 
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12">
              <span><i class="fa fa-phone squareSmall BGsec"></i> +91 8341698104, 7995478458  </span>
             </div> 
              <div class="col-md-4 col-sm-12 col-xs-12"> 
              <span><i class="fa fa-envelope squareSmall BGsec"></i> <a href="" title="Contact">info@mindappraisers.com</a></span>
            </div>
        <div class="clear"></div>
        </div>
      </div>
    </div>
</section>
<!-- ::: END ::: -->
</asp:Content>
