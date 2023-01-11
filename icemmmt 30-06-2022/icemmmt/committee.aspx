<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="committee.aspx.cs" Inherits="icemmmt.committee" %>

<!DOCTYPE html>

<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Welcome to ICEMMMT 2022</title>
      <meta name="description" content="The CVR College of Engineering was established in 2001, by Cherabuddi Educational Society with the vison of “In pursuit of Excellence”. The college is located at a picturesque location at a distance of 20km from LB Nagar towards Nagarjuna Sagar and about 25km from Rajiv Gandhi International Airport (RGIA), Hyderabad, Telangana State, India.">
    <meta name="keywords" content="Manufacturing technology,material and manufacturing technology,Materials processing and characterization,International conference on material and manufacturing technology,Advances in materials and manufacturing applications,ICEMMMT">
    <!-- web fonts -->
    <link href="//fonts.googleapis.com/css?family=Work+Sans:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">
    <!-- //web fonts -->
      <!-- FavIcon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.png">
    <!-- Template CSS -->
    <link rel="stylesheet" href="assets/css/style-starter.css">


  </head>
  <body>


<!-- Top Menu 1 -->
<section class="w3l-top-menu-1">
	<div class="top-hd">
		<div class="container">
	<header class="row top-menu-top">
		<div class="accounts col-md-9 col-6">
				<%--<li class="top_li"><span class="fa fa-phone"></span><a href="tel:+918121387751">+918121387751</a> </li>
				<li class="top_li1"><span class="fa fa-envelope-o"></span> <a href="mailto:icemmmt@cvr.ac.in" class="mail"> icemmmt@cvr.ac.in</a>	</li>--%>
        <li class="top_li"><span class="fa fa-envelope-o"></span> <a href="mailto:icemmmt_info@cvr.ac.in" class="mail"> icemmmt_info@cvr.ac.in</a>	</li>
		</div>
		<%--<div class="social-top col-md-3 col-6">
			<a href="contact.aspx" class="btn btn-secondary btn-theme4">Apply Now</a>
		</div>--%>
	</header>
</div>
</div>
</section>
<!-- //Top Menu 1 -->
<section class="w3l-bootstrap-header">
  <nav class="navbar navbar-expand-lg navbar-light py-lg-2 py-2">
    <div class="container">
      <!-- <a class="navbar-brand" href="index.html"><span class="fa fa-pencil-square-o "></span> Mastery</a>
      if logo is image enable this    -->
    <a class="navbar-brand" href="#default.aspx" style="margin: 0 auto">
        <img src="assets/images/colg1.png" alt="Your logo" title="Your logo" style="height:140px;" />
    </a>

    <div style="margin-top: 7px; font-family: Arial-Narrow" class="large-8 medium-8 small-12 columns text-center">
      <h4 style="font-family: Arial Narrow; font-weight: bold; color: #1463a9">International Conference &amp; Exposition on</h4>
      <h2 style="color: #a51a1a; font-family: Arial-Narrow; font-size: 1.75rem; margin-top: 5px; font-weight: 700;">Mechanical, Material and Manufacturing Technology</h2>
      <hr style=" max-width: 32rem; border-bottom: 1px solid #000000;">
     
      <p style="color:#1463a9;font-weight: bolder;">October 28-29, 2022 &nbsp; 
          <span> <img src="assets/images/line.png" alt="Webful Education" style="margin-bottom: 5px;"></span>   &nbsp; Hyderabad, INDIA</p>
  </div>
      

  <a class="navbar-brand" href="#default.aspx" style="margin: 0 auto">
    <img src="assets/images/logo2.png" alt="Your logo" title="Your logo" style="height:140px;" />
</a>

      
    </div>
  </nav>
