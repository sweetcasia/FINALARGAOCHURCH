<?php
require_once '../../Model/db_connection.php';
require_once '../../Controller/citizen_con.php';
require_once '../../Model/citizen_mod.php';
// Retrieve date and time from session
$scheduleDate = $_SESSION['selectedDate'] ?? null;
$startTime = $_SESSION['startTime'] ?? null;
$endTime = $_SESSION['endTime'] ?? null;

// Assuming you're storing session data for the user's name and citizen ID
$nme = $_SESSION['fullname'];
$regId = $_SESSION['citizend_id'];

// Create instances of the required classes
$citizen = new Citizen($conn);
$staff = new Staff($conn);

// Fetch available priests based on the selected schedule
$priests = $citizen->getAvailablePriests($scheduleDate, $startTime, $endTime);
$loggedInUserEmail = isset($_SESSION['email']) ? $_SESSION['email'] : null;
$r_status = isset($_SESSION['user_type']) ? $_SESSION['user_type'] : null;

if (!$loggedInUserEmail) {
  header("Location: ../../index.php");
  exit();
}

// Redirect staff users to the staff page, not the citizen page
if ($r_status === "Citizen") {
  header("Location: ../PageCitizen/CitizenPage.php"); // Change to your staff page
  exit();
}
if ($r_status === "Admin") {
  header("Location: ../PageAdmin/AdminDashboard.php"); // Change to your staff page
  exit();
}if ($r_status === "Priest") {
  header("Location: ../PagePriest/index.php"); // Change to your staff page
  exit();
}


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


// Retrieve data from sessionStorage
const selectedDate = sessionStorage.getItem('selectedDate');
const startTime = sessionStorage.getItem('startTime');
const endTime = sessionStorage.getItem('endTime');

// Use the retrieved data as needed
console.log('Selected Date:', selectedDate);
console.log('Start Time:', startTime);
console.log('End Time:', endTime);

document.addEventListener('DOMContentLoaded', function() {
    const selectedDate = sessionStorage.getItem('selectedDate');
    const selectedTimeRange = sessionStorage.getItem('selectedTimeRange');
    console.log('Selected Date:', selectedDate);  // Check if date is properly stored
    console.log('Selected Time Range:', selectedTimeRange);  // Check if time range is stored correctly

    if (selectedDate) {
        document.getElementById('date').value = selectedDate;
    }

    if (selectedTimeRange) {
        const [startTime, endTimeWithStatus] = selectedTimeRange.split(' - ');
        const endTime = endTimeWithStatus.replace(" Available", "").trim();  // Remove "Available" if present
        document.getElementById('start_time').value = startTime.trim();
        document.getElementById('end_time').value = endTime;
    }
});

