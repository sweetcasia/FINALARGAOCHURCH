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
    const dateInput = document.getElementById('date');

    // Validate the date input
    if (dateInput.value) {
        const selectedDate = new Date(dateInput.value);  // Get the provided date

        // Ensure the selected date is valid
        if (!isNaN(selectedDate.getTime())) {
            const saturdays = getSecondAndFourthSaturdays(new Date(), selectedDate);  // Get 2nd and 4th Saturdays from now until selected date
            populateSaturdaysDropdown(saturdays, selectedDate);  // Populate dropdown with those Saturdays
        } else {
            console.error("Error: Invalid date.");
            clearSaturdaysDropdown();  // Clear dropdown on invalid date
        }
    } else {
        console.error("Error: No date provided.");
        clearSaturdaysDropdown();  // Clear dropdown if no date
    }
});

function getSecondAndFourthSaturdays(startDate, endDate) {
    const saturdays = [];
    let currentDate = new Date(startDate.getFullYear(), startDate.getMonth(), 1);  // Start from the beginning of the current month

    // Loop through months until the end date is reached
    while (currentDate <= endDate) {
        const saturdaysInMonth = getSaturdaysInMonth(currentDate);
        const secondAndFourthSaturdays = saturdaysInMonth.filter((_, index) => index === 1 || index === 3);  // 2nd and 4th Saturdays
        saturdays.push(...secondAndFourthSaturdays);  // Add to the main list of Saturdays

        // Move to the next month
        currentDate.setMonth(currentDate.getMonth() + 1);
        currentDate.setDate(1);  // Reset to the first day of the new month
    }

    // Return only Saturdays up until the selected date
    return saturdays.filter(saturday => saturday <= endDate);
}

function getSaturdaysInMonth(date) {
    const saturdays = [];
    const year = date.getFullYear();
    const month = date.getMonth();
    let currentDate = new Date(year, month, 1);  // Start at the beginning of the month

    // Find the first Saturday of the month
    while (currentDate.getDay() !== 6) {
        currentDate.setDate(currentDate.getDate() + 1);
    }

    // Collect all Saturdays in the month
    while (currentDate.getMonth() === month) {
        saturdays.push(new Date(currentDate));  // Add Saturday to the list
        currentDate.setDate(currentDate.getDate() + 7);  // Move to the next Saturday
    }

    return saturdays;
}

// Function to populate dropdown with 2nd and 4th Saturdays before the selected date
function populateSaturdaysDropdown(saturdays, selectedDate) {
    const saturdaysDropdown = document.getElementById('saturdays');  // Correct ID for the dropdown
    saturdaysDropdown.innerHTML = '';  // Clear any previous options

    saturdays.forEach(saturday => {
        const selectedDateFormatted = formatDateToYYYYMMDD(selectedDate);
        const saturdayFormatted = formatDateToYYYYMMDD(saturday);

        // Only show the Saturday if it's before the selected date and NOT the selected date itself
        if (saturdayFormatted !== selectedDateFormatted && saturday < selectedDate) {
            const option = document.createElement('option');
            const formattedDate = formatDateToYYYYMMDD(saturday);  // Change to YYYY-MM-DD format
            const schedule_id = Math.random().toString(36).substr(2, 9);  // Random schedule ID for demo

            option.value = `${schedule_id}|${formattedDate}|8:00 AM|5:00 PM`;  // Four parts separated by '|'
            option.textContent = `${formattedDate} - 8:00 AM to 5:00 PM`;  // Displayed text
            saturdaysDropdown.appendChild(option);
        }
    });
}

// Function to clear the Saturdays dropdown
function clearSaturdaysDropdown() {
    const saturdaysDropdown = document.getElementById('saturdays');
    saturdaysDropdown.innerHTML = '';  // Clear any previous options
}