</section>
<section class="w3l-bootstrap-header" style="background-color: #111166;">
  <nav class="navbar navbar-expand-lg navbar-light py-lg-2 py-2">
    <div class="container">
      <!-- <a class="navbar-brand" href="index.html"><span class="fa fa-pencil-square-o "></span> Mastery</a> -->
      <!-- if logo is image enable this   
    <a class="navbar-brand" href="#index.html">
        <img src="image-path" alt="Your logo" title="Your logo" style="height:35px;" />
    </a> -->
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon fa fa-bars"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mx-auto">
          <li class="nav-item">
            <a class="nav-link" href="default.aspx">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="about.aspx" style="white-space: nowrap;">About Us</a>
          </li>

            <li class="nav-item">
            <a class="nav-link" href="CallForPaper.aspx" style="white-space: nowrap;">Call for Paper</a>
          </li>
        
          <li class="nav-item">
            <a class="nav-link" href="submission.aspx">Submission</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="Registration.aspx">Registration</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="publication.aspx">Publication</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="committee.aspx">committee</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="speaker.aspx">Speaker</a>
          </li>
          <li class="nav-item ">
            
            <div class="dropdown">
              <a class="nav-link dropdown-toggle" id="dropdownMenuButton" href="conference.aspx" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="white-space: nowrap;">Conference Info </a>
              <!-- <button class=" dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Dropdown button
              </button> -->
              <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="impDates.aspx">Important Dates</a>
                <a class="dropdown-item" href="program.aspx">Program schedule</a>
                <a class="dropdown-item" href="downloads.aspx">Downloads</a>
                <a class="dropdown-item" href="sponsorships.aspx">Sponsorships</a>
                <a class="dropdown-item" href="accommodation.aspx">Accommodation</a>
                <a class="dropdown-item" href="tourism.aspx">Tourism</a>
                <a class="dropdown-item" href="visa.aspx">Visa</a>
              </div>
            </div>


          </li>
            <li class="nav-item">
            <a class="nav-link" href="history.aspx">History</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact.aspx">Contact</a>
          </li>
         
        </ul>
        
      </div>
    </div>
  </nav>
</section>
<section class="w3l-main-slider" id="home">
  <!-- main-slider -->

    <section class="w3l-about-breadcrum">
  <div class="breadcrum-bg py-sm-5 py-4">
    <div class="container py-lg-3">
      <h2>Committee</h2>
      <p><a href="default.aspx">Home</a> &nbsp; / &nbsp; Committee</p>
    </div>
  </div>
</section>

    

    <section class="w3l-content-with-photo-4 border">
    <div id="content-with-photo4-block" class="pt-5 "> 
        <div class="container pb-md-5 border-primary">
            <div class="cwp4-two row">
               
                
                <div class="cwp4-text col-lg-12 text-center">
                        <h3 class="mb-2" style="color:#1717a3">Chief Patron </h3>
                   <ul>
                       <li>
                           Dr. Cherabuddi V. Raghava, Chairman, CVR College of Engineering, Hyderabad, India.


                       </li>
                        
                   </ul>
                    
                </div>

                <div class="cwp4-text col-lg-12 text-center mt-5">
                        <h3 class="mb-2" style="color:#1717a3">Patrons </h3>
                   <ul>
                       <li>
                           Prof. C. Madhusudana Reddy, Advisor, CVR College of Engineering, Hyderabad, India.
                       </li>
                        
                        <li>
                           Dr. K. Ramamohan Reddy, Principal, CVR College of Engineering, Hyderabad, India.
                       </li>
                       <li>
                           Dr. K. Rama Sastri, Director, CVR College of Engineering, Hyderabad, India.
                       </li>
                        
                   </ul>
                    
                </div>



                









                <div class="cwp4-text col-lg-12 text-center mt-5">
                        <h3 class="mb-2" style="color:#1717a3">Honorary Members </h3>
                   <ul>
                       <li>
                           Dr. K. Lal Kishore, Dean, Research, CVR College of Engineering, Hyderabad, India.
                       </li>
                        <li>
                          Dr. Rameshwar Rao, Dean, Projects, CVR College of Engineering, Hyderabad, India.
                       </li>
                        <li>
                           Prof. L. C. Siva Reddy, Vice Principal, CVR College of Engineering, Hyderabad, India.
                       </li>
                       <li>
                           Dr. K.S. Nayanathara, Dean, Academics, CVR College of Engineering, Hyderabad, India.
                       </li>
                       <li>
                           Dr. M. V. Seshagiri Rao, Dean, Planning & Coordination, CVR College of Engineering, Hyderabad, India.
                       </li>
                        
                   </ul>
                    
                </div>

                <div class="cwp4-text col-lg-12 text-center mt-5">
                        <h3 class="mb-2"style="color:#1717a3">Conference Chair </h3>
                   <ul>
                       <li>
                         Dr. M. Venkata Ramana, Professor & HOD, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.


                       </li>
                        
                   </ul>
                    
                </div>

                <div class="cwp4-text col-lg-12 text-center mt-5">
                        <h3 class="mb-2" style="color:#1717a3">Conference Convener </h3>
                   <ul>
                       <li>
                           Dr. P. Uma Maheshwera Reddy, Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.


                       </li>
                        
                        
                   </ul>
                    
                </div>
            </div>
        </div>
    </div>
