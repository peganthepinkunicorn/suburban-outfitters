<?php

require_once 'dbinfo.php';

$conn = new mysqli($hn, $un, $pw, $db);
if($conn->connect_error) die($conn->connect_error);

add_user($conn, $forename, $surname, $username, $token);

//Pauline Jones
$forename = 'Selene';
$surname = 'Danev';
$username = 'sdanev';
$password = 'cust123';
$token = password_hash($password,PASSWORD_DEFAULT); 

add_user($conn, $forename, $surname, $username, $token);

function add_user($conn, $forename, $surname, $username, $token){
	//code to add user here
	$query = "insert into users(forename, surname, username, password) values ('$forename', '$surname', '$username', '$token')";
	$result = $conn->query($query);
	if(!$result) die($conn->error);
}

?>