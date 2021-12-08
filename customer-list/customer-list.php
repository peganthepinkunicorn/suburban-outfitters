<?php
$page_roles = array('admin');

require_once '../dbinfo/user.php';
require_once '../dbinfo/checksession.php';
?>
<html>

	<head>
		<link rel='stylesheet' href='../styles.css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	
	<body>
		<div class="page-content">
<?php
echo "<h3>Welcome, $username!</h3>";
?>
		<!--Nav Bar-->
			<nav class="navbar navbar-default">
				<div class="container">
					<div class="collapse navbar-collapse" id="myNavbar">
						<img src='..//images/logo.png' class='logo-round'></img>
						<ul class='nav navbar-nav navbar-right'>
							<li><a href='../home/adminhome.php'>Admin Home</a></li>
							<li><a href='../logout/logout.php'>Logout</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<div class="page-content">
				<div class = 'account-info-grid'>
				<span><h4>Customer Name</h4></span><span><h4>Total Spend</h4></span>

<?php		

$query="SELECT
	customer.cust_id, f_name, l_name, sum(order_total) AS total_spend
	FROM customer, cust_order
	WHERE customer.cust_id = cust_order.cust_id
	GROUP BY customer.cust_id, f_name, l_name
	ORDER BY f_name";
$result=$conn->query($query);
if(!$result) die ($conn->error);

$rows=$result->num_rows;
for($j=0; $j<$rows; $j++) {
	$result->data_seek($j);
	$row=$result->fetch_array(MYSQLI_BOTH);
	
	echo <<<_END
				<span><a href='viewcustomer.php?cust_id=$row[cust_id]'>$row[f_name] $row[l_name]</a></span>
				<span>$$row[total_spend]</span>
_END;
}


$result->close();
$conn->close();

function get_post($conn, $var) {
	return $conn->real_escape_string($_POST[$var]);
}

?>
				</div>
			</div>
		</div>
	</body>
</html>