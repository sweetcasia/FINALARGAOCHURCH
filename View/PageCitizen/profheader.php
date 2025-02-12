<?php

if (!isset($_SESSION['email']) || !isset($_SESSION['user_type'])) {
    header("Location: ../../index.php");
    exit();
}

// Redirect based on user type
switch ($_SESSION['user_type']) {
    case 'Citizen':
        // Allow access
        break;
    case 'Admin':
        header("Location: ../PageAdmin/AdminDashboard.php");
        exit();
    case 'Staff':
        header("Location: ../PageStaff/StaffDashboard.php");
        exit();
    case 'Priest':
        header("Location: ../PagePriest/index.php");
        exit();
    default:
        header("Location: ../../index.php");
        exit();
}

// Validate specific Citizen data
if (!isset($_SESSION['fullname']) || !isset($_SESSION['citizend_id'])) {
    header("Location: ../../index.php");
    exit();
}

// Assign session variables
$nme = $_SESSION['fullname'];
$regId = $_SESSION['citizend_id'];

?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>ARGAO CHURCH MANAGEMENT SYSTEM</title>
    <meta
      content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
      name="viewport"
    />
    <link rel="icon" href="../assets/img/kaiadmin/favicon.ico" type="image/x-icon"
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <!-- Fonts and icons -->
    <script src="../assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
      WebFont.load({
        google: { families: ["Public Sans:300,400,500,600,700"] },
        custom: {
          families: [
            "Font Awesome 5 Solid",
            "Font Awesome 5 Regular",
            "Font Awesome 5 Brands",
            "simple-line-icons",
          ],
          urls: ["assets/css/fonts.min.css"],
        },
        active: function () {
          sessionStorage.fonts = true;
        },
      });
    </script>
<style>
 .notification-item {
    display: flex;            /* Use flexbox for alignment */
    align-items: center;     /* Vertically center items */
    padding: 10px;           /* Add padding for spacing */
    border-bottom: 1px solid #e0e0e0; /* Bottom border for separation */
}

.notif-icon {
    margin-right: 10px;      /* Space between icon and text */
    font-size: 24px;         /* Adjust icon size */
    color: #007bff;          /* Icon color */
}

.notif-content {
    flex-grow: 1;            /* Allow content to take remaining space */
}

.notif-content .block {
    display: block;          /* Make the link block-level for better spacing */
    font-weight: 500;        /* Bold font for better visibility */
}

.notif-content .time {
    font-size: 12px;         /* Smaller font for timestamp */
    color: #888;             /* Lighter color for less emphasis */
}
</style>
    <!-- CSS Files -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../assets/css/plugins.min.css" />
    <link rel="stylesheet" href="../assets/css/kaiadmin.min.css" />

    <!-- CSS Just for demo purpose, don't include it in your project -->
  </head> <body>
  <div class="main-header">
          <div class="main-header-logo">
            <!-- Logo Header -->
            <div class="logo-header" data-background-color="dark">
              <a href="index.html" class="logo">
                <img
                  src="assets/img/kaiadmin/logo_light.svg"
                  alt="navbar brand"
                  class="navbar-brand"
                  height="20"
                />
              </a>
              <div class="nav-toggle">
                <button class="btn btn-toggle toggle-sidebar">
                  <i class="gg-menu-right"></i>
                </button>
                <button class="btn btn-toggle sidenav-toggler">
                  <i class="gg-menu-left"></i>
                </button>
              </div>
              <button class="topbar-toggler more">
                <i class="gg-more-vertical-alt"></i>
              </button>
            </div>
            <!-- End Logo Header -->
          </div>
          <!-- Navbar Header -->
          <nav
            class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom"
          >
            <div class="container-fluid">
              <nav
                class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
              >
                <div class="input-group">
                  <div class="input-group-prepend">
                  
                  </div>
                 
                </div>
              </nav>

              <ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
                <li
                  class="nav-item topbar-icon dropdown hidden-caret d-flex d-lg-none"
                >
                  <a
                    class="nav-link dropdown-toggle"
                    data-bs-toggle="dropdown"
                    href="#"
                    role="button"
                    aria-expanded="false"
                    aria-haspopup="true"
                  >
                    <i class="fa fa-search"></i>
                  </a>
                  <ul class="dropdown-menu dropdown-search animated fadeIn">
                    <form class="navbar-left navbar-form nav-search">
                      <div class="input-group">
                        <input
                          type="text"
                          placeholder="Search ..."
                          class="form-control"
                        />
                      </div>
                    </form>
                  </ul>
                </li>
                
                 <!-- start for notification bell -->
                
                <!-- end for notification -->

              
               

                <li class="nav-item topbar-user dropdown hidden-caret">
                  <a
                    class="dropdown-toggle profile-pic"
                    data-bs-toggle="dropdown"
                    href="#"
                    aria-expanded="false"
                  >
                  <?php
$loggedInUserName = isset($nme) ? $nme : 'Guest'; // Assumes $nme is the logged-in user's name
$nameParts = explode(' ', $loggedInUserName); // Splits the name into parts by spaces
$firstName = $nameParts[0]; // Gets the first part (first name)
$initial = strtoupper(substr($firstName, 0, 1)); // Gets the first letter of the first name and makes it uppercase
?>


<div class="avatar">
  <span class="avatar-title rounded-circle border border-white bg-secondary">
    <?php echo $initial; ?>
  </span>
</div>
<span class="profile-username">
  <span class="op-7">Welcome,</span>
  <span class="fw-bold"><?php echo $loggedInUserName; ?></span>
</span>

<ul class="dropdown-menu dropdown-user animated fadeIn">
  <div class="dropdown-user-scroll scrollbar-outer">
    <li>
      <div class="user-box">
      <div class="avatar-lg">
  <div class="avatar-title rounded-circle border border-white bg-secondary text-white d-flex align-items-center justify-content-center" style="width: 60px; height: 60px; font-size: 24px;">
    <?php echo $initial; ?>
  </div>

        </div>
        <div class="u-text">
          <h4><?php echo $nme; ?></h4>
          <p class="text-muted"><?php echo $loggedInUserEmail; ?></p>
          <a href="profile.php" class="btn btn-xs btn-secondary btn-sm">View Profile</a>
        </div>
      </div>
    </li>
                      <li>
                        <div class="dropdown-divider"></div>
                
                 
                        <a class="dropdown-item" href="../../index.php?action=logout">Logout</a>
                      </li>
                    </div>
                  </ul>
                </li>
              </ul>
            </div>
          </nav>
          <!-- End Navbar -->
        </div>  
  </body>
  
    </body>
</html>
