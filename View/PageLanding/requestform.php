<?php 
session_start();

// Prevent browser from caching the login page
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0"); // HTTP 1.1.
header("Pragma: no-cache"); // HTTP 1.0.
header("Expires: 0"); // Proxies.

// Check if the user wants to log out
if (isset($_GET['action']) && $_GET['action'] === 'logout') {
    // Destroy all session data to log the user out
    session_unset();
    session_destroy();
    
    // Redirect to login page after logout
    header("Location: ../../index.php");
    exit();
}

// Check if the user is already logged in
if (isset($_SESSION['email']) && isset($_SESSION['user_type'])) {
  // Retrieve user status from session or query it from the database, if necessary
  $userType = $_SESSION['user_type'];
  $r_status = $_SESSION['r_status']; // Assumes r_status is stored in session when logging in
  
  // Redirect based on user type and r_status
  switch ($userType) {
      case "Staff":
          if ($r_status === "Active") {
              header("Location: ../PageStaff/StaffDashboard.php");
              exit();
          }
          break;
      case "Citizen":
          if ($r_status === "Approved") {
              header("Location: ../PageCitizen/CitizenPage.php");
              exit();
          }
          break;
          case "Priest":
            if ($r_status === "Active") {
                header("Location: ../PagePriest/index.php");
                exit();
            }
            break;
            case "Admin":
                  header("Location: ../PageAdmin/AdminDashboard.php");
                  exit();
              
              break;
  }
}


