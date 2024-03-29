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
			<div class='order-conf-header'>
				<h3>Congratulations! Your order has been confirmed.</h3>
				<img src='../images/congrat.png' style='height: 100px;'>
			</div>
			<div class='order-detail'>
				<span>Order#:</span>
				<span>00001</span>
				<span>Name on Order</span>
				<span>First Last</span>
				<span>Customer Address:</span>
				<span>123 Main Street, Salt Lake City, UT 84111</span>
				<span>Date:</span>
				<span>November 10th, 2021</span>
				<span>Total Price:</span>
				<span>$50</span>
				<span>Payment Method:</span>
				<span>Visa -1234</span>
			</div>
		</div>
	</body>
</html>