<?php
require_once '../../Model/staff_mod.php';
require_once '../../Controller/fetchpending_con.php';
require_once '../../Model/db_connection.php';
require_once '../../Model/citizen_mod.php';
$citizen = new Citizen($conn);
$staff = new Staff($conn);
// Check if user is logged in
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
    <link rel="icon" href="../assets/img/mainlogo.jpg" type="image/x-icon"
    />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
    <!-- Fonts and icons -->
    <script src="assets/js/plugin/webfont/webfont.min.js"></script>
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


      document.addEventListener('DOMContentLoaded', function() {
    document.querySelector('.btn-info').addEventListener('click', function() {
        // Select all input, textarea, and select elements within the form
        document.querySelectorAll('.form-control, select').forEach(function(element) {
            console.log('Clearing element:', element.id, element.type, element.value); // Debug info

            // Clear text inputs, textareas, and date inputs
            if ((element.type === 'text' || element.tagName === 'TEXTAREA' || element.type === 'date') &&
                element.id !== 'date' && element.id !== 'start_time' && element.id !== 'end_time') {
                element.value = ''; // Clear the value
            } else if (element.type === 'radio' || element.type === 'checkbox') {
                element.checked = false; // Uncheck radio and checkbox inputs
            } else if (element.tagName === 'SELECT') {
                element.selectedIndex = 0; // Reset select elements to the first option
            }
        });

        // Clear any error messages
        document.querySelectorAll('.error').forEach(function(error) {
            error.textContent = ''; // Clear error messages
        });
    });
});


document.getElementById('baptismForm').addEventListener('submit', function(event) {
    // Get the values of the first name, last name, and middle name
    var firstname = document.getElementById('firstname').value.trim();
    var lastname = document.getElementById('lastname').value.trim();
    var middlename = document.getElementById('middlename').value.trim();

    // Concatenate them into a full name
    var fullname = firstname + ' ' + middlename + ' ' + lastname;

    // Set the concatenated full name into the hidden fullname input
    document.getElementById('fullname').value = fullname;
});
function toggleChapelInput() {
    const select = document.getElementById('exampleFormControlSelect1');
    const chapelInputGroup = document.getElementById('chapelInputGroup');
    
    if (select.value === 'Fiesta Mass') {
      chapelInputGroup.style.display = 'block';
    } else {
      chapelInputGroup.style.display = 'none';
    }
  }

    </script>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
 integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl7/1L_dstPt3HV5HzF6Gvk/e3s4Wz6iJgD/+ub2oU" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <!-- CSS Files -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../assets/css/plugins.min.css" />
    <link rel="stylesheet" href="../assets/css/kaiadmin.min.css" />

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="../assets/css/demo.css" />
   
  </head>
  
   <!-- Navbar & Hero Start -->
   <div class="container-fluid nav-bar px-0 px-lg-4 py-lg-0">
      <div class="container">
       
      <?php require_once 'header.php'?>

      </div>
    </div>
    <!-- Navbar & Hero End -->
    
  <div class="container">
    <div class="page-inner">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">REQUEST FORM</div>
                    </div>
                    <div class="card-body">
                        <form method="post" action="../../Controller/citizen_con.php" onsubmit="return validateForm()">
                            <input type="hidden" name="specialrequestform_id" value="requestform">
 
                            <div class="row">
                                <div class="col-md-6 col-lg-4">
     
                                    <div class="form-group">
                                        <label for="selectrequests">Select Type of Special Masses</label>
                                        <select class="form-select" name="selectrequest" id="selectrequests">
                                            <option value="">Select</option>
                               
                                            <option>Thanksgiving</option>
                                        
                                            <option>Soul & Petition</option>
                                        </select>
                                        <span class="error" id="selectRequestError"></span>
                                    </div>

                                    <div class="form-group">
                                        <label for="chapel">Chapel</label>
                                        <input type="text" class="form-control" id="chapel" name="chapel" placeholder="Enter Chapel Name" />
                                        <span class="error" id="chapelError"></span>
                                    </div>

                                    <div class="form-group">
                                        <label for="firstname">Firstname of Person Requesting</label>
                                        <input type="text" class="form-control" id="firstname" name="firstname" placeholder="Enter Firstname" value="" />
                                        <span id="firstnameError" class="error text-danger"></span>
                                    </div>

                                    <div class="form-group">
                                        <label for="lastname">Last Name of Person Requesting</label>
                                        <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Enter Lastname" value="" />
                                        <span id="lastnameError" class="error text-danger"></span>
                                    </div>

                                    <div class="form-group">
                                        <label for="middlename">Middle Name of Person Requesting</label>
                                        <input type="text" class="form-control" id="middlename" name="middlename" placeholder="Enter Middlename" value="" />
                                        <span id="middlenameError" class="error text-danger"></span>
                                    </div>
                                </div>

                                <div class="col-md-6 col-lg-4">
                             
         
                                    <div class="form-group">
                                        <label for="address">Address</label>
                                        <input type="text" class="form-control" name="address" id="address" placeholder="Enter Address" value="" />
                                        <span class="error" id="addressError"></span>
                                    </div>

                                    <div class="form-group">
    <label for="follow_up_date">Date to Follow up</label>
    <input type="date" class="form-control" id="datetofollowup" name="datetofollowup" placeholder="" />
        <span class="error" id="dobError"></span>
        <div class="form-group">
                                        <label for="cpnumber">Contact Number</label>
                                        <label for="cpnumber">Ex:09*********</label>
                                        <input type="number" class="form-control" id="cpnumber" name="cpnumber" placeholder="Enter Contact Number" value="" />
                                        <span id="cpnumberError" class="error text-danger"></span>
                                    </div>
