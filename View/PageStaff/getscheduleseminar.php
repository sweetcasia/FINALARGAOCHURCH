<?php

require_once '../../Model/db_connection.php';
require_once '../../Controller/citizen_con.php';
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
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    />
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
          urls: ["../assets/css/fonts.min.css"],
        },
        active: function () {
          sessionStorage.fonts = true;
        },
      });

      const currentDate = new Date();
let currentMonth = currentDate.getMonth();
let currentYear = currentDate.getFullYear();
let selectedDateElement = null;

function moveDate(direction) {
    currentMonth += direction;
    if (currentMonth < 0) {
        currentMonth = 11;
        currentYear--;
    } else if (currentMonth > 11) {
        currentMonth = 0;
        currentYear++;
    }
    renderCalendar();
}
let initialLoad = true; // Track if this is the initial load of the calendar

function renderCalendar() {
    const daysElement = document.getElementById('days');
    daysElement.innerHTML = '';

    const monthYearElement = document.getElementById('monthYear');
    const months = [
        'January', 'February', 'March', 'April', 'May', 'June',
        'July', 'August', 'September', 'October', 'November', 'December'
    ];

    // Update month and year display
    monthYearElement.innerHTML = `${months[currentMonth]}<br><span style="font-size:18px">${currentYear}</span>`;

    // Get the first day of the month
    const firstDay = new Date(currentYear, currentMonth, 1).getDay();
    const daysInMonth = new Date(currentYear, currentMonth + 1, 0).getDate();

    const today = new Date();
    const oneWeekFromNow = new Date(today.getTime() + 8 * 24 * 60 * 60 * 1000); // One week from today
    const isCurrentMonth = today.getFullYear() === currentYear && today.getMonth() === currentMonth;

    let hasSelectableDate = false;

    // Fill in empty days before the first day of the month
    for (let i = 0; i < firstDay; i++) {
        daysElement.innerHTML += '<li></li>';
    }

    // Fill in the actual days of the month
    for (let i = 1; i <= daysInMonth; i++) {
        const dayElement = document.createElement('li');
        dayElement.textContent = i;

        const dayDate = new Date(currentYear, currentMonth, i);

        // Disable dates within one week from today
        if (dayDate < oneWeekFromNow) {
            dayElement.classList.add('past'); // Style as past date
        } else {
            dayElement.addEventListener('click', () => selectDate(dayElement));
            hasSelectableDate = true;
        }

        daysElement.appendChild(dayElement);
    }

    // If no selectable dates and this is the initial load, move to the next month and re-render
    if (initialLoad && !hasSelectableDate) {
        currentMonth++;
        if (currentMonth > 11) {
            currentMonth = 0;
            currentYear++;
        }
        renderCalendar(); // Re-render the calendar for the next month
    }

    initialLoad = false; // Disable automatic month change after the first load
}

// Initialize calendar on page load
window.addEventListener('DOMContentLoaded', () => {
    renderCalendar();
});


function selectDate(dayElement) {
    if (selectedDateElement) {
        selectedDateElement.classList.remove('active');
    }
    dayElement.classList.add('active');
    selectedDateElement = dayElement;

    const selectedDate = new Date(currentYear, currentMonth, dayElement.textContent);
    const formattedDate = selectedDate.toLocaleDateString('en-CA'); // Format date in local time
    const selectedRadioButton = document.querySelector('input[type="radio"]:checked');
    if (selectedRadioButton) {
        selectedRadioButton.checked = false;
    }

    // Check if the selected date is within one week from today
    const today = new Date();
    const oneWeekFromNow = new Date(today.getTime() + 7 * 24 * 60 * 60 * 1000);

    if (selectedDate < oneWeekFromNow) {
        alert("Please select a date that is at least one week from today.");
        return; // Exit early if the selected date is within one week from today
    }

    // Make an AJAX request to fetch the schedule for the selected date
    fetch('../../Controller/getscheduleseminar_con.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: `date=${formattedDate}`,
    })
    .then(response => response.json())
    .then(schedules => {
        console.log('Schedules:', schedules); // Debugging
        updateAvailableTimes(schedules, selectedDate);
    })
    .catch(error => {
        console.error('Error:', error);
    });
}