</section>


    <section class="w3l-content-with-photo-4" style="background:#002147">
    <div id="content-with-photo4-block" class="pt-1"> 
        <div class="container py-md-5">
            <div class="cwp4-two row">
                
                  <div class="cwp4-text col-lg-12 text-center">

                      
                        
                   
                      <div style="overflow-x:auto;">

                      <table class="table table-bordered table-dark">
  <thead>
    <tr>
      
        <th colspan="2"scope="col" class="text-center">Technical Advisory Board</th>
     
    </tr>
  </thead>
  <tbody>
    <tr>
      <%--<td rowspan="4">National</td>--%>



        
      <td> Dr. J. Paulo Davim, Department of Mechanical Engineering, University of Aveiro, Portugal.</td>
        <td>Dr. Manoj Gupta, Mechanical Engineering, National University of Singapore (NUS), Singapore.</td>
      

    </tr>
    <tr>
      
      <td>Dr. D.T. Pham, Mechanical Engineering, University of Birmingham, Birmingham, U.K.</td>
        <td>Dr. Jose Rajan, Material Technology, Faculty of Industrial Sciences & Technology, UMP, Malaysia.</td>
      
    </tr>
    <%--<tr>
      <th scope="row">3</th>
      <td colspan="2">Larry the Bird</td>
      <td>@twitter</td>
    </tr>--%>


    

      <tr>
      
      <td> Dr. Rosemar Batista da Silva, School of Mechanical Engineering, UFU, Brazil.</td>
          <td>Dr. Aidy Ali, Department of Mechanical Engineering, UPNM, Malaysia.</td>
      
    </tr>

      <tr>
     
      <td> Dr. Shyh-Leh Chen, Department of Mechanical Engineering, National Chung Cheng University, Taiwan.</td>
           <td>Dr. Daniel Juhre, Faculty of Mechanical Engineering, Otto von Guericke University Magdeburg, Germany.</td>
     
    </tr>

      <tr>
     <%-- <td rowspan="4">International</td>--%>
          
      <td>Dr. Glen Bright, School of Mechanical Engineering, UKZN, Durban, South Africa. </td>
           <td>Dr. N. R. Dhar, Department of Industrial and Production Engineering, BUET, Dhaka, Bangladesh.</td>
      
    </tr>

      <tr>
    
      <td>Dr. G. Prusty, Mechanical & Manufacturing Engineering, UNSW Sydney, Sydney, Australia.</td>
          <td>Dr. N S Reddy, Department of Metallic & Materials Engineering, GNU, South Korea.</td>
      
    </tr>

      <tr>
      
      <td>Dr. Fadare David Abimbola, Mechanical Engineering Department, University of Ibadan, Nigeria.</td>
          <td>Dr. Chithirai Pon Selvan, Mechanical Engineering, Curtin University Dubai, UAE.</td>
      
    </tr>



      <tr>
      
      <td>Dr. Huang Weimin, School of Mechanical & Aerospace Engineering, NTU, Singapore..</td>
          <td>Dr. M. Selvaraj, Faculty of Sciences, King Khalid University, Abha, Kingdom of Saudi Arabia.</td>
     
    </tr>

      <tr>
      
      <td>Dr. Hassan Ghadbeigi, Department of Mechanical Engineering, The University of Sheffield, U.K.</td>
          <td>Dr. Raju, Mechanical & Manufacturing Engineering, UNSW Sydney, Sydney, Australia.</td>
     
    </tr>

      <tr>
      
      <td>Dr. M. Jahan, Department of Mechanical and Manufacturing Engineering, Miami University, USA.</td>
          <td>Dr. B. Khandelwal, Department of Mechanical Engineering, The University of Sheffield, UK.</td>
     
    </tr>

      <tr>
      
      <td>Dr. Kapil Gupta, Mechanical and Industrial Engineering Technology, University of Johannesburg, RSA.</td>
          <td>Dr. Samet AKAR, Cankaya University, Ankara, Turkey</td>
     
    </tr>


      <tr>
      
      <td>Dr. Sathish Kannan, Department of Mechanical Engineering, American University of Sharjah, UAE.</td>
          <td>Dr. D. Carou, School of Mechanical and Materials Engineering, University College Dublin, Ireland.</td>
     
    </tr>

      <tr>
      
      <td>Dr. R.R. Varma, Department of Mechanical and Industrial Engineering, University of Toronto, Canada.</td>
          <td>Dr. Dheerendra K. Dwivedi, Mechanical and Industrial Engineering, IIT Roorkee, India.</td>
     
    </tr>

      <tr>
      
      <td>Dr. S. K. Choudhary, Department of Mechanical Engineering, IIT Kanpur, India.</td>
          <td>Dr. Joysurya Basu, Department of Metallurgical Engineering, IIT BHU, India.</td>
     
    </tr>

      <tr>
      
      <td>Dr. Pinaki Prasad Bhattacharjee, Materials Science and Metallurgical Engineering, IIT Hyderabad, India.</td>
          <td>Dr. Neelesh Kumar Jain, Mechanical Engineering, IIT Indore, India.</td>
     
    </tr>

      <tr>
      
      <td>Dr. Debabrata Chakraborty, Department of Mechanical Engineering, IIT Guwahati, India.</td>
          <td>Dr. Amit Arora, Materials Science and Engineering, IIT Gandhinagar, India..</td>
     
    </tr>



      <tr>
      
      <td>Dr. Mamilla Ravi Sankar, Department of Mechanical Engineering, IIT Tirupati, India.</td>
          <td>Dr. M.J.N.V. Prasad, Department of Metallurgical Engineering and Materials Science, IIT Bombay, India.</td>
     
    </tr>

      <tr>
      
      <td>Dr. Manas Das, Department of Mechanical Engineering, IIT Guwahati, India.</td>
          <td>Dr. Ajay Sidpara, Department of Mechanical Engineering, IIT Kharagpur, India.</td>
     
    </tr>

      <tr>
      
      <td>Dr. Deepak Marla, Department of Mechanical Engineering, IIT Bombay, India.</td>
          <td>Dr. Hariharan, Department of Mechanical Engineering, IIT Madras, India.</td>
     
    </tr>



      <tr>
      
      <td> Dr. Deepak Kumar, Centre for Automotive Research and Tribology (ITMMEC), IIT Delhi, India.</td>
          <td>Dr. Atul Jain, Department of Mechanical Engineering, IIT Kharagpur, India.</td>
     
    </tr>

      <tr>
      
      <td>Dr. N S K Reddy, Department of Mechanical Engineering, BITS-Pilani, Hyderabad, India.</td>
          <td>Dr. N.R. Kotkunde, Department of Mechanical Engineering, BITS-Pilani, Hyderabad, India.</td>
     
    </tr>




      <tr>
      
      <td>Dr. A. Kumar, Department of Mechanical Engineering, NIT Warangal, Indi</td>
          <td>Dr. P. Vamsi Krishna, Department of Mechanical Engineering, NIT Warangal, India.</td>
     
    </tr>

      <tr>
      
      <td>Dr. Ravi Methekar, Department of Chemical Engineering, VNIT, Nagpur, India.</td>
          <td>Dr. V N Gaitonde, Department of Industrial and Production Engineering, KLE Technological University, India.</td>
     
    </tr>




      <tr>
      
      <td>Dr. Gobinda Gopal Khan, Department of Material Science & Engineering, Tripura University, India. </td>
          <td>Dr. Koteswararao V. Rajulapati, School of Engineering Sciences and Technology, HCU, India.</td>
     
    </tr>

      <tr>
      
      <td>Dr. V.S. Senthil Kumar, Department of Mechanical Engineering, Anna University, Chennai, India.</td>
          <td>Dr. A. Kumaraswamy, Department of Mechanical Engineering, DIAT, Pune, India.</td>
     
    </tr>

      <tr>
      
      <td>Dr. P. Ramesh Babu, Department of Mechanical Engineering, University College of Engineering, Osmania University, Hyderabad, India.</td>
          <td>Dr. L. Siva Rama Krishna, Department of Mechanical Engineering, University College of Engineering, Osmania University, Hyderabad, India.</td>
     
    </tr>


      <tr>
      
      <td> Dr. A.V.S.S.K.S. Gupta, Department of Mechanical Engineering, JNTU College of Engineering, Hyderabad, India.</td>
      <td>Dr. G.K. Mohan Rao, Department of Mechanical Engineering, JNTU College of Engineering, Hyderabad, India.</td>
     
    </tr>

      <tr>
      
      <td>Dr. Pavan G, Mechanical, School of Technology, Pandit Deendayal Petrolium University, Raysan, India.</td>
          <td>Dr. K. Palanikumar, Department of Mechanical and Production Engineering, SIST, Deemed University, Chennai, India.</td>
     
    </tr>

      <tr>
      
      <td>Dr. M. Sowjanya, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.</td>
      <td>Dr. Manjeet Kharub, Associate Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.</td>
     

      <tr>
      
      <td> Dr. K. Kishore Kumar, Associate Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.</td>
          <td>Dr. N.R. Banapurmath, Department of Mechanical Engineering, KLE Technological University, India.</td>
     
    </tr>

      <tr>
      
      <td>Dr. Amlana Panda, KIIT Deemed to be University, School of Mechanical Engineering, Bhubaneswar, India.</td>
       <td>Dr. R. George, Department of Mechanical Engineering, Ramaiah Institute of Technology, Bengaluru, India.</td>
     
    </tr>

      <tr>
      
      <td>Dr. Sumit Pramanik, Department of Mechanical Engineering, SRM University, Chennai, India.</td>
       <td>Dr. L. B. Rao, School of Mechanical and Building Sciences, VIT University, Chennai, India.sss</td>
     
    </tr>


          </tr>


      <tr>
      
      <td>Dr. Dipti Samantaray, Metallurgy and Materials Group, IGCAR, Chennai, India.</td>
      <td>Dr. Ajit Panigrahi, Advanced Materials Technology Department, CSIR-Institute of IMMT, Bhubaneswar, India.</td>
     
    </tr>

      <tr>
      
      <td>Dr. B.V.N. Charyulu, Defence Research and Development Laboratory (DRDL), Hyderabad, India.</td>
      <td>Dr. K. Valleti, Centre for Engineered Coatings, ARCI, Hyderabad, India.</td>
     
    </tr>

      <tr>
      
      <td>Dr. J. John Rozario Jegaraj, Defence Research and Development Laboratory (DRDL), Hyderabad, India.</td>
        
    </tr>



  </tbody>
