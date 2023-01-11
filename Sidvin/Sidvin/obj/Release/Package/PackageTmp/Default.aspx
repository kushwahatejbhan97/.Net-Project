<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sidvin.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />

    <title>
      Sidvin Realty Network &#8211; Best Property Consultancy Service
      in Guwahati
    </title>

    <!-- Google fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,100;0,300;0,400;0,700;0,900;1,100;1,300;1,400;1,700;1,900&family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Poppins:wght@400;500;600&display=swap"
      rel="stylesheet"
    />

    <!-- Font awesome CDN -->
    <link
      rel="stylesheet"
      href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
    />  

    <!-- Template CSS -->
    <link rel="stylesheet" href="assets/css/styles-starter.css" />
    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/customs-style.css" />
  <style>
      .margin-0{
          margin-bottom:0px !important;
      }
  </style>
 
 
 </head>

  <body>

      <form runat="server">

     
    <!-- header -->
    <header id="site-header" class="fixed-top">
      <section class="w3l-header-4">
        <div class="container-2">
          <nav class="navbar navbar-expand-lg navbar-light">
            <h1>
              <a class="navbar-brand" href="/home">
                <img class="logo" src="assets/images/logo/logo1.png" alt="" />
                <!-- <span class="fa fa-car" aria-hidden="true"></span>
            Car Servicing</span> -->
              </a>
            </h1>
            <button
              class="navbar-toggler collapsed"
              type="button"
              data-toggle="collapse"
              data-target="#navbarNav"
              aria-controls="navbarNav"
              aria-expanded="false"
              aria-label="Toggle navigation"
            >
              <span class="fa icon-expand fa-bars"></span>
              <span class="fa icon-close fa-times"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="/home">Home </a>
                </li>
                <li class="nav-item @@about__active">
                  <a class="nav-link" href="/about">About</a>
                </li>
                <li class="nav-item @@services__active">
                  <a class="nav-link" href="/services">Services</a>
                </li>
                <li class="nav-item @@services__active">
                  <a class="nav-link" href="/portfolio">Portfolio</a>
                </li>
                <li class="nav-item @@services__active">
                  <a class="nav-link" href="/testimonial">Testimonials</a>
                </li>
                <li class="nav-item @@services__active">
                  <a class="nav-link" href="/association">Association</a>
                </li>

                  <li class="nav-item @@services__active">
                  <a class="nav-link" href="/ciril">ciril</a>
                </li>

                <li class="nav-item @@services__active">
                  <a class="nav-link" href="/vlogs">Vlogs</a>
                </li>
                <li class="nav-item @@services__active">
                  <a class="nav-link" href="/blogs">Blogs</a>
                </li>
                <li class="nav-item ml-3">
                  <a
                    href="/contact"
                    class="btn btn-outline-primary btn-style text-uppercase mr-2"
                    >Contact Us</a
                  >
                </li>
              </ul>

              <!-- //toggle switch for light and dark theme -->
            </div>
            <!-- toggle switch for light and dark theme -->
            <div class="mobile-position">
              <nav class="navigation">
                <div class="theme-switch-wrapper">
                  <label class="theme-switch" for="checkbox">
                    <input type="checkbox" id="checkbox" />
                    <div class="mode-container">
                      <i class="gg-sun"></i>
                      <i class="gg-moon"></i>
                    </div>
                  </label>
                </div>
              </nav>
            </div>
          </nav>
        </div>
      </section>
    </header>
    <!-- //header -->

    <!-- banner section -->
    <section class="banner-section">
      <div class="container-1">
        <div class="row">
          <div class="col-lg-7 col-md-5"></div>
          <div class="col-lg-5 col-md-7">
            <div class="banner-form-w3 mr-md-4">
              <!-- banner form -->
             
                <h5 class="mb-4">Enquiry Form</h5>
                <div class="form-style-w3ls">
                   <asp:TextBox ID="txtmobname" runat="server" placeholder="Your Name" ></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ValidationGroup="formob" ControlToValidate="txtmobname" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>   
                            <asp:TextBox ID="txtmobemail" placeholder="Your Email"   runat="server"></asp:TextBox>
                          <asp:RegularExpressionValidator ValidationGroup="formob" ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtmobemail"
    ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
    Display = "Dynamic" ErrorMessage = "Invalid email address"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="formob" ControlToValidate="txtmobemail"
    ForeColor="Red" Display = "Dynamic" ErrorMessage = "Required" />
                            <asp:TextBox ID="txtmobnumber" placeholder="Your Mobile"    runat="server" CssClass="margin-0"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="REFmoblie" runat="server"
    ErrorMessage="Please enter valid phone no" ControlToValidate="txtmobnumber"  ValidationGroup="formob"  ForeColor="Red" style="font-size: small" ValidationExpression="^[7-9][0-9]{9}$"></asp:RegularExpressionValidator>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="formob" runat="server" ControlToValidate="txtmobnumber"
    ForeColor="Red" Display = "Dynamic" ErrorMessage = "Required" />
                               <asp:TextBox ID="txtmobsub" placeholder="Subject"    runat="server"></asp:TextBox>

                              <asp:TextBox ID="txtmobmess" TextMode="MultiLine"  placeholder="Your Message"  runat="server"></asp:TextBox>

    <asp:Button ID="Button2" CssClass="btn btn-style btn-primary w-100" OnClick="Button2_Click" ValidationGroup="formob"   runat="server" Text="Send request" />
             
          </div>
                </div>
             
              <!-- //banner form -->
            </div>
          </div>
        </div>
    
    </section>

    <div class="banner-form-w3 mr-md-4 banner-form-w3-new">
      <!-- banner form for mobile -->
      <div >
        <h5 class="mb-4">Enquiry Form</h5>
        <div class="form-style-w3ls">

            <asp:TextBox ID="txtname" runat="server" placeholder="Your Name"  ></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="formdesk" ControlToValidate="txtname" runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Required"></asp:RequiredFieldValidator>   
                            <asp:TextBox ID="txtemail" placeholder="Your Email"   runat="server"></asp:TextBox>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="formdesk"  ControlToValidate="txtemail"
    ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
    Display = "Dynamic" ErrorMessage = "Invalid email address"/>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="formdesk" runat="server" ControlToValidate="txtemail"
    ForeColor="Red" Display = "Dynamic" ErrorMessage = "Required" />
            
             <asp:TextBox ID="txtnumber" placeholder="Your Mobile"  runat="server" ></asp:TextBox>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
    ErrorMessage="Please enter valid phone no" ValidationGroup="formdesk"  ControlToValidate="txtnumber" Display="Dynamic"   ForeColor="Red" style="font-size: small" ValidationExpression="^[7-9][0-9]{9}$"></asp:RegularExpressionValidator>
                              
             <asp:RequiredFieldValidator ValidationGroup="formdesk"  ID="RequiredFieldValidator4"  runat="server" ControlToValidate="txtnumber"
    ForeColor="Red" Display = "Dynamic" ErrorMessage = "Required" />
            
            <asp:TextBox ID="txtsubject" placeholder="Subject"    runat="server"></asp:TextBox>

                              <asp:TextBox ID="txtmessage" TextMode="MultiLine"  placeholder="Your Message"  runat="server"></asp:TextBox>

    <asp:Button ID="Button1" CssClass="btn btn-style btn-primary w-100" OnClick="Button1_Click1" ValidationGroup="formdesk"   runat="server" Text="Send request" />
             
          </div>
      </div>
      <!-- //banner form -->
    </div>
    <!-- /banner section -->

    <!-- stats -->
    <section class="w3l-stats py-lg-5 pt-0 py-4" id="stats">
      <div class="gallery-inner container pt-0">
        <!-- <h6 class="title-small text-center"></h6> -->
        <h3 class="title-big mb-md-5 mb-5 text-center">Statistics</h3>
        <div class="row stats-con">
          <div class="col-md-3 col-6 stats_info counter_grid">
            <span class="fa fa-diamond"></span>
            <p class="cl-counter">200+</p>
            <h4>Satisfied Clients</h4>
          </div>
          <div class="col-md-3 col-6 stats_info counter_grid1">
            <span class="fa fa-file-alt"></span>
            <p class="br-counter">1000+</p>
            <h4>Brand Association</h4>
          </div>
          <div class="col-md-3 col-6 stats_info counter_grid mt-md-0 mt-5">
            <span class="fa fa-map"></span>
            <p class="ct-counter">145</p>
            <h4>Cities & Towns</h4>
          </div>
          <div class="col-md-3 col-6 stats_info counter_grid2 mt-md-0 mt-5">
            <span class="fa fa-globe"></span>
            <p class="st-counter">8</p>
            <h4>States</h4>
          </div>
        </div>
      </div>
    </section>
    <!-- //stats -->

    <!-- Service Section -->
    <!-- bottom-grids-->
    <section class="w3l-bottom-grids-6 py-5" id="services">
      <div class="container py-lg-5 py-md-4">
        <h6 class="title-small text-center">Buy | Sell | Lease</h6>
        <h3 class="title-big mb-md-5 mb-4 text-center">Services</h3>
        <div class="grids-area-hny main-cont-wthree-fea row">
          <div class="col-lg-4 col-md-6 grids-feature">
            <div class="area-box">
              <div class="service-number"><span>1</span></div>
              <i class="fas fa-store"></i>
              <h4><a href="javascript:void(0)" class="title-head">RETAIL</a></h4>
              <p>
                We are one of the foremost realtors in the north-east dealing
                with all kinds of premium retail spaces. The retail properties
                that we bring to you are the absolute best in terms of locations
                and pricing.
              </p>
              <a href="/services" class="more"
                >Read More <span class="fa fa-long-arrow-right"></span>
              </a>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 grids-feature mt-md-0 mt-4">
            <div class="area-box">
              <div class="service-number"><span>2</span></div>
              <i class="fas fa-dumpster"></i>
              <h4><a href="javascript:void(0)" class="title-head">COMMERCIAL</a></h4>
              <p>
                We help turn your old properties and land into commercial
                properties. We understand that investing in a commercial
                property is one of the best sources of income for you but they
                often are difficult to close.
              </p>
              <a href="/services" class="more"
                >Read More <span class="fa fa-long-arrow-right"></span>
              </a>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 grids-feature mt-lg-0 mt-4">
            <div class="area-box">
              <div class="service-number"><span>3</span></div>
              <i class="fas fa-warehouse"></i>
              <h4><a href="javascript:void(0)" class="title-head">WAREHOUSE</a></h4>
              <p>
               We have seen an unprecedented rise in the fields of e- commerce in the last 2 years, be it business-to-business, business-to-consumer and even consumer-to-consumer. From groceries to big commercial goods all can be bought online.
              </p>
              <a href="/services" class="more"
                >Read More <span class="fa fa-long-arrow-right"></span>
              </a>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 grids-feature mt-lg-0 mt-4">
            <div class="area-box">
              <div class="service-number"><span>4</span></div>
              <i class="fas fa-mountain"></i>
              <h4><a href="javascript:void(0)" class="title-head">LANDS</a></h4>
              <p>
                We are the best point of contact if you have any requirement for
                land or if you have a piece of land that you would like to sell
                or construct. Land is one of the most critical real estates to
                deal with mainly due to the legalities involved around it. Our
                team of experts work out the safest and the most profitable land
                deals in the north-east.
              </p>
              <a href="/services" class="more"
                >Read More <span class="fa fa-long-arrow-right"></span>
              </a>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 grids-feature mt-lg-0 mt-4">
            <div class="area-box">
              <div class="service-number"><span>5</span></div>
              <i class="fas fa-store"></i>
              <h4>
                <a href="javascript:void(0)" class="title-head">FRANCHISE OPPORTUNITY</a>
              </h4>
              <p>
                Recently Sidvin Realty Network has tied up with Franchise India Brands
                Limited that have more than 500 + brands under their name. Some
                of the big names that we have worked in the north-east are
                Westside, Zudio, Tanishq, Titan Eye Plus, World Of Titan, Linen
                Club etc.
              </p>
              <a href="/services" class="more"
                >Read More <span class="fa fa-long-arrow-right"></span>
              </a>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 grids-feature mt-lg-0 mt-4">
            <div class="area-box">
              <div class="service-number"><span>6</span></div>
              <i class="fas fa-hands-helping"></i>
              <h4>
                <a href="javascript:void(0)" class="title-head">BECOME AN ASSOCIATE</a>
              </h4>
              <p>
                We are one of the biggest and the fastest growing realtors in
                the north-east. We invite people to become our channel partners
                and grow with us. Look out for this space to get more details
              </p>
              <a href="/services" class="more"
                >Read More <span class="fa fa-long-arrow-right"></span>
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- Service video grid -->
      <div class="service-video-grid">
        <a
          class="testo-img img-fluid vid-link"
          href="#"
          data-toggle="modal"
          data-target="#videoModal"
          data-vidLink="https://www.youtube.com/embed/UpFIL7uhfGg"
        >
          <img
            class="testo-img img-fluid"
            src="assets/images/video-thumbs/service-thumb-2.png"
            alt=""
          />
        </a>

        <a
          class="testo-img img-fluid vid-link"
          href="#"
          data-toggle="modal"
          data-target="#videoModal"
          data-vidLink="https://www.youtube.com/embed/f2rGMYsft_c"
        >
          <img
            class="testo-img img-fluid"
            src="assets/images/video-thumbs/service-thumb-3.png"
            alt=""
          />
        </a>

        <a
          class="testo-img img-fluid vid-link"
          href="#"
          data-toggle="modal"
          data-target="#videoModal"
          data-vidLink="https://www.youtube.com/embed/MV4wBAwcbm0"
        >
          <img
            class="testo-img img-fluid"
            src="assets/images/video-thumbs/service-thumb-1.png"
            alt=""
          />
        </a>
      </div>
    </section>
    <!-- //bottom-grids-->

    <!-- home page about section -->
    <section class="w3l-index3 about" id="about">
      <div class="midd-w3 py-5">
        <div class="container py-lg-5 py-md-3">
          <div class="row">
            <div class="col-lg-6">
              <div class="position-relative">
                <img
                  src="assets/images/about2.jpg"
                  alt=""
                  class="radius-image img-fluid"
                />
              </div>
            </div>
            <div class="col-lg-6 mt-lg-0 mt-md-5 mt-4 about-content align-self">
              <h3 class="title-big">
                SIDVIN REALTY <br />
                NETWORK 
              </h3>
              <p class="mt-4">
                Sidvin Realty Network solidified in 2013, is an ISO
                9001: 2015 certified, best Property Consultancy Service
                established in Guwahati. We incorporate and implement
                traditional, & modern technology-based approaches for providing
                feasible consultancy & services.
              </p>
              <a
                href="/about"
                class="btn btn-style btn-primary mt-lg-5 mt-4"
                >Read about us</a
              >
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- /home page about section -->

    <!-- Our Brands -->
    <section class="brand-section container-fluid">
      <div class="owl-carousel">
        <div class="image-slider item">
          <img class="img-fluid" src="assets/images/brands/1.jpg" alt="" />
        </div>
        <div class="image-slider item">
          <img src="assets/images/brands/2.jpg" alt="" />
        </div>
        <div class="image-slider item">
          <img src="assets/images/brands/3.jpg" alt="" />
        </div>
        <div class="image-slider item">
          <img src="assets/images/brands/4.jpg" alt="" />
        </div>
        <div class="image-slider item">
          <img src="assets/images/brands/5.jpg" alt="" />
        </div>
        <div class="image-slider item">
          <img src="assets/images/brands/6.jpg" alt="" />
        </div>
        <div class="image-slider item">
          <img src="assets/images/brands/7.jpg" alt="" />
        </div>
        <div class="image-slider item">
          <img src="assets/images/brands/8.jpg" alt="" />
        </div>
        <div class="image-slider item">
          <img src="assets/images/brands/9.jpg" alt="" />
        </div>
        <div class="image-slider item">
          <img src="assets/images/brands/10.jpg" alt="" />
        </div>
        <div class="image-slider item">
          <img src="assets/images/brands/11.jpg" alt="" />
        </div>
        <div class="image-slider item">
          <img src="assets/images/brands/12.jpg" alt="" />
        </div>
        <div class="image-slider item">
          <img src="assets/images/brands/13.jpg" alt="" />
        </div>
        <div class="image-slider item">
          <img src="assets/images/brands/14.jpg" alt="" />
        </div>
        <div class="image-slider item">
          <img src="assets/images/brands/15.jpg" alt="" />
        </div>
        <div class="image-slider item">
          <img src="assets/images/brands/16.jpg" alt="" />
        </div>
        <div class="image-slider item">
          <img src="assets/images/brands/17.jpg" alt="" />
        </div>
        <div class="image-slider item">
          <img src="assets/images/brands/18.jpg" alt="" />
        </div>
        <div class="image-slider item">
          <img src="assets/images/brands/19.jpg" alt="" />
        </div>
        <div class="image-slider item">
          <img width="134" src="assets/images/brands/20.jpg" alt="" />
        </div>
      </div>
    </section>

    <!-- bottom-grids-->

    <!-- //bottom-grids-->

    <!-- testimonials -->
    <section class="w3l-clients pt-4" id="clients">
      <!-- grids -->
      <div class="cusrtomer-layout ">
        <div class="container py-lg-5 py-md-4">
          <!-- /grids -->
          <!-- <h6 class="title-small text-center">WHAT THEY SAY ABOUT US</h6> -->
          <h3 class="title-big mb-md-5 mb-4 text-center">
            Client Testimonials
          </h3>
          <!-- <div class="row testimonial-row"> -->
          <!-- <div class="col heading align-self">
				  <h6 class="title-small">What our customers are saying</h6>
				  <h3 class="title-big mb-md-5 mb-4">Client Testimonials</h3>
			  </div> -->

          <div
            id="owl-demo1"
            class="col owl-two owl-carousel owl-theme px-0  mb-5"
          >
            <div class="item">
              <div class="testimonial-content">
                <div class="testimonial">
                  <blockquote>
                    <q
                      >Mr. Vikas Goenka is an outstanding agent to work with. He is a skilled
                      listener and negotiator, with very in-depth knowledge of
                      the local markets. I listed two properties with him at the
                      same time and while he sold one within a week, one took
                      five months to sell. At no point in those five months did
                      his dedication to selling the property deviate. He was
                      just as aggressive and excited about selling the second
                      property as he was the first. Without a doubt, we would
                      seek him out immediately for any upcoming real estate
                      transaction in the future.</q
                    >
                  </blockquote>
                  <div class="testi-des">
                    <!-- <div class="test-img"><img src="assets/images/team1.jpg" class="img-fluid" alt="client-img">
									</div> -->
                    <div class="peopl align-self">
                      <h3>Rohit Saraf</h3>
                      <!-- <p class="indentity">Web Designer </p> -->
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="item">
              <div class="testimonial-content">
                <div class="testimonial">
                  <blockquote>
                    <q
                      >“I felt confident by partnering with Mr. Vikas Goenka. We
                      have closed 6 deals for RETAIL outlets with Mr. Vikas for
                      brands like Westside & Zudio in multiple locations. He is
                      a genuine REALTOR with good knowledge in his field.”</q
                    >
                  </blockquote>
                  <div class="testi-des">
                    <!-- <div class="test-img"><img src="assets/images/team1.jpg" class="img-fluid" alt="client-img">
									</div> -->
                    <div class="peopl align-self">
                      <h3>Rahul Dev Sharma</h3>
                      <!-- <p class="indentity">Web Designer </p> -->
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <div class="item">
              <div class="testimonial-content">
                <div class="testimonial">
                  <blockquote>
                    <q
                      >They provide a professional guidance. I am expressing my
                      humble gratitude for an outstanding service and support
                      provided by team Sidvin Realty for providing me a space
                      for my new venture “Apollo Clinic” at Guwahati in just
                      half an hour. I am pleased with their knowledge and
                      commitment and I know the value of professional guidance.
                      Great service makes your customers feel that you care
                      about developing a long-term relationship that means more
                      than just making a deal. Keep up the good work and well
                      done!</q
                    >
                  </blockquote>
                  <div class="testi-des">
                    <!-- <div class="test-img"><img src="assets/images/team1.jpg" class="img-fluid" alt="client-img">
									</div> -->
                    <div class="peopl align-self">
                      <h3>Rohit Saraogi</h3>
                      <!-- <p class="indentity">Web Designer </p> -->
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- </div> -->
          <!-- Testimonial video grid -->
          <div class="testimonial-video-grid mt-5">
            <a
              class="testo-img vid-link img-fluid"
              href="#"
              data-toggle="modal"
              data-target="#videoModal"
              data-vidLink="https://www.youtube.com/embed/Qu1--S5YkjY"
            >
              <img
                class="testo-img img-fluid"
                src="assets/images/video-thumbs/testo-thumb-1.png"
                alt=""
              />
            </a>
            <a
              class="testo-img img-fluid vid-link"
              href="#"
              data-toggle="modal"
              data-target="#videoModal"
              data-vidLink="https://www.youtube.com/embed/DPUXn4htlL4"
            >
              <img
                class="testo-img img-fluid"
                src="assets/images/video-thumbs/testo-thumb-2.png"
                alt=""
              />
            </a>
            <a
              class="testo-img img-fluid vid-link"
              href="#"
              data-toggle="modal"
              data-target="#videoModal"
              data-vidLink="https://www.youtube.com/embed/hMpYvSQ2a7Y"
            >
              <img
                class="testo-img img-fluid"
                src="assets/images/video-thumbs/testo-thumb-3.png"
                alt=""
              />
            </a>
            <a
              class="testo-img img-fluid vid-link"
              href="#"
              data-toggle="modal"
              data-target="#videoModal"
              data-vidLink="https://www.youtube.com/embed/PRUZIvezQiM"
            >
              <img
                class="testo-img img-fluid"
                src="assets/images/video-thumbs/testo-thumb-4.png"
                alt=""
              />
            </a>
            <a
              class="testo-img img-fluid vid-link"
              href="#"
              data-toggle="modal"
              data-target="#videoModal"
              data-vidLink="https://www.youtube.com/embed/KHZhq1bDmws"
            >
              <img
                class="testo-img img-fluid"
                src="assets/images/video-thumbs/testo-thumb-5.png"
                alt=""
              />
            </a>
            <a
              class="testo-img img-fluid vid-link"
              href="#"
              data-toggle="modal"
              data-target="#videoModal"
              data-vidLink="https://www.youtube.com/embed/ObsNSWxxlT0"
            >
              <img
                class="testo-img img-fluid"
                src="assets/images/video-thumbs/testo-thumb-6.png"
                alt=""
              />
            </a>
          </div>
        </div>
        <!-- /grids -->
      </div>
      <!-- //grids -->
    </section>
    <!-- //testimonials -->
     <!-- call us -->
