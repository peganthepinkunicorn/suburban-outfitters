<?php

$page_roles = array('admin');

require_once '../dbinfo/dbinfo.php';

$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);

if(isset($_POST['delete'])){
	$user_username = $_POST['user_username'];
	
	$delete_from_users = "DELETE FROM users WHERE username='$user_username'";
	$result = $conn -> query($delete_from_users);
	if(!$result) die($conn->error);
	
	$delete_from_roles = "DELETE FROM roles WHERE username='$user_username'";
	$result = $conn -> query($delete_from_roles);
	if(!$result) die($conn->error);

	header("Location:user-list.php");
}



$conn->close();

?>