?>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>ARGAO CHURCH MANAGEMENT SYSTEM</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta content="" name="keywords" />
    <meta content="" name="description" />
    <link rel="icon" href="../assets/img/mainlogo.jpg" type="image/x-icon"
    />

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=DM+Sans:ital,opsz,wght@0,9..40,100..1000;1,9..40,100..1000&family=Inter:slnt,wght@-10..0,100..900&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link rel="stylesheet" href="lib/animate/animate.min.css"/>
        <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
        <style>
        .text-center  p{
    color:#3b3b3b; text-align: justify; text-justify: inter-word; font-size: 15px; line-height: 1.6; margin-top: 10px; margin-left: 10px;
}


        .gallery {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            margin-top: 2rem;
            margin-bottom: 3rem;
        }
        .gallery img {
            width: 40%;
            max-width: calc(25% - 1rem);
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }
        .back-button {
float:right;       
margin-right:110px;  
margin-top:20px;  

            padding: 0.5rem 1rem;
            background-color: #0066a8;
            color: #fff;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }
        .back-button:hover {
            background-color: #004a80;
        }
        .schedule {
float:left;       
margin-LEFT:20px;  

            padding: 10px;
            color: #3b3b3b;
            border: none;
            border-radius: 5px;
            text-decoration: none;
            font-size: 12PX;
            transition: background-color 0.3s ease;
        }
       
        .schedule:hover{
            color:wheat!important;
        }
        .baptismalreq i{
            font-size:7px;
            margin-right:15px;
            color:black;
        }
        .bg-breadcrumb {
  position: relative;
  overflow: hidden;
  background: linear-gradient(rgba(1, 94, 201, 0.616), rgba(0, 0, 0, 0.2)),
  url(../assets/img/funeral.jpeg);
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  padding: 60px 0 60px 0;
  transition: 0.5s;
}

.bg-breadcrumb .breadcrumb {
  position: relative;
}

.bg-breadcrumb .breadcrumb .breadcrumb-item a {
  color: var(--bs-white);
}
    </style>
    </head>

    <body>
 <!-- Navbar & Hero Start -->
 <div class="container-fluid nav-bar px-0 px-lg-4 py-lg-0">
      <div class="container">
      <?php require_once 'navbar.php'?>

      </div>
    </div>
    <!-- Navbar & Hero End -->
      

        <!-- Header Start -->
        <div class="container-fluid bg-breadcrumb">
            <div class="container text-center py-5" style="max-width: 900px;">
                <h4 class="text-white display-4 mb-4 wow fadeInDown" data-wow-delay="0.1s">FUNERAL</h4>
                  
            </div>
        </div>
        <!-- Header End -->
<!-- Service Start -->


<div class="container-fluid service py-5">
  
        <div class="container py-5" style="padding-top:0!important;">
        
        <div class="text-center mx-auto pb-5 wow fadeInUp" data-wow-delay="0.2s">

          <div class="gallery">
            
         
          </div>
            <P style="TEXT-ALIGN: left;">Welcome to the Request of Masses page of the Argao Parish Church, Cebu. Here, we offer you the opportunity to request Masses for various occasions, both inside and outside our church, allowing you to celebrate special events in a way that best suits your needs. Whether you wish to mark a joyous occasion or need the comfort of prayer during a time of mourning, we are here to help facilitate your spiritual needs. This page will guide you through the process of requesting Masses for various services, ensuring that you can celebrate and commemorate your significant moments with our faith community.
</P>
            

        </div>
        <div class="baptismalreq">
        <h5 style="font-weight: BOLDER; padding-left:10px;">CHOOSE YOUR REQUEST TYPE

</h5>
        <br>

        <h5 style="font-weight: BOLDER; padding-left:10px;">Inside Request Form
            <br>
       <p style="font-weight: normal;">For Masses to be held within the sacred walls of the Argao Parish Church, this option is for individuals or groups who wish to request a Mass to be celebrated within the church premises. This includes all types of Masses such as regular Sunday Masses, special feasts, and seasonal liturgies. The Argao Parish Church, with its beautiful ambiance and rich tradition, serves as a central place for community gatherings, and we are honored to host your special Masses. Whether it's for a wedding, a baptism, a special prayer intention, or simply a spiritual reflection, this form is intended for events within our church, where the congregation can gather in prayer and worship.
</p>
<button  class="btn btn-primary btn-round" type="button" onclick="window.location.href='FillScheduleForm.php?type=RequestForm'">
       Inside Request Form
    </button>
    <BR></BR>
<br>
<h5 style="font-weight: BOLDER; padding-left:10px;">Outside Request Form
    <br>
       <p style="font-weight: normal;">This form is intended for those who wish to request a Mass to be held outside the Argao Parish Church, whether it be in homes, community gatherings, or at other locations within the parish area. Many of our parishioners seek to hold Masses at significant locations such as private residences, at a hospital for the sick, or even in cemeteries for the dearly departed. These Masses are equally important in our faith and allow us to bring the church’s presence and blessings wherever they are needed most. By choosing this form, you are ensuring that your requested Mass will be celebrated in a location outside of the church, bringing the sacredness of the liturgy to your chosen site.
 
</p>
<button  class="btn btn-primary btn-round" type="button" onclick="window.location.href='FillRequestSchedule.php?type=RequestForm'">
        Outside Request Form
    </button>
</div>

<BR>
<br>
<div class="baptismalreq">
        <h5 style="font-weight: BOLDER; padding-left:10px;">AVAILABLE MASSES:</h5>
        <br>
        <P>1.  &nbsp;
       <STRong> Fiesta Mass: </STRong>Celebrate the feast of the patron saint with a special Mass.</P>
        <P>2. &nbsp;
       <strong>Novena Mass:</strong>  A series of prayers and Masses leading up to a significant feast or event.</P>
        <P>3.&nbsp;
        <strong> Wake Mass:</strong> A Mass offered in remembrance of the deceased.</P>
        <P>4.&nbsp;
        <strong>Monthly Mass:</strong>  A recurring Mass held once every month for various intentions.</P>
        <P>5.&nbsp;
        <strong>1st Friday Mass:</strong>  A special Mass offered on the first Friday of each month.</P>
        <P>6.&nbsp;
        <strong>Cemetery Chapel Mass:</strong>  A Mass held at the cemetery chapel for the souls of the departed.</P>
        <P>7.&nbsp;
        <strong>Baccalaureate Mass:</strong>  A Mass celebrated in honor of graduates as they mark a significant milestone.</P>
        <P>8.&nbsp;
        <strong>Anointing of the Sick:</strong> A Mass and sacrament offering healing prayers for those in need.</P>
        <P>9.&nbsp;
        <strong> Blessing:</strong> A special Mass to invoke blessings for a home, event, or individual.</P>
        <P>10.&nbsp;
        <strong>Special Mass:</strong>  Custom Masses offered for unique occasions or intentions.</P>
     
      
        
    

</div>
<BR>
<br>



        </div>
    </div>


    <?php require_once 'footer.php'?>


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary btn-lg-square rounded-circle back-to-top"><i class="fa fa-arrow-up"></i></a>   

        <script>
    var acc = document.getElementsByClassName("accordion");
    var i;

    for (i = 0; i < acc.length; i++) {
        acc[i].addEventListener("click", function() {
            this.classList.toggle("active");
            var panel = this.nextElementSibling;
            if (panel.style.display === "block") {
                panel.style.display = "none";
            } else {
                panel.style.display = "block";
            }
        });
    }
</script>
        <!-- JavaScript Libraries -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="lib/wow/wow.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/counterup/counterup.min.js"></script>
        <script src="lib/lightbox/js/lightbox.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>