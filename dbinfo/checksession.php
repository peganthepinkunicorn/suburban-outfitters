<?php

require_once 'user.php';

session_start();

if(!isset($_SESSION['user'])) {
	header("Location: ../login/login.php");
	exit();
}else{
	$user = $_SESSION['user'];
	$username = $user->username;
	$user_roles = $user->getRoles();
	
	$found=0;
	foreach ($user_roles as $urole) {
		foreach ($page_roles as $prole){
			if ($urole == $prole) $found=1;
		}
	}
	
	if (!$found) {
		header("Location: ../dbinfo/unauthorized.php");
	}
}
?>