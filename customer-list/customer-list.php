<?php

$page_roles = array('admin');

require_once '../dbinfo/dbinfo.php';
require_once '../dbinfo/checksession.php';

$conn = new mysqli($hn, $un, $pw, $db);
if ($conn->connect_error) die($conn->connect_error);

echo <<<_END
	Welcome $username
	<pre>
	<a href='../logout/logout.php'>Logout</a>
	
_END;

$query="SELECT * FROM customer";
$result=$conn->query($query);
if(!$result) die ($conn->error);

$rows=$result->num_rows;
for($j=0; $j<$rows; $j++) {
	$result->data_seek($j);
	$row=$result->fetch_array(MYSQLI_BOTH);
	
	echo <<<_END
	<pre>
		Customer Name <a href='viewcustomer.php?cust_id=$row[cust_id]'>$row[f_name]$row[l_name]</a>
	</pre>
_END;
}

$result->close();
$conn->close();

function get_post($conn, $var) {
	return $conn->real_escape_string($_POST[$var]);
}

?>