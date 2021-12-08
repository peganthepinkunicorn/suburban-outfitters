<html>
	<head>
		<link rel='stylesheet' href='../styles.css'>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div class="page-content">
	</body>
</html>
<?php

$page_roles = array('admin');

require_once '../dbinfo/dbinfo.php';
require_once '../dbinfo/checksession.php';

$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);

if(isset($_GET['cust_id']))
{ 
	$cust_id = $_GET['cust_id'];

	$query = "SELECT * FROM customer WHERE cust_id = $cust_id";

	$result = $conn->query($query);
	if(!$result) die($conn->error);

	//Step 4b: Fetching a Row
	$rows = $result->num_rows;

	for($j=0; $j<$rows; $j++)
	{
		$row = $result->fetch_array(MYSQLI_ASSOC);
		echo <<<_END
			<pre>
			Customer ID: $row[cust_id]
			Name: $row[f_name] $row[l_name]
			Address: $row[cust_address]
			City: $row[cust_city]
			State $row[cust_state]
			</pre>
_END;

	}

}

echo '<a href="customer-list.php">Back</a>';

?>