</table>

                          



                          </div>
                      </div>



               
                
                

                
                
            </div>
        </div>
    </div>
</section>


    <section class="w3l-content-with-photo-4 border">
    <div id="content-with-photo4-block" class="pt-5 "> 
        <div class="container pb-md-5 border-primary">
            <h5 class="text-center pb-4"><u>Other Members of Organizing Committee:</u></h5>
            <div class="cwp4-two row">
               
                
                <div class="cwp4-text col-lg-12 text-center">
                        <h3 class="mb-2" style="color:#1717a3">Publicity/Media/Helpdesk </h3>
                   <ul>
                       <li>
                           Mr. Neeraj Kumar Jha, Associate Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.


                       </li>

                       <li>
                          Mr. G. Haribabu, Assistant Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.


                       </li>

                       <li>
                           Mr. A. Suresh, Assistant Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.


                       </li>
                        
                   </ul>
                    
                </div>

                <div class="cwp4-text col-lg-12 text-center mt-5">
                        <h3 class="mb-2" style="color:#1717a3">Registrations </h3>
                   <ul>
                       <li>
                           Mr. V. Rajender Kumar, Associate Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.
                       </li>
                        <li>
                          Mrs. V. Lavanya, Assistant Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.
                       </li>
                        <li>
                           Mr. Sarat Kumar Sahoo, Assistant Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.
                       </li>
                        
                   </ul>
                    
                </div>


                <div class="cwp4-text col-lg-12 text-center mt-5">
                        <h3 class="mb-2" style="color:#1717a3">Technical Session/Schedule Management </h3>
                   <ul>
                       <li>
                          Mrs. G. Mrudula, Associate Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.
                       </li>
                        <li>
                         Mr. G. Naveen Kumar, Associate Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.
                       </li>
                        
 
                        
                   </ul>
                    
                </div>

                <div class="cwp4-text col-lg-12 text-center mt-5">
                        <h3 class="mb-2"style="color:#1717a3">Inauguration & Valedictory </h3>
                   <ul>
                       <li>
                          Mrs. M.R.S. Rupa Sri, Assistant Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.


                       </li>
                        <li>
                        Mr. C. Sai Kiran, Assistant Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.


                       </li>
                        
                   </ul>
                    
                </div>

                <div class="cwp4-text col-lg-12 text-center mt-5">
                        <h3 class="mb-2"style="color:#1717a3">Transport & Accommodation </h3>
                   <ul>
                       <li>
                         Mr. Appala Naidu, Associate Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.


                       </li>
                        <li>
                         Mr. P. Srinivas Reddy, Assistant Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.


                       </li>
                       <li>
                          Mr. Sk. Md. Shareef, Assistant Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.
                       </li>
                        
                   </ul>
                    
                </div>

                <div class="cwp4-text col-lg-12 text-center mt-5">
                        <h3 class="mb-2"style="color:#1717a3">Hospitality & Food </h3>
                   <ul>
                       <li>
                          Mr. ALN Arun Kumar, Assistant Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.


                       </li>
                        <li>
                        Mr. T. Venkatesh, Assistant Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.




                       </li>
                        
                   </ul>
                    
                </div>

                <div class="cwp4-text col-lg-12 text-center mt-5">
                        <h3 class="mb-2"style="color:#1717a3">Treasurer </h3>
                   <ul>
                       <li>
                        Mr. G. Bharath Reddy, Assistant Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.


                       </li>
                       
                        
                   </ul>
                    
                </div>

                <div class="cwp4-text col-lg-12 text-center mt-5">
                        <h3 class="mb-2"style="color:#1717a3">Certificates  </h3>
                   <ul>
                       <li>
                       Mr. M. Srinivas Reddy, Associate Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.


                       </li>
                        <li>
                       Mrs. P. Bhargavi, Assistant Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.


                       </li>
                        
                   </ul>
                    
                </div>

                <div class="cwp4-text col-lg-12 text-center mt-5">
                        <h3 class="mb-2"style="color:#1717a3">Sponsorship </h3>
                   <ul>
                       <li>
                       Mr. P. Lava Kumar, Associate Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.


                       </li>
                       <li>
                           Mr. M. Ravi Kumar, Assistant Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.


                       </li>
                        
                        
                   </ul>
                    
                </div>

                <div class="cwp4-text col-lg-12 text-center mt-5">
                        <h3 class="mb-2"style="color:#1717a3">Website  </h3>
                   <ul>
                       <li>
                          Mr. V. Rahul, Assistant Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.


                       </li>
                        
                   </ul>
                    
                </div>

                <div class="cwp4-text col-lg-12 text-center mt-5">
                        <h3 class="mb-2"style="color:#1717a3">Photo & Video  </h3>
                   <ul>
                       <li>
                         Mr. M. Uday Kiran, Assistant Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.


                       </li>
                       <li>
                         Mr. Rajesh Kumar, Assistant Professor, Department of Mechanical Engineering, CVR College of Engineering, Hyderabad, India.
                       </li>
                        
                   </ul>
                    
                </div>

                
            </div>
        </div>
    </div>
