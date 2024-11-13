<?php
require_once '../../Model/staff_mod.php';  // Your Staff class file
require_once '../../Model/db_connection.php';  // Your DB connection
session_start();

// Check if user is logged in
if (!isset($_SESSION['email']) || !isset($_SESSION['user_type'])) {
    header("Location: ../../index.php");
    exit();
}

// Redirect based on user type
switch ($_SESSION['user_type']) {
    case 'Staff':
        // Allow access
        break;
    case 'Admin':
        header("Location: ../PageAdmin/AdminDashboard.php");
        exit();
    case 'Priest':
        header("Location: ../PagePriest/PriestDashboard.php");
        exit();
    case 'Citizen':
        header("Location: ../PageCitizen/CitizenPage.php");
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
$userManager = new Staff($conn);
$baptismReport = $userManager->generateWeddingReport();  // Call the method

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Citizen Accounts Report</title>
    <script>
        function printReport() {
            window.print();
        }
    </script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        /* Header styling */
        .report-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .report-header img {
            width: 80px;
            height: 80px;
        }
        .report-header h4 {
            margin: 0;
            padding: 0;
            font-size: 24px;
            color: #333;
        }
        .report-header p {
            margin: 5px 0;
            font-size: 16px;
            color: #555;
        }

        /* Button styling */
        .button {
            display: block;
            width: 150px;
            padding: 10px;
            margin: 20px auto;
            background-color: #4CAF50;
            color: white;
            text-align: center;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        @media print {
            .button {
                display: none;
            }
        }
    </style>
</head>
<body>

    <!-- Formal Report Header -->
    <div class="report-header">
        <img src="../assets/img/mainlogo.jpg" alt="Church Logo"> <!-- Replace with your logo -->
        <h4>Argao Parish Church</h4>
        <p>Argao, Cebu</p>
        <p>0939-424-232</p>
        <p>argaoparishchurch@gmail.com</p>
    </div>

    <h2 style="text-align: center;">Wedding Seminar Report</h2>


    <!-- Print Button -->
    <button class="button" onclick="printReport()">Print Report</button>

    <table class="table table-bordered">
        <thead>
            <tr>
            <th>Speaker</th>
                <th>Seminar Date</th>
                <th>Reference Number</th>
                <th>Type</th>
                <th>Citizen Name</th>
                <th>Payment Status</th>
                <th>Payable Amount</th>
            </tr>
        </thead>
        <tbody>
            <?php if (!empty($baptismReport)): ?>
                <tr>
                <td><?= htmlspecialchars($baptismReport['Speaker']) ?></td>
                    <td><?= htmlspecialchars($baptismReport['appointment_schedule_date']) ?></td>
                    <td><?= htmlspecialchars($baptismReport['ref_number']) ?></td>
                    <td><?= htmlspecialchars($baptismReport['type']) ?></td>
                    <td><?= htmlspecialchars($baptismReport['fullnames']) ?></td>
                    <td><?= htmlspecialchars($baptismReport['p_status']) ?></td>
                    <td><?= htmlspecialchars($baptismReport['payable_amount']) ?></td>
                </tr>
            <?php else: ?>
                <tr>
                    <td colspan="6">No marriage records found for this week.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>
    <button class="button" onclick="history.back()">Back</button>
</body>
</html>