function updateAvailableTimes(schedules, selectedDate) {
    const timeSlots = document.querySelectorAll('.time .form-check');
    const today = new Date();
    const oneWeekFromNow = new Date(today.getTime() + 7 * 24 * 60 * 60 * 1000);

    timeSlots.forEach(slot => {
        const timeRange = slot.querySelector('label').textContent.trim();
        const [startTime, endTime] = timeRange.split(' - ');

        const isBooked = schedules.some(schedule => {
            const dbStartTime = schedule.start_time.substring(0, 5); // Extract HH:MM from HH:MM:SS
            const dbEndTime = schedule.end_time.substring(0, 5);     // Extract HH:MM from HH:MM:SS
            return formatTime(dbStartTime) === startTime && formatTime(dbEndTime) === endTime;
        });

        const radioButton = slot.querySelector('input[type="radio"]');
        const statusText = slot.querySelector('h6');

        // Disable radio buttons and change text for dates within one week from today
        if (selectedDate < oneWeekFromNow) {
            statusText.textContent = 'Not Available';
            statusText.style.color = 'gray';
            radioButton.disabled = true; // Disable the radio button
        } else if (isBooked) {
            statusText.textContent = 'Booked';
            statusText.style.color = 'red';
            radioButton.disabled = true; // Disable the radio button
        } else {
            statusText.textContent = 'Available';
            statusText.style.color = 'green';
            radioButton.disabled = false; // Ensure the radio button is enabled if not booked
        }
    });
}

function formatTime(time) {
    const [hours, minutes] = time.split(':');
    const suffix = hours >= 12 ? 'PM' : 'AM';
    const formattedHours = hours % 12 || 12;
    return `${formattedHours}:${minutes} ${suffix}`;
}

window.addEventListener('DOMContentLoaded', () => {
    const selectedRadioButton = document.querySelector('input[type="radio"]:checked');
    if (selectedRadioButton) {
        selectedRadioButton.checked = false;
    }
    renderCalendar();
});

