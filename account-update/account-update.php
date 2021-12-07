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

$page_roles = array('admin', 'employee', 'customer');

require_once '../dbinfo/user.php';
require_once '../dbinfo/checksession.php';

if($_SESSION['user']){
	
	$user = $_SESSION['user'];
	$username = $user->username;
	$user_roles = $user->getRoles();
	
	$found=0;
	foreach ($user_roles as $urole) {
		foreach ($page_roles as $prole) {
			if($urole==$prole) {
				$found=1;
			}
		}
	}
	
	if(!$found) {
		header("Location: ../dbinfo/unauthorized.php");
	}else{
		echo "<h3>Welcome, $username!</h3>";
	}
	
}else{
	echo "username is not in the session<br>";
}

function destroy_session_and_data() {
	$_SESSION = array();
	setcookie(session_name(),'',time() - 2592000, '/');
	session_destroy();
}

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
			
			<h4>Name</h4>
			<form method='POST' action='../account/account.php'>
				<div class='account-info-grid'>
					<span>First Name</span>
					<span><input type='text' name='first-name'/></span>
					<span>Last Name</span>
					<span><input type='text' name='last-name'/></span>
				</div>
				<h4>Address</h4>
				<div class='account-info-grid'>
					<span>Street Address</span>
					<span><input type='text' name='street-address'/></span>
					<span>City</span>
					<span><input type='text' name='city'/></span>
					<span>State</span>
					<span><input type='text' name='state'/></span>
					<span>Zip Code</span>
					<span><input type='number' name='zip'/></span>
				</div>
				<h4>Payment</h4>
				<div class='account-info-grid'>
					<span>Card Number</span>
					<span><input type='number' name='card-number'/></span>
					<span>Expiration Date</span>
					<span><input type='date' name='expiration-date'/></span>
					<span>Name on Card</span>
					<span><input type='text' name='name-on-card'/></span>
				</div>
				<div class='account-info-grid'>
					<input type='image' name='save-account-information' src='../images/button_save-changes.png'/>
					<a href ='../account/account.php'><img src='../images/button_cancel.png'></img></a>
				</div>
			</form>
		</div>
	</body>
</html>