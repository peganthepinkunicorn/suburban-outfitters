<?php

$page_roles = array('admin', 'employee', 'customer');

require_once '../dbinfo/checksession.php';
require_once '../dbinfo/user.php';
$conn = new mysqli($hn, $un, $pw, $db);

if ($conn->connect_error) die($conn->connect_error);
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
							<li><a href='../home/home.php'>Home</a></li>
							<li><a href='../products/products.php'>Products</a></li>
							<li><a href=''>Sales</a></li>
							<li><a href='../account/account.php'>Account</a></li>
							<li><a href=''>Contact Us</a></li>
							<li><a href='../logout/logout.php'>Logout</a></li>
							<li><a href='../bag/shoppingbag.php'>Bag</a></li>
						</ul>
					</div>
				</div>
			</nav>
			<div class='account-info-grid'>
				<span><h3>Account Information</h3></span><span></span>
<?php

//Get Customer Information
		$conn = new mysqli($hn, $un, $pw, $db);
		if($conn->connect_error) die($conn->connect_error);
		$get_cust_info = ("select * from customer where username ='$username'");

		$result = $conn->query($get_cust_info); 
		if(!$result) die($conn->error);

		$rows = $result->num_rows;
		for($j=0; $j<$rows; $j++)
		{
			$row= $result ->fetch_array(MYSQLI_ASSOC);
			$firstname = $row['f_name'];
			$lastname = $row['l_name'];
			$cust_id = $row['cust_id'];
			$address = $row['cust_address'];
			$city = $row['cust_city'];
			$state = $row['cust_state'];
		}
		//End of getting customer information

echo <<<_END
					<span>Customer Name</span>
					<span>$firstname $lastname</span>
					<span>Street Address</span>
					<span>$address</span>
					<span>City</span>
					<span>$city</span>
					<span>state</span>
					<span>$state</span>

					<span><a href='../account-update/account-update.php'><img src='../images/update-info-button.png'></img></a></span>
					<span><a href='order-history.php'><img src='../images/order-history-button.png'></img></a></span>
				<span><h3>Saved Payments</h3></span><span></span>
_END;

$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);
$get_card_info = "SELECT * FROM cust_saved_pmt WHERE cust_id = $cust_id";

$result = $conn->query($get_card_info); 
if(!$result) die($conn->error);

$rows = $result->num_rows;

for($j=0; $j<$rows; $j++)
{
	//$result->data_seek($j); 
	$row = $result->fetch_array(MYSQLI_ASSOC); 

echo <<<_END
	<span>Name on Card:</span>
	<span>$row[name_on_card]</span>
	<span>Card Number:</span>
	<span>$row[card_number]</span>
	<span>card Type:</span>
	<span>$row[card_type]</span>
	<span>Expiration Date:</span>
	<span>$row[exp_date]</span>
	<span>CVV:</span>
	<span>$row[sec_num]</span>
_END;

}
?>
			</div>
		</div>
	</body>
</html>