<section class="w3l-call pt-5" id="book">
    <div class="container pt-lg-5 pt-md-4">
        <div class="row">
            <div class="col-md-8 align-center">
                <h4 class="mb-2">SAY HI!</h4>
                <p class="mb-2">Sidvin Realty Network </p>
                <h2><span class="fa mr-1 fa-phone"></span> (+91) 88 5861 5861</h2>
                <br />
                <h2><span class="fa mr-1 fa-phone"></span> (+91) 98 6402 3888</h2>
               
                <p class="mt-4">#206, Shankar Complex, Christian Basti, G S Road, Guwahati (Assam) – 781 005</p>
                <p class="mt-4">Jaipur Branch Address-                                                                                                 SSK Tower, First Floor, Metro Pillar No. 75, New Sanganer Road, Near Gurjar Ki Thadi, Jaipur, Rajasthan, India</p>
                <!-- <a class="btn btn-primary btn-style mt-md-5 mt-4" href="/contact"> Get Started </a> -->
                <a href="/contact" class="btn btn-outline-primary btn-style ml-2 mt-md-5 mt-4">Contact Us</a>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6 col-8 mt-md-0 mt-5">
                <img src="assets/images/customer.png" alt="" class="img-fluid">
            </div>
        </div>
    </div>
</section>
<!-- //call us -->

    <!-- Vlogs Section -->
    <section class="w3l-bottom-grids-6 py-5 vlogs-section" id="vlogs">
      <div class="container py-lg-5 py-md-4">
        <h3 class="title-big text-center text-white">World of Vlogs</h3>
        <h6 class="title-small text-center mb-md-5 mb-4 text-light">
          --- By Vikas Goenka ---
        </h6>
        <div class="grids-area-hny main-cont-wthree-fea row">
          <div class="col-lg-4 col-md-6 grids-feature">
            <div class="area-box">
              <a
                class="vlog-img img-fluid vid-link"
                href="#"
                data-toggle="modal"
                data-target="#videoModal"
                data-vidLink="https://www.youtube.com/embed/iSeOLGr0ZIQ"
              >
                <img
                  class="img-fluid"
                  src="assets/images/video-thumbs/vlog-1.png"
                  alt=""
                />
              </a>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 grids-feature mt-md-0 mt-4">
            <div class="area-box">
              <a
                class="vlog-img img-fluid vid-link"
                href="#"
                data-toggle="modal"
                data-target="#videoModal"
                data-vidLink="https://www.youtube.com/embed/cwDGVvaQZ7k"
              >
                <img
                  class="img-fluid"
                  src="assets/images/video-thumbs/vlog-2.png"
                  alt=""
                />
              </a>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 grids-feature mt-lg-0 mt-4">
            <div class="area-box">
              <a
                class="vlog-img img-fluid vid-link"
                href="#"
                data-toggle="modal"
                data-target="#videoModal"
                data-vidLink="https://www.youtube.com/embed/_e3oXCgofbg"
              >
                <img
                  class="img-fluid"
                  src="assets/images/video-thumbs/vlog-3.png"
                  alt=""
                />
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- ---------Video Modal---------- -->
    <!-- Modal -->

    <div
      class="modal fade"
      id="videoModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalCenterTitle"
      aria-hidden="true"
    >
      <div class="modal-header-c">
        <button
          type="button"
          class="close"
          data-dismiss="modal"
          aria-label="Close"
        >
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-body">
            <iframe
              width="100%"
              id="ytplayer"
              src=""
              title="YouTube video player"
              frameborder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen
            ></iframe>
          </div>
        </div>
      </div>
    </div>

    <!-- //Vlogs Section -->

    <!-- footer -->
    <section class="w3l-footer-29-main" id="footer">
      <div class="footer-29 py-5">
        <div class="container pb-lg-3">
          <div class="row footer-top-29">
            <div class="col-lg-3 col-md-6 footer-list-29 footer-3 mt-4">
              <div class="properties">
                <a
                  href="/home"
                  style="width: 250px; height: auto; margin-bottom: 100px"
                  ><img
                    style="width: 100px; margin-bottom: 20px"
                    src="assets/images/logo/logot2_sidvin.png"
                    alt=""
                /></a>
                <p>
                  We are one of the oldest realtors in the north-east and have
                  with us years of learning. The years of experience enable us
                  to close deals faster than any other competitors. We only list
                  verified clients and properties with us.
                </p>
              </div>
            </div>
            <div
              class="col-lg-2 col-md-6 col-6 footer-list-29 footer-4 col-12 mt-4"
            >
              <ul>
                <h6 class="footer-title-29">Quick Links</h6>
                <li><a href="/home">Home</a></li>
                <li><a href="/about">About</a></li>
                <li><a href="/services">Services</a></li>
                <li><a href="/portfolio">Portfolio</a></li>
                <li><a href="/contact">Get in touch</a></li>
              </ul>
            </div>
            <div class="col-lg-4 col-md-6 footer-list-29 footer-1 mt-4">
              <h6 class="footer-title-29">Office Address</h6>
              <ul>
                <li>
                  <p>
                    <span class="fa fa-map-marker"></span> #206, Shankar
                    Complex,<br /> Christian Basti, G S Road,<br /> Guwahati (Assam) – 781
                    005
                  </p>
                </li>

                  <li>
                  <p>
                    <span class="fa fa-map-marker"></span> Jaipur Branch Address, First Floor,<br /> Metro Pillar No. 75, New Sanganer Road, Near Gurjar Ki Thadi, Jaipur, Rajasthan,<br /> SSK Tower, India
                  </p>
                </li>
                <li>
                  <a href="tel:(+91) 88 5861 5861"
                    ><span class="fa fa-phone"></span> (+91) 88 5861 5861</a
                  >
                </li>
                <li>
                  <a href="tel:(+91) 361 234 3888"
                    ><span class="fa fa-phone"></span> (+91) 361 234 3888</a
                  >
                </li>
                <li>
                  <a target="_blank" href="mailto:info@sidvinrealty.com" class="mail"
                    ><span class="fa fa-envelope-open-o"></span>
                    info@sidvinrealty.com</a
                  >
                </li>
              </ul>
              <div class="main-social-footer-29">
                <a
                target="_blank"
                  href="https://www.facebook.com/realtorvikasgoenka"
                  class="facebook"
                  ><span class="fa fa-facebook"></span
                ></a>
                <a
                target="_blank"
                href="https://twitter.com/vikasgoenka" class="twitter"
                  ><span class="fa fa-twitter"></span
                ></a>
                <a
                    target="_blank"
                href="https://instagram.com/realtorvikasgoenka" class="instagram"
                  ><span class="fa fa-instagram"></span
                ></a>
                <a
                    target="_blank"
                href="https://youtube.com/c/VikasGoenka" class="google-plus"
                  ><span class="fa fa-youtube"></span
                ></a>
                <a
                target="_blank"
                  href="https://www.linkedin.com/in/vikasgoenka"
                  class="linkedin"
                  ><span class="fa fa-linkedin"></span
                ></a>
              </div>
            </div>
            <div
              class="col-lg-3 col-md-6 col-6 footer-list-29 footer-2 col-12 mt-4"
            >
              <ul>
                <h6 class="footer-title-29">We are here</h6>
                <div class="map">
                  <iframe
                    src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d28650.092920848263!2d91.779254!3d26.155608!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x976bb24e340e1f2d!2sSidvin%20Realty%20Network%20Private%20Limited!5e0!3m2!1sen!2sin!4v1640838639702!5m2!1sen!2sin"
                    frameborder="0"
                    style="border: 0"
                    allowfullscreen=""
                  ></iframe>
                </div>
              </ul>
            </div>
          </div>
          <div class="row bottom-copies">
            <p class="copy-footer-29 col-lg-8">
              © 2022 Sidvin Realty Network All Rights Reserved.
            </p>
            <ul class="list-btm-29 col-lg-4">
              <li><a href="#link">Privacy policy</a></li>
              <li><a href="#link">Terms of service</a></li>
            </ul>
          </div>
        </div>
      </div>
      <!-- move top -->
      <!-- <button onclick="topFunction()" id="movetop" class="bg-primary" title="Go to top">
        <span class="fa fa-level-up"></span>
      </button> -->

      <div class="wp-icon">
        <a href="https://api.whatsapp.com/send?phone=+918858615861"
          ><img src="assets/images/logo/icons/whatsapp-icon.png" alt=""
        /></a>
      </div>
      <script>
          // When the user scrolls down 20px from the top of the document, show the button
          window.onscroll = function () {
              scrollFunction();
          };

          function scrollFunction() {
              if (
                  document.body.scrollTop > 20 ||
                  document.documentElement.scrollTop > 20
              ) {
                  document.getElementById("movetop").style.display = "block";
              } else {
                  document.getElementById("movetop").style.display = "none";
              }
          }

          // When the user clicks on the button, scroll to the top of the document
          function topFunction() {
              document.body.scrollTop = 0;
              document.documentElement.scrollTop = 0;
          }
      </script>
      <!-- /move top -->
    </section>
    <!-- / footer -->

    <script src="assets/js/jquery-3.3.1.min.js"></script>
    <!-- Common jquery plugin -->

    <script src="assets/js/theme-change.js"></script>
    <!-- theme switch js (light and dark)-->

    <!-- magnific popup -->
    <script src="assets/js/jquery.magnific-popup.min.js"></script>
    <script>
        $(document).ready(function () {
            $(".popup-with-zoom-anim").magnificPopup({
                type: "inline",

                fixedContentPos: false,
                fixedBgPos: true,

                overflowY: "auto",

                closeBtnInside: true,
                preloader: false,

                midClick: true,
                removalDelay: 300,
                mainClass: "my-mfp-zoom-in",
            });

            $(".popup-with-move-anim").magnificPopup({
                type: "inline",

                fixedContentPos: false,
                fixedBgPos: true,

                overflowY: "auto",

                closeBtnInside: true,
                preloader: false,

                midClick: true,
                removalDelay: 300,
                mainClass: "my-mfp-slide-bottom",
            });
        });
    </script>
    <!-- magnific popup -->

    <script src="assets/js/owl.carousel.js"></script>
    <!-- script for tesimonials carousel slider -->
    <script>
        $(document).ready(function () {
            $("#owl-demo1").owlCarousel({
                loop: true,
                margin: 20,
                nav: false,
                responsiveClass: true,
                responsive: {
                    0: {
                        items: 1,
                        nav: false,
                    },
                    736: {
                        items: 1,
                        nav: false,
                    },
                    1000: {
                        items: 2,
                        nav: false,
                        loop: false,
                    },
                },
            });
        });
    </script>
    <!-- //script for tesimonials carousel slider -->

    <!--/MENU-JS-->
    <script>
        $(window).on("scroll", function () {
            var scroll = $(window).scrollTop();

            if (scroll >= 80) {
                $("#site-header").addClass("nav-fixed");
            } else {
                $("#site-header").removeClass("nav-fixed");
            }
        });

        //Main navigation Active Class Add Remove
        $(".navbar-toggler").on("click", function () {
            $("header").toggleClass("active");
        });
        $(document).on("ready", function () {
            if ($(window).width() > 991) {
                $("header").removeClass("active");
            }
            $(window).on("resize", function () {
                if ($(window).width() > 991) {
                    $("header").removeClass("active");
                }
            });
        });
    </script>
    <!--//MENU-JS-->

    <!-- disable body scroll which navbar is in active -->
    <script>
        $(function () {
            $(".navbar-toggler").click(function () {
                $("body").toggleClass("noscroll");
            });
        });
    </script>
    <!-- //disable body scroll which navbar is in active -->

    <!--bootstrap-->
    <script src="assets/js/bootstrap.min.js"></script>

    <!-- //bootstrap-->

    <!-- Video Modal -->
    <script></script>
    <!--Start of Tawk.to Script-->
    <script type="text/javascript">
        var Tawk_API = Tawk_API || {},
            Tawk_LoadStart = new Date();
        (function () {
            var s1 = document.createElement("script"),
                s0 = document.getElementsByTagName("script")[0];
            s1.async = true;
            s1.src = "https://embed.tawk.to/61cd7cc280b2296cfdd45b80/1fo5aumhj";
            s1.charset = "UTF-8";
            s1.setAttribute("crossorigin", "*");
            s0.parentNode.insertBefore(s1, s0);
        })();
    </script>
    <!--End of Tawk.to Script-->
 </form>
  </body>
</html>
