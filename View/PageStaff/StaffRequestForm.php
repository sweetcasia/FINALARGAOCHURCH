<?php
session_start();
$email = $_SESSION['email'];
$nme = $_SESSION['fullname'];
$regId = $_SESSION['citizend_id'];
require_once '../../Model/staff_mod.php';
require_once '../../Model/db_connection.php';
$staff = new Staff($conn);
$statusFilter = isset($_GET['status_filter']) ? $_GET['status_filter'] : null;
$pendingItems = $staff->getRequestAppointment($statusFilter);
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

    <!-- CSS Files -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../assets/css/plugins.min.css" />
    <link rel="stylesheet" href="../assets/css/kaiadmin.min.css" />
    <link rel="stylesheet" href="../css/table.css" />
    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="../assets/css/demo.css" />
  </head>
  <body>
  <div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-labelledby="viewModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content shadow-lg rounded-3">
            <!-- Modal Header -->
            <div class="modal-header bg-primary text-white border-0 rounded-top">
                <h5 class="modal-title" id="viewModalLabel"><i class="fas fa-info-circle"></i> Appointment Details</h5>
                <button type="button" class="close text-white" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <!-- Modal Body -->
            <div class="modal-body">
                <!-- Use Bootstrap grid for a formal layout -->
                <div class="row mb-4">
                    <div class="col-md-4">
                        <p><strong>Full Name:</strong></p>
                    </div>
                    <div class="col-md-8">
                        <p id="modalFullName" class="text-muted"></p>
                    </div>
                </div>
                <div class="row mb-4">
                    <div class="col-md-4">
                        <p><strong>Event Name:</strong></p>
                    </div>
                    <div class="col-md-8">
                        <p id="modalEventName" class="text-muted"></p>
                    </div>
                </div>
                <div class="row mb-4">
                    <div class="col-md-4">
                        <p><strong>Schedule Date:</strong></p>
                    </div>
                    <div class="col-md-8">
                        <p id="modalScheduleDate" class="text-muted"></p>
                    </div>
                </div>
                <div class="row mb-4">
                    <div class="col-md-4">
                        <p><strong>Schedule Time:</strong></p>
                    </div>
                    <div class="col-md-8">
                        <p id="modalScheduleTime" class="text-muted"></p>
                    </div>
                </div>
      
                <div class="row mb-4">
                    <div class="col-md-4">
                        <p><strong>Payable Amount:</strong></p>
                    </div>
                    <div class="col-md-8">
                        <p id="modalAmount" class="text-muted"></p>
                    </div>
                </div>
                <div class="row mb-4">
                    <div class="col-md-4">
                        <p><strong>Roles:</strong></p>
                    </div>
                    <div class="col-md-8">
                        <p id="modalRoles" class="text-muted"></p>
                    </div>
                </div>
                <div class="row mb-4">
                    <div class="col-md-4">
                        <p><strong>Reference Number:</strong></p>
                    </div>
                    <div class="col-md-8">
                        <p id="modalRefNumber" class="text-muted"></p>
                    </div>
                </div>
                <div class="row mb-4">
    <div class="col-md-4">
        <p><strong>Request Address:</strong></p>
    </div>
    <div class="col-md-8">
        <p id="modalReqAddress" class="text-muted"></p>
    </div>
</div>
<div class="row mb-4">
    <div class="col-md-4">
        <p><strong>Phone Number:</strong></p>
    </div>
    <div class="col-md-8">
        <p id="modalReqPNumber" class="text-muted"></p>
    </div>
</div>
<div class="row mb-4">
    <div class="col-md-4">
        <p><strong>Date Of Followup:</strong></p>
    </div>
    <div class="col-md-8">
        <p id="modalCalDate" class="text-muted"></p>
    </div>
</div>
<div class="row mb-4">
    <div class="col-md-4">
        <p><strong>Requested Chapel:</strong></p>
    </div>
    <div class="col-md-8">
        <p id="modalReqChapel" class="text-muted"></p>
    </div>
