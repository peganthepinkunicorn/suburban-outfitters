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

$page_roles = array('customer');

require_once '../dbinfo/user.php';
require_once '../dbinfo/checksession.php';

echo "<h3>Welcome, $username!</h3>";

?>
			<!--Nav Bar-->
			<nav class="navbar navbar-default">
				<div class="container">
					<div class="collapse navbar-collapse" id="myNavbar">
						<img src='../images/logo.png' class='logo-round'></img>
						<ul class='nav navbar-nav navbar-right'>
							<li><a href='../home/home.php'>Home</a></li>
							<li><a href='../products/products.php'>Products</a></li>
							<li><a href=''>Sales</a></li>
							<li><a href='../account/account.php'>Account</a></li>
							<li><a href=''>Contact Us</a></li>
							<li><a href='../logout/logout.php'>Logout</a></li>
							<li><a href='../bag/bag.php'>Bag</a></li>
						</ul>
					</div>
				</div>
			</nav>

<?php

//Get Customer Information
		$conn = new mysqli($hn, $un, $pw, $db);
		if($conn->connect_error) die($conn->connect_error);
		$cust_info_query = ("select * from customer where username ='$username'");

		$result = $conn->query($cust_info_query); 
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
			<h4>Name</h4>
			<form method='POST' action='account-update.php'>
				<div class='account-info-grid'>
					<span>First Name</span>
					<span><input type='text' name='firstname' value ='$firstname'></span>
					<span>Last Name</span>
					<span><input type='text' name='lastname' value='$lastname'/></span>
				</div>
				<h4>Address</h4>
				<div class='account-info-grid'>
					<span>Street Address</span>
					<span><input type='text' name='address' value='$address''/></span>
					<span>City</span>
					<span><input type='text' name='city' value='$city'/></span>
					<span>State</span>
					<span><input type='text' name='state' value='$state'/></span>
				</div>
				<div class='account-info-grid'>
					
					<input type = 'hidden' name='update' value='yes'>
					<input type = 'hidden' name='cust_id' value='$cust_id'>
					<input type='image' name='save-account-information' src='../images/button_save-changes.png'/>
					<a href ='../account/account.php'><img src='../images/button_cancel.png'></img></a>
				</div>
				<div class='account-info-grid'>
					
				</div>
			</form>
_END;

?>
		</div>
	</body>
</html>

<?php
if(isset($_POST['update']))
{
	$cust_id = $_POST['cust_id'];
	$firstname = fix_string($_POST['firstname']);
	$lastname = fix_string($_POST['lastname']);
	$address = fix_string($_POST['address']);
	$city = fix_string($_POST['city']);
	$state = fix_string($_POST['state']);
	
	$query="UPDATE customer SET f_name='$firstname', l_name='$lastname', cust_address='$address', cust_city='$city', cust_state='$state' WHERE cust_id = $cust_id";
	
	$result = $conn->query($query);
	if(!$result) die($conn->error);
	
	header("Location: ../account/account.php");
}

///sanitization function
function fix_string($string){
	$string = stripslashes($string);
    $string = strip_tags($string);
    $string = htmlentities($string);
    return $string;
}

?>