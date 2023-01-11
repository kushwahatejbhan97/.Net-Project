<%@ Page Title="" Language="C#" MasterPageFile="~/panel.Master" AutoEventWireup="true" CodeBehind="contact-us.aspx.cs" Inherits="SpaceDesignStudio.contact_us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <title>Home Décor Ideas | Interior Decorators | Interior Decorators in Hyderabad</title>
        <meta name="description" content="Home Décor Ideas hyderabad, Interior Decorators hyderabad, Interior decorators in hyderabad,Best Interior Designer,Best Interior Designer In Hyderabad,Interior Designer In Hyderabad,Interior Design Companies In Hyderabad." />
        <meta name="keywords" content="home decor ideas,interior decorators,house décor ideas,home decor ideas in hyderabad,interior decorators in hyderabad,house décor ideas in hyderabad,Flat Interior Designers,Office Interior Designers In Hyderabad,Hyderabad Interior Designers,Interior Design Companies In Hyderabad,Interior Designer In Hyderabad for home." />
        <meta name="title" content="Home Décor Ideas | Interior Decorators | Interior Decorators in Hyderabad" />
<link rel="canonical" href="http://www.spacedesignstudio.net/contact-us" />
 <link href="http://www.spacedesignstudio.net/contact-us" rel="shortlink"/>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!--  :::  BREADCRUMBS ::: -->
<section class="breadcrumbs breadcrumbs2 about wow fadeInDown" data-wow-duration="0.25s" data-wow-delay="0.45s">
  <div class="boxedeb">
    <div class="container page-block-small">
      <div class="col-md-12 col-sm-12 col-xs-12">
          <h1 style="color:White">Contact Us</h1>
          <span class="line"></span>
        <div class="rightText">
            <a href="http://www.spacedesignstudio.net" title="Home">Home</a> / Contact Us
        </div>
      </div>
    </div><!--end-container-->
  </div> 
</section>
<!-- ::: END ::: -->

<!--  :::  CONTACT ::: -->
<section id="contact" class="opt">

	 <!-- SCROLL to bottom to edit map -->
    
    
    
    <div class="container page-block text-center wow fadeInUp" data-wow-duration="0.50s" data-wow-delay="0.50s">
    	<h3 class="prime">Contact Us</h3>
        <span class="line"></span>
     	<p class="text-center">Feel free to Contact Us for any time.</p>
        <form id="Form1"  runat="server" >
          <div class="col-md-12">
            <asp:TextBox ID="txtName" runat="server" class="form-control" placeholder="Your Name"></asp:TextBox>
          </div>
          <div class="col-md-6">
            <asp:TextBox ID="TextPhone" runat="server" class="form-control" placeholder="Your Phone"></asp:TextBox>
          </div>
          <div class="col-md-6">
            <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Your Email"></asp:TextBox>
          </div>
         
          <div class="col-md-12">
            <asp:TextBox cols="60" rows="3" ID="txtMessage" runat="server" TextMode="MultiLine" class="form-control" placeholder="Write your comment here..."></asp:TextBox>
          </div>
          <div class="col-md-12">
              <input type="text" id="security" name="security" class="form-control hide" value="" />
             
              <asp:Button ID="txtSubmit" runat="server" Text="Submit" 
                  class="btn btn-primary btn-lg" onclick="txtSubmit_Click"></asp:Button>
          </div>
      	</form>
    </div>
    <div class="contact-info BGprime page-block">
      <div class="container wow fadeInUp" data-wow-duration="0.50s" data-wow-delay="0.50s">
        <div class="office">
            <h2 class="white text-center">Get in touch with us  <hr class="light">
            <div class="col-md-4 col-sm-12 col-xs-12">
              <span><i class="fa fa-map-marker squareSmall BGsec"></i>H.No. 19-4-368/36, <br />chirag ali nagar, <br>
                Kishan Bagh Road, Bahadurpura, Hyderabad.<br />500064</span> 
            </div>
            <div class="col-md-4 col-sm-12 col-xs-12">
              <span><i class="fa fa-phone squareSmall BGsec"></i> (+91) 800 800 9832</span>
             </div> 
              <div class="col-md-4 col-sm-12 col-xs-12">
              <span><i class="fa fa-envelope squareSmall BGsec"></i> <a href="mailto:javidarchitects@gmail.com" title="">javidarchitects@gmail.com</a></span>
            </div>
        <div class="clear"></div>
        </div>
      </div>
    </div>


    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3808.0779261956254!2d78.43944761443841!3d17.35998288809501!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bcb97b9e0c30287%3A0x5109990b75bc4bd7!2sKishan+Bagh+Rd%2C+Hyderabad%2C+Telangana!5e0!3m2!1sen!2sin!4v1490332474856" style="width:100%; height:450px" frameborder="0" style="border:0" allowfullscreen></iframe>
</section>
<!-- ::: END ::: -->
</asp:Content>

