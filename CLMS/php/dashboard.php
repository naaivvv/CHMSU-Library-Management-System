<?php
include 'db.php';
session_start();

if (!isset($_SESSION['username'])) {
    header('Location: index.php');
    exit();
}

// Set default values for filter and pagination
$filter = isset($_POST['filter']) ? $_POST['filter'] : 'all';
$page = isset($_GET['page']) ? $_GET['page'] : 1;
$itemsPerPage = 10; // Set the number of items to show per page

// Calculate the offset for pagination
$offset = ($page - 1) * $itemsPerPage;

// Get logged-in user's student_id
$student_id = $_SESSION['student_id'];

// Modify your SQL query to include filtering and pagination
$sql = "SELECT * 
        FROM tbl_book 
        WHERE student_id = ?";

// Apply filter if it's not set to 'all'
if ($filter !== 'all') {
    $sql .= " AND status = ?";
}

$sql .= " ORDER BY date_borrowed DESC LIMIT ?, ?";

$stmt = $conn->prepare($sql);

// Bind parameters based on the filter
if ($filter !== 'all') {
    $stmt->bind_param("ssii", $student_id, $filter, $offset, $itemsPerPage);
} else {
    $stmt->bind_param("sii", $student_id, $offset, $itemsPerPage);
}

function getBookCount($status)
{
    global $conn, $student_id;

    $countQuery = "SELECT COUNT(*) as count FROM tbl_book WHERE student_id = ? AND status = ?";
    $countStmt = $conn->prepare($countQuery);
    $countStmt->bind_param("ss", $student_id, $status);
    $countStmt->execute();
    $countResult = $countStmt->get_result();

    if ($countResult && $countResult->num_rows > 0) {
        $countRow = $countResult->fetch_assoc();
        return $countRow['count'];
    } else {
        return 0;
    }
}

$stmt->execute();
$result = $stmt->get_result();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <link rel="stylesheet" href="../css/styles.css">
    <title>Library Management System</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <?php 
    include 'announcement-bar.php';
    include 'navigation-bar-dashboard.php';
    ?>
    <div class="dashboard-content">
    <div class="container mt-4">
        <div class="row">
            <div class="col-md-12">
                <div class="d-flex justify-content-end">
                <h5 class="">Welcome! <b><span class="visually-hidden"><?php echo $_SESSION['student_id']; ?></span><?php echo $_SESSION['username']; ?></b>&nbsp;<span style="padding: 0 10px 0 20px;"></span></h5>
                </div>
                <h2>Dashboard</h2>
            </div>
        </div>
            <div class="container-fluid">
            <div class="row mb-3 mt-3 justify-content-center">
                <div class="col-md-4">
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-book"></i> Borrowed Books</h5>
                            <p class="card-text">
                                <?php echo getBookCount('borrowed'); ?>
                            </p>
                        </div>
                    </div>
                    <div class="card mb-3">
                        <div class="card-body">
                            <h5 class="card-title"><i class="fas fa-undo-alt"></i> Returned Books</h5>
                            <p class="card-text">
                                <?php echo getBookCount('returned'); ?>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <canvas id="lineChart" width="400" height="200"></canvas>
                </div>
            </div>
            <form method="post" action="dashboard.php" class="mb-3">
            <h2>History</h2>
                <div class="row g-3">
                    <div class="col-auto">
                        <label for="filter" class="form-label">Filter by Status:</label>
                    </div>
                    <div class="col-auto">
                        <select name="filter" id="filter" class="form-select">
                            <option value="all" <?php echo ($filter === 'all') ? 'selected' : ''; ?>>All</option>
                            <option value="borrowed" <?php echo ($filter === 'borrowed') ? 'selected' : ''; ?>>Borrowed</option>
                            <option value="returned" <?php echo ($filter === 'returned') ? 'selected' : ''; ?>>Returned</option>
                        </select>
                    </div>
                    <div class="col-auto">
                        <button type="submit" class="btn btn-primary">Apply Filter</button>
                    </div>
                </div>
            </form>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Book ID</th>
                                    <th scope="col">Bookshelf No.</th>
                                    <th scope="col">Book Title</th>
                                    <th scope="col">Author</th>
                                    <th scope="col">Date Borrowed</th>
                                    <th scope="col">Date Returned</th>
                                    <th scope="col">Deadline</th>
                                    <th scope="col">Status</th>
                                    <th scope="col">Remarks</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                if ($result->num_rows > 0) {
                                    while ($row = $result->fetch_assoc()) {
                                        echo "<tr>";
                                        echo "<td>" . $row["book_id"] . "</td>";
                                        echo "<td>" . $row["bookshelf"] . "</td>";
                                        echo "<td>" . $row["booktitle"] . "</td>";
                                        echo "<td>" . $row["author"] . "</td>";
                                        echo "<td>" . $row["date_borrowed"] . "</td>";
                                        echo "<td>" . $row["date_returned"] . "</td>";
                                        echo "<td>" . $row["deadline"] . "</td>";
                                        echo "<td>" . $row["status"] . "</td>";
                                        echo "<td>" . $row["remarks"] . "</td>";
                                        echo "</tr>";
                                    }
                                }
                                $stmt->close();
                                $conn->close();
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 mt-3">
                    <?php
                    // Display pagination links
                    $totalPages = ceil($result->num_rows / $itemsPerPage);

                    if ($totalPages > 1) {
                        echo "<p class='mb-1'>Page $page of $totalPages</p>";
                        echo "<div class='btn-group' role='group'>";

                        if ($page > 1) {
                            echo "<a href='dashboard.php?page=" . ($page - 1) . "&filter=$filter' class='btn btn-secondary'>Previous</a>";
                        }

                        if ($page < $totalPages) {
                            echo "<a href='dashboard.php?page=" . ($page + 1) . "&filter=$filter' class='btn btn-secondary'>Next</a>";
                        }

                        echo "</div>";
                    }
                    ?>
                    </div>
                </div>
            </div>
        </div>
</div>
    <?php 
    include 'footer.php';
    ?>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <script>
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
        return new bootstrap.Tooltip(tooltipTriggerEl);
        });
    </script>
    <script src="../js/dashboard-chart.js"></script>
</body>
</html>