</div>

            </div>

            <!-- Modal Footer -->
            <div class="modal-footer bg-light border-0 rounded-bottom">
                <button type="button" class="btn btn-secondary btn-lg" data-dismiss="modal">
                    <i class="fas fa-times-circle"></i> Close
                </button>
            </div>
        </div>
    </div>
</div>
  <?php require_once 'sidebar.php'?>
<div class="main-panel">
<?php require_once 'header.php'?>
<div class="container">
    <div class="page-inner">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">Request Form Appointment Details</h4>
                </div>
                <form method="GET" action="StaffRequestForm.php" style="display: flex; align-content: center; padding-left: 25px; padding-top: 15px;">

<h6>
    <div class="dropdown">
        <!-- Button to trigger dropdown -->
        <button style="margin-right: 15px;" class="btn btn-primary dropdown-toggle" type="button" id="eventDropdown" data-bs-toggle="dropdown" aria-expanded="false">
            <?php 
                // Display the selected event filter or "All" if none is selected
                echo isset($_GET['event_filter']) && $_GET['event_filter'] ? htmlspecialchars($_GET['event_filter']) : 'All';
            ?>
        </button>

        <!-- Dropdown menu with event filter options -->
        <ul class="dropdown-menu" aria-labelledby="eventDropdown">
            <li><a class="dropdown-item" href="?event_filter=&status_filter=<?php echo isset($_GET['status_filter']) ? htmlspecialchars($_GET['status_filter']) : ''; ?>">All</a></li>
            <li><a class="dropdown-item" href="?event_filter=Fiesta Mass<?php echo isset($_GET['status_filter']) ? '&status_filter=' . htmlspecialchars($_GET['status_filter']) : ''; ?>">Fiesta Mass</a></li>
            <li><a class="dropdown-item" href="?event_filter=Novena Mass<?php echo isset($_GET['status_filter']) ? '&status_filter=' . htmlspecialchars($_GET['status_filter']) : ''; ?>">Novena Mass</a></li>
            <li><a class="dropdown-item" href="?event_filter=Wake Mass<?php echo isset($_GET['status_filter']) ? '&status_filter=' . htmlspecialchars($_GET['status_filter']) : ''; ?>">Wake Mass</a></li>
            <li><a class="dropdown-item" href="?event_filter=Monthly Mass<?php echo isset($_GET['status_filter']) ? '&status_filter=' . htmlspecialchars($_GET['status_filter']) : ''; ?>">Monthly Mass</a></li>
            <li><a class="dropdown-item" href="?event_filter=1st Friday Mass<?php echo isset($_GET['status_filter']) ? '&status_filter=' . htmlspecialchars($_GET['status_filter']) : ''; ?>">1st Friday Mass</a></li>
            <li><a class="dropdown-item" href="?event_filter=Cemetery Chapel Mass<?php echo isset($_GET['status_filter']) ? '&status_filter=' . htmlspecialchars($_GET['status_filter']) : ''; ?>">Cemetery Chapel Mass</a></li>
            <li><a class="dropdown-item" href="?event_filter=Baccalaureate Mass<?php echo isset($_GET['status_filter']) ? '&status_filter=' . htmlspecialchars($_GET['status_filter']) : ''; ?>">Baccalaureate Mass</a></li>
            <li><a class="dropdown-item" href="?event_filter=Anointing Of The Sick<?php echo isset($_GET['status_filter']) ? '&status_filter=' . htmlspecialchars($_GET['status_filter']) : ''; ?>">Anointing of the Sick</a></li>
            <li><a class="dropdown-item" href="?event_filter=Blessing<?php echo isset($_GET['status_filter']) ? '&status_filter=' . htmlspecialchars($_GET['status_filter']) : ''; ?>">Blessing</a></li>
            <li><a class="dropdown-item" href="?event_filter=Thanksgiving<?php echo isset($_GET['status_filter']) ? '&status_filter=' . htmlspecialchars($_GET['status_filter']) : ''; ?>">Thanksgiving</a></li>
            <li><a class="dropdown-item" href="?event_filter=Soul & Petition<?php echo isset($_GET['status_filter']) ? '&status_filter=' . htmlspecialchars($_GET['status_filter']) : ''; ?>">Soul & Petition</a></li>
        </ul>
    </div>