</section>
 
    
<!-- grids block 5 -->
<section class="w3l-footer-29-main">
  <div class="footer-29" style="padding:36px 0px">
      <div class="container">
          
          <div class="row" style="border-top:0px solid #fff; padding-top: 0em" >
              <div class="col-md-6">
                  <p class="copy-footer-29">2022 © All Rights Reserved. ICE3MT 2022 | Designed by <a href="https://dexterous.in">Dexterous Technology</a></p>
              </div>
               
              <div class="col-md-6">
                  <ul class="list-btm-29">
                      <li><a href="#link">Privacy policy</a></li>
                      <li><a href="#link">Terms of service</a></li>
                      
                  </ul>
              </div>

          </div>
          
      </div>
  </div>
  <!-- move top -->
  <button onclick="topFunction()" id="movetop" title="Go to top">
    <span class="fa fa-angle-up"></span>
  </button>
  <script>
      // When the user scrolls down 20px from the top of the document, show the button
      window.onscroll = function () {
          scrollFunction()
      };

      function scrollFunction() {
          if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
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
<script src="assets/js/jquery-3.3.1.min.js"></script>
<!-- //footer-28 block -->
</section>
<script>
  $(function () {
    $('.navbar-toggler').click(function () {
      $('body').toggleClass('noscroll');
    })
  });
</script>
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
  integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
  integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous">
</script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
  integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous">
</script>

<!-- Template JavaScript -->
<script src="assets/js/all.js"></script>
<!-- Smooth scrolling -->
<!-- <script src="assets/js/smoothscroll.js"></script> -->
<script src="assets/js/owl.carousel.js"></script>

<!-- script for -->
<script>
  $(document).ready(function () {
    $('.owl-one').owlCarousel({
      loop: true,
      margin: 0,
      nav: true,
      responsiveClass: true,
      autoplay: false,
      autoplayTimeout: 5000,
      autoplaySpeed: 1000,
      autoplayHoverPause: false,
      responsive: {
        0: {
          items: 1,
          nav: false
        },
        480: {
          items: 1,
          nav: false
        },
        667: {
          items: 1,
          nav: true
        },
        1000: {
          items: 1,
          nav: true
        }
      }
    })
  })
</script>
<!-- //script -->

</body>

</html>