document.addEventListener('DOMContentLoaded', function() {
    document.querySelector('.btn-info').addEventListener('click', function() {
        // Select all input and textarea fields within the form
        document.querySelectorAll('.form-control').forEach(function(element) {
            console.log('Clearing element:', element.id, element.type, element.value); // Debug info
            // Clear text inputs, textareas, and date inputs
            if (element.type === 'text' || element.tagName === 'TEXTAREA' || element.type === 'date') {
                if (element.id !== 'date' && element.id !== 'start_time' && element.id !== 'end_time') {
                    element.value = ''; // Clear the value
                }
            } else if (element.type === 'radio' || element.type === 'checkbox') {
                element.checked = false; // Uncheck radio and checkbox inputs
            }
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


small {
    display: block;
    color: #555;
    margin-top: 5px;
}
.error {
        color: red;
        font-size: 0.875em;
        margin-top: 0.25em;
    }
    .form-control.error {
        border: 1px solid red;
    }
    .border-error {
    border: 1px solid red !important; /* Adding !important for higher specificity */
    border-radius: 1px; /* Optional: for rounded corners */
}


    </style>
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
  <body>
  <?php  require_once 'sidebar.php'?>
      <div class="main-panel">
      <?php  require_once 'header.php'?>
        
     
        <div class="container">
            <div class="page-inner">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <div class="card-title">Walk in FuneralFill-up Form</div>
                    </div>
                    <div class="card-body">
                    <form method="post" action="../../Controller/citizen_con.php" onsubmit="return validateFuneralForm()">
                
                    <div class="row">
                    <input type="hidden" name="walkinfuneral_id" value="Funeral">
        <div class="col-md-6 col-lg-4">
            <!-- Date -->
            <div class="form-group">
                <label for="date">Date</label>
                <input type="text" class="form-control" id="date" name="date" placeholder="" readonly />
                <span class="error" id="dateError"></span>
            </div>

            <!-- Firstname of Deceased Person -->
            <div class="form-group">
                <label for="firstname">Firstname of Deceased Person</label>
                <input type="text" class="form-control" id="firstname" name="firstname" placeholder="Enter Firstname"
        />
                <div id="firstnameError" class="error text-danger"></div>
            </div>

            <!-- Lastname of Deceased Person -->
            <div class="form-group">
                <label for="lastname">Last Name of Deceased Person</label>
                <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Enter Lastname"
        />
                <div id="lastnameError" class="error text-danger"></div>
            </div>

            <!-- Middlename of Deceased Person -->
            <div class="form-group">
                <label for="middlename">Middle Name of Deceased Person</label>
                <input type="text" class="form-control" id="middlename" name="middlename" placeholder="Enter Middlename"
          />
                <div id="middlenameError" class="error text-danger"></div>
            </div>

            <!-- Address -->
            <div class="form-group">
                <label for="address">Address</label>
                <textarea class="form-control" id="address" name="d_address" placeholder="Enter Address"></textarea>
                <div id="addressError" class="error text-danger"></div>
            </div>

            <!-- Gender -->
            <div class="form-group">
                <label>Gender</label><br />
                <div class="d-flex">
                    <div class="form-check">
                        <input
                            class="form-check-input"
                            type="radio"
                            name="d_gender"
                            id="flexRadioDefault1"
                            value="Male"
                          
                        />
                        <label class="form-check-label" for="flexRadioDefault1">Male</label>
                    </div>
                    <div class="form-check">
                        <input
                            class="form-check-input"
                            type="radio"
                            name="d_gender"
                            id="flexRadioDefault2"
                            value="Female"
                          
                        />
                        <label class="form-check-label" for="flexRadioDefault2">Female</label>
                    </div>
                </div>
                <div id="genderError" class="error text-danger"></div>
            </div>

            <!-- Cause of Death -->
            <div class="form-group">
                <label for="religion">Cause of Death (skip this if you don't know)</label>
                <input type="text" class="form-control" id="cause_of_death" name="cause_of_death" placeholder="" />
                <div id="causeOfDeathError" class="error text-danger"></div>
            </div>

            <!-- Marital Status -->
            <div class="form-group">
                <label for="marital_status">Marital Status</label>
                <select class="form-control" id="marital_status" name="marital_status">
                    <option value="" disabled selected>Select your status</option>
                    <option value="Single">Single</option>
                    <option value="Married">Married</option>
                    <option value="Widow">Widow</option>
                    <option value="Divorced">Divorced</option>
                </select>
                <div id="maritalStatusError" class="error text-danger"></div>
            </div>
        </div>

        <div class="col-md-6 col-lg-4">
            <!-- Start Time -->
            <div class="form-group">
                <label for="start_time">Start Time</label>
                <input type="text" class="form-control" id="start_time" name="start_time" placeholder="" readonly />
                <div id="startTimeError" class="error text-danger"></div>
            </div>

            <!-- Place of Birth -->
            <div class="form-group">
                <label for="pbirth">Place of Birth</label>
                <input type="text" class="form-control" id="pbirth" name="place_of_birth" placeholder="Enter Place of Birth" />
                <div id="placeOfBirthError" class="error text-danger"></div>
            </div>

            <!-- Date of Birth -->
            <div class="form-group">
                <label>Date of Birth</label>
                <div class="birthday-selectors">
                    <select id="month" name="month">
                        <option value="">Month</option>
                        <!-- Month options -->
                        <?php for ($i = 1; $i <= 12; $i++): ?>
                            <option value="<?php echo sprintf('%02d', $i); ?>"><?php echo date('F', mktime(0, 0, 0, $i, 10)); ?></option>
                        <?php endfor; ?>
                    </select>

                    <select id="day" name="day">
                        <option value="">Day</option>
                        <!-- Day options -->
                        <?php for ($i = 1; $i <= 31; $i++): ?>
                            <option value="<?php echo sprintf('%02d', $i); ?>"><?php echo $i; ?></option>
                        <?php endfor; ?>
                    </select>

                    <select id="year" name="year">
                        <option value="">Year</option>
                        <!-- Year options -->
                        <?php for ($i = date('Y'); $i >= 1900; $i--): ?>
                            <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                        <?php endfor; ?>
                    </select>
                </div>
                <div id="dobError" class="error text-danger"></div>
            </div>

            <!-- Father's Fullname -->
            <div class="form-group">
                <label for="father_name">Father's Fullname</label>
                <input type="text" class="form-control" id="father_name" name="father_fullname" placeholder="Enter Father's Fullname" />
                <div id="fatherNameError" class="error text-danger"></div>
            </div>

            <!-- Mother's Fullname -->
            <div class="form-group">
                <label for="mother_name">Mother's Fullname</label>
                <input type="text" class="form-control" id="mother_name" name="mother_fullname" placeholder="Enter Mother's Fullname" />
                <div id="motherNameError" class="error text-danger"></div>
            </div>
        </div>

        <div class="col-md-6 col-lg-4">
            <!-- End Time -->
            <div class="form-group">
                <label for="end_time">End Time</label>
                <input type="text" class="form-control" id="end_time" name="end_time" placeholder="" readonly />
                <div id="endTimeError" class="error text-danger"></div>
            </div>

            <!-- Parents Residence -->
            <div class="form-group">
                <label for="parents_residence">Parents Residence</label>
                <textarea class="form-control" id="parents_residence" name="parents_residence" placeholder="Enter Parents Residence"></textarea>
                <div id="parentsResidenceError" class="error text-danger"></div>
            </div>

            <!-- Place of Death -->
            <div class="form-group">
                <label for="place_of_death">Place of Death</label>
                <input type="text" class="form-control" id="place_of_death" name="place_of_death" placeholder="Enter Place" />
                <div id="placeOfDeathError" class="error text-danger"></div>
            </div>

            <!-- Date of Death -->
            <div class="form-group">
                <label>Date of Death</label>
                <div class="birthday-selectors">
                    <select id="months" name="months">
                        <option value="">Month</option>
                        <!-- Month options -->
                        <?php for ($i = 1; $i <= 12; $i++): ?>
                            <option value="<?php echo sprintf('%02d', $i); ?>"><?php echo date('F', mktime(0, 0, 0, $i, 10)); ?></option>
                        <?php endfor; ?>
                    </select>

                    <select id="days" name="days">
                        <option value="">Day</option>
                        <!-- Day options -->
                        <?php for ($i = 1; $i <= 31; $i++): ?>
                            <option value="<?php echo sprintf('%02d', $i); ?>"><?php echo $i; ?></option>
                        <?php endfor; ?>
                    </select>

                    <select id="years" name="years">
                        <option value="">Year</option>
                        <!-- Year options -->
                        <?php for ($i = date('Y'); $i >= 1900; $i--): ?>
                            <option value="<?php echo $i; ?>"><?php echo $i; ?></option>
                        <?php endfor; ?>
                    </select>
                </div>
                <div id="dodError" class="error text-danger"></div>
            </div>
        </div>
    </div>

    <div class="card-action">
    <div class="card-header">
                        <div class="card-title">Seminar Schedule and Payableamount</div>
                    </div>
    <div class="col-md-6 col-lg-4">

    <div class="form-group"> 
        <label for="eventType">Select Priest</label>
        <select class="form-control" id="eventType" name="eventType">
            <option value="" disabled <?php if (!isset($_POST['eventType']) || $_POST['eventType'] === '') echo 'selected'; ?>>Select Priest</option>
            <?php foreach ($priests as $priest): ?>
                <option value="<?php echo htmlspecialchars($priest['citizend_id']); ?>" 
                    <?php if (isset($_POST['eventType']) && $_POST['eventType'] == $priest['citizend_id']) echo 'selected'; ?>>
                    <?php echo htmlspecialchars($priest['fullname']); ?>
                </option>
            <?php endforeach; ?>
        </select>
        <span class="error" id="eventTypeError"></span>
            <?php echo isset($errors['eventType']) ? $errors['eventType'] : ''; ?>
        </span>
    </div>
<div class="form-group">
    <label for="pay_amount">Payable Amount</label>
    <input type="number" class="form-control" id="pay_amount" name="pay_amount" placeholder="Enter Payable Amount" />
    <span class="error" id="payAmountError" class="error text-danger"></span>
</div>
 
       
        </div>
            </div>
    <div class="card-action">
        <button type="submit" class="btn btn-success">Submit</button>
        <button type="button" class="btn btn-danger" onclick="window.location.href='FillScheduleForm.php?type=Funeral'">Cancel</button>
        <button type="button" class="btn btn-info" onclick="clearForm()">Clear</button>
    </div>
</form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
 function validateFuneralForm() {
    let isValid = true;

    // Helper function to validate text fields
    function validateField(id, errorId, message) {
        const field = document.getElementById(id);
        const value = field ? field.value.trim() : '';
        if (value === '') {
            document.getElementById(errorId).innerText = message;
            field.classList.add('error');
            isValid = false;
        } else {
            document.getElementById(errorId).innerText = '';
            field.classList.remove('error');
        }
    }

    // Helper function to validate select fields
    function validateSelect(id, errorId, message) {
        const field = document.getElementById(id);
        const value = field ? field.value.trim() : '';
        if (value === '') {
            document.getElementById(errorId).innerText = message;
            field.classList.add('error');
            isValid = false;
        } else {
            document.getElementById(errorId).innerText = '';
            field.classList.remove('error');
        }
    }

    // Clear previous error messages and styles
    document.querySelectorAll('.error').forEach(e => e.innerHTML = '');
    document.querySelectorAll('.form-control').forEach(e => e.classList.remove('error'));

    // Validate text fields
    validateField('firstname', 'firstnameError', 'Firstname is required');
    validateField('lastname', 'lastnameError', 'Lastname is required');
    validateField('address', 'addressError', 'Address is required');
    validateField('pbirth', 'placeOfBirthError', 'Place of Birth is required');
    validateField('father_name', 'fatherNameError', 'Father\'s Fullname is required');
    validateField('mother_name', 'motherNameError', 'Mother\'s Fullname is required');
    validateField('parents_residence', 'parentsResidenceError', 'Parents Residence is required');
    validateField('place_of_death', 'placeOfDeathError', 'Place of Death is required');
    validateField('date', 'dateError', 'Date is required');
    validateField('start_time', 'startTimeError', 'Start Time is required');
    validateField('end_time', 'endTimeError', 'End Time is required');
    // Validate date of birth
    const month = document.getElementById('month').value;
    const day = document.getElementById('day').value;
    const year = document.getElementById('year').value;
    if (!month || !day || !year) {
        document.getElementById('dobError').innerText = 'Date of Birth is required';
        isValid = false;
    } else {
        document.getElementById('dobError').innerText = '';
    }

    // Validate date of death
    const deathMonth = document.getElementById('months').value;
    const deathDay = document.getElementById('days').value;
    const deathYear = document.getElementById('years').value;
    if (!deathMonth || !deathDay || !deathYear) {
        document.getElementById('dodError').innerText = 'Date of Death is required';
        isValid = false;
    } else {
        document.getElementById('dodError').innerText = '';
    }
    function validateSelect(selectId, errorId, errorMessage) {
    const selectElement = document.getElementById(selectId);
    const errorElement = document.getElementById(errorId);
    
    if (selectElement.value === "") {
        errorElement.textContent = errorMessage;
        selectElement.classList.add('border-error'); // Add error border
        console.log(`Class added to ${selectId}`); // Debugging line
        isValid = false;
    } else {
        errorElement.textContent = ""; // Clear the error if a valid option is selected
        selectElement.classList.remove('border-error'); // Remove error border
        console.log(`Class removed from ${selectId}`); // Debugging line
    }
}

    validateSelect('eventType', 'eventTypeError', 'Please select a Priest.');
    validateSelect('marital_status', 'maritalStatusError', 'Please select a Priest.');


    
 const payAmount = document.getElementById('pay_amount').value;
    if (payAmount === '' || isNaN(payAmount) || payAmount <= 0) {
        document.getElementById('payAmountError').innerText = 'Please enter a valid payable amount';
        document.getElementById('pay_amount').classList.add('error');
        isValid = false;
    } else {
        document.getElementById('payAmountError').innerText = '';
        document.getElementById('pay_amount').classList.remove('error');
    }

    return isValid;
}
document.getElementById('submitBtn').addEventListener('click', function(event) {
    let isValid = true;

   

    // Prevent form submission if not valid
    if (!isValid) {
        event.preventDefault();
    }
});

</script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8auK+4szKfEFbpLHsTf7iJgD/+ub2oU" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.js"></script>
    <!--   Core JS Files   -->
    <script src="../assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="../assets/js/core/popper.min.js"></script>
    <script src="../assets/js/core/bootstrap.min.js"></script>

    <!-- jQuery Scrollbar -->
    <script src="../assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

  
    <!-- Kaiadmin JS -->
    <script src="../assets/js/kaiadmin.min.js"></script>

  
    </script>
  </body>
</html>
