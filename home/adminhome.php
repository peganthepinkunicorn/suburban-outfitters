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
		
		
<?php
echo "<a href='home.php'>Go to Customer Home</a>";
echo "<a href='../customer-list/customer-list.php'>View Customer List</a>";
echo "<a href='../users/user-list.php'>Manage Users</a>";
?>

		</div>
	</body>
</html>