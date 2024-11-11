<?php
require_once __DIR__ . '/../../Model/db_connection.php';
require_once __DIR__ . '/../../Model/citizen_mod.php';
session_start();
$nme = $_SESSION['fullname'];
$regId = $_SESSION['citizend_id'];
$citizenController = new Citizen($conn);

$pendingAppointments = $citizenController->cgetPendingCitizens(null, $regId);
$loggedInUserEmail = isset($_SESSION['email']) ? $_SESSION['email'] : null;
$r_status = isset($_SESSION['user_type']) ? $_SESSION['user_type'] : null;

if (!$loggedInUserEmail) {
  header("Location: ../../index.php");
  exit();
}

// Redirect staff users to the staff page, not the citizen page
if ($r_status === "Staff") {
  header("Location: ../PageStaff/StaffDashboard.php"); // Change to your staff page
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
    <script src="../assets/js/plugin/webfont/webfont.min.js"></script>
    <style>
      .form-control {
    width: 150px;
    padding: 5px;
}
body{
  margin:0!important;
}
    </style>
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

    <!-- CSS Files -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../assets/css/plugins.min.css" />
    <link rel="stylesheet" href="../assets/css/kaiadmin.min.css" />

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="assets/css/demo.css" />
  </head>
  <body>
  <div class="container-fluid nav-bar px-0 px-lg-4 py-lg-0">
      <div class="container">
       
      <?php require_once 'header.php'?>

      </div>
    </div>
    <!-- Navbar & Hero End -->
    
  <?php require_once 'profheader.php'?>

        <div class="container">
          <div class="page-inner">
            
              <div class="col-md-12">
                <div class="card">
                  <div class="card-header">
                    <h4 class="card-title">Complete Appointment</h4>
                  </div>
                  <div class="card-body">
                    <div class="table-responsive">
                    <table id="multi-filter-select" class="display table table-striped table-hover">
    <thead>
        <tr>
            <th>ID</th>
            <th>Event Name</th>
            <th>Event Date</th>
            <th>Event Time</th>
            <th>Seminar Date</th>
            <th>Seminar Time</th>
        </tr>
    </thead>
    <tbody>
    <?php if (!empty($pendingAppointments)) {
        foreach ($pendingAppointments as $index => $appointment) {
            // Convert schedule times to 12-hour format
            $scheduleStart = date('g:i A', strtotime($appointment['schedule_start_time']));
            $scheduleEnd = date('g:i A', strtotime($appointment['schedule_end_time']));
            $scheduleTime = $scheduleStart . ' - ' . $scheduleEnd;

            // Check if seminar details exist, otherwise set to "No seminar"
            if (!empty($appointment['seminar_starttime']) && !empty($appointment['seminar_endtime']) && !empty($appointment['seminar_date'])) {
                $seminarStart = date('g:i A', strtotime($appointment['seminar_starttime']));
                $seminarEnd = date('g:i A', strtotime($appointment['seminar_endtime']));
                $seminarTime = $seminarStart . ' - ' . $seminarEnd;
                $seminarDate = date('F j, Y', strtotime($appointment['seminar_date']));
            } else {
                $seminarTime = "No seminar";
                $seminarDate = "No seminar";
            }
            ?>
            <tr>
                <td><?= $index + 1; ?></td>
                <td><?= htmlspecialchars($appointment['citizen_name']); ?></td>
                <td><?= htmlspecialchars($appointment['type']); ?></td>
                <td><?= htmlspecialchars(date('F j, Y', strtotime($appointment['schedule_date']))); ?></td>
                <td><?= htmlspecialchars($scheduleTime); ?></td>
                <td><?= htmlspecialchars($seminarDate); ?></td>
                <td><?= htmlspecialchars($seminarTime); ?></td>
                <td><?= htmlspecialchars($appointment['roles']); ?></td>

                <td></td>
              
            </tr>
        <?php
        }
    } else { ?>
        <tr>
            <td colspan="11">No pending appointments found.</td>
        </tr>
    <?php } ?>
</tbody>

</table>

                    </div>
                  </div>
                </div>
              </div>

            

        
      </div>

   
    </div>
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
    <!--   Core JS Files   -->
    <script src="../assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="../assets/js/core/popper.min.js"></script>
    <script src="../assets/js/core/bootstrap.min.js"></script>

    <!-- jQuery Scrollbar -->
    <script src="../assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
    <!-- Datatables -->
    <script src="../assets/js/plugin/datatables/datatables.min.js"></script>
    <!-- Kaiadmin JS -->
    <script src="../assets/js/kaiadmin.min.js"></script>
    <!-- Kaiadmin DEMO methods, don't include it in your project! -->
    <script src="../assets/js/setting-demo2.js"></script>
    <script>
      $(document).ready(function () {
        $("#basic-datatables").DataTable({});

        $("#multi-filter-select").DataTable({
          pageLength: 5,
          initComplete: function () {
            this.api()
              .columns()
              .every(function () {
                var column = this;
                var select = $(
                  '<select class="form-select"><option value=""></option></select>'
                )
                  .appendTo($(column.footer()).empty())
                  .on("change", function () {
                    var val = $.fn.dataTable.util.escapeRegex($(this).val());

                    column
                      .search(val ? "^" + val + "$" : "", true, false)
                      .draw();
                  });

                column
                  .data()
                  .unique()
                  .sort()
                  .each(function (d, j) {
                    select.append(
                      '<option value="' + d + '">' + d + "</option>"
                    );
                  });
              });
          },
        });

        // Add Row
        $("#add-row").DataTable({
          pageLength: 5,
        });

        var action =
          '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

        $("#addRowButton").click(function () {
          $("#add-row")
            .dataTable()
            .fnAddData([
              $("#addName").val(),
              $("#addPosition").val(),
              $("#addOffice").val(),
              action,
            ]);
          $("#addRowModal").modal("hide");
        });
      });
    </script>
  </body>
</html>