</h6>

<div class="dropdown">
    <!-- Button to trigger dropdown for status filter -->
    <button class="btn btn-primary dropdown-toggle" type="button" id="statusDropdown" data-bs-toggle="dropdown" aria-expanded="false">
        <?php 
            // Display the selected status filter or "Default" if none is selected
            echo isset($_GET['status_filter']) && $_GET['status_filter'] ? htmlspecialchars($_GET['status_filter']) : 'Default';
        ?>
    </button>

    <!-- Dropdown menu with status filter options -->
    <ul class="dropdown-menu" aria-labelledby="statusDropdown">
        <li><a class="dropdown-item" href="?status_filter=&event_filter=<?php echo isset($_GET['event_filter']) ? htmlspecialchars($_GET['event_filter']) : ''; ?>">Default</a></li>
        <li><a class="dropdown-item" href="?status_filter=Completed and Paid<?php echo isset($_GET['event_filter']) ? '&event_filter=' . htmlspecialchars($_GET['event_filter']) : ''; ?>">Completed and Paid</a></li>
        <!-- Add more options if needed -->
    </ul>
</div>

</form>

                <form method="POST" action="../../Controller/updatepayment_con.php">
                <div class="card-body">
                    <!-- Selected Rows Information -->
                    <div id="selected-info" class="alert alert-info" style="display:none;">
                        <span id="selected-count">0</span> row(s) selected
                        <button id="delete-btn" class="btn btn-danger" style="display:none;">
                            <i class="fa fa-trash"></i> Delete
                        </button>
                    </div>

              
    <div class="table-responsive">