</div>
                                </div>
                                

                                <div class="col-md-6 col-lg-4">
                               
                               
                                   
                                    <div class="form-group">
                                        <label for="firstname">Firstname of Person(Pamisahan)</label>
                                        <input type="text" class="form-control" id="firstnames" name="firstnames" placeholder="Enter Firstname" value="" />
                                        <span id="firstnamesError" class="error text-danger"></span>
                                    </div>

                                    <div class="form-group">
                                        <label for="lastname">Last Name of Person(Pamisahan)</label>
                                        <input type="text" class="form-control" id="lastnames" name="lastnames" placeholder="Enter Lastname" value="" />
                                        <span id="lastnamesError" class="error text-danger"></span>
                                    </div>

                                    <div class="form-group">
                                        <label for="middlename">Middle Name of Person(Pamisahan)</label>
                                        <input type="text" class="form-control" id="middlenames" name="middlenames" placeholder="Enter Middlename" value="" />
                                        <span id="middlenamesError" class="error text-danger"></span>
                                    </div>
                                    
                                </div>
                                
                            </div>
                      
                        <div class="card-action">
                                <button class="btn btn-success">Submit</button>
                                <button type="button" class="btn btn-info" onclick="clearForm()">Clear</button>
                                <a href="javascript:history.back()" class="btn btn-danger">Cancel</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<?php require_once 'footer.php' ?>
    <script>
      // Get today's date
      
    const today = new Date();
    // Format the date as YYYY-MM-DD
    const yyyy = today.getFullYear();
    const mm = String(today.getMonth() + 1).padStart(2, '0'); // Months are zero-based
    const dd = String(today.getDate() + 1).padStart(2, '0'); // Add 1 to the current date
    const nextDay = `${yyyy}-${mm}-${dd}`;

    // Set the min attribute of the input field
    document.getElementById('datetofollowup').setAttribute('min', nextDay);
    function validateForm() {
    let isValid = true;

    // Helper function to validate field
    function validateField(id, errorId, message) {
        const field = document.getElementById(id);
        const value = field.value.trim();
        if (value === '') {
            document.getElementById(errorId).innerText = message;
            field.classList.add('error', 'text-danger');
            isValid = false;
        } else {
            document.getElementById(errorId).innerText = '';
            field.classList.remove('error', 'text-danger');
        }
    }

    // Clear previous error messages and styles
    document.querySelectorAll('.error.text-danger').forEach(e => e.innerHTML = '');
    document.querySelectorAll('.form-control').forEach(e => e.classList.remove('error', 'text-danger'));

    // Validate fields in the form
    validateField('firstname', 'firstnameError', 'Firstname is required');
    validateField('lastname', 'lastnameError', 'Lastname is required');

    validateField('address', 'addressError', 'Address is required');
  
    validateField('chapel', 'chapelError', 'Chapel is required');
    validateField('datetofollowup', 'dobError', 'Date must required');

    // Validate contact number specifically
    const cpnumberInput = document.getElementById('cpnumber');
    const cpnumberValue = cpnumberInput.value.trim();
    const cpnumberError = document.getElementById('cpnumberError');

    // Check if contact number is empty
    if (cpnumberValue === '') {
        cpnumberError.innerText = 'Contact Number is required';
        cpnumberInput.classList.add('error', 'text-danger');
        isValid = false;
    } 
    // Validate contact number format
    else if (cpnumberValue.length !== 11 || !cpnumberValue.startsWith('09')) {
        cpnumberError.innerText = 'Contact number must be 11 digits and start with "09".';
        cpnumberInput.classList.add('error', 'text-danger');
        isValid = false;
    } else {
        cpnumberError.innerText = '';
        cpnumberInput.classList.remove('error', 'text-danger');
    }

    // Validate request selection
    const selectrequest = document.getElementById('selectrequests').value;
    if (selectrequest === '') {
        document.getElementById('selectRequestError').innerText = 'Selected Request is required';
        isValid = false;
    } else {
        document.getElementById('selectRequestError').innerText = '';
    }

    return isValid;
}


    </script>
    <style>
              .birthday-input {
    font-family: Arial, sans-serif;
    margin-bottom: 10px;
}

.birthday-input label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.birthday-selectors {
    display: flex;
    gap: 5px;
}


.birthday-selectors select {
    padding: 5px;
    border: 1px solid #0a58ca;
    border-radius: 5px;
    width: 100px;
    font-size: 14px;
    color: #555;
}

.birthday-selectors select:focus {
    outline: none;
    border-color: #0a58ca;
}
.error {
        color: red;
        font-size: 0.875em;
        margin-top: 0.25em;
    }
    .form-control.error {
        border: 1px solid red;
    }
    </style>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8auK+4szKfEFbpLHsTf7iJgD/+ub2oU" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.js"></script>
    <!--   Core JS Files   -->
    <script src="../assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="../assets/js/core/popper.min.js"></script>
    <script src="../assets/js/core/bootstrap.min.js"></script>

    <!-- jQuery Scrollbar -->
    <script src="../assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

    <!-- Chart JS -->
    <script src="../assets/js/plugin/chart.js/chart.min.js"></script>

    <!-- jQuery Sparkline -->
    <script src="../assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

   



    <!-- Sweet Alert -->
    <script src="../assets/js/plugin/sweetalert/sweetalert.min.js"></script>

    <!-- Kaiadmin JS -->
    <script src="../assets/js/kaiadmin.min.js"></script>
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
