<html>

	<head>
		<link rel='stylesheet' href='../styles.css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	
	<body>
		<div class="page-content">
		<a href='../logout/logout.php'>Logout</a>
		
<?php

$page_roles = array('admin');

require_once '../dbinfo/user.php';
require_once '../dbinfo/checksession.php';
echo "<h3>Welcome, $username!</h3>";
echo "<a href='home.php'>Go to Customer Home</a>";
echo "<a href='../customer-list/customer-list.php'>View Customer List</a>";
?>

		</div>
	</body>
</html>