<table id="multi-filter-select" class="display table table-striped table-hover">
    <thead>
        <tr>
            <th><input type="checkbox" id="select-all"></th>
            <th>ID NO.</th>
            <th>Request Category</th>
            <th>Request Person</th>

            <th>Reference Number</th>
            <th>Event Status</th>
            <th>Payment Status</th>
            <th>View</th>
        </tr>
    </thead>
    <tbody>
    <?php
                                    // Retrieve the selected event type from the GET request
                                    $eventFilter = isset($_GET['event_filter']) ? $_GET['event_filter'] : '';

                                    // Filter pending items based on the selected event type
                                    if (isset($pendingItems) && !empty($pendingItems)) {
                                        foreach ($pendingItems as $index => $item) {
                                            // Check if the event name matches the selected filter or if no filter is applied
                                            if ($eventFilter === '' || $item['req_category'] === $eventFilter) {
                                    ?>
                <tr>
                    <td>
                        <input type="checkbox" class="select-row" name="rappsched_ids[]" value="<?php echo htmlspecialchars($item['appsched_id']); ?>">
                    </td>
                    <td><?php echo htmlspecialchars($index + 1); ?></td>
                    <td><?php echo htmlspecialchars($item['req_category']); ?></td>
                    <td><?php echo htmlspecialchars($item['req_person']); ?></td>

            
                    <td><?php echo htmlspecialchars($item['ref_number']); ?></td>
                 
                    <td>
                        <form method="POST" action="../../Controller/updatepayment_con.php">
                            <input type="hidden" name="rcappsched_id" value="<?php echo htmlspecialchars($item['appsched_id']); ?>">
                            <select name="rc_status" class="btn btn-xs <?php echo $item['c_status'] == 'Completed' ? 'btn-success' : 'btn-primary'; ?>" onchange="this.form.submit()">
                                <option value="Process" <?php echo $item['c_status'] == 'Process' ? 'selected' : ''; ?>>Process</option>
                                <option value="Completed" <?php echo $item['c_status'] == 'Completed' ? 'selected' : ''; ?>>Completed</option>
                            </select>
                        </form>
                    </td>
                    <td>
                        <form method="POST" action="../../Controller/updatepayment_con.php">
                            <input type="hidden" name="rappsched_id" value="<?php echo htmlspecialchars($item['appsched_id']); ?>">
                            <select name="rp_status" class="btn btn-xs <?php echo $item['p_status'] == 'Paid' ? 'btn-success' : 'btn-primary'; ?>" onchange="this.form.submit()">
                                <option value="Paid" <?php echo $item['p_status'] == 'Paid' ? 'selected' : ''; ?>>Paid</option>
                                <option value="Unpaid" <?php echo $item['p_status'] == 'Unpaid' ? 'selected' : ''; ?>>Unpaid</option>
                            </select>
                        </form>
                    </td>
                    <td>
    <button type="button" class="btn btn-primary view-details" 
            data-fullname="<?php echo htmlspecialchars($item['req_category']); ?>" 
            data-eventname="<?php echo htmlspecialchars($item['req_person']); ?>" 
            data-scheduledate="<?php echo !empty($item['date']) ? htmlspecialchars(date('Y/m/d', strtotime($item['date']))) : 'No Date'; ?>" 
data-scheduletime="<?php echo !empty($item['start_time']) && $item['start_time'] !== '00:00:00' ? htmlspecialchars(date('g:i A', strtotime($item['start_time']))) : 'No Time'; ?>"

            data-amount="<?php echo htmlspecialchars($item['payable_amount']); ?>"
            data-roles="<?php echo htmlspecialchars($item['role']); ?>"
            data-refnumber="<?php echo htmlspecialchars($item['ref_number']); ?>"
            data-reqaddress="<?php echo htmlspecialchars($item['req_address']); ?>"
            data-reqpnumber="<?php echo htmlspecialchars($item['req_pnumber']); ?>"
            data-caldate="<?php echo htmlspecialchars(date('F j, Y', strtotime($item['cal_date']))); ?>"
            data-reqchapel="<?php echo htmlspecialchars($item['req_chapel']); ?>"
            data-toggle="modal" data-target="#viewModal">
        View
    </button>
</td>

                </tr>
                <?php
                                            }
                                        }
                                    } else {
                                    ?>
            <tr>
                <td colspan="14">No pending Citizen found.</td>
            </tr>
            <?php } ?>
    </tbody>
</table>

    </div>

    <!-- Delete Button -->
    <button id="delete-btn" class="btn btn-danger" type="submit" style="display:none;">
        <i class="fa fa-trash"></i> Delete Selected
    </button>