// Helper function to format date as 'YYYY-MM-DD'
function formatDateToYYYYMMDD(date) {
    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, '0');  // Month is 0-indexed, so add 1
    const day = String(date.getDate()).padStart(2, '0');  // Pad day with leading zero if necessary
    return `${year}-${month}-${day}`;  // Format as 'YYYY-MM-DD'
}

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
    input.error, select.error, textarea.error {
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
                        <div class="card-title">WeddingFill-up Form</div>
                    </div>
                    <div class="card-body">
                    <form method="post" action="../../Controller/citizen_con.php" onsubmit="return validateForm()">
    <div class="row">
        <input type="hidden" name ="walkinwedding_id" value = "walkinwedding_id">
        <div class="col-md-6 col-lg-4">
            <!-- Date -->
            <div class="form-group">
                <label for="date">Date</label>
                <input type="text" class="form-control" id="date" name="date" placeholder="" readonly />
                <div id="dateError" class="error text-danger"></div>
            </div>
            <div class="card-title" ><label style="font-size:15px!important;font-weight:700; margin-left:10px;  border-bottom: 1px solid black;
">Fillup Groom Details</label></div>

            <!-- Groom Firstname -->
            <div class="form-group">
                <label for="firstname">Firstname of Groom</label>
                <input type="text" class="form-control" id="firstname" name="firstname" placeholder="Enter Firstname"
                />
                <div id="firstnameError" class="error text-danger"></div>
            </div>

            <!-- Groom Lastname -->
            <div class="form-group">
                <label for="lastname">Last Name of Groom</label>
                <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Enter Lastname"
                   />
                <div id="lastnameError" class="error text-danger"></div>
            </div>

            <!-- Groom Middlename -->
            <div class="form-group">
                <label for="middlename">Middle Name of Groom</label>
                <input type="text" class="form-control" id="middlename" name="middlename" placeholder="Enter Middlename"
                 />
                <div id="middlenameError" class="error text-danger"></div>
            </div>

            <!-- Groom Date of Birth -->
            <div class="form-group">
                <label for="month">Groom Date of Birth</label>
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

            <!-- Groom Place of Birth -->
            <div class="form-group">
                <label for="address">Groom Place of Birth</label>
                <textarea class="form-control" id="address" name="groom_place_of_birth" placeholder="Enter Address"></textarea>
                <div id="addressError" class="error text-danger"></div>
            </div>

            <!-- Groom Citizenship -->
            <div class="form-group">
                <label for="groom_citizenship">Groom Citizenship</label>
                <input type="text" class="form-control" id="groom_citizenship" name="groom_citizenship" placeholder="Enter Groom Citizenship" />
                <div id="groomCitizenshipError" class="error text-danger"></div>
            </div>

            <!-- Groom Address -->
            <div class="form-group">
                <label for="parents_residence">Groom Address</label>
                <textarea class="form-control" id="parents_residence" name="groom_address" placeholder="Enter Address"></textarea>
                <div id="groomAddressError" class="error text-danger"></div>
            </div>
             <!-- Groom Religion -->
             <div class="form-group">
                <label for="groom_religion">Groom Religion</label>
                <input type="text" class="form-control" id="groom_religion" name="groom_religion" placeholder="Enter Groom Religion" />
                <div id="groomReligionError" class="error text-danger"></div>
            </div>

            <!-- Groom Previously Married -->
            <div class="form-group">
                <label for="groom_previously_married">Groom Previously Married</label>
                <select class="form-control" id="groom_previously_married" name="groom_previously_married">
                    <option value="">-- Select --</option>
                    <option value="Yes">Yes</option>
                    <option value="No">No</option>
                </select>
                <div id="groomPreviouslyMarriedError" class="error text-danger"></div>
            </div>
        </div>

        <div class="col-md-6 col-lg-4">
            <!-- Start Time -->
            <div class="form-group">
                <label for="start_time">Start Time</label>
                <input type="text" class="form-control" id="start_time" name="start_time" placeholder="" readonly />
            </div>

           

        
        </div>

        <div class="col-md-6 col-lg-4">
            <!-- End Time -->
            <div class="form-group">
                <label for="end_time">End Time</label>
                <input type="text" class="form-control" id="end_time" name="end_time" placeholder="" readonly />
            </div>
            <div class="card-title" ><label style="font-size:15px!important;font-weight:700; margin-left:10px;  border-bottom: 1px solid black;
">Fillup Bride Details</label></div>
    <!-- Bride Firstname -->
    <div class="form-group">
                <label for="firstnames">Firstname of Bride</label>
                <input type="text" class="form-control" id="firstnames" name="firstnames" placeholder="Enter Firstname"
                    />
                <div id="brideFirstnameError" class="error text-danger"></div>
            </div>

            <!-- Bride Lastname -->
            <div class="form-group">
                <label for="lastnames">Last Name of Bride</label>
                <input type="text" class="form-control" id="lastnames" name="lastnames" placeholder="Enter Lastname"
                  />
                <div id="brideLastnameError" class="error text-danger"></div>
            </div>

            <!-- Bride Middlename -->
            <div class="form-group">
                <label for="middlenames">Middle Name of Bride</label>
                <input type="text" class="form-control" id="middlenames" name="middlenames" placeholder="Enter Middlename"
                  />
                <div id="brideMiddlenameError" class="error text-danger"></div>
            </div>

            <!-- Bride Date of Birth -->
            <div class="form-group">
                <label for="months">Bride Date of Birth</label>
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
                <div id="dobErrors" class="error text-danger"></div>
            </div>

            <!-- Bride Place of Birth -->
            <div class="form-group">
                <label for="bride_place_of_birth">Bride Place of Birth</label>
                <textarea class="form-control" id="bride_place_of_birth" name="bride_place_of_birth" placeholder="Enter Address"></textarea>
                <div id="bridePlaceOfBirthError" class="error text-danger"></div>
            </div>

            <!-- Bride Citizenship -->
            <div class="form-group">
                <label for="bride_citizenship">Bride Citizenship</label>
                <input type="text" class="form-control" id="bride_citizenship" name="bride_citizenship" placeholder="Enter Bride Citizenship" />
                <div id="brideCitizenshipError" class="error text-danger"></div>
            </div>
            <!-- Bride Address -->
            <div class="form-group">
                <label for="bride_address">Bride Address</label>
                <textarea class="form-control" id="bride_address" name="bride_address" placeholder="Enter Address"></textarea>
                <div id="brideAddressError" class="error text-danger"></div>
            </div>

            <!-- Bride Religion -->
            <div class="form-group">
                <label for="bride_religion">Bride Religion</label>
                <input type="text" class="form-control" id="bride_religion" name="bride_religion" placeholder="Enter Bride Religion" />
                <div id="brideReligionError" class="error text-danger"></div>
            </div>

            <!-- Bride Previously Married -->
            <div class="form-group">
                <label for="bride_previously_married">Bride Previously Married</label>
                <select class="form-control" id="bride_previously_married" name="bride_previously_married">
                    <option value="">-- Select --</option>
                    <option value="Yes">Yes</option>
                    <option value="No">No</option>
                </select>
                <div id="bridePreviouslyMarriedError" class="error text-danger"></div>
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
        <option value="" disabled selected>Select Priest</option>
        <?php foreach ($priests as $priest): ?>
            <option value="<?php echo htmlspecialchars($priest['citizend_id']); ?>">
                <?php echo htmlspecialchars($priest['fullname']); ?>
            </option>
        <?php endforeach; ?>
    </select>
    <span class="error" id="eventTypeError"></span>
</div>

<div class="form-group"> 
    <label for="saturdays">Select Seminar</label>
    <select class="form-control" id="saturdays" name="saturdays">    
    </select>
    <span class="error" id="seminarError"></span>
</div>
<div class="form-group">
                        <label for="eventTitle1">Seminar Speaker</label>
                        <input type="text" class="form-control" id="eventTitle1" name="eventspeaker" placeholder="Enter Amount">
                    </div>


<div class="form-group">
    <label for="pay_amount">Payable Amount</label>
    <input type="number" class="form-control" id="pay_amount" name="pay_amount" placeholder="Enter Payable Amount" />
    <span class="error" id="payAmountError"></span>
</div>
 
       
        </div>
            </div>
                            <div class="card-action">
                                <button type="submit" class="btn btn-success">Submit</button>
                                <button type="button" class="btn btn-danger" onclick="window.location.href='FillScheduleForm.php?type=Wedding'">Cancel</button>
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
    function validateForm() {
    var isValid = true;
    document.querySelectorAll('.error').forEach(function (el) {
        el.innerText = '';
    });
    function validateSelect(selectId, errorId, errorMessage) {
    const selectElement = document.getElementById(selectId);
    const errorElement = document.getElementById(errorId);
    let isValid = true; // Initialize isValid to true

    if (selectElement.value === "") {
        errorElement.textContent = errorMessage;
        selectElement.classList.add('border-error'); // Add error border
        console.log(`Class added to ${selectId}`); // Debugging line
        isValid = false; // Set isValid to false if there's an error
    } else {
        errorElement.textContent = ""; // Clear the error if a valid option is selected
        selectElement.classList.remove('border-error'); // Remove error border
        console.log(`Class removed from ${selectId}`); // Debugging line
    }

    return isValid; // Return the validity status
}

// Validate each select element
const isEventTypeValid = validateSelect('eventType', 'eventTypeError', 'Please select a Priest.');
const isBridePreviouslyMarriedValid = validateSelect('bride_previously_married', 'bridePreviouslyMarriedError', 'Please specify if the bride was previously married.');
const isGroomPreviouslyMarriedValid = validateSelect('groom_previously_married', 'groomPreviouslyMarriedError', 'Please specify if the groom was previously married.');

// You can combine the results if needed
const allValid = isEventTypeValid && isBridePreviouslyMarriedValid && isGroomPreviouslyMarriedValid;


    validateSelect('eventType', 'eventTypeError', 'Please select a Priest.');

    function isEmptyOrWhitespace(value) {
        return value.trim() === '';
    }
    
    var fields = [
        { id: 'date', errorId: 'dateError', name: 'Date' },
        { id: 'firstname', errorId: 'firstnameError', name: 'Firstname of Groom' },
        { id: 'lastname', errorId: 'lastnameError', name: 'Lastname of Groom' },
        { id: 'address', errorId: 'addressError', name: 'Groom Place of Birth' },
        { id: 'groom_citizenship', errorId: 'groomCitizenshipError', name: 'Groom Citizenship' },
        { id: 'parents_residence', errorId: 'groomAddressError', name: 'Groom Address' },
        { id: 'groom_religion', errorId: 'groomReligionError', name: 'Groom Religion' },
       
        { id: 'firstnames', errorId: 'brideFirstnameError', name: 'Firstname of Bride' },
        { id: 'lastnames', errorId: 'brideLastnameError', name: 'Lastname of Bride' },
       
        { id: 'bride_citizenship', errorId: 'brideCitizenshipError', name: 'Bride Citizenship' },
        { id: 'bride_religion', errorId: 'brideReligionError', name: 'Bride Religion' },
      
        { id: 'bride_address', errorId: 'brideAddressError', name: 'Bride Address' },
        { id: 'bride_place_of_birth', errorId: 'bridePlaceOfBirthError', name: 'Bride Place of Birth' }
    ];

    fields.forEach(function(field) {
    var element = document.getElementById(field.id);
    var value = element.value;
    if (isEmptyOrWhitespace(value)) {
        document.getElementById(field.errorId).innerText = field.name + ' is required and cannot be just spaces.';
        element.classList.add('form-control', 'error'); // Add both classes
        isValid = false;
    } else {
        document.getElementById(field.errorId).innerText = '';
        element.classList.remove('error');
    }
});

    var groomDob = {
        month: document.getElementById('month').value,
        day: document.getElementById('day').value,
        year: document.getElementById('year').value,
        errorId: 'dobError'
    };
    if (isEmptyOrWhitespace(groomDob.month) || isEmptyOrWhitespace(groomDob.day) || isEmptyOrWhitespace(groomDob.year)) {
        document.getElementById(groomDob.errorId).innerText = 'Complete Groom Date of Birth is required.';
        isValid = false;
    }

    var brideDob = {
        month: document.getElementById('months').value,
        day: document.getElementById('days').value,
        year: document.getElementById('years').value,
        errorId: 'dobErrors'
    };
    if (isEmptyOrWhitespace(brideDob.month) || isEmptyOrWhitespace(brideDob.day) || isEmptyOrWhitespace(brideDob.year)) {
        document.getElementById(brideDob.errorId).innerText = 'Complete Bride Date of Birth is required.';
        isValid = false;
    }
    const seminar = document.getElementById('saturdays').value;
if (seminar === '' || seminar === null) {
    document.getElementById('seminarError').innerText = 'Please select a seminar';
    document.getElementById('saturdays').classList.add('error');
    isValid = false;
} else {
    document.getElementById('seminarError').innerText = '';
    document.getElementById('saturdays').classList.remove('error');
}


    
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
