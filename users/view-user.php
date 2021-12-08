<html>
	<head>
		<link rel='stylesheet' href='../styles.css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="page-content">
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
<?php

$page_roles = array('admin');

require_once '../dbinfo/dbinfo.php';
require_once '../dbinfo/checksession.php';

$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);

if(isset($_GET['user_username']))
{ 
	$user_username = $_GET['user_username'];

	$query = "SELECT * FROM users, roles WHERE users.username = '$user_username' AND users.username = roles.username";

	$result = $conn->query($query);
	if(!$result) die($conn->error);

	$rows = $result->num_rows;

	for($j=0; $j<$rows; $j++)
	{
		$row = $result->fetch_array(MYSQLI_ASSOC);
		echo <<<_END
			<span>Username:</span><span>$row[username]</span>
			<span>First Name:</span><span>$row[forename]</span>
			<span>Role:</span><span>$row[role]</span>
			<span>Last Name:</span><span>$row[surname]</span>
_END;

	}

}

echo '<a href="user-list.php">Back</a>';

?>
	</body>
</html>