document.addEventListener('DOMContentLoaded', function() {
    const form = document.getElementById('scheduleForm');

    if (form) {
        form.addEventListener('submit', function(event) {
            event.preventDefault();

            const selectedDateElement = document.querySelector('.days .active');
            const selectedRadioButton = document.querySelector('input[name="flexRadioDefault"]:checked');

            if (selectedDateElement && selectedRadioButton) {
                const selectedDate = new Date(currentYear, currentMonth, selectedDateElement.textContent);
                selectedDate.setHours(12, 0, 0, 0);
                const formattedDate = selectedDate.toISOString().split('T')[0];
                const selectedTimeRange = selectedRadioButton.nextElementSibling.textContent.trim();

                // Store the selected date and time in sessionStorage
                sessionStorage.setItem('selectedDate', formattedDate);

                // Store start and end times separately
                sessionStorage.setItem('selectedTime', selectedTimeRange);

                // Get the type from the URL to determine the form type
                const urlParams = new URLSearchParams(window.location.search);
                const type = urlParams.get('type') || 'baptism'; // Default to 'baptism' if not set

                let nextPage;
                if (type === 'baptism') {
                    nextPage = `FillBaptismForm.php`;
                } else if (type === 'confirmation') {
                    nextPage = `FillConfirmationForm.php`;
                } else if (type === 'Wedding') {
                    nextPage = `FillWeddingForm.php`;
                } else if (type === 'Funeral') {
                    nextPage = `FillFuneralForm.php`;
                } else {
                    alert('Invalid scheduling type.');
                    return;
                }

                console.log('Redirecting to:', nextPage);
                window.location.assign(nextPage);
            } else {
                alert('Please select both a date and a time before submitting.');
            }
        });
    } else {
        console.error('Form element with id "scheduleForm" not found.');
    }
});


    </script>
        <style>
 .container-cal {
            margin: 0 auto;
        }
        .calendar {
            width: 80%;
        }
        .month ul {
            list-style-type: none;
            padding: 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .weekdays, .days {
            list-style-type: none;
            padding: 0;
            display: flex;
            flex-wrap: wrap;
        }
        .weekdays li, .days li {
            width: 14.28%;
            text-align: center;
            margin-bottom: 10px;
        }
        .days li {
            cursor: pointer;
        }
        .days li.active {
            background-color: #1abc9c;
            color: white;
            border-radius: 50%;
        }
        .days li.past {
            color: #ccc;
            cursor: not-allowed;
        }
    </style>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-KyZXEAg3QhqLMpG8r+Knujsl7/1L_dstPt3HV5HzF6Gvk/e3s4Wz6iJgD/+ub2oU"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />
    <!-- CSS Files -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../assets/css/plugins.min.css" />
    <link rel="stylesheet" href="../assets/css/kaiadmin.min.css" />

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="../assets/css/demo.css" />
    <link rel="stylesheet" href="../assets/css/schedule.css" />
  </head>
  <body style="background: #9e9e9e47">
    <div
      class="main-header"
      style="
        background: #0066a8 !important;
        width: 100% !important;
        position: static !important;
      "
    >
      <div class="main-header-logo">
        <!-- Logo Header -->
        <div class="logo-header" data-background-color="dark">
          <a href="" class="logo">
            <img
              src="../assets/img/kaiadmin/logo_light.svg"
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
          <div class="logo-header" data-background-color="dark">
            <a href="index.html" class="logo">
              <img
                src="../assets/img/argaochurch.png"
                alt="navbar brand"
                class="navbar-brand"
                height="46"
              />
            </a>
            <div class="nav-toggle"></div>
          </div>

          <ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
            <li class="nav-item topbar-user dropdown hidden-caret">
              <a
                class="dropdown-toggle profile-pic"
                data-bs-toggle="dropdown"
                href="#"
                aria-expanded="false"
              >
                <div class="avatar">
                  <span
                    class="avatar-title rounded-circle border border-white bg-secondary"
                    >P</span
                  >
                </div>
                <span class="profile-username">
                  <span class="op-7" style="color: white !important"
                    >Welcome,</span
                  >
                  <span class="fw-bold" style="color: white !important"
                    >Church Citizen</span
                  >
                </span>
              </a>
              <ul class="dropdown-menu dropdown-user animated fadeIn">
                <div class="dropdown-user-scroll scrollbar-outer">
                  <li>
                    <div class="user-box">
                      <div class="avatar-lg">
                        <img
                          src="assets/img/profile.jpg"
                          alt="image profile"
                          class="avatar-img rounded"
                        />
                      </div>
                      <div class="u-text">
                        <h4>Church Admin</h4>
                        <p class="text-muted">argaochurch@gmail.com</p>
                        <a
                          href="profile.html"
                          class="btn btn-xs btn-secondary btn-sm"
                          >View Profile</a
                        >
                      </div>
                    </div>
                  </li>
                  <li>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">My Profile</a>
                    <a class="dropdown-item" href="#">Account Setting</a>
                    <a class="dropdown-item" href="#">Logout</a>
                  </li>
                </div>
              </ul>
            </li>
          </ul>
        </div>
      </nav>
      <!-- End Navbar -->
    </div>
  </div>
  <form id="scheduleForm">
  <div class="container-cal">
    <div class="calendar">
        <h3 style="padding-top: 20px;" class="fw-bold mb-3">Select Date</h3>
        <div class="month">
            <ul>
                <li class="prev" onclick="moveDate(-1)">&#10094;</li>
                <li id="monthYear">
                   <br>
                    <span style="font-size:18px">2024</span>
                </li>
                <li class="next" onclick="moveDate(1)">&#10095;</li>
              
            </ul>
        </div>

        <ul class="weekdays">
            <li>Su</li>
            <li>Mo</li>
            <li>Tue</li>
            <li>Wed</li>
            <li>Thu</li>
            <li>Fri</li>
            <li>Sat</li>
        </ul>

        <ul class="days" id="days">
            <!-- Days will be generated by JavaScript -->
        </ul>
    </div>


<div class="schedule">

<div class="time" > 
  <h3 style="padding-top: 20px; padding-left: 10px;" class="fw-bold mb-3">Select Time</h3>
  <div style="padding-left: 70px;" class="form-group">
    <div class="d-flex">
     
      <div class="form-check">
      <input
          class="form-check-input"
          type="radio"
          name="flexRadioDefault"
          id="flexRadioDefault1"
          value="8:30 AM - 9:30 AM"
        />
        <label
          style="padding-right: 130px;"
          class="form-check-label"
          for="timeSlot1"
        >
          8:30 AM - 9:30 AM
        </label>
        <label>
          <h6 style="font-size: 14px; color: green; padding:0; margin: 0;"></h6>
        </label>
      </div>
    </div>
    <div class="d-flex">
     
      <div class="form-check">
        <input
          class="form-check-input"
          type="radio"
          name="flexRadioDefault"
          id="flexRadioDefault2"
          value="9:30 AM - 10:30 AM"
          
        />
        <label
        style="padding-right: 121px;"
          class="form-check-label"
          for="timeSlot2"
        >
          9:30 AM - 10:30 AM
        </label>
        <label
        style="color: red;"
        class="form-check-label"
        for="flexRadioDefault2"
      >
      <h6 style="font-size: 14px; color: red; padding:0; margin: 0;" ></h6>
      </label>
      </div>
    </div>
    <div class="d-flex">
     
      <div class="form-check">
        <input
          class="form-check-input"
          type="radio"
          name="flexRadioDefault"
          id="flexRadioDefault3"
          value="10:30 AM - 11:30 AM"
        />
        <label
        style="padding-right: 115px;"
          class="form-check-label"
          for="timeSlot3"
        >
        10:30 AM - 11:30 AM
      </label>
      <label
        class="form-check-label"
        for="flexRadioDefault2"
      >
      <h6 style="font-size: 14px; color: green; padding:0; margin: 0;"></h6>
      </label>
      </div>
    </div>
    <div class="d-flex">
      <div class="form-check">
        <input
          class="form-check-input"
          type="radio"
          name="flexRadioDefault"
          id="flexRadioDefault4"
          value="1:30 PM - 2:30 PM"
        />
        <label
        style="padding-right: 113px;"
          class="form-check-label"
          for="timeSlot4"
        >
        1:30 PM - 2:30 PM
        </label>
        <label
        class="form-check-label"
        for="flexRadioDefault2"
      >
      <h6 style="font-size: 14px; color: green; padding:0; margin: 0;"></h6>
      </label>
      </div>
    </div>
    <div class="d-flex">
     
      <div class="form-check">
        <input
          class="form-check-input"
          type="radio"
          name="flexRadioDefault"
          id="flexRadioDefault5"
          value="2:30 PM - 3:30 PM"
        />
        <label
        style="padding-right: 115px;"
          class="form-check-label"
          for="timeSlot5"
        >
          2:30 PM - 3:30 PM
        </label>
        <label
        class="form-check-label"
        for="flexRadioDefault2"
      >
      <h6 style="font-size: 14px; color: green; padding:0; margin: 0;"></h6>
      </label>
      </div>
    </div>
    <div class="d-flex">
     
      <div class="form-check">
        <input
          class="form-check-input"
          type="radio"
          name="flexRadioDefault"
          id="flexRadioDefault6"
          value="3:30 PM - 4:30 PM"
        />
        <label
        style="padding-right: 115px;"
          class="form-check-label"
          for="timeSlot6"
        >
          3:30 PM - 4:30 PM
        </label>
        <label
        class="form-check-label"
        for="flexRadioDefault2"
      >
      <h6 style="font-size: 14px; color: green; padding:0; margin: 0;"></h6>
      </label>
      </div>
    </div>
    <div class="d-flex">
     
      <div class="form-check">
        <input
          class="form-check-input"
          type="radio"
          name="flexRadioDefault"
          id="flexRadioDefault7"
          value="4:30 PM - 5:30 PM"
        />
        <label
        style="padding-right: 117px;"
          class="form-check-label"
          for="timeSlot7"
        >
          4:30 PM - 5:30 PM
        </label>
        <label
        class="form-check-label"
        for="flexRadioDefault2"
      >
      <h6 style="font-size: 14px; color: green; padding:0; margin: 0;"></h6>
      </label>
      </div>
    </div>
  </div>

</div>

</div>

</div>

</div>
<button type="submit" id="submitBtn" style="background: #1572e8!important; 
border: none;  
position: absolute;
top:600px;
right: 65px;
" class="btn btn-primary">Submit</button>

</form>

  <!-- container -->
    <script src="../assets/js/calendar.js"></script>

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
      integrity="sha384-KyZXEAg3QhqLMpG8r+8auK+4szKfEFbpLHsTf7iJgD/+ub2oU"
      crossorigin="anonymous"
    ></script>
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
  </body>
</html>