</form>

            </div>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Bootstrap JS -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

    <!--   Core JS Files   -->
    <script src="../assets/js/core/jquery-3.7.1.min.js"></script>
    <script src="../assets/js/core/popper.min.js"></script>
    <script src="../assets/js/core/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- jQuery Scrollbar -->
    <script src="../assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
    <!-- Datatables -->
    <script src="../assets/js/plugin/datatables/datatables.min.js"></script>
    <!-- Kaiadmin JS -->
    <script src="../assets/js/kaiadmin.min.js"></script>
    <!-- Kaiadmin DEMO methods, don't include it in your project! -->
    <script src="../assets/js/setting-demo2.js"></script>
    <script>
       document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.view-details').forEach(button => {
        button.addEventListener('click', function() {
            const fullName = this.getAttribute('data-fullname');
            const eventName = this.getAttribute('data-eventname');
            const scheduleDate = this.getAttribute('data-scheduledate');
            const scheduleTime = this.getAttribute('data-scheduletime');
            const amount = this.getAttribute('data-amount');
            const roles = this.getAttribute('data-roles');
            const refNumber = this.getAttribute('data-refnumber');
            const reqAddress = this.getAttribute('data-reqaddress');
            const reqPNumber = this.getAttribute('data-reqpnumber');
            const calDate = this.getAttribute('data-caldate');
            const reqChapel = this.getAttribute('data-reqchapel');

            document.getElementById('modalFullName').textContent = fullName;
            document.getElementById('modalEventName').textContent = eventName;
            document.getElementById('modalScheduleDate').textContent = scheduleDate;
            document.getElementById('modalScheduleTime').textContent = scheduleTime;
            document.getElementById('modalAmount').textContent = amount;
            document.getElementById('modalRoles').textContent = roles;
            document.getElementById('modalRefNumber').textContent = refNumber;
            document.getElementById('modalReqAddress').textContent = reqAddress;
            document.getElementById('modalReqPNumber').textContent = reqPNumber;
            document.getElementById('modalCalDate').textContent = calDate;
            document.getElementById('modalReqChapel').textContent = reqChapel;
        });
    });
});

                  document.addEventListener('DOMContentLoaded', function() {
    <?php
    if (isset($_SESSION['status']) && $_SESSION['status'] == 'success') {
        echo "Swal.fire({
            icon: 'success',
            title: 'Success!',
            text: 'Your changes have been saved successfully',
            toast: true,
            position: 'top-end',
            showConfirmButton: false,
            timer: 3000,
            timerProgressBar: true,
            didOpen: (toast) => {
                toast.addEventListener('mouseenter', Swal.stopTimer);
                toast.addEventListener('mouseleave', Swal.resumeTimer);
            }
        });";
        unset($_SESSION['status']);
    }
    ?>
});

      document.getElementById('select-all').addEventListener('change', function() {
    const checkboxes = document.querySelectorAll('.select-row');
    const deleteBtn = document.getElementById('delete-btn');
    checkboxes.forEach(checkbox => checkbox.checked = this.checked);
    toggleDeleteButton();
});

document.querySelectorAll('.select-row').forEach(checkbox => {
    checkbox.addEventListener('change', toggleDeleteButton);
});

function toggleDeleteButton() {
    const selectedCount = document.querySelectorAll('.select-row:checked').length;
    const deleteBtn = document.getElementById('delete-btn');
    if (selectedCount > 0) {
        deleteBtn.style.display = 'inline-block';
    } else {
        deleteBtn.style.display = 'none';
    }
}
      document.addEventListener('DOMContentLoaded', function() {
    const checkboxes = document.querySelectorAll('.select-row');
    const selectedInfo = document.getElementById('selected-info');
    const selectedCount = document.getElementById('selected-count');
    const deleteBtn = document.getElementById('delete-btn');
    let selectedRows = 0;

    checkboxes.forEach(function(checkbox) {
        checkbox.addEventListener('change', function() {
            if (this.checked) {
                selectedRows++;
            } else {
                selectedRows--;
            }

            // Update the selected count display
            selectedCount.textContent = selectedRows;

            // Show the selected info bar if any rows are selected
            if (selectedRows > 0) {
                selectedInfo.style.display = 'block';
                deleteBtn.style.display = 'inline-block';
            } else {
                selectedInfo.style.display = 'none';
                deleteBtn.style.display = 'none';
            }
        });
    });

    deleteBtn.addEventListener('click', function() {
        const idsToDelete = [];
        checkboxes.forEach(function(checkbox) {
            if (checkbox.checked) {
                idsToDelete.push(checkbox.getAttribute('data-id'));
            }
        });

        if (idsToDelete.length > 0) {
            if (confirm('Are you sure you want to delete the selected items?')) {
                // Add your deletion logic here (e.g., an AJAX request to delete the selected rows)
                console.log('Deleting rows with IDs: ', idsToDelete);
                // Optionally, refresh the page or remove the selected rows from the table
            }
        }
    });
});

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
